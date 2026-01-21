Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1983D7D61
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768974039; cv=none; b=nG7R51WP4sLgD5DWJ86MqKoOKk99SaioaigXonFs+St/vMmlBfUHQxSznWS73U/Rh9ssH3rlPn/gIIcXwYCHwjznRoaiqtDY/dEm+9KH6Hiv1FFGBMGmSUv1Ih0mhRjUGkQJ6oZOVGd8qVuXP4ht9GtyuynUDpWqwzf9X2V1T9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768974039; c=relaxed/simple;
	bh=Kvg2q4Yi4vIcci2Y+eq9J5EALHTSz38nuXcXftdAVDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJ63wJmiZe7KOPAlraHPNHI4ZLUlC8zQZr6MgGD9ONJi5FFDR5hXdOSVRSTBEPCVzK+K68AExXHV43qTY7obPYs7GgWZ+4Z6giwdjwz0J6FRZ/C5NcjpbwnHzr3EZc+4/yDXFiOu1sYrG1TKlMe2aKA27tea1lTxbkF2WHEb4eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PoR7jyXh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PoR7jyXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768974036; x=1800510036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kvg2q4Yi4vIcci2Y+eq9J5EALHTSz38nuXcXftdAVDo=;
  b=PoR7jyXhlSyRx1hhDpPTBdh5tDys9ifYvyIc0WnWKtEe+wonJecREIrb
   DJOA3H7QplN23vfdjj7ib/UXQwvnMGCSnnxUw8AKKlo/A5a06JIPt1M7l
   ePHNCBdwvIW4NCUWUXKTH2W9NFanqN8Eb/PsEMpxS+bXFoqC+5/lJ3whU
   KSe6UYYr4cjOVkyRbPuuwQ/G+bty357h1chcyetLWlOJrl5pceokmw+ys
   GisskECKSDTMqOL/+4uRkZAhptQoI3Ah7jVlNpmG2EjeJFjDcyZzvOxMS
   C6bUdnHGPLDUccEBSVOggE5al1SKZeKqw062FkZPfP34+5lBjv69t+zte
   A==;
X-CSE-ConnectionGUID: 6uRXuh2mRp+kjRxNdyHwQw==
X-CSE-MsgGUID: 9wEtRs2qQuu4SVVQ3z8lRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70105938"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70105938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 21:40:35 -0800
X-CSE-ConnectionGUID: 00nS/6gyR5q28y06K8ubyg==
X-CSE-MsgGUID: 5mlNIvMwQGKYn+8fdVXbBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205974576"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 21:40:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viQxD-00000000Q25-2RVK;
	Wed, 21 Jan 2026 05:40:31 +0000
Date: Wed, 21 Jan 2026 13:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v6 03/10] bpf: Introduce lock-free
 bpf_async_update_prog_callback()
Message-ID: <202601211303.AWUABPWt-lkp@intel.com>
References: <20260120-timer_nolock-v6-3-670ffdd787b4@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-timer_nolock-v6-3-670ffdd787b4@meta.com>

Hi Mykyta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on efad162f5a840ae178e7761c176c49f433c7bb68]

