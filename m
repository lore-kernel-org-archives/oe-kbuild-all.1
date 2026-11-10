Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347624;
	b=fHUKBYKQTHyUG/gt5E+KTvkpeBho+t8a/FRH9DIWcTXzsTOEsRa5133xAIpvFBHX25xq
	 UtPpZBlhOPJvPmG5dFOisKVr3EVkyaLo9ZioMz+RWq/09B8eWv4nY8I01lEngoMTUsLUc
	 0wfNXIUOCxseLjKQO8oAOqKoPMVEk6Z5yYoY0QBrCHZHcEuyI8VNReh1tU9rYkDtqVfyv
	 DfgoWSB7hW9bYvBrvfXSsO7Nh55ai8+6xdhH0TVe6x4DpfmA0fllew73kp5vpNGVrrYGX
	 zdgIt1+2YVBA7BbWoeRvXmsHyzNvp4H7oIH5g1mcjwBBJ6qHDmBT/k1yMdh3i3EY7qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347624;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kfTTZoYEnOvf0FaHrC/anhiZhW/gzlG4G9wWJ5oSou4=;
	b=XDMRPJPk2AA4sv8wvvq9XlEMaZKFHh7H3J0AJ4Qt/idZkNPmKunscC3nX9ItmXUfieSa
	 Iwv7wlSSo0NPMMGe1ftefIhLxQIz+enlS/vAz+/xLh4frcf2QOIr/pTBiLad88PHD8zVU
	 r/lbqnh0AtT2KlpbgvcT90mup/iTTBAYp/LfNqCzPojBT6LtyyCVjwtIwG4ucBGo3oPF8
	 PM8AgMmku9GdHv1jTUF1M5Tb7HUiQ5TP8hg9JPF5KgardV6OHHcjgZfv69bPv7MYeBefl
	 aVeIVmMU0RJoc2P3tpIrIwui5yIG6TzFCSNEGL3mwggX29IDG+ddMhRE0UHMP3VcSew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPhf9r5L;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF0606A320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 21:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPhf9r5L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794347624; x=1825883624;
  h=date:from:to:cc:subject:message-id;
  bh=S2Zzf/aDHx/Embb9GS/DjIEF9+4a3GZAUyT4fyHku2E=;
  b=SPhf9r5Lr1HsEdw34ncDgzX2rquNn54JbjrS+ZavzjlhttbjNOND1XPP
   cS41mgykNQAD/eqULcmUsB/IFonWs6sXrWr97Ca9z9bInhm4ZVVML17Qc
   etE4nIB+R5JvpqNRd+JECSfex6TaUfVYAEB15q7TuE8FXPCPMSI8xE9Ge
   7j9+ANYmsR+iACtAfBxbgTM0iA6a+mk+iUqC3FLYvw+azWiMy/Daek0mA
   hFOzuSfrCjzufuiEm8VNXWGYSTE5wc+RC14ST3AG64DwcNXFuodbu50SV
   2xzJs0Bjgz7ySDIWfzfNMAK42sgDEyIjeBHeOXLzOV1Z1xstjgVf6CsGj
   A==;
X-CSE-ConnectionGUID: oj9B+WGXRiqDDr9tug6sOA==
X-CSE-MsgGUID: QWEn7AymSjO+xaFR6nTD5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3138147"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3138147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 13:53:42 -0800
X-CSE-ConnectionGUID: uDylPuzkSM2kYqYiHEhNPQ==
X-CSE-MsgGUID: cl2Pp1qVQj6NxPEwq0n6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8405264"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Nov 2026 13:53:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQtma-000000000NH-49oI;
	Tue, 10 Nov 2026 21:53:36 +0000
Date: Tue, 10 Nov 2026 22:53:34 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:bpf-napi 38/46] kernel/bpf/kthread.c:104:
 undefined reference to `tcp_bpf_tx_release_task'
Message-ID: <202611102233.KRSKSacN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux bpf-napi
head:   447e73927e821b61da411e58b9444d831373f359
commit: 0a47dcf5aa0f1dd0aee9752660a0d38e0b462a62 [38/46] tcp: Do not leave sockets on an xmit queue that its thread neglects
config: xtensa-randconfig-2000-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102233.KRSKSacN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102233.KRSKSacN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102233.KRSKSacN-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   `.exit.text' referenced in section `__jump_table' of net/bluetooth/6lowpan.o: defined in discarded section `.exit.text' of net/bluetooth/6lowpan.o
   xtensa-linux-ld: kernel/bpf/kthread.o: in function `bpf_kthread_find':
>> kernel/bpf/kthread.c:104: undefined reference to `tcp_bpf_tx_release_task'
   xtensa-linux-ld: kernel/bpf/kthread.o: in function `bpf_kthread_release_work.isra.2':
   kernel/bpf/kthread.c:113: undefined reference to `tcp_bpf_tx_release_task'
   drivers/clocksource/timer-mediatek.o: in function `mtk_timer_probe':
   drivers/clocksource/timer-mediatek.c:356:(.text+0x50a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: *UND*
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
   `.exit.text' referenced in section `__jump_table' of net/netfilter/ipset/ip_set_core.o: defined in discarded section `.exit.text' of net/netfilter/ipset/ip_set_core.o
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_write_xmit':
   net/ipv4/tcp_output.c:3307: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `__tcp_push_pending_frames':
   include/net/tcp.h:764: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `__tcp_push_pending_frames':
   net/ipv4/tcp_output.c:3327: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_push_one':
   include/net/tcp.h:764: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o: in function `tcp_xmit_retransmit_queue.part.91':
   net/ipv4/tcp_output.c:1328: undefined reference to `__tcp_bpf_tx_defer'
   xtensa-linux-ld: net/ipv4/tcp_output.o:include/net/tcp.h:764: more undefined references to `__tcp_bpf_tx_defer' follow
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o
   `.exit.text' referenced in section `__jump_table' of net/ceph/ceph_common.o: defined in discarded section `.exit.text' of net/ceph/ceph_common.o


vim +104 kernel/bpf/kthread.c

    90	
    91	/*
    92	 * A NAPI bound to a thread is polled by nobody once the thread's callback has
    93	 * returned, and nobody transmits for the sockets on a TCP xmit queue bound to
    94	 * it, so the thread gives both back to the kernel on its way out. This
    95	 * runs in the thread, not in whoever stops it: a thread whose callback
    96	 * returned on its own may stay unstopped for as long as its program lives.
    97	 *
    98	 * A bind publishes the thread in the NAPI or the queue and then asks
    99	 * bpf_kthread_alive(), and the thread sets ->exiting and then looks for what
   100	 * is bound to it, both under the lock. So a bind that was told the thread is
   101	 * alive has published something the walk finds, and any later bind is told
   102	 * otherwise and undoes itself.
   103	 */
 > 104	static void bpf_kthread_release_work(struct bpf_kthread *kthread)
   105	{
   106		unsigned long irqflags;
   107	
   108		raw_spin_lock_irqsave(&bpf_kthreads_lock, irqflags);
   109		kthread->exiting = true;
   110		raw_spin_unlock_irqrestore(&bpf_kthreads_lock, irqflags);
   111	
   112		napi_bpf_release_task(current);
   113		tcp_bpf_tx_release_task(current);
   114	}
   115	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
