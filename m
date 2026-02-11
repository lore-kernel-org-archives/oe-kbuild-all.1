Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6071282866
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781934; cv=none; b=DZz0LqSbjnm8qxLafMD2ToFVomvLeas9gBIJuq8b1yaGJtQRcw6NqiEa9V0UilvzBmGF//1UelrQ9LQW6Iv7bJP/nKlT4QGa5FdiFYciLz5SjQdq2N8MIeuc7w9yOKmJX91HW5bmlmcdGBWO3EOo8BqUSVs2DpR9rWkWNlfKXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781934; c=relaxed/simple;
	bh=aIJ6GH52bNNz3vgTudPS7dioLPDcfi5CKGwndzYs+Js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lrHM1nU40MrbDiSIEu3a1rtQEbq3xmF5SToU2yi75ADgOLz8Nu4wRtUrqJM7ER5mBmwiOnvzyea6oUA6pSL7sm1WWiEgIcVi2nXOAp+bov/gJ938q5MfZkrDqNfZXp7rMj2A6FHZiLoVrSAVcKYkFFGrJPzddDMLCJ45UAHr7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTXFKtou; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTXFKtou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770781933; x=1802317933;
  h=date:from:to:cc:subject:message-id;
  bh=aIJ6GH52bNNz3vgTudPS7dioLPDcfi5CKGwndzYs+Js=;
  b=LTXFKtoubSczwM7gRlxTm9V22EwfqKTvBhmiLRmy+umaZ7hM6xNfXt01
   ncP7ZtU30xTKORLX0HfB3y+Czq74/GXUsYn+sjKzvleHRgQLYOithJmoh
   SBXzdiwKKlHfHAHMEOEGYnD2LmQXQEEmJ5pi9/N+HcgpoMHX+NRLSBvs9
   a9bOET9lj8ac8stmyUMu2gHLmB3xb2hQvWjF4b4NPG80KFTBvj7ZGw1B8
   fhmin5eV0apWl3R7by8P5hgvMRGaqdZ58SZSPfrA5vH8u8oVdLdT4bCw9
   ngrxzDrRADlUC2j+pCcpYNQJl6wNcDHs7SKMBmAZ83zNrnsLsyyYIgR4I
   w==;
X-CSE-ConnectionGUID: xhdPIk25TLaG0IabQbwAsA==
X-CSE-MsgGUID: 2J1oewJ0Rl+IoI/MLYGWLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71818889"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71818889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 19:52:12 -0800
X-CSE-ConnectionGUID: Zw4TV7L0SRWir7C2R1aXng==
X-CSE-MsgGUID: XY/6OpfOSYqTS20DsF9c6A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2026 19:52:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq1Gq-00000000pee-49W3;
	Wed, 11 Feb 2026 03:52:08 +0000
Date: Wed, 11 Feb 2026 11:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [jonhunter:tegra/next-fixes 123/182]
 kernel/trace/trace_printk.c:464:45: error: expected ';' before ')' token
Message-ID: <202602111131.JKcKfT7S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jonhunter/linux tegra/next-fixes
head:   132737e360b4c0daa7f473faf0f55cb04ee3e15c
commit: 188f2b64bf80ddc71ef9fee0702978367a800308 [123/182] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
config: x86_64-randconfig-078-20250407 (https://download.01.org/0day-ci/archive/20260211/202602111131.JKcKfT7S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111131.JKcKfT7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111131.JKcKfT7S-lkp@intel.com/

Note: the jonhunter/tegra/next-fixes HEAD 132737e360b4c0daa7f473faf0f55cb04ee3e15c builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   kernel/trace/trace_printk.c: In function '__trace_bputs':
>> kernel/trace/trace_printk.c:464:45: error: expected ';' before ')' token
     464 |                 return __trace_puts(ip, str));
         |                                             ^
         |                                             ;
>> kernel/trace/trace_printk.c:463:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     463 |         if (!printk_binsafe(tr))
         |         ^~
   kernel/trace/trace_printk.c:464:45: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     464 |                 return __trace_puts(ip, str));
         |                                             ^
>> kernel/trace/trace_printk.c:464:45: error: expected statement before ')' token


vim +464 kernel/trace/trace_printk.c

   448	
   449	/**
   450	 * __trace_bputs - write the pointer to a constant string into trace buffer
   451	 * @ip:	   The address of the caller
   452	 * @str:   The constant string to write to the buffer to
   453	 */
   454	int __trace_bputs(unsigned long ip, const char *str)
   455	{
   456		struct trace_array *tr = READ_ONCE(printk_trace);
   457		struct ring_buffer_event *event;
   458		struct trace_buffer *buffer;
   459		struct bputs_entry *entry;
   460		unsigned int trace_ctx;
   461		int size = sizeof(struct bputs_entry);
   462	
 > 463		if (!printk_binsafe(tr))
 > 464			return __trace_puts(ip, str));
   465	
   466		if (!(tr->trace_flags & TRACE_ITER(PRINTK)))
   467			return 0;
   468	
   469		if (unlikely(tracing_selftest_running || tracing_disabled))
   470			return 0;
   471	
   472		trace_ctx = tracing_gen_ctx();
   473		buffer = tr->array_buffer.buffer;
   474	
   475		guard(ring_buffer_nest)(buffer);
   476		event = __trace_buffer_lock_reserve(buffer, TRACE_BPUTS, size,
   477						    trace_ctx);
   478		if (!event)
   479			return 0;
   480	
   481		entry = ring_buffer_event_data(event);
   482		entry->ip			= ip;
   483		entry->str			= str;
   484	
   485		__buffer_unlock_commit(buffer, event);
   486		ftrace_trace_stack(tr, buffer, trace_ctx, 4, NULL);
   487	
   488		return 1;
   489	}
   490	EXPORT_SYMBOL_GPL(__trace_bputs);
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
