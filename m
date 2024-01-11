Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE4D5100A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO1CbsFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704992913; x=1736528913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pZADfUlkNjpKkgkO8I89jRqUgQvYhM2PinPZp/8ueuk=;
  b=hO1CbsFgjDJLbrK4DOTT3HTvEbBwtHDvgX+ZhL8TUdloYSfaiadvqaOD
   xAmZH8refQmziIcpVdKYPCpXiUmrdKMH5ETZinnd/YiC4vd/jLsbbSh+a
   Sk538Hy6ToiO5Nn1RwZCqVgOY8pTXMmPyObFCE/i6z7Ih4xSiiGdFvWh3
   jmB55Mn1Sw0GLLCdH46QIUNNFoZApznmYVKcs53x6ETu9f1mM7IWwZMon
   hssr4JahBA7EP62NTx6o40XcczAy92bXDbs98IA7aJ27kV99JoVXnGNru
   AX+IqI7gxz8o5GG6rVhHAS6dZKohJYy0dLrgDJYhTn7CdICAjAhxaqThW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="430098457"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="430098457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 09:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="31086890"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2024 09:07:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNyX5-0008WK-12;
	Thu, 11 Jan 2024 17:07:55 +0000
Date: Fri, 12 Jan 2024 01:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Galo <carlosgalo@google.com>, rostedt@goodmis.org,
	akpm@linux-foundation.org, surenb@google.com
Cc: oe-kbuild-all@lists.linux.dev, android-mm@google.com,
	kernel-team@android.com, Carlos Galo <carlosgalo@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm: Update mark_victim tracepoints fields
Message-ID: <202401120052.rdFjpivG-lkp@intel.com>
References: <20240111001155.746-1-carlosgalo@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111001155.746-1-carlosgalo@google.com>

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0dd3ee31125508cd67f7e7172247f05b7fd1753a]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Galo/mm-Update-mark_victim-tracepoints-fields/20240111-081635
base:   0dd3ee31125508cd67f7e7172247f05b7fd1753a
patch link:    https://lore.kernel.org/r/20240111001155.746-1-carlosgalo%40google.com
patch subject: [PATCH] mm: Update mark_victim tracepoints fields
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240112/202401120052.rdFjpivG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120052.rdFjpivG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120052.rdFjpivG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/oom.h:206,
                    from mm/oom_kill.c:54:
   include/trace/events/oom.h: In function 'trace_raw_output_mark_victim':
>> include/trace/stages/stage3_trace_output.h:6:17: error: called object is not a function or function pointer
       6 | #define __entry field
         |                 ^~~~~
   include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
     203 |         trace_event_printf(iter, print);                                \
         |                                  ^~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(print));                   \
         |                              ^~~~~~
   include/trace/events/oom.h:74:1: note: in expansion of macro 'TRACE_EVENT'
      74 | TRACE_EVENT(mark_victim,
         | ^~~~~~~~~~~
   include/trace/events/oom.h:93:9: note: in expansion of macro 'TP_printk'
      93 |         TP_printk("pid=%d uid=%u comm=%s oom_score_adj=%hd",
         |         ^~~~~~~~~
   include/trace/events/oom.h:95:17: note: in expansion of macro '__entry'
      95 |                 __entry->uid
         |                 ^~~~~~~
>> include/trace/trace_events.h:203:39: error: expected expression before ')' token
     203 |         trace_event_printf(iter, print);                                \
         |                                       ^
   include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/events/oom.h:74:1: note: in expansion of macro 'TRACE_EVENT'
      74 | TRACE_EVENT(mark_victim,
         | ^~~~~~~~~~~


vim +6 include/trace/stages/stage3_trace_output.h

af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  4) 
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  5) #undef __entry
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03 @6) #define __entry field
af6b9668e85ffd include/trace/stages/stage3_defines.h Steven Rostedt (Google  2022-03-03  7) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
