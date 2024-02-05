Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61A2C69D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707146021; cv=none; b=KFOOBs2jI4Y2wLknSGZ4fEI8iGpxKgp0p1fv/uDYW34uBlUnGYDjZ8e0TmSnYjpkdzoeU69xUekJ2cuj07qsYReHP0BY3pMGTHcd63grlPxNaLgSu+pRcM0ahyKIE0ehfRDSbMseB+Q5oynPfkcqBG6qkeNZl9G8y6Tx6CSzAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707146021; c=relaxed/simple;
	bh=14T9Wu4Ejlaq3MXwvGWTBdFS+Jtk6xFUHCKRXj25lPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UthxJXo1hx8QM5yQaloshZBawWhYTRVcmuBfe7rNqPJphmoEnJtOKfpDXk2QzjgQgxsHIBIVCx77yiPq2GVfj0M/dlx3R8+2dD2fpTzvrcyAclA0DANAFoH4TbDcDfHaqzttdUixDBs4gnUIR1PK1+m/Nmu/bnK3Hf1HpSk4Txg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDgTJtua; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDgTJtua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707146019; x=1738682019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14T9Wu4Ejlaq3MXwvGWTBdFS+Jtk6xFUHCKRXj25lPY=;
  b=gDgTJtuasXQd/mYiXjgdx5hAwNw32KUi0YldsYMo5A91lhxipLl98O2q
   1kHDUMnB0Bowm/uQPKdSixUWas2GMK11fzprXSNkJ5qKSbekAH0YZeWJ8
   ZvoagZ5wlilI2kjdEH29YCsOnzq3Fx/wut+5SeLqIXMc80PY/dhxgYty+
   QnimGJ0jdXvpNtjU91oMBDtPrK1zzSTaIhpuAI208E/V2MEXz7DCRwk30
   7Xb/72PpQylVhQBARFcUp+ztcT41fil3F7qdIzqYSpx8yBWnNCdyh4JIK
   MSZSKyuPASWwSpjsnREKoQE0srkncKNeqmxUCMV8+LGOtRqZU9TdrsGLw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11893814"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11893814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 07:13:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="752435"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Feb 2024 07:13:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX0f3-0000bg-1Z;
	Mon, 05 Feb 2024 15:13:29 +0000
Date: Mon, 5 Feb 2024 23:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3278/4021]
 arch/sparc/vdso/vclock_gettime.c:197:undefined reference to
 `__ubsan_handle_shift_out_of_bounds'
Message-ID: <202402052332.5r7hzXyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: 31a765c6a9693e06306467c7929d16d010ad970c [3278/4021] ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
config: sparc64-randconfig-r012-20230903 (https://download.01.org/0day-ci/archive/20240205/202402052332.5r7hzXyV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402052332.5r7hzXyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402052332.5r7hzXyV-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: warning: arch/sparc/vdso/vdso-note.o: missing .note.GNU-stack section implies executable stack
   sparc64-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.o: in function `__vdso_clock_gettime':
