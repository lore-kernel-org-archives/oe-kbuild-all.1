Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE064221D96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205907; cv=none; b=YGiZcPrw62UfR3A4G/DpMvRd9N0jKaIsxM4f5FKFyUgjqGe57cLD+o8JyURYrAGm+u3aKdyNSjxgJ54SeS9o/1XJj4QRtlKINaZi0++sZJ2Sjd2RUXyrAAATvDl4mgXCG7qnnIC3auVu86pU0uRkscnucFJWdb2hMSUuaTfB51g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205907; c=relaxed/simple;
	bh=/f1o6WNhSwx26j1tjGbqqP0+YVGZ77Can1Iup4t9ZFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tck98QTd/cckadk3FV6RK7vsQ/vbDlY9hlHfudPC0yBs15nfpSUl2KziwqXxW/oOIEX3BSapyNxVmtDWprwCjs5saGtXfKWqKu1kI+AB5gPbPeSXLPfqU0PKjW52ThgnD8EooAbqtNFod1BH8HeX9ILT5yaMBd9ZRMRmkqj2zds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Og/nQcOm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Og/nQcOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205905; x=1806741905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/f1o6WNhSwx26j1tjGbqqP0+YVGZ77Can1Iup4t9ZFM=;
  b=Og/nQcOmIajSow9C2LnbdkEwszbpZM5osf3VdGlN0rlKHplmUyiL/KES
   Od4v1WOSDBR+D32JVy343MePuv4zplUJD68kZKj9Ao+lmiNUGnGoFGHRs
   y3fQVbjwm9WD4Iu/xVSIaduX96nAT5JfS4mykdhHVNhcQ0oOdxf/3OZr7
   iE0G5Wb6uQAdaD1WR8CK79B1ZqyicOEouq/OQB2TxZusklacgTTIqEmiB
   4KSALYNNDD9BBu5smIL/c49KdZiLmgDSQjKy/6vAG1ZcEXNoJUVK2k2Xz
   KZxLiQjHDQq9OG+X6Wdlq6eK6WVwEBsHhkottibHWY8UTyrmQC/BOB8A9
   A==;
X-CSE-ConnectionGUID: nfz0wNleS9mjGgLXtKkqJA==
X-CSE-MsgGUID: POi+oA6fQTCosrfqx124Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888913"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:01 -0700
X-CSE-ConnectionGUID: 2fFZdCZ3QbaHUhBP0kikbA==
X-CSE-MsgGUID: FRxoNrNzSS28AIAKyacSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368654"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015J-14gI;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 3 Apr 2026 16:44:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mathura_Kumar <academic1mathura@gmail.com>, brauner@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, academic1mathura@gmail.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2()
 for non-destructive peek on posix mqueue
Message-ID: <202604030707.7rWWvONm-lkp@intel.com>
References: <20260315040827.156558-2-academic1mathura@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315040827.156558-2-academic1mathura@gmail.com>

Hi Mathura_Kumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v7.0-rc6 next-20260402]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/IPC-Added-New-system-call-do_mq_timedreceive2-for-non-destructive-peek-on-posix-mqueue/20260315-143134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260315040827.156558-2-academic1mathura%40gmail.com
patch subject: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2() for non-destructive peek on posix mqueue
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260403/202604030707.7rWWvONm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030707.7rWWvONm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030707.7rWWvONm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   error: include/uapi/linux/mqueue.h: leak CONFIG_COMPAT to user-space
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mqueue.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1431: headers] Error 2
   In file included from arch/parisc/kernel/signal32.h:9,
                    from arch/parisc/kernel/asm-offsets.c:34:
>> include/linux/compat.h:805:65: warning: 'struct compat_mq_timedreceive2_args' declared inside parameter list will not be visible outside of this definition or declaration
     805 | asmlinkage long compat_sys_mq_timedreceive2(mqd_t mqdes, struct compat_mq_timedreceive2_args __user *uargs,
         |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +805 include/linux/compat.h

   799	
   800	#ifdef __ARCH_WANT_COMPAT_SYS_PWRITEV64V2
   801	asmlinkage long compat_sys_pwritev64v2(unsigned long fd,
   802			const struct iovec __user *vec,
   803			unsigned long vlen, loff_t pos, rwf_t flags);
   804	#endif
 > 805	asmlinkage long compat_sys_mq_timedreceive2(mqd_t mqdes, struct compat_mq_timedreceive2_args __user *uargs,
   806												unsigned int flags, unsigned long index,
   807												struct old_timespec32 __user *abs_timeout);
   808	/*
   809	 * Deprecated system calls which are still defined in
   810	 * include/uapi/asm-generic/unistd.h and wanted by >= 1 arch
   811	 */
   812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
