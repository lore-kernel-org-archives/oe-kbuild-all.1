Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F33218C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301807; cv=none; b=as2gAEizz4JsyAQRT7a9UoJZxifu4zrCSkeMdRILDrbqad7y9e+fuBzzlHXuViKHDmJoKbNRkqkUQ5pHXIyZut49u26ZVRqkoa3pynun1UYPUjQcNxbDq6MTxj+I++FeucSMAfdedOlDr9ZEkqsEQUGFK/C85gSXjicaLT6K9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301807; c=relaxed/simple;
	bh=RIVTddaDHTeQgAHMyaATs+1LIv9y4+UzM0k7v4cBwEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XreCBvjXTE/EB3+eRVFDA/puWa9FncOK+Aqk2AkKqGsOsVwxzmVZ0PcQsOOmwv7+KvY+FCo2gjIlIkzoqPXjlRrx9yr4SDSuQXMs4a8dOS4iySopUyVz9fcZfhvtiSVVpu153eEny6MexBYA+qfty9rbLbFQyOzg0BOarakiEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf7UYVdB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf7UYVdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758301806; x=1789837806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RIVTddaDHTeQgAHMyaATs+1LIv9y4+UzM0k7v4cBwEo=;
  b=Nf7UYVdBDpJzLad4i5utjU9yL7TP0T9LXQgY0wuARiZ/5Ah5HwvjeH8D
   +XYugd60GmBkAYJuMMpLpihoraowuXZz/6AaiLQh640Ffige0KGk0sQPy
   xzHl/zYLxMxuyl1Kcfb0ga2qXaIOwiYIyHEbkVLLedLvZTF97/UskexyI
   5Gvx4ZIPA40g/g1rtSJhryXLD+5C8jX6zc0XLlVvgXjLexWwQfI4bgtzn
   8tjzsqHXGYUUcXrEPllbPcqIaSkYAH427USlF+3WylIzUfqoaGH5sJTZJ
   HzplnNQeLLezUAKOSfJS6ZcXvAknZWICHjcU1gOv9Q+8ijJvmKxqjgffL
   A==;
X-CSE-ConnectionGUID: 1DGg+6D9TfWZgYT88xjNow==
X-CSE-MsgGUID: ZzTXmY+eTF6oJyNxTgZNfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60598197"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60598197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 10:10:03 -0700
X-CSE-ConnectionGUID: 0XTU64C0ScaiG/e30x56hA==
X-CSE-MsgGUID: AgjWt8pETEGyzUvWx1nL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175805685"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 10:10:01 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzecR-0004ZZ-1H;
	Fri, 19 Sep 2025 17:09:59 +0000
Date: Sat, 20 Sep 2025 01:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Add an option to show symbols in _text+offset
 for function profiler
Message-ID: <202509200000.EJ4InVti-lkp@intel.com>
References: <175826135058.101165.7219957344129610147.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175826135058.101165.7219957344129610147.stgit@devnote2>

Hi Masami,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on linus/master v6.17-rc6 next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-Add-an-option-to-show-symbols-in-_text-offset-for-function-profiler/20250919-135733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/175826135058.101165.7219957344129610147.stgit%40devnote2
patch subject: [PATCH] tracing: Add an option to show symbols in _text+offset for function profiler
config: x86_64-buildonly-randconfig-002-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200000.EJ4InVti-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200000.EJ4InVti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200000.EJ4InVti-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/trace/trace_sched_switch.c:15:
>> kernel/trace/trace.h:1422:37: warning: left shift count >= width of type [-Wshift-count-overflow]
    1422 | #define C(a, b) TRACE_ITER_##a = (1 << TRACE_ITER_##a##_BIT)
         |                                     ^~
   kernel/trace/trace.h:1358:17: note: in expansion of macro 'C'
    1358 |                 C(PROF_TEXT_OFFSET,     "prof-text-offset"),
         |                 ^
   kernel/trace/trace.h:1402:17: note: in expansion of macro 'PROFILER_FLAGS'
    1402 |                 PROFILER_FLAGS
         |                 ^~~~~~~~~~~~~~
   kernel/trace/trace.h:1424:29: note: in expansion of macro 'TRACE_FLAGS'
    1424 | enum trace_iterator_flags { TRACE_FLAGS };
         |                             ^~~~~~~~~~~
--
   In file included from kernel/trace/trace.c:58:
>> kernel/trace/trace.h:1422:37: warning: left shift count >= width of type [-Wshift-count-overflow]
    1422 | #define C(a, b) TRACE_ITER_##a = (1 << TRACE_ITER_##a##_BIT)
         |                                     ^~
   kernel/trace/trace.h:1358:17: note: in expansion of macro 'C'
    1358 |                 C(PROF_TEXT_OFFSET,     "prof-text-offset"),
         |                 ^
   kernel/trace/trace.h:1402:17: note: in expansion of macro 'PROFILER_FLAGS'
    1402 |                 PROFILER_FLAGS
         |                 ^~~~~~~~~~~~~~
   kernel/trace/trace.h:1424:29: note: in expansion of macro 'TRACE_FLAGS'
    1424 | enum trace_iterator_flags { TRACE_FLAGS };
         |                             ^~~~~~~~~~~
   In file included from <command-line>:
   In function 'tracer_alloc_buffers',
       inlined from 'early_trace_init' at kernel/trace/trace.c:11144:2:
>> include/linux/compiler_types.h:572:45: error: call to '__compiletime_assert_557' declared with attribute error: BUILD_BUG_ON failed: TRACE_ITER_LAST_BIT > TRACE_FLAGS_MAX_SIZE
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:553:25: note: in definition of macro '__compiletime_assert'
     553 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:572:9: note: in expansion of macro '_compiletime_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:10983:9: note: in expansion of macro 'BUILD_BUG_ON'
   10983 |         BUILD_BUG_ON(TRACE_ITER_LAST_BIT > TRACE_FLAGS_MAX_SIZE);
         |         ^~~~~~~~~~~~


vim +1422 kernel/trace/trace.h

a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1416) 
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1417) /*
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1418)  * By redefining C, we can make TRACE_FLAGS a list of masks that
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1419)  * use the bits as defined above.
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1420)  */
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1421) #undef C
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29 @1422) #define C(a, b) TRACE_ITER_##a = (1 << TRACE_ITER_##a##_BIT)
a3418a364ec3c8f Steven Rostedt (Red Hat  2015-09-29  1423) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
