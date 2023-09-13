Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975C1DA42
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694636891; x=1726172891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yppS0u/uE1OIbUQHB8OHrywrXFEsfaNUI24KVDD/7n4=;
  b=ezVjDt5H/3uP2tYIBUnYwRSVokg3k7mH/UQd/vICwYovu2dL0xAqQv+E
   ZujJ9JIjrHpJRyt5O1A51s9lJU86MgKUHp4BFOGDgy5sFNV6c+Xxt/xbd
   hQE/1JXltOtEdssfiI+OCIAeu/P+pjFqWDgloreog+jDC/XNcXgZbiw7I
   S6ebM02tMQsj3ZeXDn32U9EsvRXonFy5PcthfgygMDdKbvetYWMfg9TuV
   gG8DCvtkIu/P1zr1MwO1lrrEDBXX+hI4p9N48ymC5yDwDWUe+k5C3/ACA
   3XlGVmxW2YYaEbqsDlf4+6lp66zRkqWC45k1JDM8VKzWuZhq/XzENIVL8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465149009"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="465149009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 13:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773612753"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="773612753"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Sep 2023 13:28:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgWT1-0000aZ-08;
	Wed, 13 Sep 2023 20:28:07 +0000
Date: Thu, 14 Sep 2023 04:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:rcu/torture 1/8]
 kernel/locking/locktorture.c:1310:undefined reference to
 `torture_sched_setaffinity'
Message-ID: <202309140452.b519gqGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/torture
head:   8d86d4452a4cf36af59b79c3f646f5b7ebb823b1
commit: d559059c7e9a825bc42f97f9b89dbfc02c9214f9 [1/8] locktorture: Add readers_bind and writers_bind module parameters
config: nios2-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309140452.b519gqGU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140452.b519gqGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140452.b519gqGU-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/locking/locktorture.o: in function `lock_torture_init':
>> kernel/locking/locktorture.c:1310:(.init.text+0x528): undefined reference to `torture_sched_setaffinity'
   kernel/locking/locktorture.c:1310:(.init.text+0x528): relocation truncated to fit: R_NIOS2_CALL26 against `torture_sched_setaffinity'
>> nios2-linux-ld: kernel/locking/locktorture.c:1321:(.init.text+0x5e0): undefined reference to `torture_sched_setaffinity'
   kernel/locking/locktorture.c:1321:(.init.text+0x5e0): relocation truncated to fit: R_NIOS2_CALL26 against `torture_sched_setaffinity'


