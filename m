Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6A83E8C65
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960722; cv=none; b=pan5iX9RAVppIY2rgNyuOzhujZEbm3JHBKNqt8zePFPUQMceHCDft+GQSwexENDIM3a6ZpKK04Q/drjN8cA55y/9f+UXGtZ/EJ6W5gX+DNGdBEofexdTFh4aaHN5bColR89tDSw2TOXXiYP9tYxLz1pg9Xik3qjbgBaYLAwjYx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960722; c=relaxed/simple;
	bh=ersfyARxZb4qdBPVQ7/vbfiqiaZq62qGdtvW05iuaTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LI/OUFLN7/CbE4tTZdT2W6+XuIpOrJWK1JMk59eyul5V1AeNFfDJLFBcgAleRebk2flCswgHgqFX44sKCKn7Ufr6+fxaKBa/bM/xQQSXba3cvBDg9lUzv4cuAy62hG8q6514R//CSgUfbQ9j5esZfs8n6hIzm68kVcpYfXrkgIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5gy6+xP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5gy6+xP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786960710; x=1818496710;
  h=date:from:to:cc:subject:message-id;
  bh=ersfyARxZb4qdBPVQ7/vbfiqiaZq62qGdtvW05iuaTY=;
  b=S5gy6+xPlAIS1j15knVPDgxJ5JTG+Ct4D+TO8q73hQXK9Ke6T6j8BzwD
   wPPXYEe73+jAtPSrP/eOXIoia7Kd3MjWoDQDre1194xa36F+pORedrL8q
   HHbZkFMUqemGEJDQYNS0sF04h+fMH9X1ihaI1cazSlxQfWs7LBhvQ5030
   Sy/+1WpWkb1Ui6VMo93h5DoLfn7g+dz8CjCJAJDC4gk6gD5IP8l88aKbO
   XLEKgFzMAeiBvEsbUiTdnWnFohcHpciFOJldPCuRXLU8iQ0WYaRkd0BLk
   xV6ioaKsCcx7KBVe8dHtk+TmTX/lcTlvZSan739kHAZPxoWHvyKbpF7oA
   A==;
X-CSE-ConnectionGUID: v4MiQPMSSFmLf0/S56Mp1g==
X-CSE-MsgGUID: FPw8DJtxS7i7rgAytixYXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87448820"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87448820"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 02:58:24 -0700
X-CSE-ConnectionGUID: SBPgZBFeRkm1uzwwTz/lzA==
X-CSE-MsgGUID: 4gcKpvBZS1yvlHt39bqzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="263104277"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2026 02:58:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvu6l-00000000dOz-3p8t;
	Mon, 17 Aug 2026 09:58:19 +0000
Date: Mon, 17 Aug 2026 17:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 164/217]
 drivers/video/backlight/as3711_bl.c:439:25: error: incompatible types when
 assigning to type 'struct as3711_bl_pdata' from type 'struct as3711_bl_pdata
 *'
Message-ID: <202608171741.2Y2e2Ina-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 12ff7114412140adebfff278600b4a753e6bdf8f [164/217] mfd: as3711: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260817/202608171741.2Y2e2Ina-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171741.2Y2e2Ina-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608171741.2Y2e2Ina-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/backlight/as3711_bl.c: In function 'as3711_backlight_probe':
>> drivers/video/backlight/as3711_bl.c:439:25: error: incompatible types when assigning to type 'struct as3711_bl_pdata' from type 'struct as3711_bl_pdata *'
     439 |         supply->pdata = pdata;
         |                         ^~~~~


vim +439 drivers/video/backlight/as3711_bl.c

