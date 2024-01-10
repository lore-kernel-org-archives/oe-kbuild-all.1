Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8EBE5E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="lhRgrwMp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W01nSssrELUPcU+e8tchaiZBCa287E2OsmbyHyZ83fw=; b=lhRgrwMpHx0Re+Zku5IbxHpv1U
	uCCstboGwuEHKM6W1TXYJ/+t2zOsatzcFqLO/g26lxx8hYSokwY1JK54jZBHI60Kou8kto+Ibxam8
	CC8mGltou8d6M0lUoJeji1i8Vsy0x6/PnVUBctidZvHOjqwcRWJD9r5xyECCw9NFYK96Uu+rfRil3
	8IinptCkn86QCYopchSf4FO8N2ILbDpWuMwV4u0uYXUCz6y6tkIWZnOH2hbWlXgX2Cd5z97z/bBZp
	HyQwPIfhxoTsAsZ1dGGsD2gJeL/HHrWmvk5N5SlhKFTE88okAO6CmMbGTF2YYCQGLdC5mYCFG4CJC
	vBU5qjMw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45132)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rNVRK-00057I-1M;
	Wed, 10 Jan 2024 10:04:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rNVRK-0005Cc-SR; Wed, 10 Jan 2024 10:04:02 +0000
Date: Wed, 10 Jan 2024 10:04:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12033/13011]
 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:193:undefined reference to
 `phylink_ethtool_nway_reset'
Message-ID: <ZZ5rkvvTs3BVGxtc@shell.armlinux.org.uk>
References: <202401101414.8GvBGMXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401101414.8GvBGMXw-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jan 10, 2024 at 02:09:24PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f067394dd3b2af3263339cf7183bdb6ee0ac1f8
> commit: e8e138cf7383cf820419fcbec63992e75a01467b [12033/13011] net: libwx: add phylink to libwx
> config: parisc-randconfig-r002-20221104 (https://download.01.org/0day-ci/archive/20240110/202401101414.8GvBGMXw-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101414.8GvBGMXw-lkp@intel.com/reproduce)

Isn't there already a patch to add the required "select PHYLINK" for
this?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
