Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357F08814
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720389581; cv=none; b=ac4HfFEQrp4j+SpmbDJqwTk6kPli598CGCcnbYds8fGyjMwtEw0ZgnRjUmJ3wQ/Cs25iz7c/ePoq6Mnfx0DdjynJRIMgM80+GFWfShvKiPsiod+o8XM2W+zvhOrefVJvZOk90BbOieNlsoDxIZPUhrWtm9pjG/74WVeGmK65/VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720389581; c=relaxed/simple;
	bh=85uIH3BEHMBxUDAQtbACjpvFUlz23ww8KKreCacGGyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPwhjMmRBC9Go//o7r8I+U2gY/RfPpSyDL1p5+B+ccZNnB+YBu0BdAFASjcEsol2neqeh/GvqsSxvnoXZYdx3MYNnejrCNMeTLU8wyLq/QrMkKqTB+1uO25PapqsGSZi3+8gY1gMEmuzwQxXnbmHu6tzLdSUdZ7f9Eh3+bvL044=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm5tsJ8Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm5tsJ8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720389574; x=1751925574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=85uIH3BEHMBxUDAQtbACjpvFUlz23ww8KKreCacGGyQ=;
  b=Zm5tsJ8Z5pHYnIQAmqGtFcXySUHcx7iRV3ZLrMGDDHMhf4bMXwRZ7NOA
   aAOs2VrQ3vvwjwPKLBb5c8VYkDILVuacvkoKxKcnZG5VEVhUDXYc/gVOF
   alP/5YNQZBdzfeRHaKBgmduwcCJ0KSXyqhOu4L2vSLpCFbGQf95wvFjhn
   j0daDnmSlfk9FVInOV9JIxk8Lv7OfZj3SimLIBweurP9eVTe3Lh1tyZUL
   Be73Urz9c7zNrcP6fXUtB0oo1HayzHheJ1rkJmRhf41pV4gZQIdKtD6Eg
   h75Hthh6PXdbuff66sLrT2bR3O/nmrab2h85IVvBZ6+/pjqTPYvEV0G0A
   Q==;
X-CSE-ConnectionGUID: EThI2vTST3+j0hGI5Kmv7g==
X-CSE-MsgGUID: qxRi8VKkSoigwjydIyRN0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="20485471"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="20485471"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 14:59:33 -0700
X-CSE-ConnectionGUID: J8o7efaBTYqZrFPJYmyNrg==
X-CSE-MsgGUID: oxynnYHWQcmK3IZfyPA+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47094873"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 14:59:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQZur-000VJ8-09;
	Sun, 07 Jul 2024 21:59:29 +0000
Date: Mon, 8 Jul 2024 05:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3876/10596]
 drivers/net/ethernet/mucse/rnp/rnp_pcs.c:15:9: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202407080500.X6ek0A6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3b421b6002e287e38790cbdad4a3e08baf7e1bc4
