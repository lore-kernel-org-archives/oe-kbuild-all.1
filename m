Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CAEADD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 05:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712814613; cv=none; b=EitOeDtuRh8YgfP3msjl0/rTWq9iAwYQYp6CoAh2B2RWc1dUXsG+1dIcb4+u0nZN+mn3ZJg7QgG+BLDzWiNSwlsZy5MjMH/tyG6fdl57kCIbQFag6/j4OTrwonJOxjsnEKNk14wJaz/+Q+l+wGE2AmKyshhCrgUJQdL41lQTwbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712814613; c=relaxed/simple;
	bh=CuhYnl+5QYPwZgvjMFtH4BaNDdqfO39PHkvmeG0H7nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DXwn0qHvIseeA9Eshi3YzuqYqjFfkd5pxg5+7Pn6qGponFdMSivXwcGKM6iYrBxGy28NMhfa5CcudrsVBcKD4z9ieYA/5LYHgRij6gtG0jocUSLW4Cd9dRVfhcpckYeXxieM3ujEgqh9dFE3Yl+vXptudrQTgaWc52qvBMV3q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=POxRpH8J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="POxRpH8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712814611; x=1744350611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CuhYnl+5QYPwZgvjMFtH4BaNDdqfO39PHkvmeG0H7nA=;
  b=POxRpH8JG54VV5473Ibx8UziX/qqJzIIqTrTcOic5gDbDjl3WmdhXIRZ
   49qrTBoESdUtbfbfB4T7X7Bibgk78K1qi3aOA8hDoxg1VWFxfeM5DMWy8
   iw9YNnXQKtpWHB/iQL3A1M9DQtug/dRidUuktm0cvlZ9akZTsOmcAIa4m
   lLBouIBltItsoF0Y8AwnafcDzlRkdqUoY8NJ8iOuL95Kf3Y74VPx1X3x2
   NGWsMBC1eTJVimFvkTPwCNJQ0pBwjyHgNBMKqGiGCfR8gRm2jr8V20UQz
   lKH1CGIKNFcTx/2OVaSH4RSsAkahu6Bpjwg46KV9HXuoMP6u2x/PxI/sh
   Q==;
X-CSE-ConnectionGUID: AqOM5uR1QWOXRxA3qqWsqQ==
X-CSE-MsgGUID: 8sPuPa0ESsm/Msk2X4VPcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8334804"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8334804"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 22:50:10 -0700
X-CSE-ConnectionGUID: KHtfx7mZQbm0Vyas9yx/RQ==
X-CSE-MsgGUID: iORGVk9bTpGNWmZTlj+xhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20828272"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2024 22:50:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1runK1-0008H3-38;
	Thu, 11 Apr 2024 05:50:05 +0000
Date: Thu, 11 Apr 2024 13:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 17/19]
 kernel/trace/trace.c:6046:16: error: 'struct trace_array' has no member
 named 'text_delta'
Message-ID: <202404111358.hiOuzLUG-lkp@intel.com>
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
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111358.hiOuzLUG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111358.hiOuzLUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111358.hiOuzLUG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'update_last_data':
>> kernel/trace/trace.c:6046:16: error: 'struct trace_array' has no member named 'text_delta'
    6046 |         if (!tr->text_delta && !tr->data_delta)
         |                ^~
>> kernel/trace/trace.c:6046:35: error: 'struct trace_array' has no member named 'data_delta'
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
   kernel/trace/trace.c:7534:37: warning: 'last_boot_fops' defined but not used [-Wunused-const-variable=]
    7534 | static const struct file_operations last_boot_fops = {
         |                                     ^~~~~~~~~~~~~~


vim +6046 kernel/trace/trace.c

  6043	
  6044	static void update_last_data(struct trace_array *tr)
  6045	{
> 6046		if (!tr->text_delta && !tr->data_delta)
  6047			return;
  6048	
  6049		/* Clear old data */
  6050		tracing_reset_online_cpus(&tr->array_buffer);
  6051	
  6052		/* Using current data now */
  6053		tr->text_delta = 0;
  6054		tr->data_delta = 0;
  6055	}
  6056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
