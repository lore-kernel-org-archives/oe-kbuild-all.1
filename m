Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D527A900
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364765; cv=none; b=AX8kKO+uDT7wEZczIw+Nfj2ySUJ65cVW/7xfts+kk/kAg0vCiv0nsR+gRvPEkgaRMvvL3kv0nrlteYGU/Mo+IpBk2Y8rNwNvU8h8BfikdOEWMv4X5+w+JdkDJ2OD1s8pe0ugmSF9G+gufCPGTos/SRvvt3S/KjGlnLVXp9DV1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364765; c=relaxed/simple;
	bh=c7frD8WUm5ARaKNL4/LoIQfJdFWjkZqhzxUyqJAtc2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhJMn6LKMd0ttx0BkOXylc8JEDdN21ZqSKBEdIWBNvGS+H/69YlTMOZrRbRqD4vNgSvrqi82mpmmAXF4sVI5Qbn1Ep3SALPJ+NdrAmAlAi2RtfOBnrCOkTJvcSb64rvR3jMModThvv/iqajNE+UG2z1afQeEPUSh19r3MXX6huE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lp50+f39; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lp50+f39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748364764; x=1779900764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7frD8WUm5ARaKNL4/LoIQfJdFWjkZqhzxUyqJAtc2U=;
  b=lp50+f39lgLpzZsh8ymfvLhouruY4F3Okp9jhSnhDFrwbdLLLJ7qQTG2
   6J7zoXc4AWZFz3AsPUyssuTKE0Z4EZVqaA3NsHI/uGk/MUVVk0RvzONEI
   XYgLl/kqJAf1bdFVuIxOTV25R5YqOjRw0ElymzfN3N9XWpYS1DNB3UKSB
   Yo+5PqsU7mXl4mqu7UOvvEjsL+F045AybZq/3gPAEEaQUNM89duaV3WQ7
   doHuZgjmH+tVCTUbkvF1ws8dYGEbt2ArMYm1maPaJ0DDTkfWmfWV1kKom
   8+bZlABWDxGSgDQ/XjG2zDY9SmwPcepATw4OwDx5LgiJB14r3tZHDE45R
   w==;
X-CSE-ConnectionGUID: qmu54FomQ2+zXTDf9k99Bg==
X-CSE-MsgGUID: ctlKWWcwTUqyr2rty0ZJ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61025700"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="61025700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:52:42 -0700
X-CSE-ConnectionGUID: dUcHlMDqR3Wx+WjS7FR2qQ==
X-CSE-MsgGUID: 2BmXeJ0iQiysTLSDRIgBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143862950"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 09:52:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJxXa-000TU4-1U;
	Tue, 27 May 2025 16:52:38 +0000
Date: Wed, 28 May 2025 00:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/3]
 include/trace/events/swiotlb.h:15:23: error: variable has incomplete type
 'enum SWIOTLB_NO_FORCE'
Message-ID: <202505280044.QvthRVFm-lkp@intel.com>
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
head:   2b7d7bb68588fa99fafdee5d1108566d3d0cffa3
commit: 77c20b4cbcd0dca8e114cbcdcdaac61f3fb9555d [0/3] iommu/dma: Trace bounce buffer usage when mapping buffers
config: i386-buildonly-randconfig-003-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280044.QvthRVFm-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280044.QvthRVFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280044.QvthRVFm-lkp@intel.com/

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
