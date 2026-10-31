Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793490873;
	b=4wW44lyJzw4jwi68lBcZdG0lRK8KbziobzfyoEP/y8RUwnw1Q9riFWCHqpoAtQD02CDS
	 iYr42MxOoV4IbDgju6CRyUn/xVERMkhZfanbNkElrq35mkFSL1ALS7Z6dk9b+9vdYDraY
	 Fmjj1hoVhBUXpxKfzjMbSefUiH1C1c4VQozrxIZMEcf/rZqGeEwCNK24IR8rTE41S5tGG
	 Kto7tiKlBr8xGGHUY07ldkLooWAJdyddvMhn4l7z0v0n1BpnVggzIZHmhI0UYk4fxs/Hi
	 i2/EOi8WoNnekqAqvohjZdveWQCxnyZBU5VCbyiKbmoyeOQ7Ik6XKCgrpv2Dhs9viBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793490873;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dQc1WGQxETTRNnj+14JhKmeJXUyXeJIqJMj8yrchhss=;
	b=jRUCFFifelrYHsfYG8/zzvXCm3iAtSAH9oUM5gHVi5XyI1b3qg9iyU6qBMiURhPevoqR
	 +u2Fm1QuFIO4s7jsFzWjQ/LKom9yl7REcyUc7aZ3MJwVFWUHvBhSxvovapNp2F1ZiViN1
	 M3JrMvbGZFS3bbuBqkhRGQ9WyDl4oA0SkkQrNtSrEGzO+fKbmO0Sogk9EWmn4P/tALJQm
	 cufjxlc+RCLza2biNtNYuLBuyHWx3lybbHDuuoNPEL/dGdQP/tUeSWieUgdsbi7gV3ivq
	 ge3rJlml36ZmOpBMXkCgJJy0WLUH/nCBXsg+YuqWtlUKlfepwrUPq7TcCfBfUDy4Geg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+JQm8Yl;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED399606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 23:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED399606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q+JQm8Yl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793490871; x=1825026871;
  h=date:from:to:cc:subject:message-id;
  bh=yhH4wyzfNJpyvxfvcP+9mDT6GU3W6uHhCmdoxjvwDNw=;
  b=Q+JQm8YlgA22+UNoDiy5PwCSNyCcj68sl7Foq2TzLi3XLVA2FLgD7HSl
   l52XNze44z1eoMgKHd6GLvEWqZpF+YqIia+9I5G+0SvKxV/wdq4jxBxzL
   rl70yEKvm52jcPakA8ND+W2gXV80ejKUNXv0CYVui9a63ze6oLbMhsGl5
   sGtylendkkR0aVQ1KD2d80rLJal4f0OZ/6BVTEK62Jj+9YKupgXh4uFxQ
   an0Z+xOojPkX/xm40cEP8j2m+XT6zA3ZoRo8pQwuzJLNkXqE16naclwpA
   oBOjh3URGVI+jIwP95pxu7+/2JlrMLLcSjrlSmECduOW2FpijFKWmKnG+
   A==;
X-CSE-ConnectionGUID: 0CAkabrqQ0m2KUHRP5C/iw==
X-CSE-MsgGUID: O/Yyxs0mSACXs+YZDues6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2129062"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2129062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 16:54:30 -0700
X-CSE-ConnectionGUID: qHH8P78oTI6BNdLxIGm6Aw==
X-CSE-MsgGUID: LEK+jQojRq65dY3biEC7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6090804"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2026 16:54:30 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNIu2-00000000dH8-3DrY;
	Sat, 31 Oct 2026 23:54:26 +0000
Date: Sun, 01 Nov 2026 07:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 0/1] mm/shmem.c:5234:undefined
 reference to `ashmem_memfd_ioctl'
Message-ID: <202611010733.gjXKAh3T-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   c3c384d4d5fd887a90e4061229522d9547a54ea4
commit: 3f06e745a13c92ac95fda0fde0266cda407f73ae [0/1] ANDROID: ashmem: ensure that tmpfs file is memfd in ioctl
config: i386-randconfig-1001-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010733.gjXKAh3T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010733.gjXKAh3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010733.gjXKAh3T-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/shmem.o: in function `shmem_ashmem_ioctl':
>> mm/shmem.c:5234:(.text+0xb36): undefined reference to `ashmem_memfd_ioctl'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +5234 mm/shmem.c

  5228	
  5229	#ifdef CONFIG_ASHMEM
  5230	static long shmem_ashmem_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
  5231	{
  5232		if (!(SHMEM_I(file_inode(file))->flags & SHMEM_FL_MEMFD))
  5233			return -ENOTTY;
> 5234		return ashmem_memfd_ioctl(file, cmd, arg);
  5235	}
  5236	#endif
  5237	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
