Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65346175D39
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103985; cv=none; b=V8WyT6faa4moQtFx3Xm5LdsBMUVXXXzn1AMGEK56K4dCCyK/DWb+enTaLzbKq4NRsuQLh1EKVQCtoWUP4bJ6nvcdLJVu7slYqAG6HLhojLnQgOrr3K6/CK69O44GXSsFvmA6r7xx7i3CYOwRac5s+M4ppnl7ta2gCpyEtSb42/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103985; c=relaxed/simple;
	bh=fDLJsT54dSxm1y46YGptra1PqCVaar4upTFp1LoErAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3ORll/P+cr7v3AcJDHHmVk5s5w81/eRwtUZPC2Rs237jz4Qwi4vOiQmkeaPs5uho+bC9PRTL4k0wWVPS02EkKokK91cLbS5R7EJERqwaUwgpHFZZ0kUp6MV6OANdaOMZXEc9+u8iYzw/7bStOkzVDDoaSOdQ2DkAOSnVB024po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/MERuIu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/MERuIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725103983; x=1756639983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDLJsT54dSxm1y46YGptra1PqCVaar4upTFp1LoErAg=;
  b=A/MERuIuX1ihuikblTYnb8IVY0MEEJt8yKJuOxhf8uyY3EMjUnwgw9Zy
   9V3CuNdq8dkS1XeOVUtfs2+8mFFcxVq4ExvTOkXdAYd/Pc/q5ilR/hwRk
   YrzQ3e6abKL9iWKfi8xVrVt6eFLZTSKXZhWutTWsswkeL2EPWdEvRxekS
   zRSf3qCMHWaps/voHXG446pQR6rinUTKas9I3hA4KPNb5dT2dBJVWHXH4
   vsG3GXboBvU/cRY22QOsVUbec8OqIZrj9CA/JfBLzgmAzyKmBZfru66bI
   nSuRBkvLT/VJSdzIzpKc5LQ0HbeU68YssKyd44zrA8EnniG5+YTgsyFgh
   A==;
X-CSE-ConnectionGUID: lir2lKjbQDqu5IKQgAdgHA==
X-CSE-MsgGUID: 4S9rDUhlT6mERq9vMWO5Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="13309734"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="13309734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:33:03 -0700
X-CSE-ConnectionGUID: 5LRusX/qQ9i+UzZb5sqkYw==
X-CSE-MsgGUID: oDgdpXazRvyPxw4C7Sev3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64158484"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2024 04:33:02 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skMLj-0002gi-2K;
	Sat, 31 Aug 2024 11:32:59 +0000
Date: Sat, 31 Aug 2024 19:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2024.08.30a 33/33] kernel/rcu/refscale.c:1179
 ref_scale_init() warn: inconsistent indenting
