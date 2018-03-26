# MVP Contributions Update for Lazy MVPs #

This provides a set of Azure Logic Apps for Microsoft MVPs to upload their contributions easier


## Prerequisites ##

* Subscription key from [Microsoft MVP API](https://mvpapi.portal.azure-api.net)
* Client ID and secret key from [Microsoft Application Registration Portal](https://apps.dev.microsoft.com)
* Azure Subscription for Logic Apps


## Getting Started ##

1. Clone this repository
1. Run the following PowerShell Scirpt
    ```
    $apiKey = ConvertTo-SecureString "[MVP API Subscription Key]" `
              -AsPlainText -Force

    .\Deploy-MVPContributions.ps1 `
        -SubscriptionName "MySubscription" `
        -ResourceGroupName "My-Resource-Group" `
        -ResourceGroupLocation "My Location" `
        -ApiKey $apiKey
    ```
1. Open the Swagger file and substitute the subscription key with yours.
1. Upload the Swagger file to the custom connector.
1. Authorise connectors &ndash; MVP Contributions, Excel and OneDrive
1. Prepare the Excel file [(template provided)](templates/contributions.template.xlsx) and store it into OneDrive.
1. Run the Logic App, `mvp-contributions-main` from through Postman or something similar, with the payload of this format:
    ```
    {
      "filepath": "/Documents/mvp/contributions",
      "filename": "contributions.201610-201803.xlsx",
      "tableName": "OpenSourceProjects"
    }
    ```
1. PROFIT!


## Contribution ##

Your contributions are always welcome! All your work should be done in your forked repository. Once you finish your work with corresponding tests, please send us a pull request onto our `master` branch for review.


## License ##

**yarm** is released under [MIT License](http://opensource.org/licenses/MIT)

> The MIT License (MIT)
>
> Copyright (c) 2018 [aliencube.org](http://aliencube.org)
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
