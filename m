Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECEEAD2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 00:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726706883; cv=none; b=BcjFmHPVjZVKPRpHCLNZ4R6F/ckM5LmoLfJEo32HT3vPP4wPboYpGvdpgeVLMF9zT02sdvbPIvFzCyPBCiEzaesf1Vd+hm50TnXsrkn5F/1lT47D97qsky5uWr//+WnYaCVmnSbdQSle1BM8Z7A9Zn6BrGYkzBR/Y6ZYe9RTGMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726706883; c=relaxed/simple;
	bh=2oxivBhCUPITxW+69+02HU74gvlA4FIqIRncGvTJeow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW7Dy5bMSiKBCRr6HMiKsc3+fb6NxiNo3DUs9aGEHqPaej98uWQiQj+hkJ1DWGr58ucolg9Xw9aycvrJax6TaOqq0tVi3WQ/Hk27PGT97V1vWaIIAf3fcvN3/LEgUMnETXiQWxCJHNq8b2N/vs+KlyFvYbEPzM5h6Yu4cVksxW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY782EMM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY782EMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726706881; x=1758242881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oxivBhCUPITxW+69+02HU74gvlA4FIqIRncGvTJeow=;
  b=KY782EMM/Cv9WW5kxPBHQPHAPfXzs2Sa0HOxR99np6M6iLrHV7WkDInC
   hvLFtvdjEAm0OMJZyFYOKYIXfQqAENVLqi0ScW0tAM+ZKt9jLo4sXVWtB
   qFxzwsRdJdsjFhQKbwUKWuldEG1Bxxxd9uOMkml/NvrDNiOpW+Rj6S1+7
   MT59JD+DdRDomTlIxonvHZ5ulH8yD7AKkyo5c2Vp4PBPpAJDtE4jRnEa7
   6uigPlTmGhI4v7jHjgURMPlHhFCmXCtfA/yWNRLkQXgWBixUzbfXzvtXI
   m+40faIm6oDnSIMy4AMbW10iW2lNTOwZnaS00nLk/W6t2F0QFvISd6DbD
   w==;
X-CSE-ConnectionGUID: KeYjcZh0Q8GmlXqeInjrfw==
X-CSE-MsgGUID: /UNJkpS1SlCarvdcu710Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25767307"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25767307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 17:48:00 -0700
X-CSE-ConnectionGUID: i6y2I8JlSu2CyEeD2OnFmA==
X-CSE-MsgGUID: ZStNJvN8QA2YsApxKgRK2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="74742253"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Sep 2024 17:47:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr5Ku-000CmC-28;
	Thu, 19 Sep 2024 00:47:56 +0000
Date: Thu, 19 Sep 2024 08:47:24 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/6] percpu-refcount: Add torture test for percpu refcount
Message-ID: <202409190803.wpIBcLGg-lkp@intel.com>
References: <20240916050811.473556-3-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916050811.473556-3-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master dennis-percpu/for-next v6.11 next-20240918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/percpu-refcount-Add-managed-mode-for-RCU-released-objects/20240916-131210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240916050811.473556-3-Neeraj.Upadhyay%40amd.com
patch subject: [RFC 2/6] percpu-refcount: Add torture test for percpu refcount
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240919/202409190803.wpIBcLGg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190803.wpIBcLGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190803.wpIBcLGg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/percpu-refcount-torture.c: In function 'percpu_ref_test_cleanup':
>> lib/percpu-refcount-torture.c:187:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     187 |                 kfree(busted_late_release_tasks);
         |                 ^~~~~
   lib/percpu-refcount-torture.c: In function 'percpu_ref_torture_init':
>> lib/percpu-refcount-torture.c:247:16: error: implicit declaration of function 'kcalloc' [-Werror=implicit-function-declaration]
     247 |         refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
         |                ^~~~~~~
>> lib/percpu-refcount-torture.c:247:14: warning: assignment to 'struct percpu_ref *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     247 |         refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
         |              ^
