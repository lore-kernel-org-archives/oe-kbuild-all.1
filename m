Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F604685
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720398400; cv=none; b=mAf9w8gHhgg5euHQwAqG+F/x1A59ofQSkRNHYQKNIK6sx6D8mMgaZqK+T4FdPZ6j2BIk5oxkUtqZIcowyjahrscznucpnfTMGbL9GiFt39cJNUIdUivR0L7r81/MYEAJlfvLX1LBQdHIoBNfVBxC5vzmdoW63+Ay0yzJh3/aW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720398400; c=relaxed/simple;
	bh=+KnDgGZfNMMXPWuf7WevSyRIEpqPe65tOvOdurF8b9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNj0TPRxGvH/E96HnP0Fax+GOzbec732Yxz7HbnvuCclQHUoa90cELLcUyeFVMvaR/WSnjTTYVlNdVdGyH+AKPibXCnCek5rgFbITpnFto3pSOJxdvDSY1tzKe8PE1USx1wE36xCk8l4NokwuqIgzv63XQz5lVs3+U8Wehy8DB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYrSx96G; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYrSx96G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720398390; x=1751934390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KnDgGZfNMMXPWuf7WevSyRIEpqPe65tOvOdurF8b9k=;
  b=iYrSx96GoUONxwsMuXbmm0S1vZsvoRPizHlzvomZ1wpRE7KW5yHsWscN
   p/J7FXFqWFjSNpp8nE9DAsfF8JGAVn3fIVZCGQcTGZAEWU1vYW2ARHn8b
   RKh32/ybveQwF0BnzhaZeX+0F2DLLZ1i9aE2Rkz72rwZUqAO7FGSZ6lUh
   xfni1GABx3hKEog9Ldf6kTul42ZXWmy5pRWqXKTLBjuLL6yxIWV61QFPY
   jTDM6wcDAxpzxGOZtJDZe6JqsF2h8mcndG1sbXDlrhwPNc7PfXPrt+H3e
   pC5WXHXrVXiujsS1+7Tsy3x0XRLZ5QrsDCeBaaSdNHd57tawFZMKNg6X7
   A==;
X-CSE-ConnectionGUID: RAzZdGRvQUSNrTGj2MlpxQ==
X-CSE-MsgGUID: /meZJ9NLTIeeyXhwTmnR6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17796708"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17796708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 17:26:29 -0700
X-CSE-ConnectionGUID: qRlgrwnZTPOac/Gb5+0TRA==
X-CSE-MsgGUID: hRahoCR9Rqe3Uo9d052gaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="51782078"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jul 2024 17:26:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQcD3-000VOc-09;
	Mon, 08 Jul 2024 00:26:25 +0000
