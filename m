Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4948F2EAE5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626763; cv=none; b=VOt8zAdC+abnoBHEq1FS3KNb+ExGAn2X6Euuf1UOc4sJWnlPSIoz8cn8Q1pKbMuqzj+ieKQuHnarFx7ZOLisYlqaKgFemCUcIXX0M5cQhjq4Ci4g6hVv1UWIr/xf+RhLE1tYYF5skd52aN9uT6+cB8hSPSiVX6pBek4bAmLZ3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626763; c=relaxed/simple;
	bh=uTCK2j2FfWeizA1h3pk3AP4hXpQBXDHyFFE+eEb2qBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=No1ToQe32bTrl7ozx4yn/ytnHamJ+1XQqSSqKtEkD89/hctk3OL+kanzR9Y36EpHXlzwVfp59ugztVfiYa/H8RZ6tTDuiqj7VutMDISpYsVaWv4vdT8jIXx0+aQJOpx3DTvibogN0l2Is/8ttVbRywDYYQhuR8MlqzjWBk0a2rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2DiOXMg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2DiOXMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750626762; x=1782162762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTCK2j2FfWeizA1h3pk3AP4hXpQBXDHyFFE+eEb2qBs=;
  b=X2DiOXMgb0uf7Gp5B4ianAWeXqCr1hfWaGRDLlhsn19YGwbJrqceiGAn
   RUD/uT5jaTzMcFmAKlgyy4FyxoipMZuAbDbMvX7nEidnIg5ISM3iyEOlV
   IWgbR0fclGEuwi2ejT3Hza+DdLyZjquT9zXVlDxloq49ESITqiXfPIX4h
   LOx86fVf4rHLW43B0M2jYCoe8F8sXMHGynsQIg9M/XtB8D3pdpyzV/rUn
   zHQZp4/l/NZWZ2B/9BkphpnQJsM2cRFGaDstEe/fnVz4aNNZwdbf/mKtc
   PH3SNK1WheAyuDUgA6PDSdlhq6kBe1RcEA+r0WFn7cbTmHJfpYCjAleG/
   A==;
X-CSE-ConnectionGUID: 9WnvUx5vQLSziFvHUWA2hw==
X-CSE-MsgGUID: b/tZfbYbT5OMjWfxNOFXcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="63096830"
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="63096830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 14:12:41 -0700
X-CSE-ConnectionGUID: ygqZE9d0S4ida83f6xXU4g==
X-CSE-MsgGUID: mMx6OBDESm+vJw5MJFYhiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,257,1744095600"; 
   d="scan'208";a="151002978"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jun 2025 14:12:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTRzR-000NWc-1v;
	Sun, 22 Jun 2025 21:12:37 +0000
Date: Mon, 23 Jun 2025 05:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:x86/lass 2/16] arch/x86/include/asm/uaccess_64.h:177:31:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202506230504.2GhnbhRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git x86/lass
head:   59822d1bcbc8a26ad84fffa7ff4e6840ef526285
commit: e408c89255c56175bcbed7e6b5ea5efd4074251d [2/16] x86/asm: Introduce inline memcpy and memset
config: x86_64-randconfig-122-20250622 (https://download.01.org/0day-ci/archive/20250623/202506230504.2GhnbhRq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506230504.2GhnbhRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506230504.2GhnbhRq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/netfilter/x_tables.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
>> arch/x86/include/asm/uaccess_64.h:177:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *addr @@     got void [noderef] __user *addr @@
   arch/x86/include/asm/uaccess_64.h:177:31: sparse:     expected void *addr
   arch/x86/include/asm/uaccess_64.h:177:31: sparse:     got void [noderef] __user *addr
>> arch/x86/include/asm/uaccess_64.h:180:20: sparse: sparse: subtraction of different types can't work (different address spaces)

vim +177 arch/x86/include/asm/uaccess_64.h

   170	
   171	static __always_inline __must_check unsigned long __clear_user(void __user *addr, unsigned long size)
   172	{
   173		void *ret;
   174	
   175		might_fault();
   176		stac();
 > 177		ret = __inline_memset(addr, 0, size);
   178		clac();
   179	
 > 180		return ret - addr;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
