Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C535628E2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677326192; x=1708862192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPZsf/gUZkdRZkjFsv53/tZnPTzbelILYzdMaKNxBF4=;
  b=clPz1Ca5jyOT01Puj508wsC/lhaH9t2OqVfB9v0nn+zZpYvG981hAKZU
   HJ3pM60474mqWr1KMB26/sLkGNEnAkLyxhHnYRTrmpiHev82sifeZcJJo
   S8ytK0rJK0PkRr935beo6IKZoNaoA4EAnaxq/ZSse6AUMBmlUPD/ucvzk
   Kk68BOA1qEa1jXpApNJ2TNeX2dPVLh2bsuaTB99o4NrW37g5stEhuZ7dJ
   LgJhATTKwx7ztViA8inVxuEazycVCcaqxaBrT0ZVeLCQRDMYQ0cqRRf+r
   vYs+mrPTMUNFOMTskhfWgntFjcXZCghDwYR4vkdIAaRCpEzAVnptUbDj+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361169270"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361169270"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 03:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673185459"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="673185459"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2023 03:56:29 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVtAD-0003AV-0b;
	Sat, 25 Feb 2023 11:56:29 +0000
Date: Sat, 25 Feb 2023 19:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2] rcu: Add a minimum time for marking boot as
 completed
Message-ID: <202302251903.JJF7dBwl-lkp@intel.com>
References: <20230225033421.3323164-1-joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225033421.3323164-1-joel@joelfernandes.org>

Hi Joel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on paulmck-rcu/dev]
[also build test ERROR on linus/master v6.2 next-20230225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes-Google/rcu-Add-a-minimum-time-for-marking-boot-as-completed/20230225-113519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
patch link:    https://lore.kernel.org/r/20230225033421.3323164-1-joel%40joelfernandes.org
patch subject: [PATCH RFC v2] rcu: Add a minimum time for marking boot as completed
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230225/202302251903.JJF7dBwl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e42e553f5b94f064331b1cff0af0ea6f55ffe1b4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joel-Fernandes-Google/rcu-Add-a-minimum-time-for-marking-boot-as-completed/20230225-113519
        git checkout e42e553f5b94f064331b1cff0af0ea6f55ffe1b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251903.JJF7dBwl-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rcu/update.o: in function `rcu_end_inkernel_boot':
>> kernel/rcu/update.c:246: undefined reference to `__udivdi3'
>> ld: kernel/rcu/update.c:246: undefined reference to `__udivdi3'


vim +246 kernel/rcu/update.c

   242	
   243	void rcu_end_inkernel_boot(void)
   244	{
   245		if (boot_end_delay) {
 > 246			u64 boot_ms = ktime_get_boot_fast_ns() / 1000000UL;
   247	
   248			if (boot_ms < boot_end_delay) {
   249				schedule_delayed_work(&boot_rcu_work,
   250						boot_end_delay - boot_ms);
   251				return;
   252			}
   253		}
   254	
   255		rcu_unexpedite_gp();
   256		rcu_async_relax();
   257		if (rcu_normal_after_boot)
   258			WRITE_ONCE(rcu_normal, 1);
   259		rcu_boot_ended = true;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
