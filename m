Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027842AA4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730609721; cv=none; b=jfWv8WYrDIgRyW4OVLbmFhphB7RAbiEHHmwlAFSLac4Fh5NMolaw4onuQgYSNjO0iQfyrz0TRzUfbX4jD5EMD5KJ3D6MtyZ2lwLuGLTtA28ZQm2ljMmlLhA7ieB74muIsk4rYXrHHnal99nWu0ptqOxyLsUJ6f0sXftGPkCua9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730609721; c=relaxed/simple;
	bh=tlQrntuUWRfP2jYT5MQ26UOHKEWeDh6VfzqbpkmBdnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQDv0EljgzKLxPbhFoIfpwGQepzD2/0SjQR1rrnaY+PDrqAovIROdX+PkZLkISt34EIea/OJVONXQS4ODBjX4Y/IILS56BLYIj+oRNt996xSpKrx6y2qaUSQxElptSc+0uiaf6ZcAYdjWhB03E6yBrT6Yo03ZBP+y1JSB36MP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXS1Rhl8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXS1Rhl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730609719; x=1762145719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tlQrntuUWRfP2jYT5MQ26UOHKEWeDh6VfzqbpkmBdnM=;
  b=QXS1Rhl8hhNMJPXHka2CflwWjwqAHsfZ4SnkBJG20RMulHMZPqEVNIyV
   b+sV/s9ShH/+iVo+HmyUXXoBfMeshWrBvmOJexvTEuh443wHUkDfwzDq0
   Ev4HRR/FmLJwA48LVY/+ITG4hHOLP+E0kffc7cCmoA4C26hnprcsVthMm
   SwKVcYH3mVTUuCurUi+MmK1kBVk7vB2ijARt1GTlsf4ny+N1oKdbsBqCC
   JdWDHA5K1E4BiZvt+B14MHFqcJan2U/M4wAFwWchPVUe6VYkmzqOt4EWc
   S30MxStr8qvLHgss3XTCvrc4v35TgAHJ65nu+SToGXgtqCY21kiUMh/9J
   A==;
X-CSE-ConnectionGUID: qpjNr4/dR3maleHhgQaoug==
X-CSE-MsgGUID: dXh66sOtR86t5u/DFrRH/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="29748598"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="29748598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 21:55:16 -0700
X-CSE-ConnectionGUID: Gd8XBjQMQ8i3R2rqK/h5Pw==
X-CSE-MsgGUID: t9neAcF7T+yWCCRI/ZSZ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83673950"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2024 21:55:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Sdq-000jhd-2r;
	Sun, 03 Nov 2024 04:55:10 +0000
Date: Sun, 3 Nov 2024 12:54:14 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Peterson <benjamin@engflow.com>
Cc: oe-kbuild-all@lists.linux.dev, Benjamin Peterson <benjamin@engflow.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf trace: avoid garbage when not printing an trace
 event's arguments
Message-ID: <202411031202.CkbT89xW-lkp@intel.com>
References: <20241101005338.5846-1-benjamin@engflow.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101005338.5846-1-benjamin@engflow.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Peterson/perf-trace-avoid-garbage-when-not-printing-an-trace-event-s-arguments/20241101-085413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20241101005338.5846-1-benjamin%40engflow.com
patch subject: [PATCH] perf trace: avoid garbage when not printing an trace event's arguments
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031202.CkbT89xW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031202.CkbT89xW-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:652: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.12.rc3.g6e02cf5e2f22
   builtin-trace.c: In function 'trace__fprintf_tp_fields':
>> builtin-trace.c:3090:35: error: field precision specifier '.*' expects argument of type 'int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Werror=format=]
    3090 |         fprintf(trace->output, "%.*s", printed, bf);
         |                                 ~~^~   ~~~~~~~
         |                                   |    |
         |                                   int  size_t {aka long unsigned int}
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:105: tools/perf/builtin-trace.o] Error 1
   make[5]: *** [Makefile.perf:762: tools/perf/perf-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
