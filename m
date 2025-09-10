Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAB63009E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757538007; cv=none; b=JRmhn6chsJdVgY4HWl3KIDLtSIse2tmFOuJbsDIQb1PFAgiQa/JlG0zAbYVUxZZOw6DukU7bu+c9WVrdCJxfZiu6Pd7ybkkwtyZRnLABkJBVaRpc45/qRkL/X3iW9dQ6pNEd+eDCYqgMpm4C5agsRi+nmmox7v4emLVnr285sb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757538007; c=relaxed/simple;
	bh=/jdM6SBPlU3FCMJ/Yc+PNEBETLRRaINEG9cNquM+uis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/IWC9Xben4BgO/Kal9WIfpTWanokCdA4LPIO9Gu6oS1Vo0yYJQKd+9iG5Y7hYLrdTvSjPmxBpZdJHhMhoY29WGn2q+cabTH+ptegQtVr6JDStzWCMRqrjLmrBHKe6LrE9HaHUZy/urX65hRVt3wDWgJfYcWLeGKUOsAVBrx4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObhGUyyH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObhGUyyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757538006; x=1789074006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jdM6SBPlU3FCMJ/Yc+PNEBETLRRaINEG9cNquM+uis=;
  b=ObhGUyyHJFx8l49JDtw/XPlmLD5tb6M0HJ98g45wUXNdRTdSX9foPdqK
   YVwATigYxGpIj2SPKBtHjW31ENRxRZL/scvfrdEBsxcKaiKSQ/w7C7gh3
   u4XnX+vEpwe/ucaQVjM34v48+zZzIAnzfoHGY22x/X4UEZuHQc/x0EJvI
   5zCEGf3K+2M6UXsf9xtH0XyPi8n85Xt9OV+82JQctfkLVHoczWOFm2h+E
   OkvOS+kJKZ5qIMkUHdtT2XQdS/lqcrPO4ZJ4lpyxIoi7oh5teCvdQ4J7d
   nGlWKrq6GfjrxmyTW8g96vNJXMvumljkK/XZKTOX7JKBmGGb6LXNrMvA/
   A==;
X-CSE-ConnectionGUID: NbSf0gMDSHGeMVTjUhmjhg==
X-CSE-MsgGUID: xq9isbN/Sm+g0rWsbW2yzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71282027"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="71282027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 14:00:06 -0700
X-CSE-ConnectionGUID: N+cKSC2+TOKDR3M3TDQYhA==
X-CSE-MsgGUID: NcmBqLPZRm6o4G1Huab/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; 
   d="scan'208";a="210620367"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2025 14:00:04 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwRv7-0006Hf-2s;
	Wed, 10 Sep 2025 21:00:01 +0000
Date: Thu, 11 Sep 2025 04:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 include/trace/events/swiotlb.h:15:23: error: variable has incomplete type
 'enum SWIOTLB_NO_FORCE'
Message-ID: <202509110448.uuGhHWlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   7baa61f0376aff7a4e3e86143e22d5dc5d4a50fa
commit: 77c20b4cbcd0dca8e114cbcdcdaac61f3fb9555d [0/1] iommu/dma: Trace bounce buffer usage when mapping buffers
config: i386-buildonly-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110448.uuGhHWlN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110448.uuGhHWlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110448.uuGhHWlN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
>> include/trace/events/swiotlb.h:15:23: error: variable has incomplete type 'enum SWIOTLB_NO_FORCE'
      15 |                  enum swiotlb_force swiotlb_force),
         |                                     ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   include/trace/events/swiotlb.h:15:9: note: forward declaration of 'enum SWIOTLB_NO_FORCE'
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
>> include/trace/events/swiotlb.h:15:23: error: variable has incomplete type 'enum SWIOTLB_NO_FORCE'
      15 |                  enum swiotlb_force swiotlb_force),
         |                                     ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   include/trace/events/swiotlb.h:15:9: note: forward declaration of 'enum SWIOTLB_NO_FORCE'
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   In file included from drivers/iommu/dma-iommu.c:28:
   include/trace/events/swiotlb.h:15:9: warning: declaration of 'enum SWIOTLB_NO_FORCE' will not be visible outside of this function [-Wvisibility]
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
>> drivers/iommu/dma-iommu.c:821:42: error: argument type 'enum SWIOTLB_NO_FORCE' is incomplete
     821 |                 trace_swiotlb_bounced(dev, phys, size, swiotlb_force);
         |                                                        ^~~~~~~~~~~~~
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^~~~~~~~~~~~~~~~
   include/trace/events/swiotlb.h:15:9: note: forward declaration of 'enum SWIOTLB_NO_FORCE'
      15 |                  enum swiotlb_force swiotlb_force),
         |                       ^
   include/linux/swiotlb.h:131:23: note: expanded from macro 'swiotlb_force'
     131 | #define swiotlb_force SWIOTLB_NO_FORCE
         |                       ^
   7 warnings and 3 errors generated.


vim +15 include/trace/events/swiotlb.h

2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  11  
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  12  	TP_PROTO(struct device *dev,
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  13  		 dma_addr_t dev_addr,
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  14  		 size_t size,
ae7871be189cb41 Geert Uytterhoeven 2016-12-16 @15  		 enum swiotlb_force swiotlb_force),
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  16  
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  17  	TP_ARGS(dev, dev_addr, size, swiotlb_force),
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  18  
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  19  	TP_STRUCT__entry(
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  20  		__string(	dev_name,	dev_name(dev)		)
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  21  		__field(	u64,	dma_mask			)
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  22  		__field(	dma_addr_t,	dev_addr		)
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  23  		__field(	size_t,	size				)
ae7871be189cb41 Geert Uytterhoeven 2016-12-16  24  		__field(	enum swiotlb_force,	swiotlb_force	)
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  25  	),
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  26  
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  27  	TP_fast_assign(
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  28  		__assign_str(dev_name, dev_name(dev));
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  29  		__entry->dma_mask = (dev->dma_mask ? *dev->dma_mask : 0);
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  30  		__entry->dev_addr = dev_addr;
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  31  		__entry->size = size;
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  32  		__entry->swiotlb_force = swiotlb_force;
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  33  	),
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  34  
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  35  	TP_printk("dev_name: %s dma_mask=%llx dev_addr=%llx "
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  36  		"size=%zu %s",
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  37  		__get_str(dev_name),
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  38  		__entry->dma_mask,
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  39  		(unsigned long long)__entry->dev_addr,
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  40  		__entry->size,
ae7871be189cb41 Geert Uytterhoeven 2016-12-16  41  		__print_symbolic(__entry->swiotlb_force,
ae7871be189cb41 Geert Uytterhoeven 2016-12-16  42  			{ SWIOTLB_NORMAL,	"NORMAL" },
fff5d99225107f5 Geert Uytterhoeven 2016-12-16  43  			{ SWIOTLB_FORCE,	"FORCE" },
fff5d99225107f5 Geert Uytterhoeven 2016-12-16  44  			{ SWIOTLB_NO_FORCE,	"NO_FORCE" }))
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  45  );
2b2b614dd24e4e6 Zoltan Kiss        2013-09-04  46  

:::::: The code at line 15 was first introduced by commit
:::::: ae7871be189cb41184f1e05742b4a99e2c59774d swiotlb: Convert swiotlb_force from int to enum

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
