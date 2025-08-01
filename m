Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A761D63F7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 21:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754085536; cv=none; b=WyP8BSnBVRfyRh6v9xh1zqCFsPMBrmK834/8adkWbhnzsIBSuzQmhduVTYdJt2XnAU+VYgmm+p3wFbMX8FW1XajboQOD4sAfWFbQpL8Mb7n8VN0r2YD5Y/Y+R2p4x/G5YBuHAFUy9PB5hiu34K5cNE2VD91kxrF5aTYwhkuxeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754085536; c=relaxed/simple;
	bh=euWKwGJqIktpPJiKKmz5ZLPgS9XZ9OpNqv0GbNJKzzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6gJdFR4bD525hWIIdGGHGqYA+s7Xe/BABJyfGFf+y0/DFe/MYr2BJOB2pYGsGZdeAQ1pzfN9drqNRgIt9UbRtYcpWsUSfSJYj5GTVrXzAs6C/ALboqAQVpSAiiI+NsI4XANpngc51jHJP7u3Y56GH3lSU7NH6C0CcixpXikQO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irPMeE6P; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irPMeE6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754085534; x=1785621534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=euWKwGJqIktpPJiKKmz5ZLPgS9XZ9OpNqv0GbNJKzzQ=;
  b=irPMeE6P6ygV5iZqybay8iTCaGSQqmEkE0y52F7E7+jAK5m76pyLTzqk
   BX8QjYP+T+Ty+WTCECv0P5wbXzGGlws+raDCF0PEOT3F3JiDJojJbGEm1
   uunL6XLOuCyDQFV2NFgrNtATtv1Owt6LApyvdndIsYa3w3dPNZONWPER6
   MNVZTe2us/BRioufDsPIJ0kK+pmnHwbz3gVnMsF4nLphRfWbF3O8PPi3p
   9ZGcxZhpEalEZ04BjcJl60p1uL2WWVXU501jeE5Xq8B8mbiexnWnhS78y
   u4AuM+O7qNB3X+PwwIJa86HRCkRQISzK/OLmnQgXoJOZzyrIVc496UhZA
   w==;
X-CSE-ConnectionGUID: TpbZfPJiQvaF/gNaxwVB5w==
X-CSE-MsgGUID: 7qa/CHEoQhqFGCQ8/DCEAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66710705"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="66710705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 14:58:54 -0700
X-CSE-ConnectionGUID: DvC/AjNpTS2WlG5PcjubMQ==
X-CSE-MsgGUID: DSaAFP/wRqm69ZeMwUBLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163357384"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Aug 2025 14:58:53 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhxm6-0004xI-1G;
	Fri, 01 Aug 2025 21:58:50 +0000
Date: Sat, 2 Aug 2025 05:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 15/15]
 kernel/trace/rv/monitors/deadline/deadline.h:18:22: error:
 '__NR_sched_setscheduler' undeclared; did you mean 'sched_setscheduler'?
Message-ID: <202508020532.HwtEdLYE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.com/glemco/linux staging_rv_hybrid_automata
head:   156c507ccabc31d6a60918a00fef988aa348ff4c
commit: 156c507ccabc31d6a60918a00fef988aa348ff4c [15/15] rv: Add deadline monitors
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250802/202508020532.HwtEdLYE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020532.HwtEdLYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020532.HwtEdLYE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:9:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'extract_params':
>> kernel/trace/rv/monitors/deadline/deadline.h:18:22: error: '__NR_sched_setscheduler' undeclared (first use in this function); did you mean 'sched_setscheduler'?
      18 |                 case __NR_sched_setscheduler:
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
         |                      sched_setscheduler
   kernel/trace/rv/monitors/deadline/deadline.h:18:22: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/rv/monitors/deadline/deadline.h:23:22: error: '__NR_sched_setattr' undeclared (first use in this function); did you mean 'sched_setattr'?
      23 |                 case __NR_sched_setattr:
         |                      ^~~~~~~~~~~~~~~~~~
         |                      sched_setattr
   kernel/trace/rv/monitors/deadline/deadline.h:30:31: error: implicit declaration of function 'copy_struct_from_user' [-Wimplicit-function-declaration]
      30 |                         ret = copy_struct_from_user(&attr, size, uattr, size);
         |                               ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:13:13: warning: variable 'new_policy' set but not used [-Wunused-but-set-variable]
      13 |         int new_policy = -1, ret;
         |             ^~~~~~~~~~


vim +18 kernel/trace/rv/monitors/deadline/deadline.h

     8	
     9	static inline int extract_params(struct pt_regs *regs, long id, struct task_struct **p)
    10	{
    11		size_t size = offsetof(struct sched_attr, sched_nice);
    12		struct sched_attr __user *uattr, attr;
    13		int new_policy = -1, ret;
    14		unsigned long args[6];
    15		pid_t pid;
    16	
    17		switch (id) {
  > 18			case __NR_sched_setscheduler:
    19				syscall_get_arguments(current, regs, args);
    20				pid = args[0];
    21				new_policy = args[1];
    22				break;
  > 23			case __NR_sched_setattr:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