>> arch/sparc/vdso/vclock_gettime.c:197:(.text+0x288): undefined reference to `__ubsan_handle_shift_out_of_bounds'
>> sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.c:157:(.text+0x2a8): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.o: in function `__vdso_clock_gettime_stick':
   arch/sparc/vdso/vclock_gettime.c:217:(.text+0x548): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.c:177:(.text+0x568): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.o: in function `__vdso_gettimeofday':
   arch/sparc/vdso/vclock_gettime.c:157:(.text+0x6d0): undefined reference to `__ubsan_handle_shift_out_of_bounds'
   sparc64-linux-ld: arch/sparc/vdso/vclock_gettime.o:arch/sparc/vdso/vclock_gettime.c:177: more undefined references to `__ubsan_handle_shift_out_of_bounds' follow


vim +197 arch/sparc/vdso/vclock_gettime.c

caf539cd1087f7 David S. Miller       2018-10-25  145  
794b88e0475889 David S. Miller       2018-10-21  146  notrace static __always_inline int do_realtime(struct vvar_data *vvar,
82210fc778982d Arnd Bergmann         2019-10-27  147  					       struct __kernel_old_timespec *ts)
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  148  {
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  149  	unsigned long seq;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  150  	u64 ns;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  151  
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  152  	do {
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  153  		seq = vvar_read_begin(vvar);
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  154  		ts->tv_sec = vvar->wall_time_sec;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  155  		ns = vvar->wall_time_snsec;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  156  		ns += vgetsns(vvar);
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21 @157  		ns >>= vvar->clock.shift;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  158  	} while (unlikely(vvar_read_retry(vvar, seq)));
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  159  
19832d24495418 David S. Miller       2018-10-21  160  	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
19832d24495418 David S. Miller       2018-10-21  161  	ts->tv_nsec = ns;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  162  
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  163  	return 0;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  164  }
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  165  
caf539cd1087f7 David S. Miller       2018-10-25  166  notrace static __always_inline int do_realtime_stick(struct vvar_data *vvar,
82210fc778982d Arnd Bergmann         2019-10-27  167  						     struct __kernel_old_timespec *ts)
caf539cd1087f7 David S. Miller       2018-10-25  168  {
caf539cd1087f7 David S. Miller       2018-10-25  169  	unsigned long seq;
caf539cd1087f7 David S. Miller       2018-10-25  170  	u64 ns;
caf539cd1087f7 David S. Miller       2018-10-25  171  
caf539cd1087f7 David S. Miller       2018-10-25  172  	do {
caf539cd1087f7 David S. Miller       2018-10-25  173  		seq = vvar_read_begin(vvar);
caf539cd1087f7 David S. Miller       2018-10-25  174  		ts->tv_sec = vvar->wall_time_sec;
caf539cd1087f7 David S. Miller       2018-10-25  175  		ns = vvar->wall_time_snsec;
caf539cd1087f7 David S. Miller       2018-10-25  176  		ns += vgetsns_stick(vvar);
caf539cd1087f7 David S. Miller       2018-10-25  177  		ns >>= vvar->clock.shift;
caf539cd1087f7 David S. Miller       2018-10-25  178  	} while (unlikely(vvar_read_retry(vvar, seq)));
caf539cd1087f7 David S. Miller       2018-10-25  179  
caf539cd1087f7 David S. Miller       2018-10-25  180  	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
caf539cd1087f7 David S. Miller       2018-10-25  181  	ts->tv_nsec = ns;
caf539cd1087f7 David S. Miller       2018-10-25  182  
caf539cd1087f7 David S. Miller       2018-10-25  183  	return 0;
caf539cd1087f7 David S. Miller       2018-10-25  184  }
caf539cd1087f7 David S. Miller       2018-10-25  185  
794b88e0475889 David S. Miller       2018-10-21  186  notrace static __always_inline int do_monotonic(struct vvar_data *vvar,
82210fc778982d Arnd Bergmann         2019-10-27  187  						struct __kernel_old_timespec *ts)
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  188  {
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  189  	unsigned long seq;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  190  	u64 ns;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  191  
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  192  	do {
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  193  		seq = vvar_read_begin(vvar);
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  194  		ts->tv_sec = vvar->monotonic_time_sec;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  195  		ns = vvar->monotonic_time_snsec;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  196  		ns += vgetsns(vvar);
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21 @197  		ns >>= vvar->clock.shift;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  198  	} while (unlikely(vvar_read_retry(vvar, seq)));
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  199  
19832d24495418 David S. Miller       2018-10-21  200  	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
19832d24495418 David S. Miller       2018-10-21  201  	ts->tv_nsec = ns;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  202  
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  203  	return 0;
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  204  }
9a08862a5d2e26 Nagarathnam Muthusamy 2017-09-21  205  

:::::: The code at line 197 was first introduced by commit
:::::: 9a08862a5d2e266ecea1865547463da2745fc687 vDSO for sparc

:::::: TO: Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
