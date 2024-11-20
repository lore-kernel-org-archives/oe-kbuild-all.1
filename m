Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37D81B960
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065151; cv=none; b=Li22aWUomR0Cxgxu5atCVqR7lYZtP9fZBk2mOcqCtE4HDTYZYjEZ5+63O2+a/omEYV9N57isQd9qJ2iKpkKSogjlSE1V3DOwGSbcqM8Rj/0q4MFfGsf4OvwdmZCVuo7kmo141Wt7ctJNm++OVzgtY2fppjmSDL7y3ut82s4qkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065151; c=relaxed/simple;
	bh=Kz/t6LNnH/VHSiGqYk/YWWmSvAwGnPnF2r+QgFXQj2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhiJBexgI17BHClp+zS7r4DG7bmk9aFzcQlT4nBfZ85ja3G8enp9B1QQSkcbX9FqoxEyW4Lhp0RoKd/gwOQzubPWLdF2N0ywLDQ+hzQMt2EVnHObDBrIIXtTjI1BfrMnjJ9AdKrjE4japhcMoQYaxvFuCZTzklJSinEn1LKHi0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAXg84rW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAXg84rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065150; x=1763601150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kz/t6LNnH/VHSiGqYk/YWWmSvAwGnPnF2r+QgFXQj2I=;
  b=EAXg84rWGxLGhp147+V/aCxXEFYqAUnbkzHic7FGBg0w7DL4ERYCQiiZ
   5PpQHEuqpof066+79z2BaDbPQXEB9W0HMBx8gUPRmWhw+ihRIXKqIReM8
   2ALkvRe/3B4A3Y/ADY9BW/FZ0g3K5fd2SkamvWNw65OeANFJYR+wtjaIl
   osS4i6kofPCqBw/8CWMYtrZqgL1qlY0Ci6oAcvVPtSuKZ1EHQLzOkgMY6
   nu1qFNAF42vdp5CogbY4ALUmtqyMYgd55w8wBcscu76zZ0w760cRjg2Az
   HpHmi/A5waom3me83nmijloUs1E6qTiI8b113wycmFerrzZ5mJbcLgVLu
   A==;
X-CSE-ConnectionGUID: kaVc5OCHSBK+Umued+I3hQ==
X-CSE-MsgGUID: RyT/pBXUTcuGl94CWqIgEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54602140"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="54602140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:12:30 -0800
X-CSE-ConnectionGUID: 7KiHf3FDS0W75/6fPpLb9A==
X-CSE-MsgGUID: b/hZlUMXS7um63+2kaxfBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="94805469"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2024 17:12:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZGc-0000Ot-1h;
	Wed, 20 Nov 2024 01:12:26 +0000
Date: Wed, 20 Nov 2024 09:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-v2 7/21] include/xen/xen-ops.h:10:10: fatal
 error: 'asm/xen/interface.h' file not found
Message-ID: <202411192122.Ue0d8atL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-v2
head:   702c1af18bf513f8297bfbb99b859c37b7b900ab
commit: eed15d60367a3ec63f468407781a3f91bae76fae [7/21] virtio-msg: Add DMA OPs support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241119/202411192122.Ue0d8atL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411192122.Ue0d8atL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411192122.Ue0d8atL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_dma_ops.c:16:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/virtio/virtio_msg_dma_ops.c:16:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_dma_ops.c:16:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/virtio/virtio_msg_dma_ops.c:16:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/virtio/virtio_msg_dma_ops.c:19:
>> include/xen/xen-ops.h:10:10: fatal error: 'asm/xen/interface.h' file not found
      10 | #include <asm/xen/interface.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +10 include/xen/xen-ops.h

e04d0d0767a9c2 Isaku Yamahata     2008-04-02   4  
e04d0d0767a9c2 Isaku Yamahata     2008-04-02   5  #include <linux/percpu.h>
cd979883b9ede9 Stanislaw Gruszka  2014-02-26   6  #include <linux/notifier.h>
be81c8a1da2428 Daniel Kiper       2014-06-30   7  #include <linux/efi.h>
251e90e7e346a2 Juergen Gross      2022-06-22   8  #include <linux/virtio_anchor.h>
f030aade916508 Juergen Gross      2018-08-28   9  #include <xen/features.h>
7892f6928d0cd9 Ian Campbell       2012-10-16 @10  #include <asm/xen/interface.h>
4ccefbe597392d Stefano Stabellini 2015-11-05  11  #include <xen/interface/vcpu.h>
e04d0d0767a9c2 Isaku Yamahata     2008-04-02  12  

:::::: The code at line 10 was first introduced by commit
:::::: 7892f6928d0cd9ef9200a193183c2033b3143dab xen: correctly use xen_pfn_t in remap_domain_mfn_range.

:::::: TO: Ian Campbell <ian.campbell@citrix.com>
:::::: CC: Ian Campbell <ian.campbell@citrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