Date: Mon, 8 Jul 2024 08:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 4037/10596]
 drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:86:33: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <202407080814.NRFI4Oce-lkp@intel.com>
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
commit: 5deaf74c4b3edcf88f67f18aa352690deb9dc212 [4037/10596] drivers: initial support for rnpm drivers from Mucse Technology
config: loongarch-randconfig-r132-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080814.NRFI4Oce-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240708/202407080814.NRFI4Oce-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080814.NRFI4Oce-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:86:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:86:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:86:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:86:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:87:41: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:87:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:87:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:87:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:102:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:102:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:102:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c:102:41: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:16:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:16:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:16:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:16:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:17:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:17:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:17:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:17:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:28:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:28:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:28:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:28:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:29:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:29:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_pcs.c:29:9: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:76:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:76:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:76:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:79:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:79:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:79:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:81:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:81:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:81:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:107:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:107:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:107:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:113:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:113:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:113:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:116:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:116:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:116:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:125:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:125:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:125:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:126:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:126:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:126:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:130:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:130:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:130:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:189:23: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char *rpu_base @@     got unsigned char [noderef] [usertype] __iomem *rpu_addr @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:189:23: sparse:     expected char *rpu_base
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:189:23: sparse:     got unsigned char [noderef] [usertype] __iomem *rpu_addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:214:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char *rpu_base @@     got unsigned char [noderef] [usertype] __iomem *rpu_addr @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:214:43: sparse:     expected char *rpu_base
   drivers/net/ethernet/mucse/rnpm/rnpm_mpe.c:214:43: sparse:     got unsigned char [noderef] [usertype] __iomem *rpu_addr
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:446:5: sparse: sparse: symbol 'rnpm_reset_pipeline_n10' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:476:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:478:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:479:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:481:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:483:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:485:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:486:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:488:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:553:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:555:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:556:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:558:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_n10.c:561:9: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:20:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:20:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:20:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:20:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:29:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:29:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:29:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:29:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:31:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:31:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:31:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c:31:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_tc.c: note: in included file:
>> drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:28:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] ip @@     got restricted __be32 @@
   drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:28:44: sparse:     expected unsigned int [usertype] ip
   drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:28:44: sparse:     got restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:42:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] ip @@     got restricted __be32 @@
   drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:42:44: sparse:     expected unsigned int [usertype] ip
   drivers/net/ethernet/mucse/rnpm/rnpm_tc_u32_parse.h:42:44: sparse:     got restricted __be32
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:369:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:369:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:369:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:369:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:373:21: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:373:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:373:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:373:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:417:38: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:417:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:417:38: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:417:38: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:437:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:437:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:437:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:437:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:453:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:453:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:453:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:453:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:500:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:500:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:500:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:500:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:504:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:504:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:504:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:504:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:518:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:518:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:518:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:518:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:537:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:537:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:537:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:537:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:542:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:542:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:542:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:542:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:545:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:545:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:545:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:545:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:549:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:549:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:549:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:549:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:551:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:551:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:551:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:551:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:552:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:552:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:552:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:552:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:555:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:555:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:555:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:555:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:568:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:568:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:568:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:568:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:573:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:573:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:573:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:573:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:576:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:576:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:576:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:576:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:580:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:580:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:580:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:580:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:585:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:585:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:585:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:585:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:588:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:588:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:588:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:588:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:589:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:589:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:589:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:589:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:593:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:593:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:593:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:593:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:595:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:595:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:595:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:595:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:599:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:599:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:599:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:599:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:600:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:600:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:600:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:600:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:603:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx.c:603:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:61:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:67:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:67:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:67:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:69:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:69:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:69:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:69:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:70:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:70:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:70:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:71:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:71:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:71:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:71:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:73:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:73:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:73:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:73:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:75:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:210:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:210:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:210:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:210:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:212:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:212:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:212:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:361:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:361:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:361:19: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:361:19: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:362:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:362:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:362:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:362:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:380:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:380:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:380:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:380:27: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:382:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:382:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:382:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:382:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:424:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:424:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:424:35: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:424:35: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:427:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:427:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:427:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:427:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:643:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:643:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:643:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:643:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:645:44: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:645:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:645:44: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:645:44: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:773:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:773:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:773:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:773:21: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:976:5: sparse: sparse: symbol 'rnpm_get_vf_ringnum' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:989:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:989:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:989:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:989:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:996:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:996:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:996:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:996:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c:983:5: sparse: sparse: symbol 'rnpm_setup_ring_maxrate' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/net/ethernet/mucse/rnpm/rnpm_sriov.c: note: in included file (through drivers/net/ethernet/mucse/rnpm/rnpm.h):
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:18:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:18:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:18:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:18:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:24:21: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:24:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:24:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:24:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:56:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:56:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:56:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:56:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:67:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:67:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:67:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:67:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:69:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:69:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:69:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:69:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:71:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:71:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:71:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:71:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:76:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:76:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:76:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:76:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:94:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:94:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:94:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:94:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:95:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:95:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:95:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:95:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:97:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:97:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:97:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:97:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:99:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:99:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:99:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:99:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:102:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:102:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:102:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:102:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:125:14: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:125:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:125:14: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:125:14: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:127:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:127:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:127:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:127:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:136:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:136:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:136:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:136:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:164:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:164:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:164:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:164:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:172:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:172:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:172:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:172:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:174:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:174:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:174:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:174:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:177:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:177:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:177:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:177:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:179:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:179:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:179:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:179:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:184:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:184:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:184:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:184:23: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:316:5: sparse: sparse: symbol 'rnpm_ptp_setup_ptp' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:681:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:681:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:681:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:681:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:687:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:687:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:687:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:687:27: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:688:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:688:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:688:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:688:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:695:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:695:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:695:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:695:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:697:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:697:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:697:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:697:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:769:13: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:786:20: sparse: sparse: cast to restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_ptp.c:787:20: sparse: sparse: cast to restricted __be32
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:572:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:926:9: sparse:    void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1039:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1046:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1048:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1050:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1067:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1106:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1139:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1149:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1150:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1152:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1154:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1179:16: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1182:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1196:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1200:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1204:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1185:6: sparse: sparse: symbol 'rnpm_setup_layer2_remapping' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: cast from restricted __be32
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1221:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1227:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:26: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1233:22: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1238:26: sparse: sparse: cast from restricted __be16
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1238:26: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1243:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1267:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1272:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1275:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1209:6: sparse: sparse: symbol 'rnpm_setup_tuple5_remapping' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1293:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1297:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1299:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1302:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1303:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1306:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     got restricted __be32 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1308:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1311:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1312:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1315:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1315:26: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1316:31: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1316:31: sparse: sparse: restricted __be16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:26: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1320:22: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:31: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:27: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:27: sparse:    left side has type unsigned int
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1321:27: sparse:    right side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1326:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1326:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1326:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1326:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1327:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1327:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1327:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1327:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1329:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1329:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1329:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1329:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1330:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1330:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1330:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1330:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1360:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1360:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1360:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1360:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1361:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1361:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1361:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1361:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1364:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1364:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1364:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1364:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1366:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1366:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1366:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1366:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1368:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1368:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1368:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1368:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1280:6: sparse: sparse: symbol 'rnpm_setup_tuple5_remapping_tcam' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1404:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1404:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1404:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1404:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1408:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1408:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1408:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1408:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1412:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1412:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1412:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1412:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1414:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1414:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1414:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1414:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1415:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1415:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1415:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1415:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1416:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1416:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1416:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1416:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1417:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1417:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1417:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1417:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1418:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1418:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1418:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1418:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1419:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1419:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1419:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1419:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1420:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1420:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1420:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1420:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1421:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1421:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1421:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1421:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1422:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1422:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1422:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1422:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1424:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1424:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1424:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1424:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1425:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1425:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1425:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1425:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1443:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1443:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1443:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1443:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1445:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1445:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1445:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1445:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1454:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1454:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1454:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1454:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1456:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1456:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1456:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1456:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1471:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1471:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1471:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1471:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1473:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1473:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1473:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1473:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1490:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1490:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1490:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1490:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1492:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1492:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1492:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1492:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1494:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1494:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1494:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:1494:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:469:17: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1763:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1763:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1763:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1763:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:224:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:224:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:224:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:224:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:242:39: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:242:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:242:39: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:244:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:244:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:244:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:244:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:245:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:245:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:245:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:245:39: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:247:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:247:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:247:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:247:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:249:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:249:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:249:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:249:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:250:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:250:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:250:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:250:39: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:251:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:251:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:251:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:251:39: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:252:39: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:252:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:252:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:252:39: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:253:40: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:253:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:253:40: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:253:40: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:255:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:255:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:255:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:255:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:336:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:336:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:336:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:336:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:337:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:337:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:337:19: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:337:19: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:374:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:374:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:374:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:374:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:380:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:380:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:380:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:380:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:802:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:802:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:802:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:802:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:809:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:809:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:809:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:809:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:810:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:810:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:810:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:810:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:816:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:816:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:816:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:816:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:818:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:818:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:818:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:818:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:855:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:855:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:855:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:855:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:856:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:856:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:856:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:856:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:859:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:859:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:859:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:859:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:861:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:861:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:861:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:861:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:887:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:887:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:887:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:887:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:891:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:891:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:891:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:891:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:892:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:892:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
--
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1322:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1322:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1322:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1322:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1331:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1331:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1331:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1331:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1332:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1332:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1332:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1332:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1343:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1343:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1343:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1343:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1345:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1345:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1345:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1345:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1409:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1409:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1409:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1409:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1415:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1415:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1415:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1415:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1416:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1416:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1416:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1416:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1441:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1441:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1441:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1441:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1443:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1443:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1443:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1443:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1445:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1445:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1445:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1445:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1447:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1447:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1447:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1447:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1466:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1466:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1466:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1466:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1468:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1468:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1468:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1468:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1515:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1515:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1515:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1515:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1519:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1519:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1519:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1519:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1574:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1574:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1574:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1574:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1577:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1577:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1577:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1577:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1588:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1588:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1588:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1588:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1590:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1590:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1590:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1590:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1871:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1871:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1871:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1871:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1893:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1893:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1893:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1893:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1906:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1906:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1906:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1906:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1932:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1932:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1932:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1932:24: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1966:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1966:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1966:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1966:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1968:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] vid @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1968:13: sparse:     expected unsigned short [usertype] vid
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1968:13: sparse:     got restricted __le16 [usertype]
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1974:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1974:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1974:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:1974:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2015:16: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2015:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2015:16: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2015:16: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2036:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2036:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2036:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2036:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2055:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2055:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2055:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2055:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2057:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2057:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2057:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.c:2057:25: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:29:5: sparse: sparse: symbol 'rnpm_mbx_write_posted_locked' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:70:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:70:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:70:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:70:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:75:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:75:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:75:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:75:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:73:6: sparse: sparse: symbol 'rnpm_link_stat_mark_disable' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:78:5: sparse: sparse: symbol 'rnpm_mbx_fw_post_req' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:138:5: sparse: sparse: symbol 'rnpm_fw_send_cmd_wait' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:210:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:210:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:210:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:210:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:619:5: sparse: sparse: symbol 'rnpm_mbx_lldp_all_ports_enable' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:879:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:879:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:879:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:879:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:883:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:883:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:883:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:883:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:886:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:886:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:886:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:886:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:916:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:916:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:916:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:916:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:919:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:919:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:919:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:919:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:922:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:922:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:922:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:922:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:933:5: sparse: sparse: symbol 'rnpm_mbx_pluginout_evt_en' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:962:5: sparse: sparse: symbol 'rnpm_fw_get_capablity' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1178:5: sparse: sparse: symbol 'rnpm_fw_reg_read' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1205:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1205:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1205:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1205:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1212:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1212:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1212:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1212:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1224:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1224:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1224:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1224:13: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1233:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1233:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1233:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1233:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1477:13: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1477:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1477:13: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1477:13: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_mbx_fw.c:1470:5: sparse: sparse: symbol 'rnpm_get_port_stats2' was not declared. Should it be static?
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:39:5: sparse: sparse: symbol 'bar4_reg_val' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:40:5: sparse: sparse: symbol 'bar4_reg_addr' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:41:5: sparse: sparse: symbol 'pcs_phy_num' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:42:5: sparse: sparse: symbol 'pcs_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:192:31: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:192:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:192:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:192:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:222:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:222:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:222:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:222:21: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:224:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:224:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:224:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:224:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:227:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:227:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:227:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:227:25: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:263:5: sparse: sparse: symbol 'rnpm_mbx_get_pn_sn' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:409:60: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:409:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:409:60: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:409:60: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:429:53: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:429:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:429:53: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:429:53: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:738:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:738:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:738:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:738:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:742:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:742:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:742:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:742:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:746:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:746:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:746:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:746:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:752:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:752:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:752:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:752:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:756:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:756:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:756:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:756:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:760:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:760:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:760:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:760:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:766:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:766:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:766:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:766:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:770:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:770:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:770:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:770:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:776:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:776:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:776:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:776:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:780:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:780:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:780:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:780:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:784:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:784:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:784:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:784:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:790:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:790:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:790:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:790:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:794:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:794:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:794:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:794:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:800:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:800:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:800:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:800:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:804:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:804:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:804:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:804:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:808:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:808:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:808:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:808:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:812:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:812:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:812:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:812:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:816:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:816:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:816:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:816:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:820:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:820:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:820:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:820:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:824:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:824:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:824:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:824:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:828:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:828:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:828:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:828:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:832:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:832:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:832:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:832:15: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:836:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:836:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:836:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_sysfs.c:836:15: sparse:     got void *
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:187:32: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:187:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:187:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:187:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1145:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1145:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1145:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:1145:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2464:20: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2464:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2464:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2464:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2504:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2504:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2504:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2504:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2532:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2532:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2532:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2532:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2543:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2543:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2543:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2543:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2560:22: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2560:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2560:22: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2560:22: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2692:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2692:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2692:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2692:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2944:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2944:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2944:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2944:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2946:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2946:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2946:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:2946:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3002:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3002:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3002:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3002:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3004:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3004:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3004:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3004:29: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_ethtool.c:3246:6: sparse: sparse: symbol 'rnpm_get_phy_statistics' was not declared. Should it be static?
--
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:50:6: sparse: sparse: symbol 'rnpm_port_name' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:256:6: sparse: sparse: symbol 'rnpm_pf_service_event_schedule' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:306:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:306:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:306:9: sparse:    void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:351:17: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:351:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:353:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:353:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1061:37: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1074:57: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1167:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1167:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:1137:5: sparse: sparse: symbol 'rnpm_rx_ring_reinit' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2215:56: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2215:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2220:56: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2220:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2207:6: sparse: sparse: symbol 'rnpm_write_eitr' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2775:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2775:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2787:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2787:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2902:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2902:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2902:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2994:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2994:17: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2994:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3033:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3033:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3033:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3033:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3013:5: sparse: sparse: symbol 'rnpm_xmit_nop_frame_ring' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3056:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3056:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3056:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3056:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3037:5: sparse: sparse: symbol 'rnpm_xmit_nop_frame_ring_temp' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3102:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3102:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3102:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3102:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3104:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3104:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3104:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3104:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3106:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3106:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3106:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3106:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3110:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3110:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3110:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3110:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3113:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3113:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3113:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3113:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3120:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3120:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3120:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3120:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3125:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3125:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3125:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3127:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3127:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3127:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3127:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3172:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3172:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3172:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3172:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3174:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3174:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3174:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3174:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3191:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3191:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3191:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3191:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3205:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3205:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3205:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3205:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3206:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3206:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3206:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3206:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3208:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3208:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3208:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3208:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3211:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3211:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3211:31: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3211:31: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3214:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3214:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3214:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3214:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3219:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3219:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3219:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3219:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3221:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3221:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3221:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3221:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3241:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3247:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3247:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3247:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3247:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3248:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3248:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3248:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3248:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3249:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3249:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3249:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3249:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3250:9: sparse:     got void *
--
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3497:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3497:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3497:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3497:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3502:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3502:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3502:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3502:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3504:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3504:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3504:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3504:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3505:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3524:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3529:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3529:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3529:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3529:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3531:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3531:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3531:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3531:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3533:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3581:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3581:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3581:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3581:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3674:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3674:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3674:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3674:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3756:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3756:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3756:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3756:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3763:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3763:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3763:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3763:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3767:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3767:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3767:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3767:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3883:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3883:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3883:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3883:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3884:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3884:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3884:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3884:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3885:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3885:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3885:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3885:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3918:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3918:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3918:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3918:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3923:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3923:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3923:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3923:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3924:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3924:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3924:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3924:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3928:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3928:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3928:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3928:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3930:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3930:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3930:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3930:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3931:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3931:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3931:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3931:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3909:6: sparse: sparse: symbol 'rnpm_vlan_stags_flag' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3968:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3968:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3968:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3968:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3970:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3970:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3970:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3970:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3976:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3976:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3976:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3976:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3988:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3988:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3988:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3988:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3989:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3989:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3989:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:3989:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4039:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4039:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4039:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4039:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4042:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4046:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4046:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4046:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4046:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4054:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4058:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4058:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4058:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4058:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4066:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4069:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4072:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4072:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4072:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4072:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4076:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4080:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4080:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4080:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4080:33: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4031:6: sparse: sparse: symbol 'control_mac_rx' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4124:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4124:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4124:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4124:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4456:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4456:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4456:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4456:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4513:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4513:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4513:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4513:34: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4522:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4522:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4522:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4522:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4525:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4525:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4525:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4525:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4539:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4539:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4539:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4539:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4546:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4546:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4546:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4546:41: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4559:48: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4559:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4559:48: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4559:48: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4817:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4817:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4817:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4917:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4917:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4917:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4956:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4956:24: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4956:24: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4956:24: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5139:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5139:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5139:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5215:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5215:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5215:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5299:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5299:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5299:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5299:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5300:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5300:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5300:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5300:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5301:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5301:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5301:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5301:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5302:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5302:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5302:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5302:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5308:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5308:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5308:33: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5308:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5313:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5313:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5313:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5313:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5318:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5318:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5318:35: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5318:35: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5319:32: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5319:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5319:32: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5319:32: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5322:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5322:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5322:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5322:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5328:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5328:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5328:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5328:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5332:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5332:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5332:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5332:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5335:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5335:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5335:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5335:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5338:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5338:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5338:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5338:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5340:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5340:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5340:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5340:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5343:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5343:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5343:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5343:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5347:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5347:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5347:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5347:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5354:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5354:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5354:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5354:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5357:43: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5357:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5357:43: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5357:43: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5364:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5364:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5364:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5364:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5366:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5366:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5366:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5366:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5370:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5370:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5370:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5370:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5372:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5372:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5372:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5372:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5377:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5377:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5377:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5377:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5379:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5379:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5379:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5379:23: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5382:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5382:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5382:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5382:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5384:23: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5384:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5384:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5384:23: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5803:6: sparse: sparse: symbol 'rnpm_pf_service_timer' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5821:6: sparse: sparse: symbol 'rnpm_service_timer' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5846:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5846:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5846:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5846:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5858:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5858:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5858:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5858:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5862:26: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5862:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5862:26: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5862:26: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5874:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5874:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5874:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5874:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5878:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5878:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5878:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5878:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5905:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5905:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5905:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5905:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5906:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5906:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5906:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5906:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5910:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5910:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5910:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5910:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5918:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5918:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5918:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5918:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5919:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5919:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5919:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5919:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5920:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5920:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5920:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5920:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5923:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5923:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5923:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5923:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5924:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5924:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5924:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5924:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5925:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5925:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5925:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5925:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5926:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5926:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5926:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5926:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5928:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5928:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5928:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5928:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5929:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5929:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5929:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5929:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5930:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5930:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5930:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5930:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5931:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5931:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5931:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5931:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5933:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5933:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5933:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5933:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5939:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5939:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5939:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5939:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5940:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5947:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5948:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5949:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5950:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5954:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5955:17: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5962:21: sparse: sparse: symbol 'wait_all_port_resetting' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5974:21: sparse: sparse: symbol 'clean_all_port_resetting' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6003:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6185:5: sparse: sparse: symbol 'rnpm_check_mc_addr' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6211:6: sparse: sparse: symbol 'update_pf_vlan' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6262:6: sparse: sparse: symbol 'rnpm_pf_service_task' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got long @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6436:27: sparse:     got long
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse:    left side has type restricted __le32
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6437:27: sparse:    right side has type long
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned short [usertype] old @@     got restricted __be16 [usertype] frag_off @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse:     expected unsigned short [usertype] old
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6483:32: sparse:     got restricted __be16 [usertype] frag_off
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse:    left side has type restricted __be16
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6485:33: sparse:    right side has type int
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:58: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse:     expected restricted __wsum [usertype] diff
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6489:69: sparse:     got int
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6611:27: sparse:     got int
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6654:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6766:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mac_ip_len @@     got int @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse:     expected restricted __le32 [usertype] mac_ip_len
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:6842:27: sparse:     got int
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7422:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7425:33: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7437:29: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7445:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7492:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7496:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7535:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7528:6: sparse: sparse: symbol 'rnpm_clear_udp_tunnel_port' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be16 [usertype] vxlan_port @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     expected unsigned int [usertype] value
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     got restricted __be16 [usertype] vxlan_port
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7577:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7667:29: sparse: sparse: symbol 'rnpm_netdev_ops' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7692:6: sparse: sparse: symbol 'rnpm_assign_netdev_ops' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7785:6: sparse: sparse: symbol 'rnpm_fix_queue_number' was not declared. Should it be static?
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:7961:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8025:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8055:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8281:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8451:27: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8452:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:8760:5: sparse: sparse: symbol 'rnpm_can_rpu_start' was not declared. Should it be static?
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9034:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9034:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9034:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9034:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9035:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9035:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9035:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9035:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9036:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9036:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9036:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9036:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9039:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9039:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9039:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9039:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9040:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9040:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9040:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9040:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9041:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9041:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9041:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9041:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9042:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9042:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9042:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9042:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9044:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9044:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9044:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9044:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9045:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9045:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9045:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9045:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9046:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9046:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9046:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9046:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9047:25: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9047:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9047:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9047:25: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9049:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9049:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9049:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:9049:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:637:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:575:31: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:598:26: sparse: sparse: restricted __le16 degrades to integer
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through drivers/net/ethernet/mucse/rnpm/rnpm.h):
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:160:20: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_common.h:166:9: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2660:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2671:17: sparse:     got void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
   include/net/checksum.h:63:59: sparse: sparse: self-comparison always evaluates to false

