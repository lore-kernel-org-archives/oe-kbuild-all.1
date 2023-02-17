Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F2389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676610121; x=1708146121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7mZndlAoCSXWOvOAIpXs/1CYQ0i7I//F43ZiLhet2+c=;
  b=P0CdJnWIZ24MEIu6wc77p1oYpHiq8NxKoWwVtO8hv+JeNVfete/AghLd
   hiEkDM/fNTBciFNjwng9zDjSWMf1X98kGg7vSq75F+A23UjwbTE8VS+K0
   Jqx/8+VNQAkhei3NaRw3dvpgjvWfZSwM06FW8pZaFRFLpTm5uudoAfpTS
   p+99VOBp6RDpWap7pvZ+2QD0VZV65Viwbt1Pm+Yr7qTkiQR+TdHb2DheX
   taKWXN0CxLz4x68aIN5mdQj96k2ULofO4942CPVai58fxQOf45Ldtu4bv
   6hCL1yCQnz2q6/6mIz/G4AcSA68/zgk7nBuLJJb1WSdP16cIIziJ4Sy/u
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334110744"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="334110744"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 21:02:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670419292"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670419292"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 21:02:00 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSssh-000B85-1i;
	Fri, 17 Feb 2023 05:01:59 +0000
Date: Fri, 17 Feb 2023 13:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] net/core: add optional threading for rps backlog processing
Message-ID: <202302171214.44DCQ08b-lkp@intel.com>
References: <20230216174154.89956-1-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216174154.89956-1-nbd@nbd.name>

Hi Felix,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]
[also build test ERROR on next-20230216]
[cannot apply to horms-ipvs/master net/master linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/net-core-add-optional-threading-for-rps-backlog-processing/20230217-014318
patch link:    https://lore.kernel.org/r/20230216174154.89956-1-nbd%40nbd.name
patch subject: [RFC] net/core: add optional threading for rps backlog processing
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230217/202302171214.44DCQ08b-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/cfa45a2d0fa5797acfd823432640693fa2b0cde5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/net-core-add-optional-threading-for-rps-backlog-processing/20230217-014318
        git checkout cfa45a2d0fa5797acfd823432640693fa2b0cde5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171214.44DCQ08b-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/dev.c: In function 'rps_set_threaded':
>> net/core/dev.c:6394:17: error: implicit declaration of function 'rps_lock'; did you mean 'rht_lock'? [-Werror=implicit-function-declaration]
    6394 |                 rps_lock(sd);
         |                 ^~~~~~~~
         |                 rht_lock
>> net/core/dev.c:6399:17: error: implicit declaration of function 'rps_unlock'; did you mean 'rht_unlock'? [-Werror=implicit-function-declaration]
    6399 |                 rps_unlock(sd);
         |                 ^~~~~~~~~~
         |                 rht_unlock
   cc1: some warnings being treated as errors


vim +6394 net/core/dev.c

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
  6393	
> 6394			rps_lock(sd);
  6395			if (threaded)
  6396				n->state |= NAPIF_STATE_THREADED;
  6397			else
  6398				n->state &= ~NAPIF_STATE_THREADED;
> 6399			rps_unlock(sd);
  6400		}
  6401	
  6402		return err;
  6403	}
  6404	#endif
  6405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
