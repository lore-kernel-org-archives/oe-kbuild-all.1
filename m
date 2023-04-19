Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7033A2564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681891848; x=1713427848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldfHi5FJOij2vVlboMSTKmDdQJF9+AoXFipgUDIrzP0=;
  b=Si8wo7lAypF/Jhn5BvRnwla8Vju2YzyvgNY/4ao3RymwyEACeVs26QnE
   lub4mr6VBtSYyjOv0L6rUjSAuOXFQ0gCIN6GvAt26BarBGLMUGm0TYCut
   ONYlfn7CzvGPvAf44XnxbmsSPL3mc9LthYzyAJYCQlm8Bb8qeD7AsIq9e
   u2Ek4+cR5vU1AlCbQerxh9cOUHD2CHDPbx2+NJliqiLakBP5j0P73AKgk
   nVQOWm0qp4yMRg8VW6vsNvk+/CmUrTmUHaR7D+SvvMv/9adrb3X+cUyXV
   5BacL1DvE7g8nCC9NfzcxeNvzactXTHhzyvgq1QdvYgL/fgZ824KCWK9M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431664126"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="431664126"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 01:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684896973"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="684896973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 01:10:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp2tm-000eix-2C;
	Wed, 19 Apr 2023 08:10:42 +0000
Date: Wed, 19 Apr 2023 16:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [tip:locking/core 5/5]
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:232:34: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202304191617.HODs4X6a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   93eff603d6a2bc1895eeb7063dbd0661bb760b74
commit: f7faedffa92c35afbcfbf0a3dd73079e16b2b87f [5/5] drm/i915/gt: use __xchg instead of internal helper
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230419/202304191617.HODs4X6a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=f7faedffa92c35afbcfbf0a3dd73079e16b2b87f
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip locking/core
        git checkout f7faedffa92c35afbcfbf0a3dd73079e16b2b87f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191617.HODs4X6a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:232:34: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c:247:34: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_engine_cs.c:1045:15: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_lrc.c:1112:37: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/gt/intel_lrc.c:1229:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/gt/intel_lrc.c:1230:22: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_gt.c:756:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/i915/gt/intel_gt.c:803:14: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_rc6.c:705:16: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_migrate.c:1150:14: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/gpu/drm/i915/gt/intel_gsc.c:73:43: sparse: sparse: Using plain integer as NULL pointer

vim +232 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c

   134	
   135	static void heartbeat(struct work_struct *wrk)
   136	{
   137		struct i915_sched_attr attr = { .priority = I915_PRIORITY_MIN };
   138		struct intel_engine_cs *engine =
   139			container_of(wrk, typeof(*engine), heartbeat.work.work);
   140		struct intel_context *ce = engine->kernel_context;
   141		struct i915_request *rq;
   142		unsigned long serial;
   143	
   144		/* Just in case everything has gone horribly wrong, give it a kick */
   145		intel_engine_flush_submission(engine);
   146	
   147		rq = engine->heartbeat.systole;
   148		if (rq && i915_request_completed(rq)) {
   149			i915_request_put(rq);
   150			engine->heartbeat.systole = NULL;
   151		}
   152	
   153		if (!intel_engine_pm_get_if_awake(engine))
   154			return;
   155	
   156		if (intel_gt_is_wedged(engine->gt))
   157			goto out;
   158	
   159		if (i915_sched_engine_disabled(engine->sched_engine)) {
   160			reset_engine(engine, engine->heartbeat.systole);
   161			goto out;
   162		}
   163	
   164		if (engine->heartbeat.systole) {
   165			long delay = READ_ONCE(engine->props.heartbeat_interval_ms);
   166	
   167			/* Safeguard against too-fast worker invocations */
   168			if (!time_after(jiffies,
   169					rq->emitted_jiffies + msecs_to_jiffies(delay)))
   170				goto out;
   171	
   172			if (!i915_sw_fence_signaled(&rq->submit)) {
   173				/*
   174				 * Not yet submitted, system is stalled.
   175				 *
   176				 * This more often happens for ring submission,
   177				 * where all contexts are funnelled into a common
   178				 * ringbuffer. If one context is blocked on an
   179				 * external fence, not only is it not submitted,
   180				 * but all other contexts, including the kernel
   181				 * context are stuck waiting for the signal.
   182				 */
   183			} else if (engine->sched_engine->schedule &&
   184				   rq->sched.attr.priority < I915_PRIORITY_BARRIER) {
   185				/*
   186				 * Gradually raise the priority of the heartbeat to
   187				 * give high priority work [which presumably desires
   188				 * low latency and no jitter] the chance to naturally
   189				 * complete before being preempted.
   190				 */
   191				attr.priority = 0;
   192				if (rq->sched.attr.priority >= attr.priority)
   193					attr.priority = I915_PRIORITY_HEARTBEAT;
   194				if (rq->sched.attr.priority >= attr.priority)
   195					attr.priority = I915_PRIORITY_BARRIER;
   196	
   197				local_bh_disable();
   198				engine->sched_engine->schedule(rq, &attr);
   199				local_bh_enable();
   200			} else {
   201				reset_engine(engine, rq);
   202			}
   203	
   204			rq->emitted_jiffies = jiffies;
   205			goto out;
   206		}
   207	
   208		serial = READ_ONCE(engine->serial);
   209		if (engine->wakeref_serial == serial)
   210			goto out;
   211	
   212		if (!mutex_trylock(&ce->timeline->mutex)) {
   213			/* Unable to lock the kernel timeline, is the engine stuck? */
   214			if (xchg(&engine->heartbeat.blocked, serial) == serial)
   215				intel_gt_handle_error(engine->gt, engine->mask,
   216						      I915_ERROR_CAPTURE,
   217						      "no heartbeat on %s",
   218						      engine->name);
   219			goto out;
   220		}
   221	
   222		rq = heartbeat_create(ce, GFP_NOWAIT | __GFP_NOWARN);
   223		if (IS_ERR(rq))
   224			goto unlock;
   225	
   226		heartbeat_commit(rq, &attr);
   227	
   228	unlock:
   229		mutex_unlock(&ce->timeline->mutex);
   230	out:
   231		if (!engine->i915->params.enable_hangcheck || !next_heartbeat(engine))
 > 232			i915_request_put(__xchg(&engine->heartbeat.systole, 0));
   233		intel_engine_pm_put(engine);
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
