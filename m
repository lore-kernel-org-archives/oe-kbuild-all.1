Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC71F91D6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848758; cv=none; b=HX3qzNQvYUfez1Z+zwbQaSf1vufSTiGwrT0E2MuuJHkvwnssF9E/fanvCl35J9CyG86WOhdHzzCMAojq/WEbq2ojDOb/PLA5v4J6q9x2VwSDYjYJaR+9vJOq5kNVb4Jd7AeZJAUKN2C+bvcSfiyuEv/e2npdLpLn5iFrgIDzgZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848758; c=relaxed/simple;
	bh=CkJeIuaJ3sxX9iz3s5N5a4Du9X27WP1NooXAyUc8FjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RGVJopV2X79f9ZuFPOBNNQAZ3NoPtRG2DQg7Z46BkWCje/Suu7bGrjr4pb6PEnGpDArM8adPiPCh6PklrrCTyivZcnsR/e6OmPrgygMkAk6EUP3QCuB5+wV0+32zU6mlj4BC8+dVgnPC0yU1NxpFZrxuoj+uzAFyC3fZJ700BlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exv+PTwd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exv+PTwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769848756; x=1801384756;
  h=date:from:to:cc:subject:message-id;
  bh=CkJeIuaJ3sxX9iz3s5N5a4Du9X27WP1NooXAyUc8FjM=;
  b=exv+PTwdi3u5q8T8Rxlt1QDMCuTEXw62AoklzRR1m5oYYxfCLFTCMF6+
   o1XUjGN/x5IpzUaxKa/BcPDn8hZ4n8pTzUx+t46Q+g7irSLz1unYGGUyz
   8Y8/2vXqTmnazFOPk8QcsopHH/jrcn/wAjczI44SoB/Pe1mBkuFPthpA2
   4JQVHgJATCGvg2RjJLpmuGPUR837mc+kyi+KOo9vXendB5jcC7qTVBVz+
   XjKeJwkBCk16RNem2nPuKWtuoKdQIZsFEJ/QaC3oFXP/yRZqI8wV1nj2z
   iZ4hUg4MfCNZCR23mosAZsJ7i3FyPC3IvV0p7Jb+2zwaeTsIV2bl7aB+i
   w==;
X-CSE-ConnectionGUID: VuFuoDSnTOOj64blTSycnA==
X-CSE-MsgGUID: MdHQLKsMReGdV48t/5SC/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88664767"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88664767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 00:39:15 -0800
X-CSE-ConnectionGUID: Cc+6xwMNRWq2wCAMKmWviA==
X-CSE-MsgGUID: J10dHwovRmOKAcMT/AZOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213553621"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2026 00:39:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm6Vc-000000002fh-0AWF;
	Sat, 31 Jan 2026 08:39:12 +0000
Date: Sat, 31 Jan 2026 09:38:12 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 5/12]
 kernel/bpf/trampoline.c:1504:34: error: use of undeclared identifier
 'direct_ops'
Message-ID: <202601310946.O8o6OTo9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 1e90d2b0500ea06da8dcae5b9fdd52ecce958b20 [5/12] bpf: Add bpf_trampoline_multi_attach/detach functions
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601310946.O8o6OTo9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310946.O8o6OTo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310946.O8o6OTo9-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/trampoline.c:453:34: error: variable has incomplete type 'struct bpf_trampoline_ops'
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |                                  ^
   kernel/bpf/trampoline.c:453:15: note: forward declaration of 'struct bpf_trampoline_ops'
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   kernel/bpf/trampoline.c:714:12: error: incomplete definition of type 'struct bpf_trampoline_ops'
     714 |                 err = ops->register_fentry(tr, im->image, data);
         |                       ~~~^
   kernel/bpf/trampoline.c:453:15: note: forward declaration of 'struct bpf_trampoline_ops'
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
   kernel/bpf/trampoline.c:1449:34: error: variable has incomplete type 'struct bpf_trampoline_ops'
    1449 | static struct bpf_trampoline_ops trampoline_multi_ops = {
         |                                  ^
   kernel/bpf/trampoline.c:453:15: note: forward declaration of 'struct bpf_trampoline_ops'
     453 | static struct bpf_trampoline_ops trampoline_ops = {
         |               ^
>> kernel/bpf/trampoline.c:1504:34: error: use of undeclared identifier 'direct_ops'
    1504 |         err = update_ftrace_direct_add(&direct_ops, data.reg);
         |                                         ^
   kernel/bpf/trampoline.c:1508:34: error: use of undeclared identifier 'direct_ops'
    1508 |         err = update_ftrace_direct_mod(&direct_ops, data.modify, true);
         |                                         ^
   kernel/bpf/trampoline.c:1510:42: error: use of undeclared identifier 'direct_ops'
    1510 |                 WARN_ON_ONCE(update_ftrace_direct_del(&direct_ops, data.reg));
         |                                                        ^
   kernel/bpf/trampoline.c:1567:41: error: use of undeclared identifier 'direct_ops'
    1567 |         WARN_ON_ONCE(update_ftrace_direct_del(&direct_ops, data.unreg));
         |                                                ^
   kernel/bpf/trampoline.c:1568:41: error: use of undeclared identifier 'direct_ops'
    1568 |         WARN_ON_ONCE(update_ftrace_direct_mod(&direct_ops, data.modify, true));
         |                                                ^
   8 errors generated.


vim +/direct_ops +1504 kernel/bpf/trampoline.c

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
