Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EA79D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675442053; x=1706978053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3FO0zmwtGXdm1KMLo7JIahsaETloivDWXp0SJSFRnGY=;
  b=Ftu8qbCMd8pEvebYmc625VPb7fM8r1YvfmsC123e/L0r+gt4E6ohfgo+
   LBfEzronvTBlQrp3xRdDxlrHq6QQIuJWaltGYs0DYcln0vhoU8fy9d+AS
   PpY3/H3uH0HrjSWZeXCYgNugmBFY31nLJMfRS5ljWbnrrP8Wd4R7RsivG
   GQbxXnrvYsQC0KBEp/MKwLqANzSjLJQXwCOgMs68EyMQcMqYbWBZGqCoW
   dmzLP617zAR4UCrlRz1TWs6aNU4GBWFeaLb5Hare0aQDM3vJXaOw61I7L
   ItDjW8R65Mb9IiCnFuixaN97rftTeT0ceq4TgcycjGBV+Lh0RVD46CiVD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328803161"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="328803161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 08:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="839650449"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="839650449"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Feb 2023 08:34:09 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNz0r-0000dl-0F;
	Fri, 03 Feb 2023 16:34:09 +0000
Date: Sat, 4 Feb 2023 00:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>, Eric Biggers <ebiggers@google.com>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.4 117/130]
 arch/ia64/kernel/mca_drv.c:179:9: error: implicit declaration of function
 'make_task_dead'
Message-ID: <202302040009.ky4Irm7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.4
head:   ca063b9ad3a34ec08e420c8a92b5da1ef2c7e097
commit: 688f9f4af16cbd6ce48f9a6be509e2328e8fcb7a [117/130] exit: Add and use make_task_dead.
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302040009.ky4Irm7U-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/688f9f4af16cbd6ce48f9a6be509e2328e8fcb7a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.4
        git checkout 688f9f4af16cbd6ce48f9a6be509e2328e8fcb7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/ia64/kernel/mca_drv.c: In function 'fatal_mca':
   arch/ia64/kernel/mca_drv.c:84:9: warning: function 'fatal_mca' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      84 |         vsnprintf(buf, sizeof(buf), fmt, args);
         |         ^~~~~~~~~
   arch/ia64/kernel/mca_drv.c: In function 'mca_recovered':
   arch/ia64/kernel/mca_drv.c:98:9: warning: function 'mca_recovered' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      98 |         vsnprintf(buf, sizeof(buf), fmt, args);
         |         ^~~~~~~~~
   arch/ia64/kernel/mca_drv.c: In function 'mca_handler_bh':
>> arch/ia64/kernel/mca_drv.c:179:9: error: implicit declaration of function 'make_task_dead' [-Werror=implicit-function-declaration]
     179 |         make_task_dead(SIGKILL);
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FRAME_POINTER
   Depends on [n]: DEBUG_KERNEL [=y] && (M68K || UML || SUPERH) || ARCH_WANT_FRAME_POINTERS [=n]
   Selected by [y]:
   - FAULT_INJECTION_STACKTRACE_FILTER [=y] && FAULT_INJECTION_DEBUG_FS [=y] && STACKTRACE_SUPPORT [=y] && !X86_64 && !MIPS && !PPC && !S390 && !MICROBLAZE && !ARM && !ARC && !X86


vim +/make_task_dead +179 arch/ia64/kernel/mca_drv.c

   149	
   150	/**
   151	 * mca_hanlder_bh - Kill the process which occurred memory read error
   152	 * @paddr:	poisoned address received from MCA Handler
   153	 */
   154	
   155	void
   156	mca_handler_bh(unsigned long paddr, void *iip, unsigned long ipsr)
   157	{
   158		ia64_mlogbuf_dump();
   159		printk(KERN_ERR "OS_MCA: process [cpu %d, pid: %d, uid: %d, "
   160			"iip: %p, psr: 0x%lx,paddr: 0x%lx](%s) encounters MCA.\n",
   161		       raw_smp_processor_id(), current->pid,
   162			from_kuid(&init_user_ns, current_uid()),
   163			iip, ipsr, paddr, current->comm);
   164	
   165		spin_lock(&mca_bh_lock);
   166		switch (mca_page_isolate(paddr)) {
   167		case ISOLATE_OK:
   168			printk(KERN_DEBUG "Page isolation: ( %lx ) success.\n", paddr);
   169			break;
   170		case ISOLATE_NG:
   171			printk(KERN_CRIT "Page isolation: ( %lx ) failure.\n", paddr);
   172			break;
   173		default:
   174			break;
   175		}
   176		spin_unlock(&mca_bh_lock);
   177	
   178		/* This process is about to be killed itself */
 > 179		make_task_dead(SIGKILL);
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
