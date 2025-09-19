Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC433218D5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 17:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301808; cv=none; b=Jdn09jSSM3xPRiFQI82KNkh3I9j6LKHV/e8IrwruheKe6AEfW1gdz3IBF9W90D5UGhPAZPFiJFDHhiHUXiyjDlfbvpOwTiyWpplFyvUQgB0+WVDFxSORyYXXUaLWM0OaHmRvudySHFrXYw5vSRyqtMoLWUAss5BQ6MSRD48GfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301808; c=relaxed/simple;
	bh=3nVGTP0/fZdnddm/qDL66fSIowau9y5iui5bnICxuoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ06mXabKiSQoLI9H7Y20kPhu4emC9NWMx/Gta7gv3lDZAbJIxx3fwMlDd9yophBjwm9Z74+aVAibA2oYLPWAF5kWrDwxsXEF9SoxBkVDcJfIMxa08m+LUUjQQfUvq/J6zhBRROXkclYmFSLQkj8i3OLx37P5EPhWFEDqDWnamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ/OwYae; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ/OwYae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758301807; x=1789837807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3nVGTP0/fZdnddm/qDL66fSIowau9y5iui5bnICxuoE=;
  b=aJ/OwYaeHljXcW8FaP35z5EShgdo0gyG0/GvTOVsLxPz7C3dB8LK6x+5
   Zm0jdwfsJS7bvopni3ftdeycqJ+0eOFCKna+uJ+FUHK08LP3ZVd5AKmwX
   fFBzaJ+a3VxSFaj+Gj61sJsLXO1cPGLdIWJVpbv6pbPUUHddFFJU2F7n0
   4X6lA3TiIDA0dsQ/ozr58GR7HhBl67MSaGVPm0Q44eUXeNIHzSwwGbgQK
   4A2ls4ih2K/Mz3QE1yQx5Db7cyuknd0kfeH97obp7ygZrZw57m151KyPn
   73TTnUF6+64d+L5mlKegrOwffbcujBJ2okh8Mu7X69wrwHlZUkJNiQo09
   g==;
X-CSE-ConnectionGUID: 8ZCg0CKoQKuMpCnhZQw+mw==
X-CSE-MsgGUID: NkWdvRDAQTqNUVjuyxHitA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60598202"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60598202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 10:10:03 -0700
X-CSE-ConnectionGUID: +iRlAc/qRFmsQ8D/KqdCjQ==
X-CSE-MsgGUID: 6+mE80nkQuOnZezyjd7KmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175805686"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2025 10:10:01 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzecR-0004ZX-1E;
	Fri, 19 Sep 2025 17:09:59 +0000
Date: Sat, 20 Sep 2025 01:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] tracing: Add an option to show symbols in _text+offset
 for function profiler
Message-ID: <202509200025.UH0WU2Qw-lkp@intel.com>
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
config: arc-randconfig-001-20250919 (https://download.01.org/0day-ci/archive/20250920/202509200025.UH0WU2Qw-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200025.UH0WU2Qw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200025.UH0WU2Qw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c: In function 'create_trace_options_dir':
>> kernel/trace/trace.c:526:16: error: 'TRACE_ITER_PROF_TEXT_OFFSET' undeclared (first use in this function); did you mean 'TRACE_ITER_CONTEXT_INFO'?
     526 |                TRACE_ITER_PROF_TEXT_OFFSET)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9316:34: note: in expansion of macro 'TOP_LEVEL_TRACE_FLAGS'
    9316 |                     !((1 << i) & TOP_LEVEL_TRACE_FLAGS))
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:526:16: note: each undeclared identifier is reported only once for each function it appears in
     526 |                TRACE_ITER_PROF_TEXT_OFFSET)
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9316:34: note: in expansion of macro 'TOP_LEVEL_TRACE_FLAGS'
    9316 |                     !((1 << i) & TOP_LEVEL_TRACE_FLAGS))
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +526 kernel/trace/trace.c

   512	
   513	/* trace_flags holds trace_options default values */
   514	#define TRACE_DEFAULT_FLAGS						\
   515		(FUNCTION_DEFAULT_FLAGS |					\
   516		 TRACE_ITER_PRINT_PARENT | TRACE_ITER_PRINTK |			\
   517		 TRACE_ITER_ANNOTATE | TRACE_ITER_CONTEXT_INFO |		\
   518		 TRACE_ITER_RECORD_CMD | TRACE_ITER_OVERWRITE |			\
   519		 TRACE_ITER_IRQ_INFO | TRACE_ITER_MARKERS |			\
   520		 TRACE_ITER_HASH_PTR | TRACE_ITER_TRACE_PRINTK |		\
   521		 TRACE_ITER_COPY_MARKER)
   522	
   523	/* trace_options that are only supported by global_trace */
   524	#define TOP_LEVEL_TRACE_FLAGS (TRACE_ITER_PRINTK |			\
   525		       TRACE_ITER_PRINTK_MSGONLY | TRACE_ITER_RECORD_CMD |	\
 > 526		       TRACE_ITER_PROF_TEXT_OFFSET)
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
