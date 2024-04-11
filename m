Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD7913BAEF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712807590; cv=none; b=YE5oYPLZjqvnL4IJoMm4yFDy63O7cmFIaec4Z/mRyS7eZvoliSDq0wgsm3T4gazWe7hmOV6CeNWZjXnKq1nwxYWdU+57G3gM3NXZlAMp6umRCXKEnt9OfuUccwT2N2IiUfKgeF+eYSoCYk4m1l5SA8VUPAto9KTtAeJX7ofjSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712807590; c=relaxed/simple;
	bh=2xZqF8OoE3700euJk+S3Mbz8hc9VN7V1OMzIuE6hEaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmy3TAz/bcpdp+xJkLbDojyjBpOBuX3ymFhkBWHRFgKzZg8oJmocUv4Syz4NlOi71DTjg0iwUtDPB6J9t5naG4bscKApU7peZixznI5OufmOuHbawjQXxbfu+su5t+sIwbqnwhgbQ21rIcSIMOXiZRQryMJSDpZqO3j4E3sBE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVbA4eyC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVbA4eyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712807588; x=1744343588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xZqF8OoE3700euJk+S3Mbz8hc9VN7V1OMzIuE6hEaQ=;
  b=YVbA4eyCaQAxDfTfhhQQPGmSM18Uv47fBKa8+3Qi52KL6j2p4/VShWWS
   +XpmhIsB0/aIYVE6cWR0yNRoFKQ6W1ExtFYFpkDptgrTVeWxw8H3FBcRO
   OTKvd0k0l8VPE5cjCx8RmBV00SMi2aRmqCjmiFQN/cnHTknMm4/4jZ6sM
   oAVu2L7JMLUEsLVgHgs/4ucYGgbJbreZCXRaUel/eVPqeiw0J9bBZbX1l
   z/P2YsDPnLu2AiftbePp38AjKlG1Q6tZvSi5ph+W5J8603uTe5JbWPWc8
   W0NJuCoeqoCgHn2qBWvQLP4EfSKz6jxBUTq71J7lCbfdVXUO9hNlS2yzL
   Q==;
X-CSE-ConnectionGUID: 3JW0di9lRSOfLIbQSGHyYA==
X-CSE-MsgGUID: r8j9pcBGQm2awgigNlMu+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8420894"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8420894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:53:05 -0700
X-CSE-ConnectionGUID: IhWL3uuNRMOjxU/HSSu1EA==
X-CSE-MsgGUID: DmmramplQq+wTiBPb3pbqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25255330"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 20:53:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulUj-0008Bm-22;
	Thu, 11 Apr 2024 03:53:01 +0000
Date: Thu, 11 Apr 2024 11:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 17/19]
 kernel/trace/trace.c:7534:37: warning: 'last_boot_fops' defined but not used
Message-ID: <202404111149.cqSjQFa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   26231feef0abf43a00e0ea834d7e0df0c017be2f
commit: 07bdbc98d5602bb910541fdd75e9756296641e69 [17/19] tracing/ring-buffer: Add last_boot_info file to boot instance
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111149.cqSjQFa7-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111149.cqSjQFa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111149.cqSjQFa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'update_last_data':
   kernel/trace/trace.c:6046:16: error: 'struct trace_array' has no member named 'text_delta'
    6046 |         if (!tr->text_delta && !tr->data_delta)
         |                ^~
   kernel/trace/trace.c:6046:35: error: 'struct trace_array' has no member named 'data_delta'
    6046 |         if (!tr->text_delta && !tr->data_delta)
         |                                   ^~
   kernel/trace/trace.c:6053:11: error: 'struct trace_array' has no member named 'text_delta'
    6053 |         tr->text_delta = 0;
         |           ^~
   kernel/trace/trace.c:6054:11: error: 'struct trace_array' has no member named 'data_delta'
    6054 |         tr->data_delta = 0;
         |           ^~
   kernel/trace/trace.c: In function 'tracing_last_boot_read':
   kernel/trace/trace.c:6889:54: error: 'struct trace_array' has no member named 'text_delta'
    6889 |         seq_buf_printf(&seq, "text delta:\t%ld\n", tr->text_delta);
         |                                                      ^~
   kernel/trace/trace.c:6890:54: error: 'struct trace_array' has no member named 'data_delta'
    6890 |         seq_buf_printf(&seq, "data delta:\t%ld\n", tr->data_delta);
         |                                                      ^~
   kernel/trace/trace.c: In function 'tracing_init_tracefs_percpu':
   kernel/trace/trace.c:8742:15: error: 'struct trace_array' has no member named 'range_addr_start'
    8742 |         if (tr->range_addr_start)
         |               ^~
   kernel/trace/trace.c: In function 'allocate_trace_buffer':
   kernel/trace/trace.c:9289:15: error: 'struct trace_array' has no member named 'range_addr_start'
    9289 |         if (tr->range_addr_start && tr->range_addr_size) {
         |               ^~
   kernel/trace/trace.c:9289:39: error: 'struct trace_array' has no member named 'range_addr_size'
    9289 |         if (tr->range_addr_start && tr->range_addr_size) {
         |                                       ^~
   In file included from kernel/trace/trace.c:15:
   kernel/trace/trace.c:9291:57: error: 'struct trace_array' has no member named 'range_addr_start'
    9291 |                                                       tr->range_addr_start,
         |                                                         ^~
   include/linux/ring_buffer.h:119:62: note: in definition of macro 'ring_buffer_alloc_range'
     119 |         __ring_buffer_alloc_range((size), (flags), (order), (start),    \
         |                                                              ^~~~~
   kernel/trace/trace.c:9292:57: error: 'struct trace_array' has no member named 'range_addr_size'
    9292 |                                                       tr->range_addr_size);
         |                                                         ^~
   include/linux/ring_buffer.h:120:36: note: in definition of macro 'ring_buffer_alloc_range'
     120 |                                   (range_size), &__key);                \
         |                                    ^~~~~~~~~~
   kernel/trace/trace.c:9295:48: error: 'struct trace_array' has no member named 'text_delta'
    9295 |                                             &tr->text_delta, &tr->data_delta);
         |                                                ^~
   kernel/trace/trace.c:9295:65: error: 'struct trace_array' has no member named 'data_delta'
    9295 |                                             &tr->text_delta, &tr->data_delta);
         |                                                                 ^~
   kernel/trace/trace.c:9300:19: error: 'struct trace_array' has no member named 'mapped'
    9300 |                 tr->mapped++;
         |                   ^~
   kernel/trace/trace.c: In function 'trace_array_create_systems':
   kernel/trace/trace.c:9473:11: error: 'struct trace_array' has no member named 'range_addr_start'
    9473 |         tr->range_addr_start = range_addr_start;
         |           ^~
   kernel/trace/trace.c:9474:11: error: 'struct trace_array' has no member named 'range_addr_size'
    9474 |         tr->range_addr_size = range_addr_size;
         |           ^~
   kernel/trace/trace.c: At top level:
>> kernel/trace/trace.c:7534:37: warning: 'last_boot_fops' defined but not used [-Wunused-const-variable=]
    7534 | static const struct file_operations last_boot_fops = {
         |                                     ^~~~~~~~~~~~~~


vim +/last_boot_fops +7534 kernel/trace/trace.c

  7533	
> 7534	static const struct file_operations last_boot_fops = {
  7535		.open		= tracing_open_generic_tr,
  7536		.read		= tracing_last_boot_read,
  7537		.llseek		= generic_file_llseek,
  7538		.release	= tracing_release_generic_tr,
  7539	};
  7540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
