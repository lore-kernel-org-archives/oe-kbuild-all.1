Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234351;
	b=j9DU0G6BWnZ0oDXmOcXotxl5SurBivMCtciRkyEnsXMXkLv590Uzmyjm8FX5JnnF2K+Z
	 s3/r5gyEcRVH1tssDr2dUXa4pZRJoZ64dx8DVyoJhLXvJxofWKq1w9VtBNGa7+MWw79Z+
	 a6Xff9W/kvpMN7VwvidZElZ0S9nXPTdqyNQS9LWSAgUpPxBrnnb2F6d4eanhJajrbmN3f
	 T0wnml1uj+087mv5YC65BZBOMQ30hGI8TVxi6dVN0Q6/ZQw0e0VA+EI2NfeaIdZkRrCr6
	 Q+mEcFwcSFU62a4xohK3hGT3yuP8JHgYp1EmlH8TAPncp4AgLlGiAqHiaAPMLOsDHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234351;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x0R76oxiydtsmCRSA1lfvqTCOYK7LD4bb3wcN7uVK6Y=;
	b=oTZacTYJV4/Ceaig+LFWlbXA8OOLLs5U+e3AU89OVAmFlanIBz3h405/pBkGKmZvLKlN
	 l5hNNo6XhHtD5fBULu/HOanuWDHsK3f1LL+98iS8iUVMC917LPY7x2+ryz+cvPVCMPlmF
	 y4A3VtmNA37s5qHIxaj7wEhFx0WopSDXxBTwqH74WTwT0QtBjLIMbe7/J64CzcXljbvtG
	 O2IP9p9L3KCQplfwN6oam25M/xeMHAXOO41abw8ZtkTFmEGorEuvBnz5ibMCz3UdymV6c
	 ahA/zqWrcsbFwa6hVijvn9jzQiamGgrb66CVFyEutJTgblGeKY7s8HbTZEVaUDYSHJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DqP/jj6E";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499E3606A325
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 14:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DqP/jj6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794234352; x=1825770352;
  h=date:from:to:cc:subject:message-id;
  bh=mB0VzxO6B+Q5NQaBNEQ1YvCkKtsADTSgLY0T2mBp4ag=;
  b=DqP/jj6Ea2B1oMx7Ccdp6H4Ml5X5OQN2BZ4XoDgRnm/oPIHARSE+ZXte
   cNu9Z8xh4OEKn6fYwO1vo1BFK3dDIW5Cb06pZkzAG2wbhu9POWKK+Kx5S
   3dkkL0uCftZxXFKKHxJUYrnwUMnV+LehWSthrcmjre1zhQpeTZzkUjCis
   CYqq3PX55HWgelnub8ffkX627zouLujp8YFupxkUtpY4swfOVTg4yhW4R
   4jdmcaPkJ76pxDt+DLlZrQc0LM/h0vP5g6FpN2ePuME0aTIzZhVA2NZGR
   kSHcy3zmrBNDx1Q9gX8tlktvAlV1z/CFBwN5AvsPdGUjAEdBQI441qgNb
   w==;
X-CSE-ConnectionGUID: 903gPtvQQryVI0i7e6Ykdg==
X-CSE-MsgGUID: NX76iGpSQfqrQ8OP5OvkCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2951786"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2951786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:25:51 -0800
X-CSE-ConnectionGUID: sTaQPCW1S8SsGoXAyOQ0RQ==
X-CSE-MsgGUID: 9LlqWNSuSKC+B0WBQ1WO7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7911208"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2026 06:25:49 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQJd-000000000L5-0r6O;
	Mon, 09 Nov 2026 14:25:45 +0000
Date: Mon, 09 Nov 2026 15:24:48 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 22/48]
 kernel/bpf/unwind.c:127:undefined reference to `bpf_sk_release_proto'
Message-ID: <202611091555.kZ1v3R4J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations
head:   c5378a88f114558f34a5251ecc2e401d1c111548
commit: 2fd707f27a3e03d4bb53e381f93322a8a3f82919 [22/48] bpf: Add frame descriptor tables and release what they list when unwinding
config: s390-randconfig-2000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091555.kZ1v3R4J-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091555.kZ1v3R4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091555.kZ1v3R4J-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
>> kernel/bpf/unwind.c:127:(.text+0x9d8): undefined reference to `bpf_sk_release_proto'


vim +127 kernel/bpf/unwind.c

   102	
   103	/*
   104	 * Release one resource by its handle, at run time: the pointer to an object,
   105	 * the address of a stack object or of a lock, or nothing for a section.
   106	 * @flags is the saved IRQ flags of an irqsave lock. Not inlined so that every
   107	 * release of an unwind can be observed by attaching to this function.
   108	 */
   109	noinline void bpf_unwind_release(const struct bpf_resource *res, void *handle, void *flags)
   110	{
   111		/* A destructor that needs RCU protection gets it here, whatever the frames held. */
   112		if (res->rcu)
   113			rcu_read_lock();
   114		switch (res->kind) {
   115		case BPF_RESOURCE_OBJ:
   116			bpf_obj_drop_impl(handle, res->meta);
   117			break;
   118		case BPF_RESOURCE_PERCPU_OBJ:
   119			bpf_percpu_obj_drop_impl(handle, res->meta);
   120			break;
   121		case BPF_RESOURCE_KPTR:
   122		case BPF_RESOURCE_ITER:
   123			res->dtor(handle);
   124			break;
   125	#ifdef CONFIG_NET
   126		case BPF_RESOURCE_SOCK:
 > 127			bpf_sk_release_proto.func((u64)(long)handle, 0, 0, 0, 0);
   128			break;
   129	#endif
   130		case BPF_RESOURCE_RINGBUF:
   131			bpf_ringbuf_discard_proto.func((u64)(long)handle, 0, 0, 0, 0);
   132			break;
   133		case BPF_RESOURCE_DYNPTR_RINGBUF:
   134			bpf_ringbuf_discard_dynptr_proto.func((u64)(long)handle, 0, 0, 0, 0);
   135			break;
   136		case BPF_RESOURCE_SPIN_LOCK:
   137			bpf_spin_unlock_proto.func((u64)(long)handle, 0, 0, 0, 0);
   138			break;
   139		case BPF_RESOURCE_RES_LOCK:
   140			bpf_res_spin_unlock(handle);
   141			break;
   142		case BPF_RESOURCE_RES_LOCK_IRQ:
   143			bpf_res_spin_unlock_irqrestore(handle, flags);
   144			break;
   145		case BPF_RESOURCE_IRQ_FLAG:
   146			bpf_local_irq_restore(handle);
   147			break;
   148		case BPF_RESOURCE_IRQ_FLAG_LOCK:
   149			/* Restored together with the lock that saved them. */
   150			break;
   151		case BPF_RESOURCE_RCU:
   152			bpf_rcu_read_unlock();
   153			break;
   154		case BPF_RESOURCE_PREEMPT:
   155			bpf_preempt_enable();
   156			break;
   157		default:
   158			WARN_ON_ONCE(1);
   159		}
   160		if (res->rcu)
   161			rcu_read_unlock();
   162	}
   163	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
