Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4BD1DED5C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766549431; cv=none; b=JaJP1SiyikHZi+03ophQBCtpzKqrAY5Uu3CXWNi/eZD7zDjEo98OBgJF9SLVuwXaMbE8iwAfiMLv8TVaaIUt9qk3mJLIJxPBG1IcynhHHdkgWXGCqVsv+Xum18dpRNKd+zb051MHurgmUe5pzf334s1p87yXZ8+bRtmBr0VYH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766549431; c=relaxed/simple;
	bh=+Th8rRD8dMAQRPAA1EkPWHfosY5mTceaGV+sXWYogC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E1GoZY7IzlDNpJCQ5UURiYw/XF68vWJlweSnQXZYw83jEQ8x/z4mAnfSq3tKxRL/zYlcRmnx6lhCk10lQuDvbqUXJdKI5GLeFhAS8EwaU/6/lzno59E495CvifswGO8GbUsAvnsf/gRC1ceFxGMdNqi+wl7F5lIn2h9/quhZgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaqG6Rrv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaqG6Rrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766549429; x=1798085429;
  h=date:from:to:cc:subject:message-id;
  bh=+Th8rRD8dMAQRPAA1EkPWHfosY5mTceaGV+sXWYogC4=;
  b=CaqG6Rrv1WY3+j822+19s1DYhX/Z/zDEQx0zXercRQrkqGSoBSOiW/kq
   aKRZykeKF1MiVbe2+HeN96/HhzXuthXJ3BizVxFF2r5XwIysmHM7tvMBd
   3hVECuZhba5vJh6H+0WXb+M15EdwuRydLhiyZZ0Jg/A/sZ6IqkDhK5b/2
   ddWyGUEd+1M8fqsl2bw9sD2HHTTSG3scyjQm9TI07a/tMNCmEs3dFJFqm
   v5ba+PtjatjtXwR2E02wDkb3Wm69zwIXeLyGNB5uYdiZnooRdEahLYP77
   6JbsNR3/SRan21WhKMwc/hfH3bCJgghw5qjF6LzPDk8GCIV6+H8m5OnA7
   A==;
X-CSE-ConnectionGUID: Uz7GTlIcTYekbeshOUqQ3A==
X-CSE-MsgGUID: 8ES3NhsPRKG3zVLGwP6jEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72246286"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="72246286"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:10:29 -0800
X-CSE-ConnectionGUID: WfK7V40bTJ+hxhl6WJrJZA==
X-CSE-MsgGUID: mnQVWTO0RACwx4lTZCovwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199066710"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Dec 2025 20:10:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGCf-000000002en-12Xh;
	Wed, 24 Dec 2025 04:10:25 +0000
Date: Wed, 24 Dec 2025 12:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 include/trace/events/swiotlb.h:15:23: error: variable has incomplete type
 'enum SWIOTLB_NO_FORCE'
Message-ID: <202512241259.r93ijM8K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   48ed03a80ad49e3648c77d8c2c1ca10e706d6215
commit: 77c20b4cbcd0dca8e114cbcdcdaac61f3fb9555d [0/1] iommu/dma: Trace bounce buffer usage when mapping buffers
config: i386-buildonly-randconfig-001-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241259.r93ijM8K-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241259.r93ijM8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241259.r93ijM8K-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   5 warnings and 3 errors generated.


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
