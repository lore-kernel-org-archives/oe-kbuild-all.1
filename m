Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0D17991
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 01:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742434393; cv=none; b=rDvqpVhOg5efMgPEwOedMs8UGUT4QfzkQdEXM7u7itbVPc9ofOXthtIeusq6j6D8qAbBUzdsIPamnBok31CdzgCHNlJ4O286DwJbPmbOJJBWV7f3s/oic/23FmtQnYRK28nbxD2Jv4Fn+QMi/pN5EsZQzYlQv6/V6LuGF8iWTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742434393; c=relaxed/simple;
	bh=S1+CjvfTOAcjDQQSABFFoKEejWQYsfaOlE188+mntsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spN3Yem5AenlvBKLkIDST7BTLmsw1+bkdrj4/nULM7TChqifV6vDkFiLv6WpvrMWIxkXOqRUOb891oS9hvqqCETuSdwGHtxgttu/G960i88b7Msqf/QF2zDpvHY9HDX+xnagrpTiaVKjUlmJLNqFaFCf4p2slVNu4qkpV9Lchlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXA5a/tR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXA5a/tR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742434391; x=1773970391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S1+CjvfTOAcjDQQSABFFoKEejWQYsfaOlE188+mntsU=;
  b=SXA5a/tRLtkfyPyI49Z7T+HJB6oA4c+Xtv2SxMJ6o2P+PX0S4UxAPufe
   pBK38l1s2QVRewfnJgOWV7L6r5/zj7Rva0RkaxkaSVp4ieqKZGLrvCySk
   k8BbaI3ABoappOgXAy5s8ZHmp+cnorOg75cdGUX9elT4Lkh6hqyETxbc7
   9QjBCaC6F0xhUiaonAikxA8sLDF+YghjxTsMRNmd7Em6DeRWCdwlTRoBu
   kzBGkd1/toaN0Ezovfh1Do5MbOZO7udg7IA+D1GfcMWNk5QLV79jlpzWu
   LFl5tlU2HrdYNkPPtwxDInOrBM/rpLCygnLsZhLZlm+FrW8vbNbNpZR8P
   Q==;
X-CSE-ConnectionGUID: JWJ1lyggTLC11JiwxEEAmw==
X-CSE-MsgGUID: Llxf71O3RcSkvVnL7/0ULg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="31230574"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="31230574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 18:33:10 -0700
X-CSE-ConnectionGUID: LOprpSuTThOQvMVql4nP7w==
X-CSE-MsgGUID: YBFBHAAcQ3eBqImcurzANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="153886706"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2025 18:33:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv4mR-000059-0w;
	Thu, 20 Mar 2025 01:33:07 +0000
Date: Thu, 20 Mar 2025 09:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
	Alex Elder <elder@riscstar.com>
Subject: [andi-shyti:i2c/i2c-host-next 39/40]
 drivers/i2c/busses/i2c-k1.c:518:6: warning: variable 'ret' is uninitialized
 when used here
Message-ID: <202503200928.eBWfwnHG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   088a53439990929cce4acffe210896ef36717a20
commit: 95a8ca229032b4984bba959a2c5680a015719481 [39/40] i2c: spacemit: add support for SpacemiT K1 SoC
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200928.eBWfwnHG-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200928.eBWfwnHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200928.eBWfwnHG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-k1.c:518:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     518 |         if (ret && ret != -EINVAL)
         |             ^~~
   drivers/i2c/busses/i2c-k1.c:511:9: note: initialize the variable 'ret' to silence this warning
     511 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +518 drivers/i2c/busses/i2c-k1.c

   504	
   505	static int spacemit_i2c_probe(struct platform_device *pdev)
   506	{
   507		struct clk *clk;
   508		struct device *dev = &pdev->dev;
   509		struct device_node *of_node = pdev->dev.of_node;
   510		struct spacemit_i2c_dev *i2c;
   511		int ret;
   512	
   513		i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
   514		if (!i2c)
   515			return -ENOMEM;
   516	
   517		of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
 > 518		if (ret && ret != -EINVAL)
   519			dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
   520	
   521		/* For now, this driver doesn't support high-speed. */
   522		if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
   523			dev_warn(dev, "unsupported clock frequency %u; using %u\n",
   524				 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
   525			i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
   526		} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
   527			dev_warn(dev, "unsupported clock frequency %u; using %u\n",
   528				 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
   529			i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
   530		}
   531	
   532		i2c->dev = &pdev->dev;
   533	
   534		i2c->base = devm_platform_ioremap_resource(pdev, 0);
   535		if (IS_ERR(i2c->base))
   536			return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
   537	
   538		i2c->irq = platform_get_irq(pdev, 0);
   539		if (i2c->irq < 0)
   540			return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
   541	
   542		ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
   543				       IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
   544		if (ret)
   545			return dev_err_probe(dev, ret, "failed to request irq");
   546	
   547		clk = devm_clk_get_enabled(dev, "func");
   548		if (IS_ERR(clk))
   549			return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
   550	
   551		clk = devm_clk_get_enabled(dev, "bus");
   552		if (IS_ERR(clk))
   553			return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
   554	
   555		spacemit_i2c_reset(i2c);
   556	
   557		i2c_set_adapdata(&i2c->adapt, i2c);
   558		i2c->adapt.owner = THIS_MODULE;
   559		i2c->adapt.algo = &spacemit_i2c_algo;
   560		i2c->adapt.dev.parent = i2c->dev;
   561		i2c->adapt.nr = pdev->id;
   562	
   563		i2c->adapt.dev.of_node = of_node;
   564	
   565		strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
   566	
   567		init_completion(&i2c->complete);
   568	
   569		platform_set_drvdata(pdev, i2c);
   570	
   571		ret = i2c_add_numbered_adapter(&i2c->adapt);
   572		if (ret)
   573			return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
   574	
   575		return 0;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
