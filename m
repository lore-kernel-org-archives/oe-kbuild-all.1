Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B01CF8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 02:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726711929; cv=none; b=DXO0LYyTxETxzD4HGfVTfcEbHSbs8qgj+ZLqDhX2aAObMEagrkELqhLLfm30qD/rEydiuQ/h2B7dAW95oRz/SyNqlGreyRIQrI1TQTIGa+enR7wo0HKd/DBw+4rqwHbbAV1XCNz5xZQx+SiC7o7KgLmGcq2Urvj0uDiYexUnC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726711929; c=relaxed/simple;
	bh=H5xQAQL0ey+YPXWadgFvY3dZXFvDNm/72iD/vAq/ago=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnsY/OKZwzLqpVYu1Ij6j/tOLG8+H30SkpjT2HoMyBDm+C+bSlPQBy1mSimpNIRl2WicNDYSwzKnm0j7mS4qT+n0FsHlmg8FXVyCugwrh8zJsga+P/pb0fH1a/d/pEPinun+nU3CmYqyz/I/FLdMtHIPdcNVJ+q+Xwh9emN/7zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFU+2p80; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFU+2p80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726711927; x=1758247927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H5xQAQL0ey+YPXWadgFvY3dZXFvDNm/72iD/vAq/ago=;
  b=EFU+2p80gZRMSuCDNZX5I6t3v1WpdgxNVOBWqR6kmrMVI9pvXdbbXLif
   Yx7Xm8lICyc0lXNGiq4B2OsAGS4Ji1nlUuM8sIpoFFU3nxHbEIzC4u0U8
   xxvVXGay2YVIERoLEFQX+b5bs/oGMkq5o/sCagBtdXnBlCq/auKpRToRh
   k2Z1tr3zwBx82WYFyJn01tnvK7VIqiORjPJ2mUPIHRp2wa5rOMV52U+Ak
   qWe5yRwwreGs91HXShnLqBhQgCuYjdICcn4fGUAEDUW44vwrWSJpyQRed
   LEgMkOIucp2zItc30keHkdtTb0i+YnAw7972g6BWItcFcOJQlSaSZAnj3
   A==;
X-CSE-ConnectionGUID: XNurwWWhR8Gs3ppTZbziDg==
X-CSE-MsgGUID: SD4qkQ46RMGGJmZDFQwxHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36237010"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="36237010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 19:12:06 -0700
X-CSE-ConnectionGUID: myONPzDTQrmXEPTAxy+dZg==
X-CSE-MsgGUID: H6bVfyziQI+juSeFFXQU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="70065264"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2024 19:12:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr6eI-000CoU-1n;
	Thu, 19 Sep 2024 02:12:02 +0000
Date: Thu, 19 Sep 2024 10:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 4/6] percpu-refcount-torture: Extend test with runtime mode
 switches
Message-ID: <202409190905.Cy8vmSdT-lkp@intel.com>
References: <20240916050811.473556-5-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916050811.473556-5-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master dennis-percpu/for-next v6.11 next-20240918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/percpu-refcount-Add-managed-mode-for-RCU-released-objects/20240916-131210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240916050811.473556-5-Neeraj.Upadhyay%40amd.com
patch subject: [RFC 4/6] percpu-refcount-torture: Extend test with runtime mode switches
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240919/202409190905.Cy8vmSdT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190905.Cy8vmSdT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190905.Cy8vmSdT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/percpu-refcount-torture.c: In function 'percpu_ref_test_cleanup':
   lib/percpu-refcount-torture.c:206:17: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     206 |                 kfree(busted_late_release_tasks);
         |                 ^~~~~
   lib/percpu-refcount-torture.c: In function 'percpu_ref_torture_init':
   lib/percpu-refcount-torture.c:273:16: error: implicit declaration of function 'kcalloc' [-Werror=implicit-function-declaration]
     273 |         refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
         |                ^~~~~~~
   lib/percpu-refcount-torture.c:273:14: warning: assignment to 'struct percpu_ref *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     273 |         refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
         |              ^
   lib/percpu-refcount-torture.c:290:27: warning: assignment to 'long int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     290 |         num_per_ref_users = kcalloc(nrefs, sizeof(num_per_ref_users[0]), GFP_KERNEL);
         |                           ^
