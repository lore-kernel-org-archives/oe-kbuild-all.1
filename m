Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B431B6CE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737576280; cv=none; b=FSPQSuJYsIPgMO6Io+hqo4aRkC1w103BKvEL+hiXWWPlGrUhP4SlLKRWXpJOvmoW3x6k+Ifqymn4pnydrK9w4U2wjhHp3aWlwp6THaZdT2qdZYupGBa9nWA9R6nmrggsr7eLZltNI9JMumMCL25ZyRQLSHtON5jFxa/85mgp/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737576280; c=relaxed/simple;
	bh=igF+38KzkK42REJpg1VwzyqSqINr9hPACIJRcAaU0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MSV8XsiOsjBeW4KPrzZ5h9S79on7CkJmDunYfKsZnk8Dh5GAuIasr4YercZpP2SKz/t0asAop445E5YPMBTsPebxJaKuvukcU3JXdU87paDRtaRdCfuvDD3nkl+22OxqcUlkFSyGywH1tYJwNy8BS8jUXWuZCu3/59BXFQ+Vhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1iE0dWC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1iE0dWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737576279; x=1769112279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igF+38KzkK42REJpg1VwzyqSqINr9hPACIJRcAaU0wQ=;
  b=H1iE0dWCU5adoFKM8xGTEo1mq1ymrDKpyi9rDloC0lPfzz4MNf7TbVZS
   3PcqQpyctI0OSL5DlJBtm+MQvj0a16qYVn1SdxuxZ1gWsY72rfQIQ4R0g
   x7RfgB12Tis7XG7/nB4uMR4Yk1AHIsXUChezbr3PiBP7V7ii/UF/kOA4U
   YXzMgdp/MyeHLII+hJI/LQY6gPrhEDei89U0PeFXZbXCaqOznDKqpQ9Gy
   A8ItzbCjH+KIqfyjlYUR43B/rEvG1JjGGRnTMVzESP2KZzRgSTnjoYm1B
   UDiHckdregi0cits7LHjaU4wzMUura267ws5pBFRThMfrrFw0md5QWAEv
   Q==;
X-CSE-ConnectionGUID: GB/zQi6cRJyFqtilZO4qRg==
X-CSE-MsgGUID: SncNfTSQRkeWey/WPhRZmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38304659"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="38304659"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 12:04:39 -0800
X-CSE-ConnectionGUID: eeSyaIScR2G+/iLJI7mb4A==
X-CSE-MsgGUID: U1CSUg6JTgCiwUV+IqXL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107103421"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2025 12:04:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tagxl-000aHl-0M;
	Wed, 22 Jan 2025 20:04:33 +0000
Date: Thu, 23 Jan 2025 04:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/iommu/iommu-sva-lib.c:14:6: warning: no previous prototype for
 'iommu_sva_init'
Message-ID: <202501230342.kIlwfyKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: dc05c36e47d0a11399068744f5c60658b58a2929 [2441/2441] iommu/ioasid: Redefine IOASID set and allocation APIs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501230342.kIlwfyKL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230342.kIlwfyKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230342.kIlwfyKL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/debug_locks.h:7,
                    from include/linux/lockdep.h:28,
                    from include/linux/spinlock_types.h:18,
                    from include/linux/mutex.h:16,
                    from drivers/iommu/iommu-sva-lib.c:5:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/mutex.h:14:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
>> drivers/iommu/iommu-sva-lib.c:14:6: warning: no previous prototype for 'iommu_sva_init' [-Wmissing-prototypes]
      14 | void iommu_sva_init(void)
         |      ^~~~~~~~~~~~~~


vim +/iommu_sva_init +14 drivers/iommu/iommu-sva-lib.c

    12	
    13	/* Must be called before PASID allocations can occur */
  > 14	void iommu_sva_init(void)
    15	{
    16		if (iommu_sva_pasid)
    17			return;
    18		iommu_sva_pasid = ioasid_set_alloc(NULL, 0, IOASID_SET_TYPE_NULL);
    19	}
    20	EXPORT_SYMBOL_GPL(iommu_sva_init);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
