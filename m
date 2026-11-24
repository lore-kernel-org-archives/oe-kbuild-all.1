Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491656;
	b=alT721xAYWYE6S4f82cuUm0m0WaaZqzlym7c97ZneWHhnTETIerKfvgesefJvuJI+B74
	 LEdvMOQiaCLsK5bT/dROzn57XvglB3xSe3Q1Is797DWTudqzu6XiCuCl9Our+9gQlVloS
	 25iy2rK7so83gjwqv4coE+e4J2+30BBC9CHyDSMHgq1ALiJ/1oa9mxF1eswNvkIjvIT8R
	 sqTv8kIXmCaf58IaIYNwb18SIn9LBbUyssfjcjD2n53SX9apBFBtbOLsQX9QAH//Ov3dt
	 x5kJpZYQUiq6/RL7iJwEqF+0633aF+PrEUoPAwpDcK8sasVLjujjTeM93vFfgDVQhZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zHDUrPTd0xfoRrZ6w5OeSD5r9HSpIWB36fmU+3KQKiM=;
	b=5GRoWIWeSGownSqSgAKQgIT5SPT0VLt/lhW0+9DtioftAcSJl8EjZ5DT54CXJ58cxY9O
	 TZTcLI2VRNk38itb8eaTkm2H+5tHkrCt1vsPiB83pyodtoQuoaq/QcADZH3PBHSAIh+Re
	 J5EqCvCYUaYdDKGFyt+QNUTJ3sksk2XHPTdJS6S3huxkFIWRCvVXTxRFuNQXuajuzxK+m
	 jdml7emJEA5XyjhaWXbEgKkKfP7qOCEUzMLIOP7W4Ksnztj1jSqcefR/Js3aJrEPGXbTX
	 DRGCDA21pqX1C1Al5E8L3U+Z7M1x0xqDrCCF8lgTXdpcdG7GjF/aGhlsFl6N6LWUolw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOhdPduZ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A818606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 03:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A818606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cOhdPduZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795491655; x=1827027655;
  h=date:from:to:cc:subject:message-id;
  bh=NOQb0HrH8/nBjH2x+NGR+ps0ReZxS/NkKNiyBPqH78I=;
  b=cOhdPduZbwfcEhtvr7Y8JHkSwMA5Zn8XueY5etd0UAQVo3yaz9k11NTQ
   yjtYpjCQIrpM68RqnyxFQ/upNkZtcBr/YWYKDy8UJhXdEclRRS/Xk6J60
   ZUZ99h18J/s127R/2UZgOnKBY8calvV+CUBEz07lhwCFzlqCqFxe9012g
   TNynjHI/CkaolKzNZ3Ag/NNy0jbg4G+Oq+4KEAT8jiX5YKpPgZsFJLjqp
   i8p7BmhkcQYdVVjtwQ7r/ZIQYRZccADlBucSjZsELU1628Ht385J8mFtK
   mBKrjwU0Pfhvxl9NCsXbSfQl1NcOmYnWelV6JiTJno//kd6eJqaOCxM0R
   A==;
X-CSE-ConnectionGUID: SC1HLLfdSryquIZu5JfFxw==
X-CSE-MsgGUID: qvkx5V8IQO2pvswQg1HOqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4224288"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4224288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 19:40:55 -0800
X-CSE-ConnectionGUID: Dy01rSTfQnqKH3VgJZ20JA==
X-CSE-MsgGUID: iuqu3Ej4TP6pcAbzdD3K9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11490405"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2026 19:40:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVhOk-0000000057V-3vkv;
	Tue, 24 Nov 2026 03:40:50 +0000
Date: Tue, 24 Nov 2026 04:40:47 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 198/293] kernel/bpf/coro.c:174:13:
 warning: variable 'ret' set but not used
Message-ID: <20261124043844.rOZgtOG3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   21eee2b16f3dde7280a4fa6c30e2ddbb02197140
commit: 8ab3f2ab1341cb46c5c546c9fe484a44a0c26db0 [198/293] bpf: Add a runtime to resume suspended coroutine frames
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261124/20261124043844.rOZgtOG3-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124043844.rOZgtOG3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124043844.rOZgtOG3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/coro.c: In function 'bpf_coro_run':
>> kernel/bpf/coro.c:174:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     174 |         u64 ret, kind;
         |             ^~~


vim +/ret +174 kernel/bpf/coro.c

   134	
   135	/*
   136	 * Resume the coroutine of @frame: call the resume function in its first slot with the frame
   137	 * as its argument. It is a subprogram of the program that the frame holds a reference on, and
   138	 * runs like any invocation of the program, under RCU with migration disabled, in a context
   139	 * where the kfuncs of the program type are valid, which the caller sees to. Like the call of
   140	 * any async callback it is an invocation of its own for the time of may_goto, see
   141	 * bpf_timed_may_goto_save().
   142	 *
   143	 * It is never called inside an invocation of a program, from a kfunc that the program calls:
   144	 * a continuation that suspends its frame again to such a kfunc would nest without bound. Where
   145	 * that happens the same task is in here twice at the same context level of the CPU. The
   146	 * warning catches that much, see bpf_coro_runners: not a kfunc that resumes a frame in the
   147	 * call of a program that no bpf_coro_run() entered, nor one that nests while another task's
   148	 * call of this CPU, which was preempted, holds the task level.
   149	 *
   150	 * The continuation owns the frame and may free it, and with it the reference that keeps the
   151	 * program loaded. A program is freed after a grace period of RCU, or of RCU Tasks Trace if it
   152	 * runs sleepable, see __bpf_prog_put_noref(): the call and what follows it here are in a read
   153	 * section of the one that applies.
   154	 *
   155	 * The call has a landing pad, like the call of a helper whose callback may unwind, see
   156	 * bpf_call_cb(). The verifier has a continuation leave with kexit when the kernel unwinds it,
   157	 * see push_coro_suspend(), and kexit returns here, behind the label: the pads of the program
   158	 * have released what the continuation held. Nothing on the way to it says who is told, so this
   159	 * tells a struct_ops, as bpf_prog_unwound_to_kernel() would where kexit finds no landing pad.
   160	 * unwind_exit of the program comes to the label too: the continuation did not return either,
   161	 * and nobody else is told, as where such a frame returns into the kernel.
   162	 *
   163	 * Returns true when the continuation did not return: the kernel unwound it, or the program's
   164	 * own unwinding left it. The kfunc can react, by closing a connection or waking a waiter, say.
   165	 */
   166	noinline bool bpf_coro_run(void *frame)
   167	{
   168		struct bpf_prog *prog = bpf_coro_frame_hdr(frame)->prog;
   169		bpf_callback_t resume = READ_ONCE(*(bpf_callback_t *)frame);
   170		bool sleepable = bpf_prog_runs_sleepable(prog);
   171		struct bpf_timed_may_goto saved;
   172		struct task_struct *runner;
   173		bool unwound = false;
 > 174		u64 ret, kind;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
