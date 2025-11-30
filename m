Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CEB224B04
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764519844; cv=none; b=D33kGxLfKX7BR1IYT8YoBkcpSWKdVQP0njbnB8Rn5BBl87pl5QoEXr9k4498CwfUjU5m0Tnl0i9j/2FDR4JE59bWkpoDuJhX6KSc098oL1ZSZX73Utw6uP5aIKqVBVot/1kRx3YySyQb3V+zBx/38MyrqntfS+oAUwlya4oxZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764519844; c=relaxed/simple;
	bh=ANV47WWyixiegLM8aItrNKS3lqFtimpW1slvpEkn+F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHiLCqAlv9jK9IYnesJUJdurfr3jxQ4dTQgQYJTckOTHicCwCyO/8siF63KIM3FMCbzqiXGvfXpJMxDAuc13gnomGZ0xnBdajGmD3UMWrXtboZ46zjRpVgJ6suQ/1xTQMU8d96mD3OfOuW+FM98PGVFxpIViLa/xAxW4UMbIgjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alYdVQQ7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alYdVQQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764519842; x=1796055842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANV47WWyixiegLM8aItrNKS3lqFtimpW1slvpEkn+F0=;
  b=alYdVQQ7kHjZa94Rz+xs8ao9AmnZzdLDqimMsBOm1YB68a1NYueb4iyC
   0F4ar3v8M6WLSef41Uzcrbp/8rZjydIxbbCKR+B28FaVUQkZoKimxbKIy
   LnDGZK313VaR5+C+JIymyRm6rZUMJSxIt5HqGpHX8Zuv889ON4Twy1nFC
   W4ComKFV5om0yOEhr5J8tGabyR06D78kMJhvnZaIe824xr1LObD8XRrlw
   Kl+ndnNguZripOYcA0GUxg5DrIv9atQoAtoMoplAvMz6YPhgt5BabFpQQ
   Qjd/FxuSeldGIXBR1fzI7s4IuVsi9QFFjbvL3eH9bBqTCp09u5zNe2Z+1
   w==;
X-CSE-ConnectionGUID: 1JOGiqfYTziuOjHXFUPPWQ==
X-CSE-MsgGUID: 2KUeJMXUQXS1YjOsMQQuKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66496187"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66496187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 08:24:02 -0800
X-CSE-ConnectionGUID: 6OIWPOoJQa+Wyi/MKHt0Fg==
X-CSE-MsgGUID: vdlx9HuNSmKD3FPrNRZGuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="231148170"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2025 08:24:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPkDP-00000000849-17dt;
	Sun, 30 Nov 2025 16:23:59 +0000
Date: Mon, 1 Dec 2025 00:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across
 arches
Message-ID: <202511302317.BGFIlAYX-lkp@intel.com>
References: <20251127105958.2427758-3-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127105958.2427758-3-ryan.roberts@arm.com>

Hi Ryan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on kees/for-next/hardening kees/for-next/pstore kees/for-next/kspp linus/master v6.18-rc7 next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20251127-190408
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251127105958.2427758-3-ryan.roberts%40arm.com
patch subject: [RFC PATCH v1 2/2] randomize_kstack: Unify random source across arches
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251130/202511302317.BGFIlAYX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511302317.BGFIlAYX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511302317.BGFIlAYX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_syscall_64+0x1a2: call to prandom_u32_state() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __do_fast_syscall_32+0xfd: call to prandom_u32_state() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
