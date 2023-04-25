Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5717B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 04:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682398759; x=1713934759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNcgJJpVJbVQS9FvP+hF44mTkIm/JcR7B+Hblg4gfFc=;
  b=REBT7ltdiyMqhyo9jVXH7XmYESB3i7Vf3nF5WXDVm4yGqB5uZkNDaCg3
   yB2TRseyXGLDoI37YEUSQ+GOmROtP85kj1G59BkY705voAenprA4pNQ8V
   Jb2/b2Vv0aMbMWW34X5FdmJQUYs4dpNZgWNadSVp39MFZcRa44iZ8UBur
   uEcmL2bbEHspmHKEAq+hSq0RaUx04JHgzHQQ97VMGdP4PFskWpyhRaWux
   33KTt27nUNP9BnO31GFEWWNAMbFVIDTYMf+QTfTHmjfsie7ZKVt94/1QY
   Oa3gzhC9aZuYrht7nc1ghKhXAWY53UkyalcYEOH0Pe/dlj07uAGfqbKty
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="374598827"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="374598827"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 21:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="725955517"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="725955517"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Apr 2023 21:59:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prAlo-000izu-1f;
	Tue, 25 Apr 2023 04:59:16 +0000
Date: Tue, 25 Apr 2023 12:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 7844/7899]
 kernel/sched/psi.c:538:17: error: implicit declaration of function
 'trace_android_vh_psi_event'
Message-ID: <202304251250.hWJBGeTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Georgi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   ec3670c83983dc14bbb23db15ff51ee40c42b537
commit: b79d1815c400c3929bb78a209b6e51a38d6ffcb2 [7844/7899] ANDROID: psi: Add vendor hooks for PSI tracing
config: i386-randconfig-a013-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251250.hWJBGeTb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-trusty-5.10
        git checkout b79d1815c400c3929bb78a209b6e51a38d6ffcb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251250.hWJBGeTb-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/psi.c: In function 'update_triggers':
>> kernel/sched/psi.c:538:17: error: implicit declaration of function 'trace_android_vh_psi_event' [-Werror=implicit-function-declaration]
     538 |                 trace_android_vh_psi_event(t);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:546:9: error: implicit declaration of function 'trace_android_vh_psi_group' [-Werror=implicit-function-declaration]
     546 |         trace_android_vh_psi_group(group);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/trace_android_vh_psi_event +538 kernel/sched/psi.c

   503	
   504	static u64 update_triggers(struct psi_group *group, u64 now)
   505	{
   506		struct psi_trigger *t;
   507		bool new_stall = false;
   508		u64 *total = group->total[PSI_POLL];
   509	
   510		/*
   511		 * On subsequent updates, calculate growth deltas and let
   512		 * watchers know when their specified thresholds are exceeded.
   513		 */
   514		list_for_each_entry(t, &group->triggers, node) {
   515			u64 growth;
   516	
   517			/* Check for stall activity */
   518			if (group->polling_total[t->state] == total[t->state])
   519				continue;
   520	
   521			/*
   522			 * Multiple triggers might be looking at the same state,
   523			 * remember to update group->polling_total[] once we've
   524			 * been through all of them. Also remember to extend the
   525			 * polling time if we see new stall activity.
   526			 */
   527			new_stall = true;
   528	
   529			/* Calculate growth since last update */
   530			growth = window_update(&t->win, now, total[t->state]);
   531			if (growth < t->threshold)
   532				continue;
   533	
   534			/* Limit event signaling to once per window */
   535			if (now < t->last_event_time + t->win.size)
   536				continue;
   537	
 > 538			trace_android_vh_psi_event(t);
   539	
   540			/* Generate an event */
   541			if (cmpxchg(&t->event, 0, 1) == 0)
   542				wake_up_interruptible(&t->event_wait);
   543			t->last_event_time = now;
   544		}
   545	
 > 546		trace_android_vh_psi_group(group);
   547	
   548		if (new_stall)
   549			memcpy(group->polling_total, total,
   550					sizeof(group->polling_total));
   551	
   552		return now + group->poll_min_period;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