Message-ID: <202408311948.LQzaV2xP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2024.08.30a
head:   05416eb79213ad6a9770faa795059fdd00adb6e0
commit: 05416eb79213ad6a9770faa795059fdd00adb6e0 [33/33] refscale: Add srcu_read_lock_lite() support using "srcu-lite"
config: parisc-randconfig-r071-20240831 (https://download.01.org/0day-ci/archive/20240831/202408311948.LQzaV2xP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311948.LQzaV2xP-lkp@intel.com/

smatch warnings:
kernel/rcu/refscale.c:1179 ref_scale_init() warn: inconsistent indenting

vim +1179 kernel/rcu/refscale.c

  1159	
  1160	static int __init
  1161	ref_scale_init(void)
  1162	{
  1163		long i;
  1164		int firsterr = 0;
  1165		static const struct ref_scale_ops *scale_ops[] = {
  1166			&rcu_ops, &srcu_ops, &srcu_lite_ops, RCU_TRACE_OPS RCU_TASKS_OPS
  1167			&refcnt_ops, &rwlock_ops, &rwsem_ops, &lock_ops, &lock_irq_ops, &acqrel_ops,
  1168			&sched_clock_ops, &clock_ops, &jiffies_ops, &typesafe_ref_ops, &typesafe_lock_ops,
  1169			&typesafe_seqlock_ops,
  1170		};
  1171	
  1172		if (!torture_init_begin(scale_type, verbose))
  1173			return -EBUSY;
  1174	
  1175		for (i = 0; i < ARRAY_SIZE(scale_ops); i++) {
  1176			cur_ops = scale_ops[i]; if (strcmp(scale_type,
  1177			cur_ops->name) == 0)
  1178				break;
> 1179		} if (i == ARRAY_SIZE(scale_ops)) {
  1180			pr_alert("rcu-scale: invalid scale type: \"%s\"\n",
  1181			scale_type); pr_alert("rcu-scale types:"); for (i = 0;
  1182			i < ARRAY_SIZE(scale_ops); i++)
  1183				pr_cont(" %s", scale_ops[i]->name);
  1184			pr_cont("\n"); firsterr = -EINVAL; cur_ops = NULL;
  1185			goto unwind;
  1186		}
  1187		if (cur_ops->init)
  1188			if (!cur_ops->init()) {
  1189				firsterr = -EUCLEAN;
  1190				goto unwind;
  1191			}
  1192	
  1193		ref_scale_print_module_parms(cur_ops, "Start of test");
  1194	
  1195		// Shutdown task
  1196		if (shutdown) {
  1197			init_waitqueue_head(&shutdown_wq);
  1198			firsterr = torture_create_kthread(ref_scale_shutdown, NULL,
  1199							  shutdown_task);
  1200			if (torture_init_error(firsterr))
  1201				goto unwind;
  1202			schedule_timeout_uninterruptible(1);
  1203		}
  1204	
  1205		// Reader tasks (default to ~75% of online CPUs).
  1206		if (nreaders < 0)
  1207			nreaders = (num_online_cpus() >> 1) + (num_online_cpus() >> 2);
  1208		if (WARN_ONCE(loops <= 0, "%s: loops = %ld, adjusted to 1\n", __func__, loops))
  1209			loops = 1;
  1210		if (WARN_ONCE(nreaders <= 0, "%s: nreaders = %d, adjusted to 1\n", __func__, nreaders))
  1211			nreaders = 1;
  1212		if (WARN_ONCE(nruns <= 0, "%s: nruns = %d, adjusted to 1\n", __func__, nruns))
  1213			nruns = 1;
  1214		reader_tasks = kcalloc(nreaders, sizeof(reader_tasks[0]),
  1215				       GFP_KERNEL);
  1216		if (!reader_tasks) {
  1217			SCALEOUT_ERRSTRING("out of memory");
  1218			firsterr = -ENOMEM;
  1219			goto unwind;
  1220		}
  1221	
  1222		VERBOSE_SCALEOUT("Starting %d reader threads", nreaders);
  1223	
  1224		for (i = 0; i < nreaders; i++) {
  1225			init_waitqueue_head(&reader_tasks[i].wq);
  1226			firsterr = torture_create_kthread(ref_scale_reader, (void *)i,
  1227							  reader_tasks[i].task);
  1228			if (torture_init_error(firsterr))
  1229				goto unwind;
  1230		}
  1231	
  1232		// Main Task
  1233		init_waitqueue_head(&main_wq);
  1234		firsterr = torture_create_kthread(main_func, NULL, main_task);
  1235		if (torture_init_error(firsterr))
  1236			goto unwind;
  1237	
  1238		torture_init_end();
  1239		return 0;
  1240	
  1241	unwind:
  1242		torture_init_end();
  1243		ref_scale_cleanup();
  1244		if (shutdown) {
  1245			WARN_ON(!IS_MODULE(CONFIG_RCU_REF_SCALE_TEST));
  1246			kernel_power_off();
  1247		}
  1248		return firsterr;
  1249	}
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