vim +/__iomem +86 drivers/net/ethernet/mucse/rnpm/rnpm_debugfs.c

    47	
    48	/**
    49	 * rnpm_dbg_reg_ops_write - write into reg_ops datum
    50	 * @filp: the opened file
    51	 * @buffer: where to find the user's data
    52	 * @count: the length of the user's data
    53	 * @ppos: file position offset
    54	 **/
    55	static ssize_t rnpm_dbg_reg_ops_write(struct file *filp,
    56					      const char __user *buffer, size_t count,
    57					      loff_t *ppos)
    58	{
    59		struct rnpm_adapter *adapter = filp->private_data;
    60		struct rnpm_hw *hw = &adapter->hw;
    61		int len;
    62	
    63		/* don't allow partial writes */
    64		if (*ppos != 0)
    65			return 0;
    66		if (count >= sizeof(rnpm_dbg_reg_ops_buf))
    67			return -ENOSPC;
    68	
    69		len = simple_write_to_buffer(rnpm_dbg_reg_ops_buf,
    70					     sizeof(rnpm_dbg_reg_ops_buf) - 1, ppos,
    71					     buffer, count);
    72		if (len < 0)
    73			return len;
    74	
    75		rnpm_dbg_reg_ops_buf[len] = '\0';
    76	
    77		if (strncmp(rnpm_dbg_reg_ops_buf, "write", 5) == 0) {
    78			u32 reg, value;
    79			int cnt;
    80	
    81			cnt = sscanf(&rnpm_dbg_reg_ops_buf[5], "%x %x", &reg, &value);
    82			if (cnt == 2) {
    83				if (reg >= 0x30000000) {
    84					rnpm_mbx_reg_write(hw, reg, value);
    85				} else {
  > 86					rnpm_wr_reg(hw->hw_addr + reg, value);
  > 87					value = rnpm_rd_reg(hw->hw_addr + reg);
    88				}
    89				e_dev_info("write: 0x%08x = 0x%08x\n", reg, value);
    90			} else {
    91				e_dev_info("write <reg> <value>\n");
    92			}
    93		} else if (strncmp(rnpm_dbg_reg_ops_buf, "read", 4) == 0) {
    94			u32 reg, value;
    95			int cnt;
    96	
    97			cnt = sscanf(&rnpm_dbg_reg_ops_buf[4], "%x", &reg);
    98			if (cnt == 1) {
    99				if (reg >= 0x30000000)
   100					value = rnpm_mbx_fw_reg_read(hw, reg);
   101				else
   102					value = rnpm_rd_reg(hw->hw_addr + reg);
   103				snprintf(rnpm_dbg_reg_ops_buf,
   104					 sizeof(rnpm_dbg_reg_ops_buf), "0x%08x: 0x%08x",
   105					 reg, value);
   106				e_dev_info("read 0x%08x = 0x%08x\n", reg, value);
   107			} else {
   108				e_dev_info("read <reg>\n");
   109			}
   110		} else {
   111			e_dev_info("Unknown command %s\n", rnpm_dbg_reg_ops_buf);
   112			e_dev_info("Available commands:\n");
   113			e_dev_info("   read <reg>\n");
   114			e_dev_info("   write <reg> <value>\n");
   115		}
   116		return count;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
