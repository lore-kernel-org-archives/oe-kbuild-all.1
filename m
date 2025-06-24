Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2A23BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 02:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731555; cv=none; b=QvuQNisUEJnHhlY24B9YnVC5GoHUjVPLiaFPKw8RwflCBBKPa/PYVh4v7yaR8raVWxtS7z1OOi+Uu/Zv7zuKinKS9RvnCzBOoFUx6CYbN9G7Zz7rQukrFmcreZ7inbkWMK0svpgfrIfXBy2o+jgBqXttQ9DvWbVCMPZ7sB5lVFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731555; c=relaxed/simple;
	bh=7iB/6/1rxGqEwpKEwIv4a53lRSB5RM4AJEdiWA1iU4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VnZjYyjoOE7XsA5vPLTxUMZWejScJg2NCmz752C/yWhbfbSoGevobQX/9O3kII8HBADHY471IiHfneP4jXQTvk21qA7gPvXr9EG3OI2ESwD5lOQFiykXdeppfW4JrnV8gmXsLddndxsuzWaauD0qk/MR5NCQSwkIBEa2QTQoSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0RPlvLO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0RPlvLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750731554; x=1782267554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iB/6/1rxGqEwpKEwIv4a53lRSB5RM4AJEdiWA1iU4g=;
  b=L0RPlvLOcmPahyqXCc0lfssK9hiAnjJjEBXxMI0F4XmQS7pu4bgX9qIU
   f8J9T8nn0m3l22D4rAxST01lsYNi+pje9/C7ozcnn1a6rMv4/TN0UA5UA
   yO45njTu0flJWw98W/DDjaG77kgU9bOVIr5bhs/w4bQ3hY+ivRF7SSDuH
   ReMHaKh72zSaJH6xvge8TBykO9TPgshsSw0KGfWRjuivc+cn3PctyrjFQ
   Mz/heg8qBvfQZeOMA19eLcNDwmjHWUphgpI0NMapfk/OZfwtBN3Mev1n1
   P3XyRVI5tu9TmzUpsJGWLIB7CRVVWa4LptvMiZYoegmLwI8pEZJ03x02V
   Q==;
X-CSE-ConnectionGUID: uJet4o/xQzqUFoLJtL4M5w==
X-CSE-MsgGUID: QNDqTfVeRbKOaFgGx51u5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52829336"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52829336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 19:19:13 -0700
X-CSE-ConnectionGUID: P/LAX8V5QTyESdHOWjLWQg==
X-CSE-MsgGUID: 04XmmulwRJSjkh3V1WFSWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="151360170"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Jun 2025 19:19:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTtFd-000Rd6-2G;
	Tue, 24 Jun 2025 02:19:09 +0000
Date: Tue, 24 Jun 2025 10:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 13/22]
 kernel/bpf/trampoline.c:1206:9: error: implicit declaration of function
 'free_ftrace_hash'
Message-ID: <202506241031.HO3JVM22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   28441de17b08aa419e3a354e2940268a9078d418
commit: d17f5a03a1bba684c70591ef012dbf178896f3cd [13/22] bpf: Add bpf_trampoline_multi_attach/detach functions
config: arm-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250624/202506241031.HO3JVM22-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241031.HO3JVM22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241031.HO3JVM22-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/trampoline.c:6:
   include/linux/ftrace.h:575:5: warning: no previous prototype for 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     575 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:580:5: warning: no previous prototype for 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     580 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:585:5: warning: no previous prototype for 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     585 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:279:15: error: variable 'trampoline_ops' has initializer but incomplete type
     279 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:280:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
     280 |         .register_fentry   = register_fentry,
         |          ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:280:30: warning: excess elements in struct initializer
     280 |         .register_fentry   = register_fentry,
         |                              ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:280:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:281:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
     281 |         .unregister_fentry = unregister_fentry,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:281:30: warning: excess elements in struct initializer
     281 |         .unregister_fentry = unregister_fentry,
         |                              ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:281:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:282:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
     282 |         .modify_fentry     = modify_fentry,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:282:30: warning: excess elements in struct initializer
     282 |         .modify_fentry     = modify_fentry,
         |                              ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:282:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update_ops':
   kernel/bpf/trampoline.c:465:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     465 |                 err = ops->unregister_fentry(tr, tr->cur_image->image, data);
         |                          ^~
   kernel/bpf/trampoline.c:525:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     525 |                 err = ops->modify_fentry(tr, tr->cur_image->image, im->image, lock_direct_mutex, data);
         |                          ^~
   kernel/bpf/trampoline.c:528:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     528 |                 err = ops->register_fentry(tr, im->image, data);
         |                          ^~
   kernel/bpf/trampoline.c: In function 'free_fentry_multi_data':