commit: 455d45ae080810ae554f5e586adb9004230f9f70 [3876/10596] drivers: initial support for rnp drivers from Mucse Technology
config: loongarch-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080500.X6ek0A6W-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080500.X6ek0A6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080500.X6ek0A6W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mucse/rnp/rnp_pcs.c:15:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_pcs.c:15:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:15:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:15:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:16:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_pcs.c:16:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:16:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:16:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:26:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:26:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:26:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:26:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:27:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:27:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:27:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_pcs.c:27:9: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnp/rnp_param.c:275:33: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_param.c:275:33: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_param.c:275:33: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_param.c:277:33: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_param.c:277:33: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_param.c:277:33: sparse:    void *
--
>> drivers/net/ethernet/mucse/rnp/rnp_dcb.c:42:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_dcb.c:42:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:42:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:42:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:46:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:46:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:46:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:46:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:65:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:65:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:65:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:65:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:67:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_dcb.c:67:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:67:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:67:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:72:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:72:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:72:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:72:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:94:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:94:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:94:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_dcb.c:94:25: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_dcb.c:297:29: sparse: sparse: symbol 'rnp_dcbnl_ops' was not declared. Should it be static?
--
>> drivers/net/ethernet/mucse/rnp/rnp_mbx.c:352:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_mbx.c:352:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:352:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:352:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:356:21: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_mbx.c:356:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:356:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:356:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:403:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:403:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:403:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:403:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:422:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:422:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:422:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:422:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:464:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:464:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:464:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:464:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:468:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:468:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:468:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:468:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:482:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:482:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:482:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:482:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:493:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:493:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:493:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:493:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:496:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:496:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:496:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:496:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:499:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:499:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:499:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:499:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:502:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:502:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:502:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:502:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:505:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:505:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:505:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:505:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:507:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:507:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:507:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:507:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:511:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:511:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:511:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:511:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:522:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:522:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:522:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:522:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:525:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:525:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:525:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:525:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:528:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:528:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:528:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:528:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:532:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:532:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:532:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:532:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:536:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:536:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:536:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:536:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:539:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:539:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:539:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:539:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:542:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:542:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:542:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:542:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:545:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:545:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:545:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:545:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:547:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:547:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:547:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:547:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:553:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:553:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:553:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:553:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:555:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:555:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:555:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:555:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:558:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:558:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:558:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:558:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:562:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx.c:562:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
--
>> drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:89:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:89:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:89:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:89:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:90:41: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:90:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:90:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:90:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:106:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:106:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:106:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_debugfs.c:106:41: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnp/rnp_mpe.c:72:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:72:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:72:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:73:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:73:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:73:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:74:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:74:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:74:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:96:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:96:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:96:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:102:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:102:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:102:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:105:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:105:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:105:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:112:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:112:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:112:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:113:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:113:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:113:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:116:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:116:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:116:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_mpe.c:175:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char *rpu_base @@     got unsigned char [noderef] [usertype] __iomem *rpu_addr @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:175:23: sparse:     expected char *rpu_base
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:175:23: sparse:     got unsigned char [noderef] [usertype] __iomem *rpu_addr
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:201:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char *rpu_base @@     got unsigned char [noderef] [usertype] __iomem *rpu_addr @@
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:201:42: sparse:     expected char *rpu_base
   drivers/net/ethernet/mucse/rnp/rnp_mpe.c:201:42: sparse:     got unsigned char [noderef] [usertype] __iomem *rpu_addr
--
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:439:5: sparse: sparse: symbol 'rnp_acquire_msix_vectors' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:531:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:531:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:531:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:531:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:550:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:550:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:550:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:550:33: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:596:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:596:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:596:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:600:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:600:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:600:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:984:6: sparse: sparse: symbol 'rnp_print_ring_info' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1049:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1049:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1049:9: sparse:    void *
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:1135:61: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1135:61: sparse:    left side has type restricted __le32
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1135:61: sparse:    right side has type int
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1256:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_lib.c:1256:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1256:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1256:16: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1259:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1259:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1259:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1259:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1303:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1303:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1303:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1303:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1304:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1304:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1304:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1304:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1312:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1312:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1312:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1312:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1313:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1313:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1313:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1313:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1327:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1327:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1327:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1327:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1329:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1329:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1329:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1329:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1346:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1346:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1346:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1346:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1348:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1348:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1348:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1348:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1350:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1350:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1350:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:1350:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:491:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:491:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:491:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:491:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:481:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:481:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:481:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_lib.c:481:17: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnp/rnp_ptp.c:122:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_ptp.c:122:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:122:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:122:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:277:5: sparse: sparse: symbol 'rnp_ptp_setup_ptp' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:608:13: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_ptp.c:608:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:608:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:608:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:614:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:614:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:614:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:614:27: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:615:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:615:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:615:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:615:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:621:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:621:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:621:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:621:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:623:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:623:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:623:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:623:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_ptp.c:676:13: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/ethernet/mucse/rnp/rnp_ptp.c:693:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_ptp.c:694:20: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:213:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:213:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:213:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:213:33: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1176:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] h_proto @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1176:45: sparse:     expected restricted __be16 [usertype] h_proto
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1176:45: sparse:     got int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1192:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] psrc @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1192:52: sparse:     expected restricted __be16 [usertype] psrc
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1192:52: sparse:     got int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1193:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] pdst @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1193:52: sparse:     expected restricted __be16 [usertype] pdst
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1193:52: sparse:     got int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1194:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1194:54: sparse:     expected restricted __be32 [usertype] ip4src
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1194:54: sparse:     got unsigned int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1195:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] ip4dst @@     got unsigned int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1195:54: sparse:     expected restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1195:54: sparse:     got unsigned int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1440:51: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1445:51: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1473:51: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1478:51: sparse: sparse: restricted __be32 degrades to integer
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1483:51: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1488:51: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1711:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] src_port_mask @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1711:55: sparse:     expected restricted __be16 [usertype] src_port_mask
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1711:55: sparse:     got int
>> drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1713:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] dst_port_mask @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1713:55: sparse:     expected restricted __be16 [usertype] dst_port_mask
   drivers/net/ethernet/mucse/rnp/rnp_ethtool.c:1713:55: sparse:     got int
