Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6297A2741D1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322924; cv=none; b=boLNwC8mvzQpH0Pckt4X+H1sKzOBrE+cSTRG9hpivT3cPAb63ihoH6OPLXDXAknNM+FNzty2MNMPSiZMIIFWkF1HWtV/GocaItsnC37BUDU9xjGoi8R1/3SpZIaAxNx96OYCt7vHpVc9oQiAn/8QyrACrHYNlAENNQfVAoY1txs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322924; c=relaxed/simple;
	bh=ja1UaOo8YnU9tmNrXo2JGCApc4d77Knlg96FlP/hw2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b1PkFV+8zv0FgU62VYLOK9kxr/wPWRSg/9MViJEY77dvkN6sFAnzgGE6AlemrxgEvVEqertj3aVmuurHEYDSE5aANSC8LWNzZvze5d7hlw6mD24cQYU4iB3eAfyUeEhlBeBUXBeKhKP9c4bETTwa220KzEnqBjnyGUrw2458Z88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isa+KsAT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isa+KsAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322921; x=1785858921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ja1UaOo8YnU9tmNrXo2JGCApc4d77Knlg96FlP/hw2M=;
  b=isa+KsATj17XvBiwVaCMILNRCZvRpVbSyp2aMsGQHXIlmeiH2u2yXI8z
   2wRi3hhAm4PqYRZxdGmqV3S3/2C2B9UArMuj6dF8PWdfJZNzPCCCRfGrg
   R5FA0gl2ywXfszQ4acJbrqT2T+oQbCK9Ugf0QJLCZnqNn1EQ6HKiQQRCm
   vUlANAKf0by/Jm3UE5NwUPzvdwuMo83Kt8YIMsupShLIDRmSsnj9eNfFa
   6l+JB7cyWJSmri0nusEm+7haQlRyIDLaw/n6Fwe4T2wwzATtzTI6rKXgD
   Ej5PDs0LN3EcnOfxl4VEhhCnpyZlhm6gwgxqOjNCYJTR6pjS3gQe+BbOx
   g==;
X-CSE-ConnectionGUID: DdsFFGYWSjubl3pkpSSuRQ==
X-CSE-MsgGUID: nTGLNShzSBCnv2cuLZiE9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="59208943"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59208943"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:55:21 -0700
X-CSE-ConnectionGUID: 2x+R8XNORA+mTVfBZ6hrrA==
X-CSE-MsgGUID: WcNRyoEuQMuyQ0611eASvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163459396"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2025 08:55:20 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uixWv-0001od-04;
	Mon, 04 Aug 2025 15:55:17 +0000
Date: Mon, 4 Aug 2025 17:55:03 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 kernel/sched/cputime.c:571:38: warning: ignoring attribute 'section
 (".data..percpu..shared_aligned")' because it conflicts with previous
 'section (".data..percpu")'
Message-ID: <202508041745.lcYK6ulr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: 1af75aa95dc59c902a0ce961fa499b44a2fdf97c [1743/1743] sched/cputime: use sched idle time accounting
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508041745.lcYK6ulr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041745.lcYK6ulr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041745.lcYK6ulr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:544,
                    from arch/x86/include/asm/current.h:6,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/cputime.c:4:
>> kernel/sched/cputime.c:571:38: warning: ignoring attribute 'section (".data..percpu..shared_aligned")' because it conflicts with previous 'section (".data..percpu")' [-Wattributes]
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         |                                      ^~~~~~~~~~
   include/linux/percpu-defs.h:93:45: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      93 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                             ^~~~
   kernel/sched/cputime.c:571:1: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/sched.h:935:36: note: previous declaration here
     935 | DECLARE_PER_CPU(struct rq_cputime, rq_cputimes);
         |                                    ^~~~~~~~~~~
   include/linux/percpu-defs.h:87:51: note: in definition of macro 'DECLARE_PER_CPU_SECTION'
      87 |         extern __PCPU_ATTRS(sec) __typeof__(type) name
         |                                                   ^~~~
   kernel/sched/sched.h:935:1: note: in expansion of macro 'DECLARE_PER_CPU'
     935 | DECLARE_PER_CPU(struct rq_cputime, rq_cputimes);
         | ^~~~~~~~~~~~~~~
>> kernel/sched/cputime.c:571:38: warning: ignoring attribute 'section (".data..percpu..shared_aligned")' because it conflicts with previous 'section (".data..percpu")' [-Wattributes]
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         |                                      ^~~~~~~~~~
   include/linux/percpu-defs.h:95:20: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      95 |         __typeof__(type) name
         |                    ^~~~
   kernel/sched/cputime.c:571:1: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/cputime.c:571:50: note: previous declaration here
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         |                                                  ^~~~~~~~~~~
   include/linux/percpu-defs.h:93:51: note: in definition of macro 'DEFINE_PER_CPU_SECTION'
      93 |         extern __PCPU_ATTRS(sec) __typeof__(type) name;                 \
         |                                                   ^~~~
   kernel/sched/cputime.c:571:1: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
     571 | DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +571 kernel/sched/cputime.c

   569	
   570	int use_sched_idle_time __read_mostly;
 > 571	DEFINE_PER_CPU_SHARED_ALIGNED(struct rq_cputime, rq_cputimes);
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