>> kernel/bpf/trampoline.c:1206:9: error: implicit declaration of function 'free_ftrace_hash' [-Wimplicit-function-declaration]
    1206 |         free_ftrace_hash(data->reg);
         |         ^~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c: In function 'register_fentry_multi':
>> kernel/bpf/trampoline.c:1215:16: error: implicit declaration of function 'add_hash_entry_direct' [-Wimplicit-function-declaration]
    1215 |         return add_hash_entry_direct(data->reg, tr->ptr->ip,
         |                ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c: At top level:
>> kernel/bpf/trampoline.c:1236:15: error: variable 'trampoline_multi_ops' has initializer but incomplete type
    1236 | static struct bpf_trampoline_ops trampoline_multi_ops = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1237:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
    1237 |         .register_fentry   = register_fentry_multi,
         |          ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1237:30: warning: excess elements in struct initializer
    1237 |         .register_fentry   = register_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1237:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c:1238:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
    1238 |         .unregister_fentry = unregister_fentry_multi,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1238:30: warning: excess elements in struct initializer
    1238 |         .unregister_fentry = unregister_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1238:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c:1239:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
    1239 |         .modify_fentry     = modify_fentry_multi,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1239:30: warning: excess elements in struct initializer
    1239 |         .modify_fentry     = modify_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1239:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c:1242:8: error: variable 'direct_ops' has initializer but incomplete type
    1242 | struct ftrace_ops direct_ops = {
         |        ^~~~~~~~~~
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_multi_attach':
>> kernel/bpf/trampoline.c:1258:20: error: implicit declaration of function 'alloc_ftrace_hash' [-Wimplicit-function-declaration]
    1258 |         data.reg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
         |                    ^~~~~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:1258:38: error: 'FTRACE_HASH_DEFAULT_BITS' undeclared (first use in this function)
    1258 |         data.reg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1258:38: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_multi_detach':
   kernel/bpf/trampoline.c:1341:40: error: 'FTRACE_HASH_DEFAULT_BITS' undeclared (first use in this function)
    1341 |         data.unreg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c: At top level:
   kernel/bpf/trampoline.c:279:34: error: storage size of 'trampoline_ops' isn't known
     279 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:1236:34: error: storage size of 'trampoline_multi_ops' isn't known
    1236 | static struct bpf_trampoline_ops trampoline_multi_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1242:19: error: storage size of 'direct_ops' isn't known
    1242 | struct ftrace_ops direct_ops = {
         |                   ^~~~~~~~~~
   kernel/bpf/trampoline.c:563:12: warning: 'bpf_trampoline_update' defined but not used [-Wunused-function]
     563 | static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/free_ftrace_hash +1206 kernel/bpf/trampoline.c

  1203	
  1204	static void free_fentry_multi_data(struct fentry_multi_data *data)
  1205	{
> 1206		free_ftrace_hash(data->reg);
  1207		free_ftrace_hash(data->unreg);
  1208		free_ftrace_hash(data->modify);
  1209	}
  1210	
  1211	static int register_fentry_multi(struct bpf_trampoline *tr, void *new_addr, void *ptr)
  1212	{
  1213		struct fentry_multi_data *data = ptr;
  1214	
> 1215		return add_hash_entry_direct(data->reg, tr->ptr->ip,
  1216					     (unsigned long) new_addr) ? 0 : -ENOMEM;
  1217	}
  1218	
  1219	static int unregister_fentry_multi(struct bpf_trampoline *tr, void *old_addr, void *ptr)
  1220	{
  1221		struct fentry_multi_data *data = ptr;
  1222	
  1223		return add_hash_entry_direct(data->unreg, tr->ptr->ip,
  1224					     (unsigned long) old_addr) ? 0 : -ENOMEM;
  1225	}
  1226	
  1227	static int modify_fentry_multi(struct bpf_trampoline *tr, void *old_addr, void *new_addr,
  1228				       bool lock_direct_mutex, void *ptr)
  1229	{
  1230		struct fentry_multi_data *data = ptr;
  1231	
  1232		return add_hash_entry_direct(data->modify, tr->ptr->ip,
  1233					     (unsigned long) new_addr) ? 0 : -ENOMEM;
  1234	}
  1235	
> 1236	static struct bpf_trampoline_ops trampoline_multi_ops = {
  1237		.register_fentry   = register_fentry_multi,
  1238		.unregister_fentry = unregister_fentry_multi,
  1239		.modify_fentry     = modify_fentry_multi,
  1240	};
  1241	
  1242	struct ftrace_ops direct_ops = {
  1243	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  1244	       .ops_func = bpf_tramp_ftrace_ops_func,
  1245	#endif
  1246	};
  1247	
  1248	int bpf_trampoline_multi_attach(struct bpf_prog *prog, u32 *ids,
  1249					struct bpf_tracing_multi_link *link)
  1250	{
  1251		struct bpf_attach_target_info tgt_info = {};
  1252		struct bpf_tracing_multi_node *mnode;
  1253		int j, i, err, cnt = link->nodes_cnt;
  1254		struct fentry_multi_data data = {};
  1255		struct bpf_trampoline *tr;
  1256		u64 key;
  1257	
> 1258		data.reg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1259		if (!data.reg)
  1260			return -ENOMEM;
  1261	
  1262		data.modify = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1263		if (!data.modify) {
  1264			free_ftrace_hash(data.reg);
  1265			return -ENOMEM;
  1266		}
  1267	
  1268		for (i = 0; i < cnt; i++) {
  1269			mnode = &link->nodes[i];
  1270			err = bpf_check_attach_target(NULL, prog, NULL, ids[i], &tgt_info);
  1271			if (err)
  1272				goto rollback_put;
  1273	
  1274			key = bpf_trampoline_compute_key(NULL, prog->aux->attach_btf, ids[i]);
  1275	
  1276			tr = bpf_trampoline_get(key, &tgt_info);
  1277			if (!tr)
  1278				goto rollback_put;
  1279	
  1280			mnode->trampoline = tr;
  1281			mnode->node.prog = prog;
  1282		}
  1283	
  1284		for (i = 0; i < cnt; i++) {
  1285			mnode = &link->nodes[i];
  1286			tr = mnode->trampoline;
  1287	
  1288			mutex_lock(&tr->mutex);
  1289	
  1290			err = __bpf_trampoline_link_prog(&mnode->node, tr, NULL, &trampoline_multi_ops, &data);
  1291			if (err) {
  1292				mutex_unlock(&tr->mutex);
  1293				goto rollback_unlink;
  1294			}
  1295		}
  1296	
  1297		err = register_ftrace_direct_hash(&direct_ops, data.reg);
  1298		if (err)
  1299			goto rollback_unlink;
  1300	
  1301		err = modify_ftrace_direct_hash(&direct_ops, data.modify);
  1302		if (err) {
  1303			WARN_ON_ONCE(unregister_ftrace_direct_hash(&direct_ops, data.reg));
  1304			goto rollback_unlink;
  1305		}
  1306	
  1307		for (i = 0; i < cnt; i++) {
  1308			tr = link->nodes[i].trampoline;
  1309			mutex_unlock(&tr->mutex);
  1310		}
  1311	
  1312		free_fentry_multi_data(&data);
  1313		return 0;
  1314	
  1315	rollback_unlink:
  1316		for (j = 0; j < i; j++) {
  1317			mnode = &link->nodes[j];
  1318			tr = mnode->trampoline;
  1319			WARN_ON_ONCE(__bpf_trampoline_unlink_prog(&mnode->node, tr, NULL,
  1320				     &trampoline_multi_ops, &data));
  1321			mutex_unlock(&tr->mutex);
  1322		}
  1323	
  1324	rollback_put:
  1325		for (j = 0; j < i; j++) {
  1326			mnode = &link->nodes[j];
  1327			bpf_trampoline_put(mnode->trampoline);
  1328		}
  1329	
  1330		free_fentry_multi_data(&data);
  1331		return err;
  1332	}
  1333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
