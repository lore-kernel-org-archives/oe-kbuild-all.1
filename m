Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C5013A265
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753166663; cv=none; b=ffs4KxL3Feq83Lrgli8QaaAvfi4KIsukvHAi7Ryu4lry3hdRVybu8XhNgViUwh4kCT9/PXA95yfJi9+Bn+4gy7EcETTrsKPkwj5yzMv6z+s/vd0AmrptiLi6JsemDxKYvGzOj7pyzjqBSTcHgWtb2DMu7EhD7SGmPOuaEjPR8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753166663; c=relaxed/simple;
	bh=ubaqFsYLvs49HHBKx3vO7gBaD7FvUQC31TMGV5P3rR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dg3L12JEM3HEkJftI9YN4VD2mFtak6VNT/A1XPTypn1jZa+i3UFgqLvoCbwfiejatZFbc2YCT7vdP4FxqvfNnw1y+yqLtG2EFewtF0ajZ2nl9wPyPC5q1Q7Yph5kpfO55Ouro56N4ClN/hYLTO0QS2o83l9VfCRcnMKGhGvJtXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9yzxhNe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9yzxhNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753166662; x=1784702662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubaqFsYLvs49HHBKx3vO7gBaD7FvUQC31TMGV5P3rR8=;
  b=i9yzxhNeP73yRy0yTy0QlelRvmlgkUPCKrT9DnHC3w02hicOg/aarebE
   ygOdyUpQa8owtvy2N++2oXOGHPuIlAHcx9tc6e6LGpZA+v24nI/ntZjuW
   Dut/0GB6UxbsnxWUN8qgY/dSP8UuQ+/Vidwzc49Qr8ZneTTX8hmqviQNF
   JSsB7o90lmXFoidLp/4FHYkLqVvWEMMl9/j+RWchmFStKlsGQrtFeZIVb
   n6+bPyAizN85NKA7jNzq3RSHLyW0m1cd96qPu0tWSB73O/5ue68UQxx3p
   nozRae4GpI6R2IKvDtqmgbhDTPTwMDchqoyTjfeGeZlbXqqvWodEcN8jM
   w==;
X-CSE-ConnectionGUID: eif/nj73TtawVso+5iLMPQ==
X-CSE-MsgGUID: Hbu3mFEKRC2AJYaAZOePZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54503421"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="54503421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 23:44:21 -0700
X-CSE-ConnectionGUID: 9geVEzaeQGySnUuf699x2Q==
X-CSE-MsgGUID: jTgCDdd+R36BX1H5gRKzGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="159776878"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2025 23:44:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue6jZ-000HX5-2d;
	Tue, 22 Jul 2025 06:44:17 +0000
Date: Tue, 22 Jul 2025 14:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 include/trace/events/swiotlb.h:15:23: error: variable has incomplete type
 'enum SWIOTLB_NO_FORCE'
Message-ID: <202507221453.I6j8oTgv-lkp@intel.com>
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
head:   06dd7cf971c34c04ae77670a0f331e86ddec12f4
commit: 77c20b4cbcd0dca8e114cbcdcdaac61f3fb9555d [0/1] iommu/dma: Trace bounce buffer usage when mapping buffers
config: i386-buildonly-randconfig-003-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221453.I6j8oTgv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221453.I6j8oTgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221453.I6j8oTgv-lkp@intel.com/

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

2b2b614dd24e4e Zoltan Kiss        2013-09-04  11  
2b2b614dd24e4e Zoltan Kiss        2013-09-04  12  	TP_PROTO(struct device *dev,
2b2b614dd24e4e Zoltan Kiss        2013-09-04  13  		 dma_addr_t dev_addr,
2b2b614dd24e4e Zoltan Kiss        2013-09-04  14  		 size_t size,
ae7871be189cb4 Geert Uytterhoeven 2016-12-16 @15  		 enum swiotlb_force swiotlb_force),
2b2b614dd24e4e Zoltan Kiss        2013-09-04  16  
2b2b614dd24e4e Zoltan Kiss        2013-09-04  17  	TP_ARGS(dev, dev_addr, size, swiotlb_force),
2b2b614dd24e4e Zoltan Kiss        2013-09-04  18  
2b2b614dd24e4e Zoltan Kiss        2013-09-04  19  	TP_STRUCT__entry(
2b2b614dd24e4e Zoltan Kiss        2013-09-04  20  		__string(	dev_name,	dev_name(dev)		)
2b2b614dd24e4e Zoltan Kiss        2013-09-04  21  		__field(	u64,	dma_mask			)
2b2b614dd24e4e Zoltan Kiss        2013-09-04  22  		__field(	dma_addr_t,	dev_addr		)
2b2b614dd24e4e Zoltan Kiss        2013-09-04  23  		__field(	size_t,	size				)
ae7871be189cb4 Geert Uytterhoeven 2016-12-16  24  		__field(	enum swiotlb_force,	swiotlb_force	)
2b2b614dd24e4e Zoltan Kiss        2013-09-04  25  	),
2b2b614dd24e4e Zoltan Kiss        2013-09-04  26  
2b2b614dd24e4e Zoltan Kiss        2013-09-04  27  	TP_fast_assign(
2b2b614dd24e4e Zoltan Kiss        2013-09-04  28  		__assign_str(dev_name, dev_name(dev));
2b2b614dd24e4e Zoltan Kiss        2013-09-04  29  		__entry->dma_mask = (dev->dma_mask ? *dev->dma_mask : 0);
2b2b614dd24e4e Zoltan Kiss        2013-09-04  30  		__entry->dev_addr = dev_addr;
2b2b614dd24e4e Zoltan Kiss        2013-09-04  31  		__entry->size = size;
2b2b614dd24e4e Zoltan Kiss        2013-09-04  32  		__entry->swiotlb_force = swiotlb_force;
2b2b614dd24e4e Zoltan Kiss        2013-09-04  33  	),
2b2b614dd24e4e Zoltan Kiss        2013-09-04  34  
2b2b614dd24e4e Zoltan Kiss        2013-09-04  35  	TP_printk("dev_name: %s dma_mask=%llx dev_addr=%llx "
2b2b614dd24e4e Zoltan Kiss        2013-09-04  36  		"size=%zu %s",
2b2b614dd24e4e Zoltan Kiss        2013-09-04  37  		__get_str(dev_name),
2b2b614dd24e4e Zoltan Kiss        2013-09-04  38  		__entry->dma_mask,
2b2b614dd24e4e Zoltan Kiss        2013-09-04  39  		(unsigned long long)__entry->dev_addr,
2b2b614dd24e4e Zoltan Kiss        2013-09-04  40  		__entry->size,
ae7871be189cb4 Geert Uytterhoeven 2016-12-16  41  		__print_symbolic(__entry->swiotlb_force,
ae7871be189cb4 Geert Uytterhoeven 2016-12-16  42  			{ SWIOTLB_NORMAL,	"NORMAL" },
fff5d99225107f Geert Uytterhoeven 2016-12-16  43  			{ SWIOTLB_FORCE,	"FORCE" },
fff5d99225107f Geert Uytterhoeven 2016-12-16  44  			{ SWIOTLB_NO_FORCE,	"NO_FORCE" }))
2b2b614dd24e4e Zoltan Kiss        2013-09-04  45  );
2b2b614dd24e4e Zoltan Kiss        2013-09-04  46  

:::::: The code at line 15 was first introduced by commit
:::::: ae7871be189cb41184f1e05742b4a99e2c59774d swiotlb: Convert swiotlb_force from int to enum

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