--
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:67:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:67:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:67:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:72:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:72:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:72:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:72:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:189:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:189:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:189:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:189:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:192:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:192:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:192:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:192:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:831:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:831:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:831:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:831:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:835:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:835:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:835:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:835:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:837:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:837:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:837:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:837:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1141:5: sparse: sparse: symbol 'rnp_fw_reg_read' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1178:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1178:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1178:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1178:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1187:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1187:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1187:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1187:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1201:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1201:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1201:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1201:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1212:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1212:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1212:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_mbx_fw.c:1456:5: sparse: sparse: symbol 'rnp_mbx_lldp_all_ports_enable' was not declared. Should it be static?
--
>> drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:823:15: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:823:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:823:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:823:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:827:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:827:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:827:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:827:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:831:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:831:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:831:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:831:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:837:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:837:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:837:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:837:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:841:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:841:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:841:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:847:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:847:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:847:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:847:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:851:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:851:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:851:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:851:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:855:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:855:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:855:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:855:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:861:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:861:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:861:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:861:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:865:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:865:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:865:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:865:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:871:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:871:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:871:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:871:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:875:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:875:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:875:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:875:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:879:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:879:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:879:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:879:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:883:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:883:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:883:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:883:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:887:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:887:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:887:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:887:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:891:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:891:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:891:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:891:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:895:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:895:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:895:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:895:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:918:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:918:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:918:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:918:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:922:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:922:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:922:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:922:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:926:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:926:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:926:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:926:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:931:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:931:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:931:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:931:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:936:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:936:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:936:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:936:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:941:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:941:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:941:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:941:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:946:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:946:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:946:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:946:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:951:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:951:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:951:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:951:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:956:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:956:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
--
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1035:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1035:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1035:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1039:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1039:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1039:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1039:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1043:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1043:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1043:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1043:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1048:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1048:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1048:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1048:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1054:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1054:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1054:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1054:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1058:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1058:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1058:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1058:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1062:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1062:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1062:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1062:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1066:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1066:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1066:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1066:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1070:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1070:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1070:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1070:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1074:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1074:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1074:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1074:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1078:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1078:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1078:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1078:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1082:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1082:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1082:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1082:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1086:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1086:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1086:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1086:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1090:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1090:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1090:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1090:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1094:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1094:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1094:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1094:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1098:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1098:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1098:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1098:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1105:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1105:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1105:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1105:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1109:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1109:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1109:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1109:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1113:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1113:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1113:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1113:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1117:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1117:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1117:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1117:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1124:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1124:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1124:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1124:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1128:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1128:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1128:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1128:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1132:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1132:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1132:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1132:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1154:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1154:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1154:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1154:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1186:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1186:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1186:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1186:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1188:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1188:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1188:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1188:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1192:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1192:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1192:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1192:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1214:5: sparse: sparse: symbol 'rnp_mbx_get_pn_sn' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1312:60: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1312:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1312:60: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1312:60: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1531:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1531:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1531:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1531:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1533:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1533:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1533:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1533:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1539:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1539:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1539:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1539:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1540:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1540:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1540:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1540:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1926:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1926:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1926:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1926:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1930:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1930:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1930:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1930:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1936:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1936:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1936:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1936:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1938:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1938:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1938:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1938:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1943:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1943:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1943:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1943:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1946:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1946:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1946:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sysfs.c:1946:9: sparse:     got void *
--
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:305:6: sparse: sparse: symbol 'check_ari_mode' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:724:40: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:724:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:724:40: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:724:40: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:726:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:726:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:726:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:726:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:898:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:898:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:898:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:898:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1140:5: sparse: sparse: symbol 'rnp_msg_post_status_signle_link' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1290:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1290:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1290:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1290:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1292:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1292:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1292:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c:1292:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_sriov.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:65:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:65:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:65:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:65:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:67:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:67:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:67:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:67:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:69:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:69:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:69:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:82:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:82:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:82:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:82:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:93:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:93:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:93:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:93:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:95:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:95:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:95:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:95:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:97:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:97:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:97:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:97:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:99:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:99:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:99:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:99:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:151:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:151:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:151:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:151:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:158:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:158:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:158:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:158:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:159:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:159:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:159:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:159:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:165:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:165:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:165:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:165:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:167:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:167:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:167:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:167:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:122:5: sparse: sparse: symbol 'rnp_eth_set_rar_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:195:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:195:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:195:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:195:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:198:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:198:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:198:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:198:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:199:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:199:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:199:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:199:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:179:5: sparse: sparse: symbol 'rnp_eth_clear_rar_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:231:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:231:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:231:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:231:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:233:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:233:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:233:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:233:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:214:5: sparse: sparse: symbol 'rnp_eth_set_vmdq_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:254:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:254:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:254:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:254:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:244:5: sparse: sparse: symbol 'rnp_eth_clear_vmdq_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:328:4: sparse: sparse: symbol 'rnp_addr_list_itr' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:420:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:420:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:420:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:420:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:428:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:428:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:428:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:428:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:429:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:429:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:429:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:429:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:359:5: sparse: sparse: symbol 'rnp_eth_update_mc_addr_list_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:447:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:447:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:447:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:447:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:442:6: sparse: sparse: symbol 'rnp_eth_clr_mc_addr_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:474:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:474:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:474:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:474:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:478:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:478:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:478:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:478:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:457:6: sparse: sparse: symbol 'rnp_eth_update_rss_key_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:497:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:497:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:497:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:497:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:501:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:501:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:501:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:501:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:488:6: sparse: sparse: symbol 'rnp_eth_update_rss_table_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:533:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:533:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:533:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:533:16: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:548:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:548:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:548:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:548:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:513:5: sparse: sparse: symbol 'rnp_eth_set_vfta_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:558:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:558:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:558:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:558:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:553:6: sparse: sparse: symbol 'rnp_eth_clr_vfta_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:570:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:570:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:570:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:570:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:576:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:576:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:576:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:576:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:579:5: sparse: sparse: symbol 'rnp_layer2_pritologic_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:592:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:592:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:592:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:592:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:597:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:597:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:597:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:597:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:600:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:600:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:600:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:600:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:604:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:604:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:604:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:604:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:584:6: sparse: sparse: symbol 'rnp_eth_set_layer2_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:615:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:615:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:615:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:615:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:610:6: sparse: sparse: symbol 'rnp_eth_clr_layer2_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:623:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:623:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:623:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:623:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:618:6: sparse: sparse: symbol 'rnp_eth_clr_all_layer2_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:626:5: sparse: sparse: symbol 'rnp_tuple5_pritologic_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:631:5: sparse: sparse: symbol 'rnp_tuple5_pritologic_tcam_n10' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:667:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:673:25: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:679:34: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:679:30: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:679:30: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:679:30: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:683:34: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:683:34: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:688:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:688:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:688:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:688:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:712:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:712:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:712:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:712:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:718:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:718:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:718:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:718:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:722:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:722:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:722:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:722:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:727:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:727:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:727:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:727:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:743:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:743:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:743:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:743:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:745:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:747:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:750:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:750:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:750:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:750:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:751:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:751:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:751:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:751:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:754:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:756:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:759:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:759:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:759:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:759:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:760:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:760:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:760:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:760:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:763:34: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:763:34: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:764:39: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:764:39: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:769:34: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:769:30: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:769:30: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:769:30: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:771:34: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:770:35: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:770:35: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:770:35: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:776:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:776:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:776:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:776:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:777:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:777:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:777:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:777:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:780:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:780:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:780:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:780:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:781:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:781:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:781:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:781:25: sparse:     got void *
--
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2109:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2109:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2109:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2109:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2117:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2117:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2117:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2117:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2120:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2120:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2120:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2120:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2121:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2121:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2121:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2121:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2122:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2122:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2122:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2122:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2123:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2123:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2123:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2123:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2124:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2124:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2124:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2124:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2125:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2125:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2125:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2125:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2126:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2126:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2126:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2126:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2130:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2130:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2130:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2130:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2132:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2132:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2132:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2132:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2133:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2133:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2133:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2133:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2135:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2135:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2135:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2135:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2137:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2137:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2137:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2137:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2139:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2139:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2139:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2139:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2141:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2141:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2141:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2141:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2143:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2143:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2143:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2143:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2145:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2145:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2145:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2145:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2147:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2147:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2147:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2147:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2149:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2149:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2149:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2149:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2151:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2151:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2151:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2151:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2153:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2153:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2153:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2153:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2155:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2155:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2155:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2155:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2158:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2158:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2158:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2158:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2160:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2160:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2160:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2160:23: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_n10.c:2196:24: sparse: sparse: symbol 'rnp10_gstrings_net_stats' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:2805:5: sparse: sparse: symbol 'rnp10_get_link_ksettings' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3003:5: sparse: sparse: symbol 'rnp10_set_link_ksettings' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3246:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3246:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3246:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3246:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3249:5: sparse: sparse: symbol 'rnp_nway_reset' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3269:6: sparse: sparse: symbol 'rnp_device_supports_autoneg_fc' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3587:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3587:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3587:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3587:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3674:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3674:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3674:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3674:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3679:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3679:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3679:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3679:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3720:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3720:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3720:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3720:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3826:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3826:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3826:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3826:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3827:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3827:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3827:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3827:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3889:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3889:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3889:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3889:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3890:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3890:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3890:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3890:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3950:6: sparse: sparse: symbol 'rnp_set_ethtool_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3960:5: sparse: sparse: symbol 'rnp_get_thermal_sensor_data_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3976:5: sparse: sparse: symbol 'rnp_init_thermal_sensor_thresh_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:3990:5: sparse: sparse: symbol 'rnp_phy_read_reg_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4002:5: sparse: sparse: symbol 'rnp_phy_write_reg_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4012:6: sparse: sparse: symbol 'rnp_set_vf_vlan_mode_hw_ops_n10' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4086:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4090:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4090:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4090:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4090:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4099:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4099:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4099:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4099:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4100:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4100:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4100:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4100:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4103:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4107:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4107:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4107:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4107:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4114:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4114:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4114:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4114:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4118:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4121:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4121:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4121:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4121:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4128:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4128:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4128:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4128:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4136:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_n10.c:4136:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
--
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:166:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:166:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:166:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:175:6: sparse: sparse: symbol 'rnp_unmap_and_free_tx_resource' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:202:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:202:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:203:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:203:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:602:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c:613:64: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c:702:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:702:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:670:5: sparse: sparse: symbol 'rnp_rx_ring_reinit' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2021:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2021:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2012:6: sparse: sparse: symbol 'rnp_write_eitr_rx' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2225:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2225:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2236:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2236:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2272:49: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2272:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2293:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2293:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2311:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2311:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2392:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2392:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2392:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2426:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2426:17: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2426:17: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2469:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2469:17: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2469:17: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2550:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2550:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2550:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2550:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2551:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2551:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2551:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2551:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2591:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2591:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2591:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2591:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2593:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2593:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2593:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2593:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2595:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2595:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2595:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2595:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2599:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2599:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2599:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2599:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2602:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2602:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2602:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2602:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2605:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2605:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2605:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2605:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2612:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2612:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2612:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2612:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2618:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2618:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2618:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2618:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2620:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2620:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2620:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2620:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2659:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2659:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2659:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2659:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2661:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2661:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2661:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2661:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2671:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2671:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2671:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2671:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2685:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2685:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2685:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2685:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2687:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2687:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2687:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2687:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2689:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2689:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2689:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2689:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2693:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2693:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2693:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2693:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2697:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2697:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2697:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2697:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2700:17: sparse: sparse: cast removes address space '__iomem' of expression
--
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2728:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2728:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2730:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2730:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2730:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2730:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2752:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2833:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2833:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2833:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2833:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2840:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2840:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2840:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2840:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2842:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2842:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2842:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2842:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3146:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3146:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3146:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3146:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3147:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3147:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3147:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3147:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3148:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3148:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3148:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3148:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3176:6: sparse: sparse: symbol 'rnp_vlan_stags_flag' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3284:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3284:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3284:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3284:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3601:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3601:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3601:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3601:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3580:5: sparse: sparse: symbol 'rnp_xmit_nop_frame_ring' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3662:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3662:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3662:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3662:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3712:42: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3712:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3712:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3712:42: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3722:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3722:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3722:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3722:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3728:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3728:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3728:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3728:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3738:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3738:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3738:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3738:48: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3920:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3920:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3920:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3923:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3923:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:3923:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4017:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4017:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4017:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4020:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4020:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4020:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4052:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4052:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4052:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4052:24: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4237:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4237:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4237:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4305:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4305:9: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4305:9: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4358:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4358:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4358:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4358:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4842:6: sparse: sparse: symbol 'rnp_service_timer' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:4950:6: sparse: sparse: symbol 'rnp_service_task' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5384:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5384:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5384:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5384:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:5515:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] priv_tags @@     got int @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5515:42: sparse:     expected restricted __be16 [usertype] priv_tags
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5515:42: sparse:     got int
   drivers/net/ethernet/mucse/rnp/rnp_main.c:5972:5: sparse: sparse: symbol 'rnp_delete_knode' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6036:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] off @@     got int off @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6036:21: sparse:     expected restricted __be32 [usertype] off
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6036:21: sparse:     got int off
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6044:29: sparse: sparse: restricted __be32 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6061:5: sparse: sparse: symbol 'rnp_config_knode' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6120:5: sparse: sparse: symbol 'rnp_setup_tc_cls_u32' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6197:6: sparse: sparse: symbol 'rnp_do_reset' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6348:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6352:25: sparse:     got void *
>> drivers/net/ethernet/mucse/rnp/rnp_main.c:6418:29: sparse: sparse: symbol 'rnp10_netdev_ops' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6452:6: sparse: sparse: symbol 'rnp_assign_netdev_ops' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6609:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6609:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6609:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6609:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6628:5: sparse: sparse: symbol 'rnp_can_rpu_start' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6692:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6692:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6692:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6692:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6713:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6713:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6713:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6713:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6737:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6737:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6737:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:6737:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7010:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7010:17: sparse:    void
   drivers/net/ethernet/mucse/rnp/rnp_main.c:7010:17: sparse:    void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:412:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c:435:33: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c: note: in included file (through drivers/net/ethernet/mucse/rnp/rnp_tc_u32_parse.h):
>> drivers/net/ethernet/mucse/rnp/rnp.h:1143:13: sparse: sparse: cast from restricted __le16
>> drivers/net/ethernet/mucse/rnp/rnp.h:1143:13: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnp/rnp_main.c:470:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:470:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:470:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:470:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2040:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2051:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnp/rnp_main.c:2055:17: sparse:     got void *

vim +/__iomem +15 drivers/net/ethernet/mucse/rnp/rnp_pcs.c

     7	
     8	static u32 rnp_read_pcs(struct rnp_hw *hw, int num, u32 addr)
     9	{
    10		u32 reg_hi, reg_lo;
    11		u32 value;
    12	
    13		reg_hi = addr >> 8;
    14		reg_lo = (addr & 0xff) << 2;
  > 15		wr32(hw, RNP_PCS_BASE(num) + (0xff << 2), reg_hi);
  > 16		value = rd32(hw, RNP_PCS_BASE(num) + reg_lo);
    17		return value;
    18	}
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
