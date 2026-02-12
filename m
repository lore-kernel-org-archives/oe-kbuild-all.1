Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07028F7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861842; cv=none; b=A/6a7bCNxEkPuiknVDh5vZaGtDjrBzbEGt6EQIpC8QMg4KbY44Vi4dpeqNq6qGcp0tg2679+tit0NS0DY0dbcBQZj3dLzxI9pvuUYh++S0RM7P2TS/1S/Fi6T6+1WQnXtvc1sIaiLfBU0ySFMGY745O1Vtu0EgBX5vNw4DXrwKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861842; c=relaxed/simple;
	bh=F9aHqrL9oinKp0d+Vqs+YF7zI1oXB8cS6NrnP4UwDBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=scaKfTa2Bqls74csllM6bVkJvNWcu/Ws/ajMcjQ4dg/2JyBTz2jeHR5PmppsG5jnxthYxum580VGN+WplCxq02Ac+itGFW49blGKLDLoS3OooADpzg85aOUtBCqCuKtg5/jhYM7YXbI5r0uoyBGoXMlJrPX0EvWm7Dk7e1iZ0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idl5zfYP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idl5zfYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770861841; x=1802397841;
  h=date:from:to:cc:subject:message-id;
  bh=F9aHqrL9oinKp0d+Vqs+YF7zI1oXB8cS6NrnP4UwDBo=;
  b=idl5zfYPnZEPQIIwKGVXaDrq1M1Y0gJVQyd6cs1llPtsM3ZQcA9PayLZ
   0lVonpsaKOhM2k2KaGB2REoSnb0tzI8zRxqFf/K52fk42dD8OmB7MIARz
   Qlu5p02GFyrtIwkCal7Mwu0BkhWyww4U1ZiFuxKkl655FjjhW1B6YfeHt
   WHM5bzcedrA+G7s5y52nmLTrzQ2H/IrmXENE6CAxy8XySF+TO6TTzp6qk
   zM3YMOwayRytKWlURL7jKZY+pdWAlVBiW8Sfuw3OVl9QiqW/k7oQ/HUMD
   3vIc571L4O3vbJNMQVTo8ityDt+oU5KddJ3RsdDfN09m87IWsT0dQDaOD
   g==;
X-CSE-ConnectionGUID: +SDOOq0xQy2EQS4pCB9nVA==
X-CSE-MsgGUID: chX88SRYSWCEsu2ZlHmi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71738187"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71738187"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 18:04:00 -0800
X-CSE-ConnectionGUID: vOMWRTWdRkKTbdsvrXuQrg==
X-CSE-MsgGUID: fRXxJDP0Quu67z15FOeoVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211439187"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2026 18:03:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqM3g-00000000qYs-0yeq;
	Thu, 12 Feb 2026 02:03:56 +0000
Date: Thu, 12 Feb 2026 10:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_3 7/14]
 kernel/bpf/trampoline.c:1528:undefined reference to `bpf_check_attach_target'
Message-ID: <202602120910.gic3Azkp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_3
head:   e88de144ad6e264c1df0286d6a975136d7a059c2
commit: 5e011f72271142e5e37a81d4c8eb725d0092de20 [7/14] bpf: Add bpf_trampoline_multi_attach/detach functions
config: x86_64-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120910.gic3Azkp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120910.gic3Azkp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120910.gic3Azkp-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `bpf_trampoline_compute_key':
>> include/linux/bpf_verifier.h:923:(.text+0x7ff715): undefined reference to `btf_obj_id'
   ld: vmlinux.o: in function `bpf_trampoline_multi_attach':
>> kernel/bpf/trampoline.c:1528:(.text+0x7ff7b7): undefined reference to `bpf_check_attach_target'

smatch warnings:
kernel/bpf/trampoline.c:1536 bpf_trampoline_multi_attach() warn: missing error code 'err'

vim +1528 kernel/bpf/trampoline.c

  1505	
  1506	int bpf_trampoline_multi_attach(struct bpf_prog *prog, u32 *ids,
  1507					struct bpf_tracing_multi_link *link)
  1508	{
  1509		struct bpf_attach_target_info tgt_info = {};
  1510		struct bpf_tracing_multi_node *mnode;
  1511		int j, i, err, cnt = link->nodes_cnt;
  1512		struct fentry_multi_data data = {};
  1513		struct bpf_trampoline *tr;
  1514		u64 key;
  1515	
  1516		data.reg = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1517		if (!data.reg)
  1518			return -ENOMEM;
  1519	
  1520		data.modify = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  1521		if (!data.modify) {
  1522			free_ftrace_hash(data.reg);
  1523			return -ENOMEM;
  1524		}
  1525	
  1526		for (i = 0; i < cnt; i++) {
  1527			mnode = &link->nodes[i];
> 1528			err = bpf_check_attach_target(NULL, prog, NULL, ids[i], &tgt_info);
  1529			if (err)
  1530				goto rollback_put;
  1531	
  1532			key = bpf_trampoline_compute_key(NULL, prog->aux->attach_btf, ids[i]);
  1533	
  1534			tr = bpf_trampoline_get(key, &tgt_info);
  1535			if (!tr)
> 1536				goto rollback_put;
  1537	
  1538			mnode->trampoline = tr;
  1539			mnode->node.link = &link->link;
  1540		}
  1541	
  1542		trampoline_lock_all();
  1543	
  1544		for (i = 0; i < cnt; i++) {
  1545			mnode = &link->nodes[i];
  1546			tr = mnode->trampoline;
  1547	
  1548			err = __bpf_trampoline_link_prog(&mnode->node, tr, NULL, &trampoline_multi_ops, &data);
  1549			if (err) {
  1550				goto rollback_unlink;
  1551			}
  1552		}
  1553	
  1554		if (ftrace_hash_count(data.reg)) {
  1555			err = update_ftrace_direct_add(&direct_ops, data.reg);
  1556			if (err)
  1557				goto rollback_unlink;
  1558		}
  1559	
  1560		if (ftrace_hash_count(data.modify)) {
  1561			err = update_ftrace_direct_mod(&direct_ops, data.modify, true);
  1562			if (err) {
  1563				WARN_ON_ONCE(update_ftrace_direct_del(&direct_ops, data.reg));
  1564				goto rollback_unlink;
  1565			}
  1566		}
  1567	
  1568		trampoline_unlock_all();
  1569	
  1570		free_fentry_multi_data(&data);
  1571		return 0;
  1572	
  1573	rollback_unlink:
  1574		for (j = 0; j < i; j++) {
  1575			mnode = &link->nodes[j];
  1576			tr = mnode->trampoline;
  1577			WARN_ON_ONCE(__bpf_trampoline_unlink_prog(&mnode->node, tr, NULL,
  1578				     &trampoline_multi_ops, &data));
  1579		}
  1580		trampoline_unlock_all();
  1581	
  1582	rollback_put:
  1583		for (j = 0; j < i; j++) {
  1584			mnode = &link->nodes[j];
  1585			bpf_trampoline_put(mnode->trampoline);
  1586		}
  1587	
  1588		free_fentry_multi_data(&data);
  1589		return err;
  1590	}
  1591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
