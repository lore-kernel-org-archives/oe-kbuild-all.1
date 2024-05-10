Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D285A1635CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715334726; cv=none; b=pa7N9sAPPjHHmmFASrJanpb/1eio5Cg3ijUkxlr3u4oKCD4WNZrvKS/elAEdredvjkyqckrL3ojMtsGW6JpK98CRRAl+w8JUlq3Xf6i1nN9PHNEjcEgU4AFVbxYsH0bC2SooHF9WdMmE9dptIKYugENAwlaB4t11jqtEacCt0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715334726; c=relaxed/simple;
	bh=73MhQNY+V6Zy7zfr5F40OQSoj0EBJF8+mVYNWNIBwCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9Iuvjm9CleZ+j6XieCv177E7MvKZyjnYlllYe/5HG6+sbzbhNArHbrzrqnn+YnekBPF7els8sVxLCkOdqaRPpg7VMCqqq6aIp30mfTi6+N7ED/nXD6jPxhApn1Ck2eZYeh32Yd401nUXT5cl2VfJBqO5g7TgsK9dZFsvRMqN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URttB1p/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URttB1p/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715334724; x=1746870724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73MhQNY+V6Zy7zfr5F40OQSoj0EBJF8+mVYNWNIBwCw=;
  b=URttB1p/By+JWXJPKWr33oBPiDtjIOHzQ8vtUDqtrav4m58fyLOBVcYe
   n4pV6j1k5JYHmT11mSfUZTIjSylFmw8MOPIV7lnADlp1qa0mgd2hCk2ly
   emfdT46Ha323hy9hgkpCPNWqjj9wfCPA05+FuYjAgL3NLcTf+ZPu3b11e
   RN0j+Cq2CMFsDk6J919J7Wrn+j5IADPoc67WGU8pWv3/Rsdfn9ERh460R
   LRb7tG9PrNmn9Oi6RVZUna50wibww+Jxyt83lexg0y50TwWZ2hhRSgrE0
   goSf3ylMoPl77t2D81u2Wv/eflKnmxF4UoM+XEt+xyGrmiqZhEVrvppq5
   A==;
X-CSE-ConnectionGUID: sgANaEqkRoehbyloxxIrHg==
X-CSE-MsgGUID: EWKQA2yBQfWcyP0k+Nx5sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11140701"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11140701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 02:52:01 -0700
X-CSE-ConnectionGUID: GJ/WExVKQvGZ5e6rknFozA==
X-CSE-MsgGUID: 2aRwDpU5Q3GtD3TzRzdovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="52769609"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2024 02:52:00 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Muz-0005yT-1i;
	Fri, 10 May 2024 09:51:57 +0000
Date: Fri, 10 May 2024 17:51:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 103/105]
 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-debug.c:543:6:
 error: no previous prototype for function 'imgsys_cg_debug_dump'
Message-ID: <202405101730.ZxLOrvCh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cd87d14c5c4cc74e7c89677acb4aa9c804165fc7
commit: eba329daee52c5bc6a7d2ee896053b318f90ca50 [103/105] CHROMIUM: media: platform: mediatek: isp: NDD for IMGSYS RED SCP migration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405101730.ZxLOrvCh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405101730.ZxLOrvCh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405101730.ZxLOrvCh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-debug.c:543:6: error: no previous prototype for function 'imgsys_cg_debug_dump' [-Werror,-Wmissing-prototypes]
     543 | void imgsys_cg_debug_dump(struct mtk_imgsys_dev *imgsys_dev)
         |      ^
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-debug.c:543:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     543 | void imgsys_cg_debug_dump(struct mtk_imgsys_dev *imgsys_dev)
         | ^
         | static 
   1 error generated.


