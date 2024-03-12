Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12AE1E48C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710223404; cv=none; b=USkbl2BQ13qUiqsyZ9BUXDgPJa2tPik/6vtXylH3jBEPmDsOIg/lCRYivoFDlUJk7Kv/8J2lTWbqc/f/cbRRTysLWL6UnHOMjDkcteq5u4SJLA5gML2p5Mb54CbqZMCBXvOrvG+EUOQi+kKAz4GX7HL7r4bQiwU+oFtbBVDW9J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710223404; c=relaxed/simple;
	bh=fSs3o5HlvZpjfqJmIZch3Gg7+JD25YCjj0CJmCYIS34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmm8hcJZJ6fALgLb4a3AX0U8AtQm6bAQZOUql1dw6xvOQUn+M9vMqTuw6OIJ3qpIlDNaiDU/80WiqKwzH08NAGf7kSKuLUyWb/wTJo/DgNUj1kaHhPvVWlLIor65SEtO3nvKRTWnzbtBHqlVzzF5LYN9gg5qStZkqy/xI1RRRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek7JTNHY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek7JTNHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710223403; x=1741759403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSs3o5HlvZpjfqJmIZch3Gg7+JD25YCjj0CJmCYIS34=;
  b=ek7JTNHYznEK3arKckaapejgjzDcogpz2N2lNneKLxK1tndFNUodjEl0
   GAVeTAsmtTjzomrH43gE+Z7ZZKkBlagWjNYy+lqzfnTMifBE+627O6UuN
   461JoSh/4bfOitGuo9McO3+NAC2kwu9AoE7zoevobLfHSXlZm1C0fkBlU
   rwc8tHtBqF9++QzQI4BXaQroJ7u3C0rF9qzgVi7pLEqCM211VQq8h3F7L
   Cwgd5uYy8q+17d5dZDH/ynW7k/eyVqzYFMUrcLkPnXPFHm3fgz5gfEyxs
   3vBF+PuHP47OS6G8/Ah+Ptq/cFHJSE83XxX3UAbJ2wiCfGIGgiTNtjWNW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5044180"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5044180"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 23:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="48871839"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2024 23:03:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjvEN-0009qe-0k;
	Tue, 12 Mar 2024 06:03:19 +0000
Date: Tue, 12 Mar 2024 14:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:ftrace/urgent 9/9] kernel/trace/ring_buffer.c:910:
 warning: Function parameter or struct member 'cond' not described in
 'ring_buffer_wait'
Message-ID: <202403121308.sWZRdebd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ftrace/urgent
head:   e544f05bf7b98e38c43d16a087080208ded816ae
commit: e544f05bf7b98e38c43d16a087080208ded816ae [9/9] tracing/ring-buffer: Fix wait_on_pipe() race
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240312/202403121308.sWZRdebd-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121308.sWZRdebd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121308.sWZRdebd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:910: warning: Function parameter or struct member 'cond' not described in 'ring_buffer_wait'
>> kernel/trace/ring_buffer.c:910: warning: Function parameter or struct member 'data' not described in 'ring_buffer_wait'


vim +910 kernel/trace/ring_buffer.c

78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  897) 
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  898) /**
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  899)  * ring_buffer_wait - wait for input to the ring buffer
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  900)  * @buffer: buffer to wait on
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  901)  * @cpu: the cpu buffer to wait on
e1981f75d398c0 Qiujun Huang             2020-10-17  902   * @full: wait until the percentage of pages are available, if @cpu != RING_BUFFER_ALL_CPUS
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  903)  *
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  904)  * If @cpu == RING_BUFFER_ALL_CPUS then the task will wake up as soon
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  905)  * as data is added to any of the @buffer's cpu buffers. Otherwise
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  906)  * it will wait for data to be added to a specific cpu buffer.
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  907)  */
e544f05bf7b98e Steven Rostedt (Google   2024-03-11  908) int ring_buffer_wait(struct trace_buffer *buffer, int cpu, int full,
e544f05bf7b98e Steven Rostedt (Google   2024-03-11  909) 		     ring_buffer_cond_fn cond, void *data)
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28 @910) {
3f649ab728cda8 Kees Cook                2020-06-03  911  	struct ring_buffer_per_cpu *cpu_buffer;
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  912) 	struct wait_queue_head *waitq;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  913) 	struct rb_irq_work *work;
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  914) 	long once = 0;
e30f53aad2202b Rabin Vincent            2014-11-10  915  	int ret = 0;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  916) 
e544f05bf7b98e Steven Rostedt (Google   2024-03-11  917) 	if (!cond) {
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  918) 		cond = rb_wait_once;
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  919) 		data = &once;
e544f05bf7b98e Steven Rostedt (Google   2024-03-11  920) 	}
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  921) 
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  922) 	/*
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  923) 	 * Depending on what the caller is waiting for, either any
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  924) 	 * data in any cpu buffer, or a specific buffer, put the
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  925) 	 * caller on the appropriate wait queue.
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  926) 	 */
1e0d6714aceb77 Steven Rostedt (Red Hat  2015-02-10  927) 	if (cpu == RING_BUFFER_ALL_CPUS) {
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  928) 		work = &buffer->irq_work;
1e0d6714aceb77 Steven Rostedt (Red Hat  2015-02-10  929) 		/* Full only makes sense on per cpu reads */
2c2b0a78b37390 Steven Rostedt (VMware   2018-11-29  930) 		full = 0;
1e0d6714aceb77 Steven Rostedt (Red Hat  2015-02-10  931) 	} else {
8b8b36834d0fff Steven Rostedt (Red Hat  2014-06-10  932) 		if (!cpumask_test_cpu(cpu, buffer->cpumask))
8b8b36834d0fff Steven Rostedt (Red Hat  2014-06-10  933) 			return -ENODEV;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  934) 		cpu_buffer = buffer->buffers[cpu];
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  935) 		work = &cpu_buffer->irq_work;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  936) 	}
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  937) 
1e0d6714aceb77 Steven Rostedt (Red Hat  2015-02-10  938) 	if (full)
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  939) 		waitq = &work->full_waiters;
1e0d6714aceb77 Steven Rostedt (Red Hat  2015-02-10  940) 	else
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  941) 		waitq = &work->waiters;
e30f53aad2202b Rabin Vincent            2014-11-10  942  
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  943) 	ret = wait_event_interruptible(*waitq,
78af9ffaa2fb5b Steven Rostedt (Google   2024-03-11  944) 				rb_wait_cond(work, buffer, cpu, full, cond, data));
b3594573681b53 Steven Rostedt (Google   2024-03-08  945) 
e30f53aad2202b Rabin Vincent            2014-11-10  946  	return ret;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  947) }
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  948) 

:::::: The code at line 910 was first introduced by commit
:::::: 15693458c4bc0693fd63a50d60f35b628fcf4e29 tracing/ring-buffer: Move poll wake ups into ring buffer code

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
