Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC851C5F26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 00:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234809; cv=none; b=J5xjhqNCe+RIc6bp6d2YqcDWWNUNmSnSJ2shZi02y223sjyUy34juQ4YVZSypbBQUACssPCYdr7UMOjP6UECkJflWoxCpDeKBqiv+z/5bNrpRMN7kZjn1tsmzTvj77fUMxciX3qPKTlYfnNvwStIlT6IiR5Co3Oz6MJDffYsauI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234809; c=relaxed/simple;
	bh=dzd/pnrSbPqU6qEZ56FjJpSR9Qq6SKybEq5vAflSsuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=reGVvJj7j5ubUQQzf/5/NcnJw9anYjjtuWPNgzD7OmV0IivNQmPllN20ehcP3QHzeGr1REAoeiRxMgBBlPg4K2IJ7I7JJXJsZF6LChJZR5ChJvSTJgkLLQ030wxDiFA+W7IHp1fNPufVDtsyKPzpDZhKJ+uGF77W/uKB99yuUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7tekcqJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7tekcqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739234807; x=1770770807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dzd/pnrSbPqU6qEZ56FjJpSR9Qq6SKybEq5vAflSsuE=;
  b=B7tekcqJijIT09XmSkR5v30VRGDlr4NInmfeAgwcKXeaTvAcu3kWZEi6
   NY2uy9tOmEEoy1pAewecgq8MB6V4OMbGXO2BHeo7h5idQQEmr3CkWUc+Y
   Hza2q5+hgN4k/n9P89b65lBf6lpgU1IHfF3UOQi25lyYeYI9s1y3eJ4Ga
   PpNSNjvC0ed5pmGzKw/XKEnp8+jORtGHSKCdmiGtQ7RM99YrlNl4l61C8
   APvbk8Cu7tcPa5fImVEjVCyXdI1HCJU0HE5uSrdAdZdZyMWM+M9kCo+HR
   CZXDzLquFOXftcsGRdFg51RZiM9vZ/H+rsuEEJNVZCFc4vP/yMwH/IqFC
   A==;
X-CSE-ConnectionGUID: VHDOgiAxQsqIYGbco7Uu3g==
X-CSE-MsgGUID: lZOuFwtoR+GEbcdx37jQJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62314092"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="62314092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:46:45 -0800
X-CSE-ConnectionGUID: V5xER/bVSQeTswIuBweemg==
X-CSE-MsgGUID: ECKn6JBqQYeggKOesvaGJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112993562"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Feb 2025 16:46:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1theQD-0013Zh-26;
	Tue, 11 Feb 2025 00:46:41 +0000
Date: Tue, 11 Feb 2025 08:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1422/1422] kernel/sched/.tmp_core.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202502110821.EGD3OpQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e7e24815dc35fd89241933daa8733b46f157ec60
commit: f2701b77bbd992f3df4631de8493f21db0830452 [1422/1422] Merge 4.18-rc7 into master to pick up the KVM dependcy
config: x86_64-buildonly-randconfig-002-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110821.EGD3OpQb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110821.EGD3OpQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110821.EGD3OpQb-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                 ^~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   kernel/sched/core.c:6738:17: note: in expansion of macro 'if'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:416:41: note: in expansion of macro 'likely'
     416 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   include/linux/cgroup.h:92:9: note: in expansion of macro 'static_branch_likely'
      92 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6738:21: note: in expansion of macro 'cgroup_subsys_on_dfl'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:61:31: warning: ignoring attribute 'section ("_ftrace_branch")' because it conflicts with previous 'section ("_ftrace_annotated_branch")' [-Wattributes]
      61 |                 static struct ftrace_branch_data                        \
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   kernel/sched/core.c:6738:17: note: in expansion of macro 'if'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:416:41: note: in expansion of macro 'likely'
     416 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/jump_label.h:325:9: note: in expansion of macro 'if'
     325 |         if (!__builtin_types_compatible_p(typeof(*x), struct static_key) &&     \
         |         ^~
   include/linux/jump_label.h:416:48: note: in expansion of macro 'static_key_enabled'
     416 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                                ^~~~~~~~~~~~~~~~~~
   include/linux/cgroup.h:92:9: note: in expansion of macro 'static_branch_likely'
      92 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6738:21: note: in expansion of macro 'cgroup_subsys_on_dfl'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:28:33: note: previous declaration here
      28 |                                 ______f = {                             \
         |                                 ^~~~~~~
   include/linux/compiler.h:58:49: note: in definition of macro '__trace_if'
      58 |         if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
         |                                                 ^~~~
   kernel/sched/core.c:6738:17: note: in expansion of macro 'if'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:416:41: note: in expansion of macro 'likely'
     416 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   include/linux/cgroup.h:92:9: note: in expansion of macro 'static_branch_likely'
      92 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6738:21: note: in expansion of macro 'cgroup_subsys_on_dfl'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/sched/core.c:6738:17: note: in expansion of macro 'if'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:416:41: note: in expansion of macro 'likely'
     416 | #define static_branch_likely(x)         likely(static_key_enabled(&(x)->key))
         |                                         ^~~~~~
   include/linux/cgroup.h:92:9: note: in expansion of macro 'static_branch_likely'
      92 |         static_branch_likely(&ss ## _on_dfl_key)
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6738:21: note: in expansion of macro 'cgroup_subsys_on_dfl'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/sched/core.c:6738:17: note: in expansion of macro 'if'
    6738 |                 if (cgroup_subsys_on_dfl(cpu_cgrp_subsys)) {
         |                 ^~
>> kernel/sched/.tmp_core.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
