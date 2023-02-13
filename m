Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126881FA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676273534; x=1707809534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcFXxqey98VGkreA6tI83hCzUgAUrr2q3qTqL/eAZSQ=;
  b=gTQJoL9SjqgQDUFGrfNJXlqjsn9gibJkqS2yYBFIAMzwfHaZymachDkC
   PaKse6HZcT4nfthAWgvCpjmurZKtSGEErleWrrZ5lkp08ddhRRB2l/qzo
   r+41GWpsrI+CsDbhk3Eox+FtHo2+iE1hrxioCLrDl6Gfg2tdZrJ2/DSLj
   6crY8w6YZhGrU2HKS2lQ05Ah1c25ef9nqPsEy43V9MyajXu+eozuR72qC
   IX5sOkXtJ9oeryRxZxsH2pFWFzDNAef8FyPGWGlqHcDMDvfoA9LI7pfSG
   TxkcMQ0+Eo75r25cKCsFEZb9/t9doCYzZkB8e4AAu8idGC+ThrFGybiKp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395442116"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395442116"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 23:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="842681136"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="842681136"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Feb 2023 23:32:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRTJq-0007cH-2e;
	Mon, 13 Feb 2023 07:32:10 +0000
Date: Mon, 13 Feb 2023 15:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl
 for shadow stack and landing pad instr
Message-ID: <202302131544.jUyX68qd-lkp@intel.com>
References: <20230213045351.3945824-16-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213045351.3945824-16-debug@rivosinc.com>

Hi Deepak,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linus/master v6.2-rc8]
[cannot apply to next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20230213045351.3945824-16-debug%40rivosinc.com
patch subject: [PATCH v1 RFC Zisslpcfi 15/20] sslp prctl: arch-agnostic prctl for shadow stack and landing pad instr
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230213/202302131544.jUyX68qd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/844893d36016d44495709aabb93e3c8f66efaefd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepak-Gupta/sslp-stubs-shadow-stack-and-landing-pad-stubs/20230213-125630
        git checkout 844893d36016d44495709aabb93e3c8f66efaefd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131544.jUyX68qd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2285:12: warning: no previous prototype for 'arch_get_shadow_stack_status' [-Wmissing-prototypes]
    2285 | int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2290:12: warning: no previous prototype for 'arch_set_shadow_stack_status' [-Wmissing-prototypes]
    2290 | int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2295:12: warning: no previous prototype for 'arch_get_indir_br_lp_status' [-Wmissing-prototypes]
    2295 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2300:12: warning: no previous prototype for 'arch_set_indir_br_lp_status' [-Wmissing-prototypes]
    2300 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_get_shadow_stack_status +2285 kernel/sys.c

  2284	
> 2285	int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
  2286	{
  2287		return -EINVAL;
  2288	}
  2289	
> 2290	int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
  2291	{
  2292		return -EINVAL;
  2293	}
  2294	
> 2295	int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2296	{
  2297		return -EINVAL;
  2298	}
  2299	
> 2300	int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2301	{
  2302		return -EINVAL;
  2303	}
  2304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
