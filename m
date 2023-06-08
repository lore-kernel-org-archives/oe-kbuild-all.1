Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CD2F38
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 06:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD5EC433D2;
	Thu,  8 Jun 2023 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686207340;
	bh=tmC0JvlkXc0YDH3wEj4riXVeHJFjJuQ3P/QMfxnJTnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uLxux5y/J+241Ipaq23GUjH/N6pW3LVuldmj0HgOYZGj5x6xsOlyXO8CyE6BKyZrl
	 Pta16gpgP4K50GY/u0U6juTGBNHndwaiVuxZZxbjqtxfVP/tKAa3/qk+PwepqHCizN
	 YykGrfx2ZmAOVfafO4TAgZmkh6UZfM8QwJE5Lx8l+85J4hJvI6rTm95LYFhrbtZ6x8
	 cGBjszSvEX+1FInA7TLEmpAFl5D8Dz/tG27IrVWfuI+f1kCilUVDyMACQSg+9oj6sS
	 bwj8bsZ6IDhYkectj1Gg+pWEM59Q6qf5MWsK7FOvj3Que2AZqdLn32mVVLJOr0FPuT
	 7eDUmN7Sv3BPA==
Message-ID: <1069d6fa-7b17-00de-ad0b-e91794fae9f2@kernel.org>
Date: Thu, 8 Jun 2023 08:55:28 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/5] phy: realtek: usb: Add driver for the Realtek SoC
 USB 2.0 PHY
Content-Language: en-US
To: =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
 kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 Ray Chi <raychi@google.com>, Flavio Suligoi <f.suligoi@asem.it>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230607062500.24669-2-stanley_chang@realtek.com>
 <202306080128.Gh3c2H1O-lkp@intel.com>
 <2444f4875f484cc4bf2ff9c52815fa0c@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2444f4875f484cc4bf2ff9c52815fa0c@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/06/2023 04:18, Stanley Chang[昌育德] wrote:
>> ERROR: modpost: "devm_usb_get_phy_by_phandle"
>> [drivers/power/supply/wm831x_power.ko] undefined!
>>>> ERROR: modpost: "devm_usb_get_phy"
>> [drivers/power/supply/da9150-charger.ko] undefined!
>>
>> Kconfig warnings: (for reference only)
>>    WARNING: unmet direct dependencies detected for USB_PHY
>>    Depends on [n]: USB_SUPPORT [=n]
>>    Selected by [y]:
>>    - PHY_RTK_RTD_USB2PHY [=y]
>>
> 
> I will add USB_SUUPRT dependency to Kconfig.

Why? Do you see other phy drivers needing it? Few have it but many
don't, so you should really investigate the root cause, not just add
some dependencies.

Build test your patches locally before sending and investigate the issues.

Best regards,
Krzysztof

