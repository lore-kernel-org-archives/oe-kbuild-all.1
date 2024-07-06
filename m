Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1446917BB4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 04:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720241791; cv=none; b=u66tQCmNIqEDR40jMjOJEsY+Vu7ObQUim6KB6rbAqn5hhbBj9GCIsbLq3ev9/vtHOgHGpJu0hcFas4Zw0D9wLjs3Safs/3dE4iS3PRrrNY3rXUTi7dWsG0esZGMbJ0DHlySsOCHYwmYy4Z56FRCLp8yGZNfPZyC6YxRtqj8Pgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720241791; c=relaxed/simple;
	bh=b969Y5eBAm3SFGup/DJgRDb2zIT28sfvv3Hu1dxSJxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XGXgiViWZAzB6ab5rUuTrTxM4AoSEZIMWehOzz1UpOE2IIs9YqGqamirf4XqC5UglIkIsyEriIvBv1Ulf2eIJR0pRCb363dMiodkd8ioH4yNKJhuC4PNR8J36baI+RsL/OCns3Kuf+I6fowz2PkbaFsYmfANqN4adP2pYjDY4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C449so+M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C449so+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720241789; x=1751777789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b969Y5eBAm3SFGup/DJgRDb2zIT28sfvv3Hu1dxSJxg=;
  b=C449so+M9/U6rS9FRsLvBdbrwLUAGjd5ClwsLyDmg/LXFoRcY9jVDvEg
   NtaDTcrvwFsMpeePchqkF6DqEKwI0w3bPtVIg4zimUJt/lqLgi9eu79cQ
   IX9LJ1pGK6y0DnXglYyUSqpw8A6TapPdLkuMsXff9l72PEaIPHW4UesX4
   /2tmTCjII6qHuzfVTjNS6aeVFKWTj3vyi26RjOA07QUOrXjUXPtom0vnj
   GGEEGPn+E9kTHBIR5HVCKRPFSTobpcDQkccMMdMV0utgWG5ffJpuNgDmc
   SPIHdAW2zXAIX36Cd+vx8NKTfwEislt/1RWahi8Zy3gIM/O1+M6dR7Hb9
   w==;
X-CSE-ConnectionGUID: bOL9DX3rSr+iF6VoFELQbw==
X-CSE-MsgGUID: 43rFATltRWKSs9qB2Pi7uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="42943034"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="42943034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 21:56:28 -0700
X-CSE-ConnectionGUID: tCh5x/NETDqxzgGBvifSeQ==
X-CSE-MsgGUID: +deCcvbWR+aQboieb5fVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="52205668"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2024 21:56:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPxTE-000TKG-2C;
	Sat, 06 Jul 2024 04:56:24 +0000
Date: Sat, 6 Jul 2024 12:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/cleanups 4/5]
 arch/mips/include/asm/mach-loongson64/mmzone.h:19: warning: "NODE_DATA"
 redefined
Message-ID: <202407061253.DVScBxOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/cleanups
head:   d74c3f8819fd25059208bb373a2635814b6e3317
commit: 32648bd86c675b79c12f80ccced0ffdbd14eac3a [4/5] arch, mm: move defintion of node_data to generic code
config: mips-loongson3_defconfig (https://download.01.org/0day-ci/archive/20240706/202407061253.DVScBxOr-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061253.DVScBxOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061253.DVScBxOr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/mmzone.h:12,
                    from include/linux/mmzone.h:1569,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/compat.h:17,
                    from arch/mips/kernel/asm-offsets.c:12:
>> arch/mips/include/asm/mach-loongson64/mmzone.h:19: warning: "NODE_DATA" redefined
      19 | #define NODE_DATA(n)            (node_data[n])
         | 
   In file included from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10:
   include/linux/numa.h:34: note: this is the location of the previous definition
      34 | #define NODE_DATA(nid)  (node_data[nid])
         | 
--
   In file included from arch/mips/include/asm/mmzone.h:12,
                    from include/linux/mmzone.h:1569,
                    from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/mips/include/asm/hardirq.h:16,
                    from include/linux/hardirq.h:11,
                    from include/linux/kvm_host.h:7,
                    from arch/mips/kvm/loongson_ipi.c:11:
>> arch/mips/include/asm/mach-loongson64/mmzone.h:19: warning: "NODE_DATA" redefined
      19 | #define NODE_DATA(n)            (node_data[n])
         | 
   In file included from include/linux/cpumask.h:17,
                    from arch/mips/include/asm/processor.h:15,
                    from arch/mips/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5:
   include/linux/numa.h:34: note: this is the location of the previous definition
      34 | #define NODE_DATA(nid)  (node_data[nid])
         | 
   arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype for 'kvm_init_loongson_ipi' [-Wmissing-prototypes]
     190 | void kvm_init_loongson_ipi(struct kvm *kvm)
         |      ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/mips/include/asm/mmzone.h:12,
                    from include/linux/mmzone.h:1569,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/compat.h:17,
                    from arch/mips/kernel/asm-offsets.c:12:
>> arch/mips/include/asm/mach-loongson64/mmzone.h:19: warning: "NODE_DATA" redefined
      19 | #define NODE_DATA(n)            (node_data[n])
         | 
   In file included from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10:
   include/linux/numa.h:34: note: this is the location of the previous definition
      34 | #define NODE_DATA(nid)  (node_data[nid])
         | 


vim +/NODE_DATA +19 arch/mips/include/asm/mach-loongson64/mmzone.h

c46173183657bbd arch/mips/include/asm/mach-loongson/mmzone.h   Huacai Chen   2014-06-26  18  
49a49eabeaed12d arch/mips/include/asm/mach-loongson64/mmzone.h Mike Rapoport 2024-06-27 @19  #define NODE_DATA(n)		(node_data[n])
c46173183657bbd arch/mips/include/asm/mach-loongson/mmzone.h   Huacai Chen   2014-06-26  20  

:::::: The code at line 19 was first introduced by commit
:::::: 49a49eabeaed12dd1806ab32778272c6d391c514 MIPS: loongson64: rename __node_data to node_data

:::::: TO: Mike Rapoport <rppt@kernel.org>
:::::: CC: Mike Rapoport <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
