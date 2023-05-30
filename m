Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E6046B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 08:50:24 +0000 (UTC)
X-QQ-mid:Yeas49t1685436037t569t54720
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [183.159.96.128])
X-QQ-SSF:00400000000000F0FOF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 9616780576815440517
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>,
	"'kernel test robot'" <lkp@intel.com>
Cc: <netdev@vger.kernel.org>,
	<jarkko.nikula@linux.intel.com>,
	<andriy.shevchenko@linux.intel.com>,
	<mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>,
	<Jose.Abreu@synopsys.com>,
	<andrew@lunn.ch>,
	<hkallweit1@gmail.com>,
	<oe-kbuild-all@lists.linux.dev>,
	<linux-i2c@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>,
	<mengyuanlou@net-swift.com>,
	"'Piotr Raczynski'" <piotr.raczynski@intel.com>
References: <20230524091722.522118-6-jiawenwu@trustnetic.com> <202305261959.mnGUW17n-lkp@intel.com> <ZHCZ0hLKARXu3xFH@shell.armlinux.org.uk> <02dd01d991d2$2120fcf0$6362f6d0$@trustnetic.com>
In-Reply-To: <02dd01d991d2$2120fcf0$6362f6d0$@trustnetic.com>
Subject: RE: [PATCH net-next v9 5/9] net: txgbe: Add SFP module identify
Date: Tue, 30 May 2023 16:40:36 +0800
Message-ID: <03ac01d992d2$67c1ec90$3745c5b0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFlCTXCD0V13/nxYaH3lJLB+zCPMgFguorBARt7XSgCWWopnLA04bqA
Content-Language: zh-cn
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1

On Monday, May 29, 2023 10:06 AM, Jiawen Wu wrote:
> On Friday, May 26, 2023 7:37 PM, Russell King (Oracle) wrote:
> > On Fri, May 26, 2023 at 07:30:45PM +0800, kernel test robot wrote:
> > > Kconfig warnings: (for reference only)
> > >    WARNING: unmet direct dependencies detected for I2C_DESIGNWARE_PLATFORM
> > >    Depends on [n]: I2C [=n] && HAS_IOMEM [=y] && (ACPI && COMMON_CLK [=y] || !ACPI)
> > >    Selected by [y]:
> > >    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
> > >    WARNING: unmet direct dependencies detected for SFP
> > >    Depends on [n]: NETDEVICES [=y] && PHYLIB [=y] && I2C [=n] && PHYLINK [=y] && (HWMON [=n] || HWMON [=n]=n)
> > >    Selected by [y]:
> > >    - TXGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]
> >
> > ... and is basically caused by "select SFP". No. Do not do this unless
> > you look at the dependencies for SFP and ensure that those are also
> > satisfied - because if you don't you create messes like the above
> > build errors.
> 
> So how do I make sure that the module I need compiles and loads correctly,
> rely on the user to manually select it?

When I changed the TXGBE config to:
...
	depends on SFP
	select PCS_XPCS
...
the compilation gave an error:

drivers/net/phy/Kconfig:16:error: recursive dependency detected!
drivers/net/phy/Kconfig:16:     symbol PHYLIB is selected by PHYLINK
drivers/net/phy/Kconfig:6:      symbol PHYLINK is selected by PCS_XPCS
drivers/net/pcs/Kconfig:8:      symbol PCS_XPCS is selected by TXGBE
drivers/net/ethernet/wangxun/Kconfig:40:        symbol TXGBE depends on SFP
drivers/net/phy/Kconfig:63:     symbol SFP depends on PHYLIB
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

Seems deleting "depends on SFP" is the correct way. But is this normal?
How do we ensure the dependency between TXGBE and SFP?