>> lib/percpu-refcount-torture.c:263:27: warning: assignment to 'long int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     263 |         num_per_ref_users = kcalloc(nrefs, sizeof(num_per_ref_users[0]), GFP_KERNEL);
         |                           ^
>> lib/percpu-refcount-torture.c:272:24: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     272 |         ref_user_tasks = kcalloc(nusers, sizeof(ref_user_tasks[0]), GFP_KERNEL);
         |                        ^
>> lib/percpu-refcount-torture.c:279:21: warning: assignment to 'atomic_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     279 |         ref_running = kcalloc(nrefs, sizeof(ref_running[0]), GFP_KERNEL);
         |                     ^
   lib/percpu-refcount-torture.c:309:44: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     309 |                 busted_early_release_tasks = kcalloc(nrefs,
         |                                            ^
   lib/percpu-refcount-torture.c:326:43: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     326 |                 busted_late_release_tasks = kcalloc(nrefs, sizeof(busted_late_release_tasks[0]),
         |                                           ^
   cc1: some warnings being treated as errors


vim +/kfree +187 lib/percpu-refcount-torture.c

   176	
   177	static void percpu_ref_test_cleanup(void)
   178	{
   179		int i;
   180	
   181		if (torture_cleanup_begin())
   182			return;
   183	
   184		if (busted_late_release_tasks) {
   185			for (i = 0; i < nrefs; i++)
   186				torture_stop_kthread(busted_late_task, busted_late_release_tasks[i]);
 > 187			kfree(busted_late_release_tasks);
   188			busted_late_release_tasks = NULL;
   189		}
   190	
   191		if (busted_early_release_tasks) {
   192			for (i = 0; i < nrefs; i++)
   193				torture_stop_kthread(busted_early_task, busted_early_release_tasks[i]);
   194			kfree(busted_early_release_tasks);
   195			busted_early_release_tasks = NULL;
   196		}
   197	
   198		if (ref_manager_task) {
   199			torture_stop_kthread(ref_manager, ref_manager_task);
   200			ref_manager_task = NULL;
   201		}
   202	
   203		if (ref_user_tasks) {
   204			for (i = 0; i < nusers; i++)
   205				torture_stop_kthread(ref_user, ref_user_tasks[i]);
   206			kfree(ref_user_tasks);
   207			ref_user_tasks = NULL;
   208		}
   209	
   210		kfree(ref_running);
   211		ref_running = NULL;
   212	
   213		kfree(num_per_ref_users);
   214		num_per_ref_users = NULL;
   215	
   216		if (refs) {
   217			for (i = 0; i < nrefs; i++)
   218				percpu_ref_exit(&refs[i]);
   219			kfree(refs);
   220			refs = NULL;
   221		}
   222	
   223		torture_cleanup_end();
   224	}
   225	
   226	static void percpu_ref_test_release(struct percpu_ref *ref)
   227	{
   228		WARN(!!atomic_add_return(0, &ref_running[ref-refs]), "!!! Premature ref release");
   229	}
   230	
   231	static int __init percpu_ref_torture_init(void)
   232	{
   233		DEFINE_TORTURE_RANDOM(rand);
   234		struct torture_random_state *trsp = &rand;
   235		int flags;
   236		int err;
   237		int ref_idx;
   238		int i;
   239	
   240		if (!torture_init_begin("percpu-refcount", verbose))
   241			return -EBUSY;
   242	
   243		atomic_set(&running, nusers);
   244		/* Order @running with later increment and decrement operations */
   245		smp_mb();
   246	
 > 247		refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
   248		if (!refs) {
   249			TOROUT_ERRSTRING("out of memory");
   250			err = -ENOMEM;
   251			goto init_err;
   252		}
   253		for (i = 0; i < nrefs; i++) {
   254			flags = torture_random(trsp) & 1 ? PERCPU_REF_INIT_ATOMIC : PERCPU_REF_REL_MANAGED;
   255			err = percpu_ref_init(&refs[i], percpu_ref_test_release,
   256					      flags, GFP_KERNEL);
   257			if (err)
   258				goto init_err;
   259			if (!(flags & PERCPU_REF_REL_MANAGED))
   260				percpu_ref_switch_to_managed(&refs[i]);
   261		}
   262	
 > 263		num_per_ref_users = kcalloc(nrefs, sizeof(num_per_ref_users[0]), GFP_KERNEL);
   264		if (!num_per_ref_users) {
   265			TOROUT_ERRSTRING("out of memory");
   266			err = -ENOMEM;
   267			goto init_err;
   268		}
   269		for (i = 0; i < nrefs; i++)
   270			num_per_ref_users[i] = 0;
   271	
 > 272		ref_user_tasks = kcalloc(nusers, sizeof(ref_user_tasks[0]), GFP_KERNEL);
   273		if (!ref_user_tasks) {
   274			TOROUT_ERRSTRING("out of memory");
   275			err = -ENOMEM;
   276			goto init_err;
   277		}
   278	
 > 279		ref_running = kcalloc(nrefs, sizeof(ref_running[0]), GFP_KERNEL);
   280		if (!ref_running) {
   281			TOROUT_ERRSTRING("out of memory");
   282			err = -ENOMEM;
   283			goto init_err;
   284		}
   285	
   286		for (i = 0; i < nusers; i++) {
   287			ref_idx = torture_random(trsp) % nrefs;
   288			atomic_inc(&ref_running[ref_idx]);
   289			num_per_ref_users[ref_idx]++;
   290			/* Order increments with subquent reads */
   291			smp_mb();
   292			err = torture_create_kthread(percpu_ref_test_thread,
   293						     &refs[ref_idx], ref_user_tasks[i]);
   294			if (torture_init_error(err))
   295				goto init_err;
   296		}
   297	
   298		err = torture_create_kthread(percpu_ref_manager_thread, NULL, ref_manager_task);
   299		if (torture_init_error(err))
   300			goto init_err;
   301	
   302		/* Drop initial reference, after test threads have started running */
   303		udelay(1);
   304		for (i = 0; i < nrefs; i++)
   305			percpu_ref_put(&refs[i]);
   306	
   307	
   308		if (busted_early_ref_release) {
   309			busted_early_release_tasks = kcalloc(nrefs,
   310							     sizeof(busted_early_release_tasks[0]),
   311							     GFP_KERNEL);
   312			if (!busted_early_release_tasks) {
   313				TOROUT_ERRSTRING("out of memory");
   314				err = -ENOMEM;
   315				goto init_err;
   316			}
   317			for (i = 0; i < nrefs; i++) {
   318				err = torture_create_kthread(percpu_ref_busted_early_thread,
   319						     &refs[i], busted_early_release_tasks[i]);
   320				if (torture_init_error(err))
   321					goto init_err;
   322			}
   323		}
   324	
   325		if (busted_late_ref_release) {
   326			busted_late_release_tasks = kcalloc(nrefs, sizeof(busted_late_release_tasks[0]),
   327							    GFP_KERNEL);
   328			if (!busted_late_release_tasks) {
   329				TOROUT_ERRSTRING("out of memory");
   330				err = -ENOMEM;
   331				goto init_err;
   332			}
   333			for (i = 0; i < nrefs; i++) {
   334				err = torture_create_kthread(percpu_ref_busted_late_thread,
   335						     &refs[i], busted_late_release_tasks[i]);
   336				if (torture_init_error(err))
   337					goto init_err;
   338			}
   339		}
   340		if (stutter) {
   341			err = torture_stutter_init(stutter, stutter);
   342			if (torture_init_error(err))
   343				goto init_err;
   344		}
   345	
   346		err = torture_onoff_init(onoff_holdoff * HZ, onoff_interval, NULL);
   347		if (torture_init_error(err))
   348			goto init_err;
   349	
   350		torture_init_end();
   351		return 0;
   352	init_err:
   353		torture_init_end();
   354		percpu_ref_test_cleanup();
   355		return err;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
