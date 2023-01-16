Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA361C07
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IwrpYZNXVgDzRnQ/g45MzSz/G3KSC3zVu9IxhxiH5tM=; b=bXceAawuJ0ihE/zTFcq6Zoe/AJ
	TYg+Fvaw8ns62ThMpgIc0JGruZ0GLgNRY3u3WuhAGo7LfwXD4a8JgiFvv/GHk1FX3WBLfsf48OHyI
	CcJF09sIyQuxtQEUupXi81A3S4D8nOzTpkT4NfXXCRrfTUyDXddsY/Wl0rNery5Kb9s9tGKM6Zxtf
	ajVS50m9vkBHzvzlDlusvgrt/FKeRNmXdXwC+u/XbvQCsSScsgv2MAT1u9oMEURMSMoDvG9q7xuGL
	0Pn5Ir32ABsdi5Bjvyo7Mo8WPdk3Gk7OVOCdgZDOZLrmWDexYl54y/Kqdxfb8gVztz15Ng8HYePn3
	vguaTssA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pHMpM-0004aa-Pd; Mon, 16 Jan 2023 10:34:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pHMpK-0005vo-10; Mon, 16 Jan 2023 10:34:54 +0000
Date: Mon, 16 Jan 2023 10:34:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Cc: kernel test robot <lkp@intel.com>,
	Pierluigi Passaro <pierluigi.passaro@gmail.com>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Eran Matityahu <eran.m@variscite.com>,
	Nate Drude <Nate.D@variscite.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: Re: [PATCH] net: mdio: force deassert MDIO reset signal
Message-ID: <Y8UoTtn8cIc6uzqJ@shell.armlinux.org.uk>
References: <20230115161006.16431-1-pierluigi.p@variscite.com>
 <202301161653.hbqd7e0q-lkp@intel.com>
 <AM6PR08MB4376E687ED26A7DB0DD5C331FFC19@AM6PR08MB4376.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR08MB4376E687ED26A7DB0DD5C331FFC19@AM6PR08MB4376.eurprd08.prod.outlook.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jan 16, 2023 at 10:32:38AM +0000, Pierluigi Passaro wrote:
> The config file used to build this kernel disables CONFIG_GPIOLIB.
> Is this intentional ?

All configurations should build - and the build bot tries random
configurations. Your job is to fix the errors / warnings that it
finds as a result of your patch and submit fixes where appropriate.
Don't expect the build bot to provide any guidance or answer questions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
