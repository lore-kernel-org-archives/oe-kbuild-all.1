Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056496FBB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674926693; x=1706462693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Ke+qdzcIVxMhlyDNJqUYHoY4B1qZL7DWnEgIviaA9o=;
  b=OGNi8GDusdIZ3abvzYRKTUy88qNnzmDeU11mz/j2omY/z2s7bBE7mxSt
   6IH7gNRw3Re5+WtQi8YDWO9d/dMV47H8h7+kPR+ODrSfCoEdt3ZiA879p
   /9niFgRDs38CR3gm0DxMzxV/z5L08L+XfBXw+UFFGTetncp7OycOwfskF
   KBKQSBZDKrDN2viFdJ0ZsahWatqgG9Lhr4DVy3/SAFDJ6EabpPExHqwDP
   zhqYakLelcO6JGQZLpE5P3VyY9l3cQjjbAw7QBqqJnJS8xfd9mscm76O2
   inJV+yELQ+N3bpbPlO64gEAvN14ePJ9GMVkGpEjvv5Iu1wHgn09i2cTj4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="413533321"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="413533321"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 09:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="909012185"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="909012185"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 09:24:45 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLowW-0000wx-18;
	Sat, 28 Jan 2023 17:24:44 +0000
Date: Sun, 29 Jan 2023 01:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>, torvalds@linux-foundation.org,
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@kernel.org, joshdon@google.com, brho@google.com,
	pjt@google.com, derkling@google.com, haoluo@google.com,
	dvernet@meta.com, dschatzberg@meta.com, dskarlat@cs.cmu.edu,
	riel@surriel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, kernel-team@meta.com,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 08/30] sched: Expose css_tg(), __setscheduler_prio() and
 SCHED_CHANGE_BLOCK()
Message-ID: <202301290130.A9xDBZbR-lkp@intel.com>
References: <20230128001639.3510083-9-tj@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230128001639.3510083-9-tj@kernel.org>

Hi Tejun,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.2-rc5 next-20230127]
[cannot apply to tip/sched/core tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/sched-Encapsulate-task-attribute-change-sequence-into-a-helper-macro/20230128-123001
patch link:    https://lore.kernel.org/r/20230128001639.3510083-9-tj%40kernel.org
patch subject: [PATCH 08/30] sched: Expose css_tg(), __setscheduler_prio() and SCHED_CHANGE_BLOCK()
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230129/202301290130.A9xDBZbR-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/49fe6fbf20db85f7bd19f55cdcd7e957ae0f0983
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tejun-Heo/sched-Encapsulate-task-attribute-change-sequence-into-a-helper-macro/20230128-123001
        git checkout 49fe6fbf20db85f7bd19f55cdcd7e957ae0f0983
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:6967:6: warning: no previous prototype for '__setscheduler_prio' [-Wmissing-prototypes]
    6967 | void __setscheduler_prio(struct task_struct *p, int prio)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/__setscheduler_prio +6967 kernel/sched/core.c

  6966	
> 6967	void __setscheduler_prio(struct task_struct *p, int prio)
  6968	{
  6969		if (dl_prio(prio))
  6970			p->sched_class = &dl_sched_class;
  6971		else if (rt_prio(prio))
  6972			p->sched_class = &rt_sched_class;
  6973		else
  6974			p->sched_class = &fair_sched_class;
  6975	
  6976		p->prio = prio;
  6977	}
  6978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
