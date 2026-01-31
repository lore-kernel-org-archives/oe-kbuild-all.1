Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615FD27E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769841536; cv=none; b=PLL3R/Iebum6qHrWbdmKsuYS/iUQBG88iBUmFalKaumXi50MOjQExEsxcn7oNojiVXmGn6OECP9ENeyQIm9FZMyzCU56zcAczchZhbfBrlfPrz0wbD+d5+ry3bngusas1tHLvud63Y0zGNc/5a0Mh68hbIzEXL9WaQasEHB8fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769841536; c=relaxed/simple;
	bh=Y1pDevHbRyNDWwybgf1KonEYq832VhhTioFda9QT8h0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KHxcJhhi3gFKbeBlqee/utrU/LTsZ6pLuQkxGiAkttoV7gE3abQCH9yY9QO/UM2qsCIiO77n3Se0Mij7Ncdgr1ypsFtqDPa2sfvQXVOdEslfaVYLuIArqlugM42FeFRiRqAPEqQeXuxE0wAolDMXtZ09ckkUWWzTFZD5RAR4IKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hf1+DJUN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hf1+DJUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769841531; x=1801377531;
  h=date:from:to:cc:subject:message-id;
  bh=Y1pDevHbRyNDWwybgf1KonEYq832VhhTioFda9QT8h0=;
  b=hf1+DJUNfU+qWyESbeDL7u06f2dJW/PD8pnQQLA6lVqbg1pcRWj9fS72
   pkACOmDBaD1cGGAq1RRdR1GE04CRL7kYmASAYq00Giz6LFxBFneVEhV7z
   Z9zcLt2IAuyKqf8uxRMnN2SHeuxPbRp+CQU+JHcZPMYV+u1GSKcXyA7hW
   WBbqK8P1mrFAJKZ7hCJYL3LdaHnz6g/GpcH/qbYQtFMyZXrKPrrguGYWf
   o/Vtf+o38Mo+cmH4dYtZ86rxv3BfNfduCIsVNfx+ZnVXmJgJslsGoud5P
   Z+l7gXAyeuv6s0hu9B2ewvf3IsKfO3aFXply1fb9V5z7mTrlS8vx6Q9S7
   Q==;
X-CSE-ConnectionGUID: A16YUe7JRqKuWBpRbbyeYw==
X-CSE-MsgGUID: E6Igj0qbS6y56JrfC9O63w==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88660407"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88660407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:38:50 -0800
X-CSE-ConnectionGUID: vWooFOtnRhmXzEZ1ZTdpQg==
X-CSE-MsgGUID: +doy5ZWGTMWFNifW5opj/Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 22:38:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm4d4-00000000dj6-3kwD;
	Sat, 31 Jan 2026 06:38:46 +0000
Date: Sat, 31 Jan 2026 14:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 5/12]
 kernel/bpf/trampoline.c:1449:15: error: variable 'trampoline_multi_ops' has
 initializer but incomplete type
