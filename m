Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC7C156238
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265773; cv=none; b=Uffzcw1GZmO6afFuYf8JdV7OEDmEkFusHhiQ0B3S3NKZXsL3xk4htl+arcJVLGI8vEBwFCS9B6W4zDZjQPNHzQis6b1cPAMLC4CBNwQa09vN3ULSFYHL6PsZMng7Q7HE6wHWRE3gouuezQrQham527uIe61xQovJZ+wXGQwLz8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265773; c=relaxed/simple;
	bh=CtQSPwdHc3W7zm8H8Hkkt/c8zANMM225OuY4qd31MN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ShrDiVV4J3N8U954WdXbqAFlnafRpKzo9jWrmWsXgm1nvWTVURdkuRB3lkfF6QEbsdRI1DrNlg3bZraWQSujrBAdNG+5iM5AhfNHAk3AWpCx5I0BcwlXcuKy0PZjd17wMaHGfmCflovuwSAkaP047sS+0trXZ/nA6YmfJ60sJYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ka3hXwqU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ka3hXwqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722265772; x=1753801772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CtQSPwdHc3W7zm8H8Hkkt/c8zANMM225OuY4qd31MN8=;
  b=Ka3hXwqU3V5P7MsvxgCtGGpT2voTNym+S7EjTXjf3t6q6+yG/AgTKhL1
   XrXvo7558GtgCWMasn0pHYFEMyvj2y29g36jlT91UMBVOts69erd74mR9
   Xe26VksVUShX9VKgoAHtleTsAMhwHOnADF4YfZxIXyGOjyolKT/Zebqx8
   0knXRfiCp0FV9rqAD+hCClDMLQEsmyjtZwAVOGD9EAp0W3Rp6dWCsnVSr
   jvGxrTjILymU4qmqQiHci8H4olsyWH3emJ5U5qooDvvHICJzd+M4plu3Y
   YVGkKnqXavUo+tOOUF0I2WpOMGsfGCCkFQZXFEt5TL2ROZ2Nbfi5IP9Qx
   Q==;
X-CSE-ConnectionGUID: TwfpxQqAT0eQYFXtofL+Pw==
X-CSE-MsgGUID: /4FYKlmETKiJpjSS6ziH+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30647989"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="30647989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 08:07:53 -0700
X-CSE-ConnectionGUID: gShN8NBuSJWYs41yErg+5Q==
X-CSE-MsgGUID: wtL7kPlHQQe2uYAGaeJx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="53972093"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 08:07:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYRyW-000rmy-2J;
	Mon, 29 Jul 2024 15:07:48 +0000
Date: Mon, 29 Jul 2024 23:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.fd 28/39]
 arch/powerpc/platforms/cell/spu_syscalls.c:59:1: error: a function
 declaration without a prototype is deprecated in all versions of C
Message-ID: <202407292320.PzZHoHvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   154eb19a802fdf8629273d414dbeb31eccb61587
commit: a5027b86a79716e98fe0b8e1247743dfb5a5c080 [28/39] switch spufs_calls_{get,put}() to CLASS() use
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240729/202407292320.PzZHoHvG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292320.PzZHoHvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292320.PzZHoHvG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/cell/spu_syscalls.c:13:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/cell/spu_syscalls.c:59:1: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      59 | DEFINE_CLASS(spufs_calls, struct spufs_calls *, spufs_calls_put(_T), spufs_calls_get())
         | ^
   include/linux/cleanup.h:111:48: note: expanded from macro 'DEFINE_CLASS'
     111 | static inline _type class_##_name##_constructor(_init_args)             \
         |                                                ^
   5 warnings and 1 error generated.


vim +59 arch/powerpc/platforms/cell/spu_syscalls.c

    58	
  > 59	DEFINE_CLASS(spufs_calls, struct spufs_calls *, spufs_calls_put(_T), spufs_calls_get())
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