59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  400  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  401  static int as3711_backlight_probe(struct platform_device *pdev)
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  402  {
12ff7114412140 Arnd Bergmann         2026-08-07  403  	struct as3711_bl_pdata *pdata;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  404  	struct as3711 *as3711 = dev_get_drvdata(pdev->dev.parent);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  405  	struct as3711_bl_supply *supply;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  406  	struct as3711_bl_data *su;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  407  	unsigned int max_brightness;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  408  	int ret;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  409  
12ff7114412140 Arnd Bergmann         2026-08-07  410  	supply = devm_kzalloc(&pdev->dev, sizeof(*supply), GFP_KERNEL);
12ff7114412140 Arnd Bergmann         2026-08-07  411  	if (!supply)
12ff7114412140 Arnd Bergmann         2026-08-07  412  		return -ENOMEM;
12ff7114412140 Arnd Bergmann         2026-08-07  413  	pdata = &supply->pdata;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  414  
12ff7114412140 Arnd Bergmann         2026-08-07  415  	ret = as3711_backlight_parse_dt(&pdev->dev, pdata);
41f1b3edb581db Krzysztof Kozlowski   2024-03-05  416  	if (ret < 0)
41f1b3edb581db Krzysztof Kozlowski   2024-03-05  417  		return dev_err_probe(&pdev->dev, ret, "DT parsing failed\n");
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  418  
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  419  	if (!pdata->su1_fb && !pdata->su2_fb) {
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  420  		dev_err(&pdev->dev, "No framebuffer specified\n");
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  421  		return -EINVAL;
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  422  	}
59eb2b5e57eaf0 Guennadi Liakhovetski 2013-04-29  423  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  424  	/*
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  425  	 * Due to possible hardware damage I chose to block all modes,
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  426  	 * unsupported on my hardware. Anyone, wishing to use any of those modes
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  427  	 * will have to first review the code, then activate and test it.
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  428  	 */
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  429  	if (pdata->su1_fb ||
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  430  	    pdata->su2_fbprot != AS3711_SU2_GPIO4 ||
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  431  	    pdata->su2_feedback != AS3711_SU2_CURR_AUTO) {
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  432  		dev_warn(&pdev->dev,
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  433  			 "Attention! An untested mode has been chosen!\n"
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  434  			 "Please, review the code, enable, test, and report success:-)\n");
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  435  		return -EINVAL;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  436  	}
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  437  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  438  	supply->as3711 = as3711;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21 @439  	supply->pdata = pdata;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  440  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  441  	if (pdata->su1_fb) {
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  442  		su = &supply->su1;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  443  		su->type = AS3711_BL_SU1;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  444  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  445  		max_brightness = min(pdata->su1_max_uA, 31);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  446  		ret = as3711_bl_register(pdev, max_brightness, su);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  447  		if (ret < 0)
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  448  			return ret;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  449  	}
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  450  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  451  	if (pdata->su2_fb) {
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  452  		su = &supply->su2;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  453  		su->type = AS3711_BL_SU2;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  454  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  455  		switch (pdata->su2_fbprot) {
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  456  		case AS3711_SU2_GPIO2:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  457  		case AS3711_SU2_GPIO3:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  458  		case AS3711_SU2_GPIO4:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  459  		case AS3711_SU2_LX_SD4:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  460  			break;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  461  		default:
83dedc056b61bc Jingoo Han            2013-11-12  462  			return -EINVAL;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  463  		}
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  464  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  465  		switch (pdata->su2_feedback) {
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  466  		case AS3711_SU2_VOLTAGE:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  467  			max_brightness = min(pdata->su2_max_uA, 31);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  468  			break;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  469  		case AS3711_SU2_CURR1:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  470  		case AS3711_SU2_CURR2:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  471  		case AS3711_SU2_CURR3:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  472  		case AS3711_SU2_CURR_AUTO:
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  473  			max_brightness = min(pdata->su2_max_uA / 150, 255);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  474  			break;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  475  		default:
83dedc056b61bc Jingoo Han            2013-11-12  476  			return -EINVAL;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  477  		}
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  478  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  479  		ret = as3711_bl_init_su2(supply);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  480  		if (ret < 0)
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  481  			return ret;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  482  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  483  		ret = as3711_bl_register(pdev, max_brightness, su);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  484  		if (ret < 0)
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  485  			return ret;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  486  	}
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  487  
83dedc056b61bc Jingoo Han            2013-11-12  488  	platform_set_drvdata(pdev, supply);
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  489  
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  490  	return 0;
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  491  }
de474b5bfcd544 Guennadi Liakhovetski 2013-02-21  492  

:::::: The code at line 439 was first introduced by commit
:::::: de474b5bfcd5448681549369efb36c51f870ea60 backlight: add an AS3711 PMIC backlight driver

:::::: TO: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
