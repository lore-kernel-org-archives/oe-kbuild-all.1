Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BB3318140
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 00:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766536389; cv=none; b=KtGyNjZafpAmu0c+8chKPcET3t8+ItsWl2gYDzECEPQHKI90wxnvvF+AOFgtGsR9XQM42cFGnhQ3wOl3fE+zMODxaZWunNKhcs8IJvNQTVpcvTnV/+BJ9TvNU3cLV2b6spDy7LXnWnLBVRl77UQKAYbGoiEZ5AJLxcV+qvGPvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766536389; c=relaxed/simple;
	bh=sc/21pFHzi4ubu5IS0OgNd+vZt50kE9eCh7PGamP2iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUYOnrc84Ms4kT+jm3hBmB7TjdTQ+L//qMlTyEENgpr/A5qCMhJcxNbPRfZ3cpK+BKeD70miTDyJhlcIf6EulBBuCYOH+owTzOB+N8AmgOSuqHiWAZxGJlC2RvFYcFUaX8PMOTZOd7cZaRXKKzO4jj2PR/F3VMvfwDKcmO/7VQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeRlx3ID; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeRlx3ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766536387; x=1798072387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sc/21pFHzi4ubu5IS0OgNd+vZt50kE9eCh7PGamP2iY=;
  b=jeRlx3IDhdNstNI51wGaWFcDtvKFSu+6pik/ShV2RjaoQoiqzJ68imND
   IRy+S70BOcxQG6T6rJmV1xL/l8eltSsfsaJErgxbjRWuVYFJRtNcsCC25
   H47kv0aLzBjtPM+oUeMXNjAtb6CoQObRRSt2dByWCstHl4newiWu8LxNP
   kreyAsUbEKsOKwATdw+arMr075aqLslGubH/qiPaB8U1XaKHSDdVrB+IE
   ixKdZDyUjHehZ1nZTMQSoLeB7vEH9C0h3WJ2aH8FS9abd9j3Q4zXg9ZoN
   7/D7NPOxkuSubID2um7sLgTa2OPzimbYEYSIYZVvcCzTBH6v2A+IC3TME
   A==;
X-CSE-ConnectionGUID: iV3UB3RMRdeQghDaSkv6bg==
X-CSE-MsgGUID: 76pPolw7R9OXvC8J0Cc2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72010301"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="72010301"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 16:33:07 -0800
X-CSE-ConnectionGUID: buiGrgzcTvytMMUaO37q0Q==
X-CSE-MsgGUID: V5zvbk7rTXObV3Jws+UL4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230557269"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 16:33:03 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYCoE-000000002Vp-13K0;
	Wed, 24 Dec 2025 00:32:58 +0000
Date: Wed, 24 Dec 2025 08:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yazhou Tang <tangyazhou@zju.edu.cn>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, tangyazhou518@outlook.com,
	shenghaoyuan0928@163.com, ziye@zju.edu.cn
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for
 signed and unsigned BPF_DIV
Message-ID: <202512240848.WegL0AOr-lkp@intel.com>
References: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223091120.2413435-2-tangyazhou@zju.edu.cn>

Hi Yazhou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yazhou-Tang/bpf-Add-interval-and-tnum-analysis-for-signed-and-unsigned-BPF_DIV/20251223-171652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251223091120.2413435-2-tangyazhou%40zju.edu.cn
patch subject: [PATCH bpf-next v2 1/2] bpf: Add interval and tnum analysis for signed and unsigned BPF_DIV
config: alpha-randconfig-r131-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240848.WegL0AOr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240848.WegL0AOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240848.WegL0AOr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/tnum.c:16:19: sparse: sparse: symbol 'tnum_empty' was not declared. Should it be static?

vim +/tnum_empty +16 kernel/bpf/tnum.c

    11	
    12	#define TNUM(_v, _m)	(struct tnum){.value = _v, .mask = _m}
    13	/* A completely unknown value */
    14	const struct tnum tnum_unknown = { .value = 0, .mask = -1 };
    15	/* Not well-formed Tnum, whose concrete value is empty set. */
  > 16	const struct tnum tnum_empty = { .value = -1, .mask = -1 };
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
