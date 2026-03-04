Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F6288514
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772653651; cv=none; b=D7lf5ho3OaTuCdEo2oGWGbRu/FGBihzkQ0a0hRZWAWiAvmP+6Pv4qHEnYG7B204T2yQ9N020Q43n6BHLdesGGGZHDX5w7/uxbbOV6rFPSnoiamisBt9ZRLeFABJbk2S0cRgZx4fTp4oO8W7iv1p+ZgKB894my49uTwFzliHQkJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772653651; c=relaxed/simple;
	bh=+l/jVvgg3VbXuFQoxZ8lOjWA02ggDIpf3HZiHYYiNB8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SEfzRXD/BmVvChwfn9MA/wy4bP+tjbBHYgUFaHYbtxUpKaK/2yhLpMs9fq2W4ZPdYj6lQID1kb4/6pdRv6yDFl05P4vcKMiRY4sVmzIauh9yaySCUc/OrNJAKh27c2pOjuZOIv4SoJ792NX4HXWIUtqT5Ma19ZqdZLB8PV5R7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jU8xrx52; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jU8xrx52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772653649; x=1804189649;
  h=date:from:to:cc:subject:message-id;
  bh=+l/jVvgg3VbXuFQoxZ8lOjWA02ggDIpf3HZiHYYiNB8=;
  b=jU8xrx52RU2eloxnoFBAC3mjU+fPhlLU5QJ+x+97jsfixUfzBJKYOshY
   hkxLGQc8SPwAu5Meodn4v+RczHPxPQxobGC1U8/6eZiZ7iKASPEOkTsUn
   ZQ3w5OeZNkWUrZ82DQpWFLX8nqCLkd1Pm5dxTohK+8X0tLQAeUJsFEPVt
   BRPYSmai+NuW4rZ731C0cRYMZFd705UHpj6fRsjsZDwG9Q/SY6BuHr5uM
   pHRrfFogr3FGpxMoJezFw+in4heHxsgIQOjW6UzEPzn8pEnuLn3mbk/E+
   7atef+6Q7dCcJQ3TeHwaTJEU3eAEIWGdusS68CSU9av9uy4P/mq0MGGzY
   g==;
X-CSE-ConnectionGUID: vM4jgOO+ShWLKXUQ8IFuXA==
X-CSE-MsgGUID: pSASn0ldQjyZImj8P8jzoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77569877"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77569877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 11:47:28 -0800
X-CSE-ConnectionGUID: 57L8n4YuQ86I70p5Or9WYQ==
X-CSE-MsgGUID: mG8xALttSYqGT1LEjrSmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="256325204"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 11:47:27 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxsBo-000000004Qj-0FU8;
	Wed, 04 Mar 2026 19:47:24 +0000
Date: Thu, 05 Mar 2026 03:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Subject: [chao:bugfix/syzbot 2/2] include/linux/lockdep.h:158:38:
 error: 'struct f2fs_rwsem' has no member named 'dep_map'
Message-ID: <202603050313.1AJLPkym-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   3b19564b95e9ba9803ef30e90eace0977b9d140d
commit: 3b19564b95e9ba9803ef30e90eace0977b9d140d [2/2] f2fs: fix false alarm of lockdep on cp_global_sem lock
config: sh-randconfig-r072-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050313.1AJLPkym-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050313.1AJLPkym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050313.1AJLPkym-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from fs/f2fs/super.c:8:
   fs/f2fs/super.c: In function 'f2fs_fill_super':
>> include/linux/lockdep.h:158:38: error: 'struct f2fs_rwsem' has no member named 'dep_map'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                      ^~
   fs/f2fs/super.c:4952:9: note: in expansion of macro 'lockdep_set_class'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:159:37: error: 'struct f2fs_rwsem' has no member named 'dep_map'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                                     ^~
   fs/f2fs/super.c:4952:9: note: in expansion of macro 'lockdep_set_class'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:160:37: error: 'struct f2fs_rwsem' has no member named 'dep_map'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                                     ^~
   fs/f2fs/super.c:4952:9: note: in expansion of macro 'lockdep_set_class'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:161:37: error: 'struct f2fs_rwsem' has no member named 'dep_map'
     161 |                               (lock)->dep_map.lock_type)
         |                                     ^~
   fs/f2fs/super.c:4952:9: note: in expansion of macro 'lockdep_set_class'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~


vim +158 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar    2006-07-03  150  
fbb9ce9530fd9b Ingo Molnar    2006-07-03  151  /*
fbb9ce9530fd9b Ingo Molnar    2006-07-03  152   * Reinitialize a lock key - for cases where there is special locking or
fbb9ce9530fd9b Ingo Molnar    2006-07-03  153   * special initialization of locks so that the validator gets the scope
fbb9ce9530fd9b Ingo Molnar    2006-07-03  154   * of dependencies wrong: they are either too broad (they need a class-split)
fbb9ce9530fd9b Ingo Molnar    2006-07-03  155   * or they are too narrow (they suffer from a false class-split):
fbb9ce9530fd9b Ingo Molnar    2006-07-03  156   */
fbb9ce9530fd9b Ingo Molnar    2006-07-03  157  #define lockdep_set_class(lock, key)				\
eae6d58d67d973 Peter Zijlstra 2022-06-17 @158  	lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,	\
de8f5e4f2dc1f0 Peter Zijlstra 2020-03-21  159  			      (lock)->dep_map.wait_type_inner,	\
eae6d58d67d973 Peter Zijlstra 2022-06-17  160  			      (lock)->dep_map.wait_type_outer,	\
eae6d58d67d973 Peter Zijlstra 2022-06-17  161  			      (lock)->dep_map.lock_type)
de8f5e4f2dc1f0 Peter Zijlstra 2020-03-21  162  

:::::: The code at line 158 was first introduced by commit
:::::: eae6d58d67d9739be5f7ae2dbead1d0ef6528243 locking/lockdep: Fix lockdep_init_map_*() confusion

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