vim +/imgsys_cg_debug_dump +543 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-debug.c

   542	
 > 543	void imgsys_cg_debug_dump(struct mtk_imgsys_dev *imgsys_dev)
   544	{
   545		unsigned int i = 0;
   546	
   547		if (!imgsys_main_reg_base) {
   548			dev_info(imgsys_dev->dev, "%s Unable to ioremap imgsys_top registers\n",
   549				 __func__);
   550			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   551				 __func__, imgsys_dev->dev->of_node->name);
   552			return;
   553		}
   554	
   555		for (i = 0; i <= 0x500; i += 0x10) {
   556			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   557				 __func__, 0x15000000 + i, ioread32(imgsys_main_reg_base + i),
   558				 0x15000000 + i + 0x4, ioread32(imgsys_main_reg_base + i + 0x4),
   559				 0x15000000 + i + 0x8, ioread32(imgsys_main_reg_base + i + 0x8),
   560				 0x15000000 + i + 0xc, ioread32(imgsys_main_reg_base + i + 0xc));
   561		}
   562	
   563		if (!dip_reg_base) {
   564			dev_info(imgsys_dev->dev, "%s Unable to ioremap dip registers\n",
   565				 __func__);
   566			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   567				 __func__, imgsys_dev->dev->of_node->name);
   568			return;
   569		}
   570	
   571		for (i = 0; i <= 0x100; i += 0x10) {
   572			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   573				 __func__, 0x15110000 + i, ioread32(dip_reg_base + i),
   574				 0x15110000 + i + 0x4, ioread32(dip_reg_base + i + 0x4),
   575				 0x15110000 + i + 0x8, ioread32(dip_reg_base + i + 0x8),
   576				 0x15110000 + i + 0xc, ioread32(dip_reg_base + i + 0xc));
   577		}
   578	
   579		if (!dip1_reg_base) {
   580			dev_info(imgsys_dev->dev, "%s Unable to ioremap dip1 registers\n",
   581				 __func__);
   582			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   583				 __func__, imgsys_dev->dev->of_node->name);
   584			return;
   585		}
   586	
   587		for (i = 0; i <= 0x100; i += 0x10) {
   588			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   589				 __func__, 0x15130000 + i, ioread32(dip1_reg_base + i),
   590				 0x15130000 + i + 0x4, ioread32(dip1_reg_base + i + 0x4),
   591				 0x15130000 + i + 0x8, ioread32(dip1_reg_base + i + 0x8),
   592				 0x15130000 + i + 0xc, ioread32(dip1_reg_base + i + 0xc));
   593		}
   594	
   595		if (!wpe_dip1_reg_base) {
   596			dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip1 registers\n",
   597				 __func__);
   598			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   599				 __func__, imgsys_dev->dev->of_node->name);
   600			return;
   601		}
   602	
   603		for (i = 0; i <= 0x100; i += 0x10) {
   604			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   605				 __func__, 0x15220000 + i, ioread32(wpe_dip1_reg_base + i),
   606				 0x15220000 + i + 0x4, ioread32(wpe_dip1_reg_base + i + 0x4),
   607				 0x15220000 + i + 0x8, ioread32(wpe_dip1_reg_base + i + 0x8),
   608				 0x15220000 + i + 0xc, ioread32(wpe_dip1_reg_base + i + 0xc));
   609		}
   610	
   611		if (!wpe_dip2_reg_base) {
   612			dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip2 registers\n",
   613				 __func__);
   614			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   615				 __func__, imgsys_dev->dev->of_node->name);
   616			return;
   617		}
   618	
   619		for (i = 0; i <= 0x100; i += 0x10) {
   620			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   621				 __func__, 0x15520000 + i, ioread32(wpe_dip2_reg_base + i),
   622				 0x15520000 + i + 0x4, ioread32(wpe_dip2_reg_base + i + 0x4),
   623				 0x15520000 + i + 0x8, ioread32(wpe_dip2_reg_base + i + 0x8),
   624				 0x15520000 + i + 0xc, ioread32(wpe_dip2_reg_base + i + 0xc));
   625		}
   626	
   627		if (!wpe_dip3_reg_base) {
   628			dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip3 registers\n",
   629				 __func__);
   630			dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
   631				 __func__, imgsys_dev->dev->of_node->name);
   632			return;
   633		}
   634	
   635		for (i = 0; i <= 0x100; i += 0x10) {
   636			dev_info(imgsys_dev->dev, "%s: [0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X][0x%08X 0x%08X]",
   637				 __func__, 0x15620000 + i, ioread32(wpe_dip3_reg_base + i),
   638				 0x15620000 + i + 0x4, ioread32(wpe_dip3_reg_base + i + 0x4),
   639				 0x15620000 + i + 0x8, ioread32(wpe_dip3_reg_base + i + 0x8),
   640				 0x15620000 + i + 0xc, ioread32(wpe_dip3_reg_base + i + 0xc));
   641		}
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
