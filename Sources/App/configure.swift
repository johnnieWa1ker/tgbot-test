import Vapor
import telegram_vapor_bot

// configures your application
public func configure(_ app: Application) throws {
    app.http.server.configuration.hostname = "0.0.0.0"

    app.http.server.configuration.port = 80

    let tgApi = "5969554676:AAFAcnU5FvqnlVT3ILpoyAP37T2dlYzZvvg"
    let connection: TGConnectionPrtcl = TGLongPollingConnection()
    TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
    try TGBot.shared.start()
    TGBot.log.logLevel = .error
    DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)

    try routes(app)
}