Message-ID: <202601311418.jZHFAEOY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 1e90d2b0500ea06da8dcae5b9fdd52ecce958b20 [5/12] bpf: Add bpf_trampoline_multi_attach/detach functions
config: i386-buildonly-randconfig-004-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311418.jZHFAEOY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311418.jZHFAEOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311418.jZHFAEOY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c:453:15: error: variable 'trampoline_ops' has initializer but incomplete type
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:454:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
     454 |         .register_fentry   = register_fentry,
         |          ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:454:30: warning: excess elements in struct initializer
     454 |         .register_fentry   = register_fentry,
         |                              ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:454:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:455:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
     455 |         .unregister_fentry = unregister_fentry,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:455:30: warning: excess elements in struct initializer
     455 |         .unregister_fentry = unregister_fentry,
         |                              ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:455:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c:456:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
     456 |         .modify_fentry     = modify_fentry,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:456:30: warning: excess elements in struct initializer
     456 |         .modify_fentry     = modify_fentry,
         |                              ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:456:30: note: (near initialization for 'trampoline_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_update_ops':
   kernel/bpf/trampoline.c:714:26: error: invalid use of undefined type 'struct bpf_trampoline_ops'
     714 |                 err = ops->register_fentry(tr, im->image, data);
         |                          ^~
   kernel/bpf/trampoline.c: At top level:
>> kernel/bpf/trampoline.c:1449:15: error: variable 'trampoline_multi_ops' has initializer but incomplete type
    1449 | static struct bpf_trampoline_ops trampoline_multi_ops = {
         |               ^~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1450:10: error: 'struct bpf_trampoline_ops' has no member named 'register_fentry'
    1450 |         .register_fentry   = register_fentry_multi,
         |          ^~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1450:30: warning: excess elements in struct initializer
    1450 |         .register_fentry   = register_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1450:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c:1451:10: error: 'struct bpf_trampoline_ops' has no member named 'unregister_fentry'
    1451 |         .unregister_fentry = unregister_fentry_multi,
         |          ^~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1451:30: warning: excess elements in struct initializer
    1451 |         .unregister_fentry = unregister_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1451:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c:1452:10: error: 'struct bpf_trampoline_ops' has no member named 'modify_fentry'
    1452 |         .modify_fentry     = modify_fentry_multi,
         |          ^~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1452:30: warning: excess elements in struct initializer
    1452 |         .modify_fentry     = modify_fentry_multi,
         |                              ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/trampoline.c:1452:30: note: (near initialization for 'trampoline_multi_ops')
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_multi_attach':
>> kernel/bpf/trampoline.c:1504:41: error: 'direct_ops' undeclared (first use in this function); did you mean 'direct_ops_mod'?
    1504 |         err = update_ftrace_direct_add(&direct_ops, data.reg);
         |                                         ^~~~~~~~~~
         |                                         direct_ops_mod
   kernel/bpf/trampoline.c:1504:41: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/alloc_tag.h:8,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/trampoline.c:4:
   kernel/bpf/trampoline.c: In function 'bpf_trampoline_multi_detach':
   kernel/bpf/trampoline.c:1567:48: error: 'direct_ops' undeclared (first use in this function); did you mean 'direct_ops_mod'?
    1567 |         WARN_ON_ONCE(update_ftrace_direct_del(&direct_ops, data.unreg));
         |                                                ^~~~~~~~~~
   include/asm-generic/bug.h:120:32: note: in definition of macro 'WARN_ON_ONCE'
     120 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   kernel/bpf/trampoline.c: At top level:
   kernel/bpf/trampoline.c:453:34: error: storage size of 'trampoline_ops' isn't known
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^~~~~~~~~~~~~~
>> kernel/bpf/trampoline.c:1449:34: error: storage size of 'trampoline_multi_ops' isn't known
    1449 | static struct bpf_trampoline_ops trampoline_multi_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/trampoline_multi_ops +1449 kernel/bpf/trampoline.c

  1448	
> 1449	static struct bpf_trampoline_ops trampoline_multi_ops = {
  1450		.register_fentry   = register_fentry_multi,
  1451		.unregister_fentry = unregister_fentry_multi,
  1452		.modify_fentry     = modify_fentry_multi,
  1453	};
  1454	
  1455	int bpf_trampoline_multi_attach(struct bpf_prog *prog, u32 *ids,
  1456					struct bpf_tracing_multi_link *link)
  1457	{
  1458		struct bpf_attach_target_info tgt_info = {};
  1459		struct bpf_tracing_multi_node *mnode;
  1460		int j, i, err, cnt = link->nodes_cnt;
  1461		struct fentry_multi_data data = {};
  1462		struct bpf_trampoline *tr;
  1463		u64 key;
  1464	
  1465		data.reg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1466		if (!data.reg)
  1467			return -ENOMEM;
  1468	
  1469		data.modify = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1470		if (!data.modify) {
  1471			free_ftrace_hash(data.reg);
  1472			return -ENOMEM;
  1473		}
  1474	
  1475		for (i = 0; i < cnt; i++) {
  1476			mnode = &link->nodes[i];
  1477			err = bpf_check_attach_target(NULL, prog, NULL, ids[i], &tgt_info);
  1478			if (err)
  1479				goto rollback_put;
  1480	
  1481			key = bpf_trampoline_compute_key(NULL, prog->aux->attach_btf, ids[i]);
  1482	
  1483			tr = bpf_trampoline_get(key, &tgt_info);
  1484			if (!tr)
  1485				goto rollback_put;
  1486	
  1487			mnode->trampoline = tr;
  1488			mnode->node.prog = prog;
  1489		}
  1490	
  1491		for (i = 0; i < cnt; i++) {
  1492			mnode = &link->nodes[i];
  1493			tr = mnode->trampoline;
  1494	
  1495			mutex_lock(&tr->mutex);
  1496	
  1497			err = __bpf_trampoline_link_prog(&mnode->node, tr, NULL, &trampoline_multi_ops, &data);
  1498			if (err) {
  1499				mutex_unlock(&tr->mutex);
  1500				goto rollback_unlink;
  1501			}
  1502		}
  1503	
> 1504		err = update_ftrace_direct_add(&direct_ops, data.reg);
  1505		if (err)
  1506			goto rollback_unlink;
  1507	
  1508		err = update_ftrace_direct_mod(&direct_ops, data.modify, true);
  1509		if (err) {
  1510			WARN_ON_ONCE(update_ftrace_direct_del(&direct_ops, data.reg));
  1511			goto rollback_unlink;
  1512		}
  1513	
  1514		for (i = 0; i < cnt; i++) {
  1515			tr = link->nodes[i].trampoline;
  1516			mutex_unlock(&tr->mutex);
  1517		}
  1518	
  1519		free_fentry_multi_data(&data);
  1520		return 0;
  1521	
  1522	rollback_unlink:
  1523		for (j = 0; j < i; j++) {
  1524			mnode = &link->nodes[j];
  1525			tr = mnode->trampoline;
  1526			WARN_ON_ONCE(__bpf_trampoline_unlink_prog(&mnode->node, tr, NULL,
  1527				     &trampoline_multi_ops, &data));
  1528			mutex_unlock(&tr->mutex);
  1529		}
  1530	
  1531	rollback_put:
  1532		for (j = 0; j < i; j++) {
  1533			mnode = &link->nodes[j];
  1534			bpf_trampoline_put(mnode->trampoline);
  1535		}
  1536	
  1537		free_fentry_multi_data(&data);
  1538		return err;
  1539	}
  1540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
