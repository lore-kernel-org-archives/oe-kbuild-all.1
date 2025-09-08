Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FE30E0D4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 15:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347153; cv=none; b=ASD2TkShmRGH/9F89iCr4ViQQPDVwX6PQz/Lea8BPepoB4lkguNimbRLeSjG5rm4UGDp9iNIL0rXYz3lvGFAUzi8JIS8uvcERrfOYW0guC31QnAt30OG7uuPK20rqnpz6bS3i/MARWKEpBI7Lqo7HuAibTknfVzCqZh5tgkAL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347153; c=relaxed/simple;
	bh=xCUyIzkokFyh1aGc/VterbWL8vvOmdg3NPjiNZE/5Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSfiVObsFpvrxjMRnDftWvAB/0KwiBm42Jep6giuSbNnIe2QotXga0OL5yeLFWEgaSeSXKdOuJmfwXRsO0FwGZP8Yt2f1PxD/4Ki0MCLUOpWl27CInXGz/BMyz23eadyisThzUXs+ejDf1/2qAB2Eqh92eKProAzqtBIGisa7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXjAyY5g; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXjAyY5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757347151; x=1788883151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xCUyIzkokFyh1aGc/VterbWL8vvOmdg3NPjiNZE/5Ik=;
  b=PXjAyY5g32FNOfhy0UY6QDh/PBOCTpUtpDah7uiwtUGMUlu1eGZcGt43
   l5wCdcsU8Dhn4Tkrjy4q+q35BQHWQXHXgVC0JHmi4EOIZjvplTXwWMc2q
   0O7/IWnfbqZqvVZxzeFlqrLKTVWYdPrHCtW99DZjNyzUNeBr5+KgiYXk/
   QUR/xQFmMB6WoDAqwa63ILaGnaMJQMxE7maAmh+NashfyIZz3/hT75HZl
   QPflZcI/lyDe8HIVkqMROA2VHEwWcIzgSxslsBs6KsEA5rS3Wi8LQmxRe
   bibI71AZue2c0lYUkdjhZunf8feTHL6V5+DMAcn3LTH8R+pZX7wSdD26D
   Q==;
X-CSE-ConnectionGUID: 35Lm4lYzTiyKnwOvpPdMHw==
X-CSE-MsgGUID: jVnKGl+0SyqHWJBwA3xSTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63436138"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="63436138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 08:59:10 -0700
X-CSE-ConnectionGUID: yHhk/hOwQx+qtpONdaiyGQ==
X-CSE-MsgGUID: 9gYAcaQLScO9hXxFBGUr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="178027557"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Sep 2025 08:59:09 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uveGo-0003wh-2w;
	Mon, 08 Sep 2025 15:59:06 +0000
Date: Mon, 8 Sep 2025 23:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event based
 on hardware breakpoint
Message-ID: <202509082349.0H9KO10d-lkp@intel.com>
References: <175708429018.64001.14265428106568623070.stgit@devnote2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175708429018.64001.14265428106568623070.stgit@devnote2>

Hi Masami,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on tip/x86/core perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools peterz-queue/sched/core linus/master v6.17-rc5 next-20250908]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masami-Hiramatsu-Google/tracing-wprobe-Add-watchpoint-probe-event-based-on-hardware-breakpoint/20250905-230532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/175708429018.64001.14265428106568623070.stgit%40devnote2
patch subject: [PATCH v2 1/6] tracing: wprobe: Add watchpoint probe event based on hardware breakpoint
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250908/202509082349.0H9KO10d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509082349.0H9KO10d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509082349.0H9KO10d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace_wprobe.c: In function '__register_trace_wprobe':
>> kernel/trace/trace_wprobe.c:176:20: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
     176 |         if (IS_ERR((void * __force)tw->bp_event)) {
         |                    ^
   kernel/trace/trace_wprobe.c:177:35: warning: cast to generic address space pointer from disjoint '__seg_gs' address space pointer
     177 |                 int ret = PTR_ERR((void * __force)tw->bp_event);
         |                                   ^


vim +/__seg_gs +176 kernel/trace/trace_wprobe.c

   162	
   163	static int __register_trace_wprobe(struct trace_wprobe *tw)
   164	{
   165		struct perf_event_attr attr;
   166	
   167		if (tw->bp_event)
   168			return -EINVAL;
   169	
   170		hw_breakpoint_init(&attr);
   171		attr.bp_addr = tw->addr;
   172		attr.bp_len = tw->len;
   173		attr.bp_type = tw->type;
   174	
   175		tw->bp_event = register_wide_hw_breakpoint(&attr, wprobe_perf_handler, tw);
 > 176		if (IS_ERR((void * __force)tw->bp_event)) {
   177			int ret = PTR_ERR((void * __force)tw->bp_event);
   178	
   179			tw->bp_event = NULL;
   180			return ret;
   181		}
   182	
   183		return 0;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
