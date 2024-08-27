Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA3017BA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 03:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724729867; cv=none; b=huwzU0zPlmxrzYiY46+IAs+0jVOLaT9dOstexsLnJNTBBl/XqK0XV8WEGJVkxBAbyzDZgir7v+gYXTNxtOciNzhtIFh+S5OVv2KWao8+/GP0gVHiLTZDPscOlQPnLSEyFlO6KGEXl3qSDPpwk6s4mdeDoXLvvvcddSYi/8f0+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724729867; c=relaxed/simple;
	bh=AK7DclTopyYrD0Zaha5kliGfnMDzmxIV9KCQWVoV0FY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lioftQZLQXpnRyAasNlo5O22mujg6Zata9uJvVdZPPYJewUds+DAqvnEsB3llJ5mBEmgXZRhnhHyNSp1pBZ2DgvlCwexfBG8zVE1n32/fs+oEUiSa/UV81LDZ2fJwn/h050SWXVD40H6lJ9GwGONcSljNCQuK7UAkpGvanFf4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtHu3Ic5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtHu3Ic5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724729866; x=1756265866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AK7DclTopyYrD0Zaha5kliGfnMDzmxIV9KCQWVoV0FY=;
  b=AtHu3Ic5jE0912J0BKNpZh0cqN4w1ifzfak+xd6XINdjJ5i/iA+4TWQc
   I+SSm+iqG8e42WmZSNDnU2RFr+LErSh9JRmCsp8i88sTiqNEgaHJAcVkV
   Cji0GoIplhZ6tHV9RiRGFUak/GzpV+QSXQqCdgZiWIkRMvtUF7uf5/4yY
   qQJky+Q325X9AgxYHv3ZODzplHC8MvC1dM9BL7xuJOvvawbtSYPxueLhU
   TMUY8KteRX0gNygTGvplMGkZvOV9F6aYgiUnJVtHXWiJ4/tYEr4g9JPMR
   Lyzi2qFTsmedxPiDLJ8KvUeD0rZsbA0F5f03WBn7reLiShi0iRAAxCbkL
   A==;
X-CSE-ConnectionGUID: y1eOJGqgQi2gOmND/1K3CA==
X-CSE-MsgGUID: c9rupC/VQyCRnWw0R0deHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="48573083"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="48573083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 20:37:45 -0700
X-CSE-ConnectionGUID: pjuyb4uITJSDnR6bi+tT4A==
X-CSE-MsgGUID: dEVZKj5VRrar9rMn9WM/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="85912327"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Aug 2024 20:37:44 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sin1a-000HrG-1O;
	Tue, 27 Aug 2024 03:37:42 +0000
Date: Tue, 27 Aug 2024 11:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 127/132]
 kernel/locking/percpu-rwsem.c:185:9: warning: "per_cpu_sum" redefined
Message-ID: <202408271138.nPtwMA53-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fcd6549aad02f9abeb9184201c285e6b67b3f098
commit: 2cfe6ffc66b2a26cd25e4adc66d8751581a6f28d [127/132] percpu: per_cpu_sum()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240827/202408271138.nPtwMA53-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408271138.nPtwMA53-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408271138.nPtwMA53-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/percpu-rwsem.c:185:9: warning: "per_cpu_sum" redefined
     185 | #define per_cpu_sum(var)                                                \
         |         ^~~~~~~~~~~
   In file included from kernel/locking/percpu-rwsem.c:3:
   include/linux/percpu.h:165:9: note: this is the location of the previous definition
     165 | #define per_cpu_sum(_p)                                                 \
         |         ^~~~~~~~~~~


vim +/per_cpu_sum +185 kernel/locking/percpu-rwsem.c

9287f6925ad9d8f kernel/locking/percpu-rwsem.c Oleg Nesterov  2015-07-21  184  
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14 @185  #define per_cpu_sum(var)						\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  186  ({									\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  187  	typeof(var) __sum = 0;						\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  188  	int cpu;							\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  189  	compiletime_assert_atomic_type(__sum);				\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  190  	for_each_possible_cpu(cpu)					\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  191  		__sum += per_cpu(var, cpu);				\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  192  	__sum;								\
80127a39681bd68 kernel/locking/percpu-rwsem.c Peter Zijlstra 2016-07-14  193  })
a1fd3e24d8a484b lib/percpu-rwsem.c            Oleg Nesterov  2012-12-17  194  

:::::: The code at line 185 was first introduced by commit
:::::: 80127a39681bd68c959f0953f84a830cbd7c3b1c locking/percpu-rwsem: Optimize readers and reduce global impact

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