>> lib/percpu-refcount-torture.c:299:28: warning: assignment to 'struct mutex *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     299 |         ref_switch_mutexes = kcalloc(nrefs, sizeof(ref_switch_mutexes[0]), GFP_KERNEL);
         |                            ^
   lib/percpu-refcount-torture.c:309:24: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     309 |         ref_user_tasks = kcalloc(nusers, sizeof(ref_user_tasks[0]), GFP_KERNEL);
         |                        ^
   lib/percpu-refcount-torture.c:316:21: warning: assignment to 'atomic_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     316 |         ref_running = kcalloc(nrefs, sizeof(ref_running[0]), GFP_KERNEL);
         |                     ^
   lib/percpu-refcount-torture.c:346:44: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     346 |                 busted_early_release_tasks = kcalloc(nrefs,
         |                                            ^
   lib/percpu-refcount-torture.c:363:43: warning: assignment to 'struct task_struct **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     363 |                 busted_late_release_tasks = kcalloc(nrefs, sizeof(busted_late_release_tasks[0]),
         |                                           ^
   cc1: some warnings being treated as errors


vim +299 lib/percpu-refcount-torture.c

   256	
   257	static int __init percpu_ref_torture_init(void)
   258	{
   259		DEFINE_TORTURE_RANDOM(rand);
   260		struct torture_random_state *trsp = &rand;
   261		int flags;
   262		int err;
   263		int ref_idx;
   264		int i;
   265	
   266		if (!torture_init_begin("percpu-refcount", verbose))
   267			return -EBUSY;
   268	
   269		atomic_set(&running, nusers);
   270		/* Order @running with later increment and decrement operations */
   271		smp_mb();
   272	
 > 273		refs = kcalloc(nrefs, sizeof(refs[0]), GFP_KERNEL);
   274		if (!refs) {
   275			TOROUT_ERRSTRING("out of memory");
   276			err = -ENOMEM;
   277			goto init_err;
   278		}
   279		for (i = 0; i < nrefs; i++) {
   280			flags = (torture_random(trsp) & 1) ? PERCPU_REF_INIT_ATOMIC :
   281								PERCPU_REF_REL_MANAGED;
   282			err = percpu_ref_init(&refs[i], percpu_ref_test_release,
   283					      flags, GFP_KERNEL);
   284			if (err)
   285				goto init_err;
   286			if (!(flags & PERCPU_REF_REL_MANAGED))
   287				percpu_ref_switch_to_managed(&refs[i]);
   288		}
   289	
   290		num_per_ref_users = kcalloc(nrefs, sizeof(num_per_ref_users[0]), GFP_KERNEL);
   291		if (!num_per_ref_users) {
   292			TOROUT_ERRSTRING("out of memory");
   293			err = -ENOMEM;
   294			goto init_err;
   295		}
   296		for (i = 0; i < nrefs; i++)
   297			num_per_ref_users[i] = 0;
   298	
 > 299		ref_switch_mutexes = kcalloc(nrefs, sizeof(ref_switch_mutexes[0]), GFP_KERNEL);
   300		if (!ref_switch_mutexes) {
   301			TOROUT_ERRSTRING("out of memory");
   302			err = -ENOMEM;
   303			goto init_err;
   304		}
   305	
   306		for (i = 0; i < nrefs; i++)
   307			mutex_init(&ref_switch_mutexes[i]);
   308	
   309		ref_user_tasks = kcalloc(nusers, sizeof(ref_user_tasks[0]), GFP_KERNEL);
   310		if (!ref_user_tasks) {
   311			TOROUT_ERRSTRING("out of memory");
   312			err = -ENOMEM;
   313			goto init_err;
   314		}
   315	
   316		ref_running = kcalloc(nrefs, sizeof(ref_running[0]), GFP_KERNEL);
   317		if (!ref_running) {
   318			TOROUT_ERRSTRING("out of memory");
   319			err = -ENOMEM;
   320			goto init_err;
   321		}
   322	
   323		for (i = 0; i < nusers; i++) {
   324			ref_idx = torture_random(trsp) % nrefs;
   325			atomic_inc(&ref_running[ref_idx]);
   326			num_per_ref_users[ref_idx]++;
   327			/* Order increments with subquent reads */
   328			smp_mb();
   329			err = torture_create_kthread(percpu_ref_test_thread,
   330						     &refs[ref_idx], ref_user_tasks[i]);
   331			if (torture_init_error(err))
   332				goto init_err;
   333		}
   334	
   335		err = torture_create_kthread(percpu_ref_manager_thread, NULL, ref_manager_task);
   336		if (torture_init_error(err))
   337			goto init_err;
   338	
   339		/* Drop initial reference, after test threads have started running */
   340		udelay(1);
   341		for (i = 0; i < nrefs; i++)
   342			percpu_ref_put(&refs[i]);
   343	
   344	
   345		if (busted_early_ref_release) {
   346			busted_early_release_tasks = kcalloc(nrefs,
   347							     sizeof(busted_early_release_tasks[0]),
   348							     GFP_KERNEL);
   349			if (!busted_early_release_tasks) {
   350				TOROUT_ERRSTRING("out of memory");
   351				err = -ENOMEM;
   352				goto init_err;
   353			}
   354			for (i = 0; i < nrefs; i++) {
   355				err = torture_create_kthread(percpu_ref_busted_early_thread,
   356						     &refs[i], busted_early_release_tasks[i]);
   357				if (torture_init_error(err))
   358					goto init_err;
   359			}
   360		}
   361	
   362		if (busted_late_ref_release) {
   363			busted_late_release_tasks = kcalloc(nrefs, sizeof(busted_late_release_tasks[0]),
   364							    GFP_KERNEL);
   365			if (!busted_late_release_tasks) {
   366				TOROUT_ERRSTRING("out of memory");
   367				err = -ENOMEM;
   368				goto init_err;
   369			}
   370			for (i = 0; i < nrefs; i++) {
   371				err = torture_create_kthread(percpu_ref_busted_late_thread,
   372						     &refs[i], busted_late_release_tasks[i]);
   373				if (torture_init_error(err))
   374					goto init_err;
   375			}
   376		}
   377		if (stutter) {
   378			err = torture_stutter_init(stutter, stutter);
   379			if (torture_init_error(err))
   380				goto init_err;
   381		}
   382	
   383		err = torture_onoff_init(onoff_holdoff * HZ, onoff_interval, NULL);
   384		if (torture_init_error(err))
   385			goto init_err;
   386	
   387		torture_init_end();
   388		return 0;
   389	init_err:
   390		torture_init_end();
   391		percpu_ref_test_cleanup();
   392		return err;
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
