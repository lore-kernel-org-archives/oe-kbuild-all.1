Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC42BE7DD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337167; cv=none; b=nuB91Ipa9bFLjYryQ2sy6c5v7V0M8xeAJAEe8BlFqyKe2zOkwiRjezGx+mGJByYVsvmwLSnT/eWJAvyPcLV+xh0elMmBCh5gVJSAqBsInSm6YKT0Z2cNYLf52IsYWiRsMaoAvvrXX2wIJFAgCcAFPZLp3AzXuX3+0gvhX5dTK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337167; c=relaxed/simple;
	bh=rhnNMaNldpuuY6bLfPKspqW4HOto/k+qhHYtxszFafw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1qQ1n+5R4Pohu69PYu5i16AdvEEeq2k3EC5yYS0xrO4AEZoBMf58J4/Y/jffvhaWh8soCK2Na34kJsHgfthkDo6COh4CjKbE+YyjWmUFSO6LN3S6xmXeaBYI75o3YtvPLzkYZ3JcBg1ShSDzth7ou4shrJBSaajoJwaOXkAFsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ll9mpgSY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ll9mpgSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762337163; x=1793873163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rhnNMaNldpuuY6bLfPKspqW4HOto/k+qhHYtxszFafw=;
  b=Ll9mpgSYWpjw78EH9CPAo5qVT+92WdUjYjmGUMK3/YN5BMwU67yHb+rW
   CkX5L5K15280wPG8CIItyX0XVhtlsuanGhF+NWoXWZBQ0C6EtFul71V1E
   yHnOivIpxCcRF67EJmckefqdYCZgpZi099tz45JMqALnX3SB8eRZx8Q/5
   UUeOabLgJQSx/hMvORrHUi5k6YXrgjdAWh5Tlh859B+IJ//a9UhdD6og7
   HFLq55Aub1KcMqg6S/Emc+uAwtJp63GKE5OeYgE/69Bg4p2tWlH5H0dlb
   EURBOoDnx/fBqwAgUZeHHIkdi/CDIWZgDh4lFcULBgmU3EuY5UOQDgg2a
   w==;
X-CSE-ConnectionGUID: KG9KmW/eT9OzQL2uy2KNkQ==
X-CSE-MsgGUID: 8k3hQaC2SeWk5s2eOFAeWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63652159"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="63652159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:06:02 -0800
X-CSE-ConnectionGUID: eGsYSZUDTvuiBTUsFe/q/w==
X-CSE-MsgGUID: YEUFJmhwQw6HC3yWhgzY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="218059658"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2025 02:06:02 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGaOt-000SP4-1E;
	Wed, 05 Nov 2025 10:05:59 +0000
Date: Wed, 5 Nov 2025 18:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Huiwen He <hehuiwen@kylinos.cn>, Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Huiwen He <hehuiwen@kylinos.cn>
Subject: Re: [PATCH] tracing/hist: make err_text array fully const
Message-ID: <202511051755.CU1HPYCx-lkp@intel.com>
References: <20251104045558.1644671-1-hehuiwen@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104045558.1644671-1-hehuiwen@kylinos.cn>

Hi Huiwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on linus/master v6.18-rc4 next-20251105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huiwen-He/tracing-hist-make-err_text-array-fully-const/20251104-125932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251104045558.1644671-1-hehuiwen%40kylinos.cn
patch subject: [PATCH] tracing/hist: make err_text array fully const
config: sh-randconfig-r121-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051755.CU1HPYCx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051755.CU1HPYCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051755.CU1HPYCx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_hist.c:808:53: sparse: sparse: incorrect type in argument 4 (different modifiers) @@     expected char const **errs @@     got char const *const * @@
   kernel/trace/trace_events_hist.c:808:53: sparse:     expected char const **errs
   kernel/trace/trace_events_hist.c:808:53: sparse:     got char const *const *

vim +808 kernel/trace/trace_events_hist.c

4b147936fa5096 Tom Zanussi      2018-01-15  802  
edfeed318d59ff Tom Zanussi      2022-01-28  803  static void hist_err(struct trace_array *tr, u8 err_type, u16 err_pos)
7bbab38d07f318 Masami Hiramatsu 2018-11-05  804  {
edfeed318d59ff Tom Zanussi      2022-01-28  805  	if (!last_cmd)
edfeed318d59ff Tom Zanussi      2022-01-28  806  		return;
edfeed318d59ff Tom Zanussi      2022-01-28  807  
726721a51838e3 Tom Zanussi      2020-05-28 @808  	tracing_log_err(tr, last_cmd_loc, last_cmd, err_text,
726721a51838e3 Tom Zanussi      2020-05-28  809  			err_type, err_pos);
7bbab38d07f318 Masami Hiramatsu 2018-11-05  810  }
7bbab38d07f318 Masami Hiramatsu 2018-11-05  811  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
