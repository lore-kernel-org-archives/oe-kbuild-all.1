Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA48476
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ywhy2jAO16IXVYxg/uoZkSs55CwHUYJT0FTMuMs35PU=; b=q4+Otp1nBzJ872iRk40XDhqVm5
	Pnaqu/74Mv60CNDyCIQmifA4tZU0wE8FSnDfPgnf3IeOnZY2x3N7vbNjcMevgNwHm2ftr/8NyD9Bg
	K7fZBVwUkXoYfFSHUfF4CjRwa+G37ztEtwYqsy0eLP06pjb3vXPI/W0N3guJ+GbhtE541DVsWqd9F
	M3psTja6WodBPTocofwe9E/kJ0EzZpLqcWhxPtaEeEHH1diJr3mjkBubZ64SOehwEcuwMTrK1Dlqd
	dTONbNltJE8RsuNeqEntz0Cr6pm7WKBn8Ac/A428MjkiW6vogDDg64L883hpiE+4c55md+wuLqJDS
	laIMQ8zw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34414)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q2Vkf-0005Vs-Ml; Fri, 26 May 2023 12:36:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q2VkY-0003h7-BQ; Fri, 26 May 2023 12:36:50 +0100
Date: Fri, 26 May 2023 12:36:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>, netdev@vger.kernel.org,
	jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	Jose.Abreu@synopsys.com, andrew@lunn.ch, hkallweit1@gmail.com,
	oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, mengyuanlou@net-swift.com,
	Piotr Raczynski <piotr.raczynski@intel.com>
Subject: Re: [PATCH net-next v9 5/9] net: txgbe: Add SFP module identify
Message-ID: <ZHCZ0hLKARXu3xFH@shell.armlinux.org.uk>
References: <20230524091722.522118-6-jiawenwu@trustnetic.com>
 <202305261959.mnGUW17n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305261959.mnGUW17n-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 26, 2023 at 07:30:45PM +0800, kernel test robot wrote:
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
>    Depends on [n]: I2C [=n] && HAS_IOMEM [=y] && (ACPI && COMMON_CLK [=y] || !ACPI)
>    Selected by [y]:
>    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
>    WARNING: unmet direct dependencies detected for SFP
>    Depends on [n]: NETDEVICES [=y] && PHYLIB [=y] && I2C [=n] && PHYLINK [=y] && (HWMON [=n] || HWMON [=n]=n)
>    Selected by [y]:
>    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]

... and is basically caused by "select SFP". No. Do not do this unless
you look at the dependencies for SFP and ensure that those are also
satisfied - because if you don't you create messes like the above
build errors.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
