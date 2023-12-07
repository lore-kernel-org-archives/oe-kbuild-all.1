Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E9282EB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYELK0UZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701983219; x=1733519219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dT5XsiaCZuIH5AbEKio7zI1H/A2Yq9DciOqCzZLbQFY=;
  b=ZYELK0UZU2XaBN2T94FBNGTRP+Zrg/NPAkky9k9BrOIO1j/wXNU7ez6E
   58t5Jn5ox2qZkh2R6accBZ3jEwz2PomVtypXyOgQ6wi44uZDenpSG5Dqt
   ACFTeS8h2NPWuPV4Gx0rCFo9CA3/TYLwKn77by5OKgIEQbwH4nAt8vZvz
   rYqhAihq57glYc8oYk/QCL2G/d41HmCcYGSHCiKctYIYiHfgF2s4XuVwl
   OWpTe5bVIlcEIKFwYWYE5qQNoghN/kq5m2WOmm8XpPXnFpYxb7yOLkF1R
   8kIUxsSCtAswwy6pEPGyE5zxQtSwA7vTiiXHUFsEnEmM3ECKne/N7EHKs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1184014"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="1184014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 13:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="19848139"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2023 13:06:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBLa8-000CpJ-1m;
	Thu, 07 Dec 2023 21:06:52 +0000
Date: Fri, 8 Dec 2023 05:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, rafael@kernel.org,
	pavel@ucw.cz, len.brown@intel.com, peterz@infradead.org,
	mingo@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] freezer,sched: Move state information judgment outside
 task_call_func
Message-ID: <202312080436.VRc5l7Yc-lkp@intel.com>
References: <20231207111634.667057-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207111634.667057-1-xiaolei.wang@windriver.com>

Hi Xiaolei,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaolei-Wang/freezer-sched-Move-state-information-judgment-outside-task_call_func/20231207-191924
base:   linus/master
patch link:    https://lore.kernel.org/r/20231207111634.667057-1-xiaolei.wang%40windriver.com
patch subject: [PATCH] freezer,sched: Move state information judgment outside task_call_func
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231208/202312080436.VRc5l7Yc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231208/202312080436.VRc5l7Yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080436.VRc5l7Yc-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/freezer.c: In function '__set_task_frozen':
>> kernel/freezer.c:125:35: error: 'struct task_struct' has no member named 'lockdep_depth'
     125 |         p_check->lockdep_depth = p->lockdep_depth;
         |                                   ^~


vim +125 kernel/freezer.c

   107	
   108	static int __set_task_frozen(struct task_struct *p, void *arg)
   109	{
   110		unsigned int state = READ_ONCE(p->__state);
   111		struct task_freeze_check *p_check = arg;
   112	
   113		if (p->on_rq)
   114			return 0;
   115	
   116		if (p != current && task_curr(p))
   117			return 0;
   118	
   119		if (!(state & (TASK_FREEZABLE | __TASK_STOPPED | __TASK_TRACED)))
   120			return 0;
   121	
   122		p->saved_state = p->__state;
   123		WRITE_ONCE(p->__state, TASK_FROZEN);
   124		p_check->state = p->__state;
 > 125		p_check->lockdep_depth = p->lockdep_depth;
   126		return TASK_FROZEN;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
