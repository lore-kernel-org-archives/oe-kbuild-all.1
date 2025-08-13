Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDA2D73AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 14:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755094353; cv=none; b=sS1lvYfTBSetxRI6TJ0m6VsFg33tj0W/K1LsFyJ9tlYB+sZjGX0o3cFxg3WIi312zZvyH2ItOFNGtcoPRBm8WXsiUQ7fmlyolbtTn9AbJ4PLtFVJhHiuCXze9tq91P3l8yH6jSJhNigkopfqifQCYOJrTTZd7bCr0jh6w/30xo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755094353; c=relaxed/simple;
	bh=Due4i1PxTEgyR/kIwWkON5iX84h0ZaemvZI82Ha4f34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEgxDJh5DfABtPlPMTw99/4ohgZ3jmkegiMcB+fWWArqRSnDNzvHvIWe0eA6SRb4o65P7HTgqrc8Pb5P6pyQnbMYOrq0b6rikABYvPW/lF/cFC6NI0FrjTFJUbFeMLPtR1AJ0QquHQzqmNO27M1ag7wUAN3yHvtDEO4Z7wKfhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=M5u+GXSU; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="M5u+GXSU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZbQpAOYAXHiJ6xf3vUtXBDhpzfyDFauO6I8sUiuzuH8=; b=M5u+GXSUJcDptuX/xTZovS6clH
	QrBHrADptCUiSqdbxpjLm60+WYHcVuyqdGhDD5N5aDGel1sG7fdY/LpYi8dEfk8YFTRqOaQKJb2pB
	wfRuLoU/ul2uxbhXPws5l2bXnnCp4qjPSQ1r14eNstJXytCLx5+cy476dLB8Mmk3q+KWXL/1h6ByX
	MvAguPOj7M0EhHd/v7hB7il48YpvrFkWanf26n6vefofoCMftTif3it4Ln9yKe/WTjVIkjLP0eEvc
	wR/DndayjSxMBHUiHcggX3dx8my+le91z3cqy3w7lMpuOI0dV3z7RA+FbCDMQqfisET5kw+4FyJdm
	9h+rqGOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53732)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umCDK-0006og-1M;
	Wed, 13 Aug 2025 15:12:26 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umCDH-0005oy-1H;
	Wed, 13 Aug 2025 15:12:23 +0100
Date: Wed, 13 Aug 2025 15:12:22 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [linux-next:master 2051/2153] alpha-linux-ld:
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:undefined reference to
 `stmmac_simple_pm_ops'
Message-ID: <aJydRm4JvaZkE-m5@shell.armlinux.org.uk>
References: <202508132051.a7hJXkrd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508132051.a7hJXkrd-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi Rafael,

It seems that in the config below, CONFIG_PM is not set, which leads
EXPORT_SIMPLE_DEV_PM_OPS() not to export the ops, and define it static.

However, if I instead do:

DEFINE_SIMPLE_DEV_PM_OPS(name, ...);
EXPORT_SYMBOL_GPL(name);

then the symbol will obviously still be exported, and it also won't be
static, but the struct will be empty.

Essentially, EXPORT_SIMPLE_DEV_PM_OPS() is not semantically the same as
DEFINE_SIMPLE_DEV_PM_OPS() + EXPORT_SYMBOL_GPL() which is not what I
expected.

First question is, is this expected behaviour?

Second, should I be using DEFINE_SIMPLE_DEV_PM_OPS() +
EXPORT_SYMBOL_GPL() instead for this case? If not, should I use
pm_ptr() in all the drivers that reference the
EXPORT_SIMPLE_DEV_PM_OPS() symbol?

Thanks.

On Wed, Aug 13, 2025 at 08:19:37PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   43c3c17f0c805882d1b48818b1085747a68c80ec
> commit: 38772638d6d1989655f5a05b273dc62a026e0ef1 [2051/2153] net: stmmac: loongson: convert to suspend()/resume() methods
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250813/202508132051.a7hJXkrd-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132051.a7hJXkrd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508132051.a7hJXkrd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    `xe_configfs_exit' referenced in section `.data.rel.ro' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
> >> alpha-linux-ld: drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.o:(.data.rel+0xe0): undefined reference to `stmmac_simple_pm_ops'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
