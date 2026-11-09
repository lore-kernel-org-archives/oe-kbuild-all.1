Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224996;
	b=TCCHjoV+85alJDp4pFr+nmpfCI7nr7YDTRe62XdQbE49mSNrCw0fm/acFPk5OneeY404
	 dKkl3/1pJFgAgNwNli+yDrLQxPVyKPANkcm48jP3Xl9rUABalAKF5Ju4cXOp7SAakWIkg
	 0Y19Yu9jqP5x9kT1gATzsevg+vq+WFszpLJzFdKN46AVMeRsGjK/EtR/NYr/mWu8Ega/6
	 xXHgLuG+N69uUXVOOHYK8CiTUK6jzfOjs9S0hyy5/fw7S6ENArZFCHOuS9+a5UaZJ//BH
	 pO4/OrsZVNd/SX61D00r8Jf3AxCMmYWM/TtQ5/zey2q1+lhrKT7kNVdChua5Xb02o6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224996;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2dtk5+IYjNtnQBXa/sLfkvWQ5gAQ0+3sEjOsf5QDlmM=;
	b=ebbYpKfFiIxrGMab5CRYAECKYKeMWaUWcilO5O6sQwORMug47s9iJt0cgHxGOBXrgyH/
	 6t9tX5FNPO34VNDpQFxFiXULnTZKltnx+zCgmnA+HIjSJDq1Dhz0KVrKarJAPwgXS3b/+
	 RPsGTn0y2uCmfvtiFYyWvEhzMMi1QNjV+FUipkYbul6h69ecD1hPpomNq3/h8S9mqCqG/
	 EyoE5ZmCfcTPF3V8mH2NIObsGzh1+1Ne4PPzd88d2i4ppYINsGdFNMXaT8vKXdbJ9f1qc
	 JOeJxAfA12ffa1bfgHLCqSVUJs8Q5kCZApScveHcY6KGZ/n2VVBl0xdfV3tmgMge3Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUYMLyjv;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB8606A332
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 11:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AB8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUYMLyjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224991; x=1825760991;
  h=date:from:to:cc:subject:message-id;
  bh=QGnbyNJfUH+GxzCLt66movYVxMetZdZPYHy7atFuHYo=;
  b=iUYMLyjvUFimD/1AFqX60FVFgK+OzY3G6Usg7BavlU/XdzIuJ1l6Rwxg
   iko4XvYFAA85ri8LRrQ2Yun05FdG3QQ0g6PsMdySUjCfFcQYRu5GLxyJl
   nHVKyqZWiY2/1+BfLoYkO1UvUjb75WXwxI5VsKD9kODcqk7c8hNAbeFXg
   fuotJ3cgOZQhXq0awwpnyEtFEDhnx3ew0S8uqYps6CznRJpnUxLgi0Df6
   VcF4WDfCGsAW9YYN13q2zpnEF3EXmIbQKC8DF+65BlevNT0m1C6bYr4qp
   03AAmH6ROqc1AjHB2GRTDUpbEPqlOrTziHG7gdje1AVo8Yt2t5Vl6rO+n
   w==;
X-CSE-ConnectionGUID: MeWO/GheRI+btlglIudwug==
X-CSE-MsgGUID: yPxYfAqzS9Wswzc9kKNc4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2933799"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2933799"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:49:50 -0800
X-CSE-ConnectionGUID: CCaeRjUCQrOZIM5I84QedA==
X-CSE-MsgGUID: JyB67i95QU6qXYW7vIpZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="9622968"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 09 Nov 2026 03:49:49 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQNsf-000000000JH-449P;
	Mon, 09 Nov 2026 11:49:45 +0000
Date: Mon, 09 Nov 2026 12:48:59 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 22/48] kernel/bpf/unwind.c:127:
 undefined reference to `bpf_sk_release_proto'
Message-ID: <202611091245.zdPgUGk9-lkp@intel.com>
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
config: nios2-randconfig-2001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091245.zdPgUGk9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091245.zdPgUGk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091245.zdPgUGk9-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/unwind.o: in function `bpf_unwind_release':
>> kernel/bpf/unwind.c:127: undefined reference to `bpf_sk_release_proto'
>> nios2-linux-ld: kernel/bpf/unwind.c:127: undefined reference to `bpf_sk_release_proto'


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
