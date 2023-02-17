Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DF6AA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676640316; x=1708176316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PoY1eCZPQ6CMFKJxPVXA5D51Use3P2jX1QY+6QeFy1U=;
  b=O2TdrHp9V3P/MhYGkdWLiZSOvrPwVytLcGQacXC+IAGhRHMiWHZrvYq7
   qemHQ8IwGPy1JCjL+kwDni5EW6Xmd4nzW+i/bZMLks91pFEX+HCEebqZH
   b3pina8KIsI1EqzFOQcaMcODIlxyc3i52zQOLKKyryujR6fhEXYgpTwAL
   cCga8JFOTl520dBcx7eK0GgJmYsmwSlbL69rlqQeEdzOILdA/f2T7VRMb
   Z52IwpUOrcx1xNttlLj0rOMHYYOqbyIqNqOLd1HKpIiz7EfTc+kqN7PBP
   u83W5r9eOvt/62hYhmPcVkHkLf+hnIL+ylsEqCDo3EUO5rIFMSP1X+13q
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396660361"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="396660361"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 05:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="739263108"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="739263108"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 05:25:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT0jh-000BUR-24;
	Fri, 17 Feb 2023 13:25:13 +0000
Date: Fri, 17 Feb 2023 21:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2] net/core: add optional threading for rps backlog
 processing
Message-ID: <202302172108.u0t9b7qI-lkp@intel.com>
References: <20230217100606.1234-1-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217100606.1234-1-nbd@nbd.name>

Hi Felix,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]
[cannot apply to net/master horms-ipvs/master linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/net-core-add-optional-threading-for-rps-backlog-processing/20230217-180801
patch link:    https://lore.kernel.org/r/20230217100606.1234-1-nbd%40nbd.name
patch subject: [RFC v2] net/core: add optional threading for rps backlog processing
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230217/202302172108.u0t9b7qI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/70f8857dc63eaa2125fdb9fa512f5ca42e15e3fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/net-core-add-optional-threading-for-rps-backlog-processing/20230217-180801
        git checkout 70f8857dc63eaa2125fdb9fa512f5ca42e15e3fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172108.u0t9b7qI-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'rps_set_threaded':
>> net/core/dev.c:6400:17: error: implicit declaration of function 'rps_lock_irq_restore'; did you mean 'rps_unlock_irq_restore'? [-Werror=implicit-function-declaration]
    6400 |                 rps_lock_irq_restore(sd, &flags);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 rps_unlock_irq_restore
   cc1: some warnings being treated as errors


vim +6400 net/core/dev.c

  6357	
  6358	#ifdef CONFIG_RPS
  6359	int rps_set_threaded(bool threaded)
  6360	{
  6361		static bool rps_threaded;
  6362		int err = 0;
  6363		int i;
  6364	
  6365		if (rps_threaded == threaded)
  6366			return 0;
  6367	
  6368		for_each_possible_cpu(i) {
  6369			struct softnet_data *sd = &per_cpu(softnet_data, i);
  6370			struct napi_struct *n = &sd->backlog;
  6371	
  6372			n->thread = kthread_run(napi_threaded_poll, n, "napi/rps-%d", i);
  6373			if (IS_ERR(n->thread)) {
  6374				err = PTR_ERR(n->thread);
  6375				pr_err("kthread_run failed with err %d\n", err);
  6376				n->thread = NULL;
  6377				threaded = false;
  6378				break;
  6379			}
  6380	
  6381		}
  6382	
  6383		rps_threaded = threaded;
  6384	
  6385		/* Make sure kthread is created before THREADED bit
  6386		 * is set.
  6387		 */
  6388		smp_mb__before_atomic();
  6389	
  6390		for_each_possible_cpu(i) {
  6391			struct softnet_data *sd = &per_cpu(softnet_data, i);
  6392			struct napi_struct *n = &sd->backlog;
  6393			unsigned long flags;
  6394	
  6395			rps_lock_irqsave(sd, &flags);
  6396			if (threaded)
  6397				n->state |= NAPIF_STATE_THREADED;
  6398			else
  6399				n->state &= ~NAPIF_STATE_THREADED;
> 6400			rps_lock_irq_restore(sd, &flags);
  6401		}
  6402	
  6403		return err;
  6404	}
  6405	#endif
  6406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