url:    https://github.com/intel-lab-lkp/linux/commits/Mykyta-Yatsenko/bpf-Factor-out-timer-deletion-helper/20260121-031948
base:   efad162f5a840ae178e7761c176c49f433c7bb68
patch link:    https://lore.kernel.org/r/20260120-timer_nolock-v6-3-670ffdd787b4%40meta.com
patch subject: [PATCH bpf-next v6 03/10] bpf: Introduce lock-free bpf_async_update_prog_callback()
config: arc-randconfig-r112-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211303.AWUABPWt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211303.AWUABPWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211303.AWUABPWt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1203:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1203:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1203:21: sparse:     got void [noderef] __rcu *
>> kernel/bpf/helpers.c:1383:76: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/helpers.c:1383:76: sparse:    void [noderef] __rcu *
   kernel/bpf/helpers.c:1383:76: sparse:    void *
   kernel/bpf/helpers.c:2546:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2576:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:3045:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:3050:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +1383 kernel/bpf/helpers.c

  1190	
  1191	static void bpf_wq_work(struct work_struct *work)
  1192	{
  1193		struct bpf_work *w = container_of(work, struct bpf_work, work);
  1194		struct bpf_async_cb *cb = &w->cb;
  1195		struct bpf_map *map = cb->map;
  1196		bpf_callback_t callback_fn;
  1197		void *value = cb->value;
  1198		void *key;
  1199		u32 idx;
  1200	
  1201		BTF_TYPE_EMIT(struct bpf_wq);
  1202	
> 1203		callback_fn = READ_ONCE(cb->callback_fn);
  1204		if (!callback_fn)
  1205			return;
  1206	
  1207		key = map_key_from_value(map, value, &idx);
  1208	
  1209	        rcu_read_lock_trace();
  1210	        migrate_disable();
  1211	
  1212		callback_fn((u64)(long)map, (u64)(long)key, (u64)(long)value, 0, 0);
  1213	
  1214		migrate_enable();
  1215		rcu_read_unlock_trace();
  1216	}
  1217	
  1218	static void bpf_async_cb_rcu_free(struct rcu_head *rcu)
  1219	{
  1220		struct bpf_async_cb *cb = container_of(rcu, struct bpf_async_cb, rcu);
  1221	
  1222		kfree_nolock(cb);
  1223	}
  1224	
  1225	static void bpf_wq_delete_work(struct work_struct *work)
  1226	{
  1227		struct bpf_work *w = container_of(work, struct bpf_work, delete_work);
  1228	
  1229		cancel_work_sync(&w->work);
  1230	
  1231		call_rcu(&w->cb.rcu, bpf_async_cb_rcu_free);
  1232	}
  1233	
  1234	static void bpf_timer_delete_work(struct work_struct *work)
  1235	{
  1236		struct bpf_hrtimer *t = container_of(work, struct bpf_hrtimer, cb.delete_work);
  1237	
  1238		/* Cancel the timer and wait for callback to complete if it was running.
  1239		 * If hrtimer_cancel() can be safely called it's safe to call
  1240		 * call_rcu() right after for both preallocated and non-preallocated
  1241		 * maps.  The async->cb = NULL was already done and no code path can see
  1242		 * address 't' anymore. Timer if armed for existing bpf_hrtimer before
  1243		 * bpf_timer_cancel_and_free will have been cancelled.
  1244		 */
  1245		hrtimer_cancel(&t->timer);
  1246		call_rcu(&t->cb.rcu, bpf_async_cb_rcu_free);
  1247	}
  1248	
  1249	static int __bpf_async_init(struct bpf_async_kern *async, struct bpf_map *map, u64 flags,
  1250				    enum bpf_async_type type)
  1251	{
  1252		struct bpf_async_cb *cb;
  1253		struct bpf_hrtimer *t;
  1254		struct bpf_work *w;
  1255		clockid_t clockid;
  1256		size_t size;
  1257		int ret = 0;
  1258	
  1259		if (in_nmi())
  1260			return -EOPNOTSUPP;
  1261	
  1262		switch (type) {
  1263		case BPF_ASYNC_TYPE_TIMER:
  1264			size = sizeof(struct bpf_hrtimer);
  1265			break;
  1266		case BPF_ASYNC_TYPE_WQ:
  1267			size = sizeof(struct bpf_work);
  1268			break;
  1269		default:
  1270			return -EINVAL;
  1271		}
  1272	
  1273		__bpf_spin_lock_irqsave(&async->lock);
  1274		t = async->timer;
  1275		if (t) {
  1276			ret = -EBUSY;
  1277			goto out;
  1278		}
  1279	
  1280		cb = bpf_map_kmalloc_nolock(map, size, 0, map->numa_node);
  1281		if (!cb) {
  1282			ret = -ENOMEM;
  1283			goto out;
  1284		}
  1285	
  1286		switch (type) {
  1287		case BPF_ASYNC_TYPE_TIMER:
  1288			clockid = flags & (MAX_CLOCKS - 1);
  1289			t = (struct bpf_hrtimer *)cb;
  1290	
  1291			atomic_set(&t->cancelling, 0);
  1292			INIT_WORK(&t->cb.delete_work, bpf_timer_delete_work);
  1293			hrtimer_setup(&t->timer, bpf_timer_cb, clockid, HRTIMER_MODE_REL_SOFT);
  1294			cb->value = (void *)async - map->record->timer_off;
  1295			break;
  1296		case BPF_ASYNC_TYPE_WQ:
  1297			w = (struct bpf_work *)cb;
  1298	
  1299			INIT_WORK(&w->work, bpf_wq_work);
  1300			INIT_WORK(&w->delete_work, bpf_wq_delete_work);
  1301			cb->value = (void *)async - map->record->wq_off;
  1302			break;
  1303		}
  1304		cb->map = map;
  1305		cb->prog = NULL;
  1306		cb->flags = flags;
  1307		rcu_assign_pointer(cb->callback_fn, NULL);
  1308	
  1309		WRITE_ONCE(async->cb, cb);
  1310		/* Guarantee the order between async->cb and map->usercnt. So
  1311		 * when there are concurrent uref release and bpf timer init, either
  1312		 * bpf_timer_cancel_and_free() called by uref release reads a no-NULL
  1313		 * timer or atomic64_read() below returns a zero usercnt.
  1314		 */
  1315		smp_mb();
  1316		if (!atomic64_read(&map->usercnt)) {
  1317			/* maps with timers must be either held by user space
  1318			 * or pinned in bpffs.
  1319			 */
  1320			WRITE_ONCE(async->cb, NULL);
  1321			kfree_nolock(cb);
  1322			ret = -EPERM;
  1323		}
  1324	out:
  1325		__bpf_spin_unlock_irqrestore(&async->lock);
  1326		return ret;
  1327	}
  1328	
  1329	BPF_CALL_3(bpf_timer_init, struct bpf_async_kern *, timer, struct bpf_map *, map,
  1330		   u64, flags)
  1331	{
  1332		clock_t clockid = flags & (MAX_CLOCKS - 1);
  1333	
  1334		BUILD_BUG_ON(MAX_CLOCKS != 16);
  1335		BUILD_BUG_ON(sizeof(struct bpf_async_kern) > sizeof(struct bpf_timer));
  1336		BUILD_BUG_ON(__alignof__(struct bpf_async_kern) != __alignof__(struct bpf_timer));
  1337	
  1338		if (flags >= MAX_CLOCKS ||
  1339		    /* similar to timerfd except _ALARM variants are not supported */
  1340		    (clockid != CLOCK_MONOTONIC &&
  1341		     clockid != CLOCK_REALTIME &&
  1342		     clockid != CLOCK_BOOTTIME))
  1343			return -EINVAL;
  1344	
  1345		return __bpf_async_init(timer, map, flags, BPF_ASYNC_TYPE_TIMER);
  1346	}
  1347	
  1348	static const struct bpf_func_proto bpf_timer_init_proto = {
  1349		.func		= bpf_timer_init,
  1350		.gpl_only	= true,
  1351		.ret_type	= RET_INTEGER,
  1352		.arg1_type	= ARG_PTR_TO_TIMER,
  1353		.arg2_type	= ARG_CONST_MAP_PTR,
  1354		.arg3_type	= ARG_ANYTHING,
  1355	};
  1356	
  1357	static int bpf_async_update_prog_callback(struct bpf_async_cb *cb, void *callback_fn,
  1358						  struct bpf_prog *prog)
  1359	{
  1360		struct bpf_prog *prev;
  1361	
  1362		/* Acquire a guard reference on prog to prevent it from being freed during the loop */
  1363		if (prog) {
  1364			prog = bpf_prog_inc_not_zero(prog);
  1365			if (IS_ERR(prog))
  1366				return PTR_ERR(prog);
  1367		}
  1368	
  1369		do {
  1370			if (prog)
  1371				prog = bpf_prog_inc_not_zero(prog);
  1372			prev = xchg(&cb->prog, prog);
  1373			rcu_assign_pointer(cb->callback_fn, callback_fn);
  1374	
  1375			/*
  1376			 * Release previous prog, make sure that if other CPU is contending,
  1377			 * to set bpf_prog, references are not leaked as each iteration acquires and
  1378			 * releases one reference.
  1379			 */
  1380			if (prev)
  1381				bpf_prog_put(prev);
  1382	
> 1383		} while (READ_ONCE(cb->prog) != prog || READ_ONCE(cb->callback_fn) != callback_fn);
  1384	
  1385		if (prog)
  1386			bpf_prog_put(prog);
  1387	
  1388		return 0;
  1389	}
  1390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