vim +1310 kernel/locking/locktorture.c

  1184	
  1185		/* Initialize the statistics so that each run gets its own numbers. */
  1186		if (nwriters_stress) {
  1187			lock_is_write_held = false;
  1188			cxt.lwsa = kmalloc_array(cxt.nrealwriters_stress,
  1189						 sizeof(*cxt.lwsa),
  1190						 GFP_KERNEL);
  1191			if (cxt.lwsa == NULL) {
  1192				VERBOSE_TOROUT_STRING("cxt.lwsa: Out of memory");
  1193				firsterr = -ENOMEM;
  1194				goto unwind;
  1195			}
  1196	
  1197			for (i = 0; i < cxt.nrealwriters_stress; i++) {
  1198				cxt.lwsa[i].n_lock_fail = 0;
  1199				cxt.lwsa[i].n_lock_acquired = 0;
  1200			}
  1201		}
  1202	
  1203		if (cxt.cur_ops->readlock) {
  1204			if (nreaders_stress >= 0)
  1205				cxt.nrealreaders_stress = nreaders_stress;
  1206			else {
  1207				/*
  1208				 * By default distribute evenly the number of
  1209				 * readers and writers. We still run the same number
  1210				 * of threads as the writer-only locks default.
  1211				 */
  1212				if (nwriters_stress < 0) /* user doesn't care */
  1213					cxt.nrealwriters_stress = num_online_cpus();
  1214				cxt.nrealreaders_stress = cxt.nrealwriters_stress;
  1215			}
  1216	
  1217			if (nreaders_stress) {
  1218				cxt.lrsa = kmalloc_array(cxt.nrealreaders_stress,
  1219							 sizeof(*cxt.lrsa),
  1220							 GFP_KERNEL);
  1221				if (cxt.lrsa == NULL) {
  1222					VERBOSE_TOROUT_STRING("cxt.lrsa: Out of memory");
  1223					firsterr = -ENOMEM;
  1224					kfree(cxt.lwsa);
  1225					cxt.lwsa = NULL;
  1226					goto unwind;
  1227				}
  1228	
  1229				for (i = 0; i < cxt.nrealreaders_stress; i++) {
  1230					cxt.lrsa[i].n_lock_fail = 0;
  1231					cxt.lrsa[i].n_lock_acquired = 0;
  1232				}
  1233			}
  1234		}
  1235	
  1236		lock_torture_print_module_parms(cxt.cur_ops, "Start of test");
  1237	
  1238		/* Prepare torture context. */
  1239		if (onoff_interval > 0) {
  1240			firsterr = torture_onoff_init(onoff_holdoff * HZ,
  1241						      onoff_interval * HZ, NULL);
  1242			if (torture_init_error(firsterr))
  1243				goto unwind;
  1244		}
  1245		if (shuffle_interval > 0) {
  1246			firsterr = torture_shuffle_init(shuffle_interval);
  1247			if (torture_init_error(firsterr))
  1248				goto unwind;
  1249		}
  1250		if (shutdown_secs > 0) {
  1251			firsterr = torture_shutdown_init(shutdown_secs,
  1252							 lock_torture_cleanup);
  1253			if (torture_init_error(firsterr))
  1254				goto unwind;
  1255		}
  1256		if (stutter > 0) {
  1257			firsterr = torture_stutter_init(stutter, stutter);
  1258			if (torture_init_error(firsterr))
  1259				goto unwind;
  1260		}
  1261	
  1262		if (nwriters_stress) {
  1263			writer_tasks = kcalloc(cxt.nrealwriters_stress,
  1264					       sizeof(writer_tasks[0]),
  1265					       GFP_KERNEL);
  1266			if (writer_tasks == NULL) {
  1267				TOROUT_ERRSTRING("writer_tasks: Out of memory");
  1268				firsterr = -ENOMEM;
  1269				goto unwind;
  1270			}
  1271		}
  1272	
  1273		/* cap nested_locks to MAX_NESTED_LOCKS */
  1274		if (nested_locks > MAX_NESTED_LOCKS)
  1275			nested_locks = MAX_NESTED_LOCKS;
  1276	
  1277		if (cxt.cur_ops->readlock) {
  1278			reader_tasks = kcalloc(cxt.nrealreaders_stress,
  1279					       sizeof(reader_tasks[0]),
  1280					       GFP_KERNEL);
  1281			if (reader_tasks == NULL) {
  1282				TOROUT_ERRSTRING("reader_tasks: Out of memory");
  1283				kfree(writer_tasks);
  1284				writer_tasks = NULL;
  1285				firsterr = -ENOMEM;
  1286				goto unwind;
  1287			}
  1288		}
  1289	
  1290		/*
  1291		 * Create the kthreads and start torturing (oh, those poor little locks).
  1292		 *
  1293		 * TODO: Note that we interleave writers with readers, giving writers a
  1294		 * slight advantage, by creating its kthread first. This can be modified
  1295		 * for very specific needs, or even let the user choose the policy, if
  1296		 * ever wanted.
  1297		 */
  1298		for (i = 0, j = 0; i < cxt.nrealwriters_stress ||
  1299			    j < cxt.nrealreaders_stress; i++, j++) {
  1300			if (i >= cxt.nrealwriters_stress)
  1301				goto create_reader;
  1302	
  1303			/* Create writer. */
  1304			firsterr = torture_create_kthread_cb(lock_torture_writer, &cxt.lwsa[i],
  1305							     writer_tasks[i],
  1306							     writer_fifo ? sched_set_fifo : NULL);
  1307			if (torture_init_error(firsterr))
  1308				goto unwind;
  1309			if (cpumask_nonempty(writers_bind))
> 1310				torture_sched_setaffinity(writer_tasks[i]->pid, writers_bind);
  1311	
  1312		create_reader:
  1313			if (cxt.cur_ops->readlock == NULL || (j >= cxt.nrealreaders_stress))
  1314				continue;
  1315			/* Create reader. */
  1316			firsterr = torture_create_kthread(lock_torture_reader, &cxt.lrsa[j],
  1317							  reader_tasks[j]);
  1318			if (torture_init_error(firsterr))
  1319				goto unwind;
  1320			if (cpumask_nonempty(readers_bind))
> 1321				torture_sched_setaffinity(reader_tasks[j]->pid, readers_bind);
  1322		}
  1323		if (stat_interval > 0) {
  1324			firsterr = torture_create_kthread(lock_torture_stats, NULL,
  1325							  stats_task);
  1326			if (torture_init_error(firsterr))
  1327				goto unwind;
  1328		}
  1329		torture_init_end();
  1330		return 0;
  1331	
  1332	unwind:
  1333		torture_init_end();
  1334		lock_torture_cleanup();
  1335		if (shutdown_secs) {
  1336			WARN_ON(!IS_MODULE(CONFIG_LOCK_TORTURE_TEST));
  1337			kernel_power_off();
  1338		}
  1339		return firsterr;
  1340	}
  1341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
