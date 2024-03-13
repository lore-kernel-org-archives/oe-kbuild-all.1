Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84DC10A1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710305259; cv=none; b=utJtwEqoKW5VrUmfI/5jDioOznJLotsuOuYCaPcPXRIfPpKwVfvPM7a7UjvaWvSiSfxvnXd7rEWgOAPvOmgizmcStjqH98u/hplyBlXiFBIw3Y/hkRzl8oK4fT6LX+9W1NJF+whnUB5BSS7fbqUkE0r8WLcbibePjlIjX5a4TAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710305259; c=relaxed/simple;
	bh=0VLNhsdEsnSGGg7k9LsQ8u0lhJzFFsDGiJ3xN6QEpD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+pbJcW76bkf6eJlFmgXKb1XvFtwNLLu7JUwX1HprgK4Jxp4Egqudv/gXvBhm+nusx44PXRGGoJ5dN/dlSWCX+uIC+XVinlQYQvpocwR8rffjogUXKf2imUwpWS4lqkNdjWz9BZx0E7vT6zE7hAyizpN+W9QiQrNF8BGOR9Gvzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmAmGXuh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmAmGXuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710305256; x=1741841256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VLNhsdEsnSGGg7k9LsQ8u0lhJzFFsDGiJ3xN6QEpD8=;
  b=MmAmGXuhYoJULGsE36YO5bvEIyLF7voL4Wke5BWnprvqX7AjoxU7C7P/
   PpdgnP5wxuoKXvu2aebWmApNArDKCKUgx74KNZNapGqvnfsTJK1P+nle/
   8BmVu0zAMW/Qlx0CnxKRqVTyBiWtyFEfOlT6LYYEUEoV3fC3cLtqQ5iNk
   5yujFJdxnCa09+QhvdOrjsDw2xSiZSiFCKyhPCt625Dw9sXu7ye1VMURX
   ZnjOwGP7UWyhYKGsjhU30y7dhpMVe6UknvxlAjfr+ZXNNSHGjdyF7Us59
   5ZeM5IooSQXzPEL1SzbaTVFK1gM2oVgy81w3Z+iLTyIgiAGGGRz86oX+b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8821731"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8821731"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:47:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11850862"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2024 21:47:34 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkGWa-000C1f-09;
	Wed, 13 Mar 2024 04:47:32 +0000
Date: Wed, 13 Mar 2024 12:47:10 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ring-buffer: Reuse rb_watermark_hit() for the poll
 logic
Message-ID: <202403131254.Wt63XOJz-lkp@intel.com>
References: <20240312115543.500445373@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312115543.500445373@goodmis.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.8 next-20240312]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ring-buffer-Fix-full_waiters_pending-in-poll/20240312-195518
base:   linus/master
patch link:    https://lore.kernel.org/r/20240312115543.500445373%40goodmis.org
patch subject: [PATCH 2/2] ring-buffer: Reuse rb_watermark_hit() for the poll logic
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240313/202403131254.Wt63XOJz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131254.Wt63XOJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131254.Wt63XOJz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'ring_buffer_poll_wait':
>> kernel/trace/ring_buffer.c:962:31: warning: unused variable 'flags' [-Wunused-variable]
     962 |                 unsigned long flags;
         |                               ^~~~~


vim +/flags +962 kernel/trace/ring_buffer.c

