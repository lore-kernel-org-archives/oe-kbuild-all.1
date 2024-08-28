Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9313775E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876011; cv=none; b=c26tSlXEE+T4cZaDEGHmJ0XLhe/LsBjx4Yj5MhAgAIv0OWlUB7uN7R0SN7L3DzT0Zu1iCaGQvxmUeXTUJAsI/3DM+pnkO7xvcOdIK4RjjBcHdRjjqrtfdNT2qMNqJm591jycs9QO6MTclXSYBcGtPFHpvUFsKa/mCPU2W6caJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876011; c=relaxed/simple;
	bh=ERYuJRxT1ASngtrlG+cqz6JGGHT/ZOQPALpeThVLi0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPhfLKRfv+f2y1Y64f0KBq0AQK5AlkZ4fs349bcsDrR19oPa+TAmNY5x1r41ZQVj/or9X/s1qt8xzI4+U7kmABT2e49uAga0YtfhWKap57xsGHT/HEQVcW56PCAFeaiLW+AWV34NnF7capGk4vb45u8dmN/2vIoNrV6TBlkKlyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUAIBzkH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUAIBzkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724876009; x=1756412009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERYuJRxT1ASngtrlG+cqz6JGGHT/ZOQPALpeThVLi0U=;
  b=TUAIBzkHUENRq7qyjitwUeM6UlQ20k9it2Iq/JHxQinbmw9/n6tgUdbn
   Gbe3VJUnNycqJ4ek4k0Tdx4yUrxlbQ7cdcXsUG14k6TPxHDQqQB54+A/8
   Z6qO72pufUTbGwAzALM7HbFBWkUFFRsb8t96jGyshklTAZJNdLan3HwJc
   g5hXaNXdEmpay4p7gaY6wAbmpMZe9MY3+abX66lbp9DPtjc8AXB6IgqRH
   NA3ZM/gbKqUdNOw69utIm92hOwYi+eW5dwIKdsj/70katPbryKS4jhK57
   QkXA1YTq998BJxaE7CYmkfkl8RaqX9BXparYqhq4jyDD5VRY2j8F9uCqw
   w==;
X-CSE-ConnectionGUID: 1SwCXa1STGaqnAsnJgFXdA==
X-CSE-MsgGUID: I4PNRqq/SeiXSpck/qErQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34051670"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="34051670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 13:13:28 -0700
X-CSE-ConnectionGUID: R3btIcJrT+GTaPw2fQg+JQ==
X-CSE-MsgGUID: 5DunDZTgSi2vgGN3t1622g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="64041551"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2024 13:13:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjP2i-000LJm-2w;
	Wed, 28 Aug 2024 20:13:24 +0000
Date: Thu, 29 Aug 2024 04:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20748/23581] drivers/block/.tmp_nbd.o:
 warning: objtool: nbd_alloc_and_init_config()+0x165: unreachable instruction
Message-ID: <202408290453.uMJshGum-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   46d28312ab3cc0cfe7e8dea2f41d22fe4ac35e67
commit: 9d0422bf311dfb36617e4d8f7367a3e7dc9179ec [20748/23581] nbd: fold nbd config initialization into nbd_alloc_config()
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240829/202408290453.uMJshGum-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290453.uMJshGum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290453.uMJshGum-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/block/nbd.c:17:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/block/.tmp_nbd.o: warning: objtool: nbd_alloc_and_init_config()+0x165: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
