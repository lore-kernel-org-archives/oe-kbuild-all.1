Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A9204583
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932268; cv=none; b=sAbJ101ajmdwPqMUaM7NO+6PyYdhLwb6IdHYrc2ECa2jptyIa5zX/2iCz0VX6kXF4Ozy1WjjOTWbECvwGHjG35RgRzgkZcZmRt8Ia7kLHpPeVX4ACN9v8QUPTPrgIOr4SQ06VXhNme94pvxelqtYMabBsheFl0sB3DjIOHM67pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932268; c=relaxed/simple;
	bh=LY4sgA/1F77wGEKx9e7+YKszc9W7xhMuL8AwpEaGTyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlReyqUSiv190vgZXqj2ni380OOS+LGIqTdpJ7YfBdVeaVWosT4KcXD6T2IYudN7SIQnf5KJc9ajabqBRp2AsmojKW1hXaXlgtQrEHKSr7BzKb2IyPbteLhOQyriyZZcdrGmfTqTGwyjqjvP3t+f6t/DrniaF/B4a6txzB4XVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5PkgzxH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5PkgzxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744932266; x=1776468266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LY4sgA/1F77wGEKx9e7+YKszc9W7xhMuL8AwpEaGTyQ=;
  b=R5PkgzxH8D5T7l8Kvg9DcT7HZF2kpuFyQglW0e3oFjBbDCk/8rKOKlv2
   1DbiLNrZSaBNTA9lUsI6C36BlZSG0y9jytrTVBci09gqxq386/vyTapwu
   yacwuThInbJx5pgVgdBx0E+F6PNipRvADlaOtbhvuff87/cvCiXkJ6Vyt
   r/IPbSAjF06Qa61MRbxEJSkrs3y8D9/43YXSP+WZMAKTakUO37STiuHdt
   7K8W1kV6hUrNL71sfkenQMrbcIWLbJRmwhdvP2FIq2Rosnz3IT4FB5x6S
   /T9uP/vmscptq0Ius+gfIxziNyGTKRq1Bl09V+ID7piOMNJqMFK9ChL/r
   g==;
X-CSE-ConnectionGUID: OXsv3pINT9CgMfe82S0HyA==
X-CSE-MsgGUID: /H6Wv3c3RLOB2os9/Pm2Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57201265"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="57201265"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 16:24:25 -0700
X-CSE-ConnectionGUID: mhXH7XURQZKdzpyxgVdADg==
X-CSE-MsgGUID: xo8e8uNrQsCuCyTPk4uq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="161920214"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Apr 2025 16:24:23 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Yaj-00029P-1s;
	Thu, 17 Apr 2025 23:24:21 +0000
Date: Fri, 18 Apr 2025 07:24:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 include/trace/events/swiotlb.h:15:23: error: variable has incomplete type
 'enum SWIOTLB_NO_FORCE'
Message-ID: <202504180731.e9yEUUu6-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fca4978dfd5b101b91ab73eda188edaa5ddc8730
commit: 77c20b4cbcd0dca8e114cbcdcdaac61f3fb9555d [0/1] iommu/dma: Trace bounce buffer usage when mapping buffers
config: i386-buildonly-randconfig-006-20250418 (https://download.01.org/0day-ci/archive/20250418/202504180731.e9yEUUu6-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180731.e9yEUUu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180731.e9yEUUu6-lkp@intel.com/

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