15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   928) 
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   929) /**
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   930)  * ring_buffer_poll_wait - poll on buffer input
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   931)  * @buffer: buffer to wait on
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   932)  * @cpu: the cpu buffer to wait on
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   933)  * @filp: the file descriptor
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   934)  * @poll_table: The poll descriptor
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   935)  * @full: wait until the percentage of pages are available, if @cpu != RING_BUFFER_ALL_CPUS
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   936)  *
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   937)  * If @cpu == RING_BUFFER_ALL_CPUS then the task will wake up as soon
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   938)  * as data is added to any of the @buffer's cpu buffers. Otherwise
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   939)  * it will wait for data to be added to a specific cpu buffer.
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   940)  *
a9a08845e9acbd Linus Torvalds           2018-02-11   941   * Returns EPOLLIN | EPOLLRDNORM if data exists in the buffers,
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   942)  * zero otherwise.
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   943)  */
13292494379f92 Steven Rostedt (VMware   2019-12-13   944) __poll_t ring_buffer_poll_wait(struct trace_buffer *buffer, int cpu,
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   945) 			  struct file *filp, poll_table *poll_table, int full)
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   946) {
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   947) 	struct ring_buffer_per_cpu *cpu_buffer;
68282dd930ea38 Steven Rostedt (Google   2024-03-08   948) 	struct rb_irq_work *rbwork;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   949) 
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   950) 	if (cpu == RING_BUFFER_ALL_CPUS) {
68282dd930ea38 Steven Rostedt (Google   2024-03-08   951) 		rbwork = &buffer->irq_work;
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   952) 		full = 0;
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   953) 	} else {
6721cb60022629 Steven Rostedt (Red Hat  2013-05-23   954) 		if (!cpumask_test_cpu(cpu, buffer->cpumask))
66bbea9ed6446b Vincent Donnefort        2024-01-31   955  			return EPOLLERR;
6721cb60022629 Steven Rostedt (Red Hat  2013-05-23   956) 
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   957) 		cpu_buffer = buffer->buffers[cpu];
68282dd930ea38 Steven Rostedt (Google   2024-03-08   958) 		rbwork = &cpu_buffer->irq_work;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   959) 	}
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28   960) 
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   961) 	if (full) {
68282dd930ea38 Steven Rostedt (Google   2024-03-08  @962) 		unsigned long flags;
68282dd930ea38 Steven Rostedt (Google   2024-03-08   963) 
68282dd930ea38 Steven Rostedt (Google   2024-03-08   964) 		poll_wait(filp, &rbwork->full_waiters, poll_table);
68282dd930ea38 Steven Rostedt (Google   2024-03-08   965) 
4e3268779574c4 Steven Rostedt (Google   2024-03-12   966) 		if (rb_watermark_hit(buffer, cpu, full))
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   967) 			return EPOLLIN | EPOLLRDNORM;
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   968) 		/*
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   969) 		 * Only allow full_waiters_pending update to be seen after
4e3268779574c4 Steven Rostedt (Google   2024-03-12   970) 		 * the shortest_full is set (in rb_watermark_hit). If the
4e3268779574c4 Steven Rostedt (Google   2024-03-12   971) 		 * writer sees the full_waiters_pending flag set, it will
4e3268779574c4 Steven Rostedt (Google   2024-03-12   972) 		 * compare the amount in the ring buffer to shortest_full.
4e3268779574c4 Steven Rostedt (Google   2024-03-12   973) 		 * If the amount in the ring buffer is greater than the
4e3268779574c4 Steven Rostedt (Google   2024-03-12   974) 		 * shortest_full percent, it will call the irq_work handler
4e3268779574c4 Steven Rostedt (Google   2024-03-12   975) 		 * to wake up this list. The irq_handler will reset shortest_full
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   976) 		 * back to zero. That's done under the reader_lock, but
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   977) 		 * the below smp_mb() makes sure that the update to
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   978) 		 * full_waiters_pending doesn't leak up into the above.
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   979) 		 */
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   980) 		smp_mb();
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   981) 		rbwork->full_waiters_pending = true;
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   982) 		return 0;
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   983) 	}
a505bba2acc5f4 Steven Rostedt (Google   2024-03-12   984) 
68282dd930ea38 Steven Rostedt (Google   2024-03-08   985) 	poll_wait(filp, &rbwork->waiters, poll_table);
68282dd930ea38 Steven Rostedt (Google   2024-03-08   986) 	rbwork->waiters_pending = true;
42fb0a1e84ff52 Steven Rostedt (Google   2022-10-20   987) 
4ce97dbf502452 Josef Bacik              2014-08-25   988  	/*
4ce97dbf502452 Josef Bacik              2014-08-25   989  	 * There's a tight race between setting the waiters_pending and
4ce97dbf502452 Josef Bacik              2014-08-25   990  	 * checking if the ring buffer is empty.  Once the waiters_pending bit
4ce97dbf502452 Josef Bacik              2014-08-25   991  	 * is set, the next event will wake the task up, but we can get stuck
4ce97dbf502452 Josef Bacik              2014-08-25   992  	 * if there's only a single event in.
4ce97dbf502452 Josef Bacik              2014-08-25   993  	 *
4ce97dbf502452 Josef Bacik              2014-08-25   994  	 * FIXME: Ideally, we need a memory barrier on the writer side as well,
4ce97dbf502452 Josef Bacik              2014-08-25   995  	 * but adding a memory barrier to all events will cause too much of a
4ce97dbf502452 Josef Bacik              2014-08-25   996  	 * performance hit in the fast path.  We only need a memory barrier when
4ce97dbf502452 Josef Bacik              2014-08-25   997  	 * the buffer goes from empty to having content.  But as this race is
4ce97dbf502452 Josef Bacik              2014-08-25   998  	 * extremely small, and it's not a problem if another event comes in, we
4ce97dbf502452 Josef Bacik              2014-08-25   999  	 * will fix it later.
4ce97dbf502452 Josef Bacik              2014-08-25  1000  	 */
4ce97dbf502452 Josef Bacik              2014-08-25  1001  	smp_mb();
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1002) 
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1003) 	if ((cpu == RING_BUFFER_ALL_CPUS && !ring_buffer_empty(buffer)) ||
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1004) 	    (cpu != RING_BUFFER_ALL_CPUS && !ring_buffer_empty_cpu(buffer, cpu)))
a9a08845e9acbd Linus Torvalds           2018-02-11  1005  		return EPOLLIN | EPOLLRDNORM;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1006) 	return 0;
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1007) }
15693458c4bc06 Steven Rostedt (Red Hat  2013-02-28  1008) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
