Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202A1F8691
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604422; cv=none; b=fiDZzU/ChO403SQkofTT2e1Yqwa6IGqSn4GOH+I0gZog3GbUZCi8kP4vord3IVhFC1V8Y7VG6nMpGV9e/JEpvwqkhaFBbLojwnDKFCEba0w8ZlhfRD3GKxXpfjrpP/D5ZDvRxJjteDYZeGdz7qKOBbqay+IG7BHteSa9aSxUba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604422; c=relaxed/simple;
	bh=pE5Dk/tNN7GQkkWwNa2MuvPkOoCWLyh5tiOLS3ktlPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obEZQgeFZSceFYtUP8WbrfIM5SmpBd5siaTRqurAnGvIn7hNqcXacJmDiwr6GHBb+OPusLa7aK7RuwSQyXy6nagfMzSLJf+1dL70hDwqzhAKggccXYialOBE1ZLAHH9vc52Qpk15WhvHZ21taP+0LmEOpOPA218Tl3oGCCsWPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSnR+1Na; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSnR+1Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771604422; x=1803140422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pE5Dk/tNN7GQkkWwNa2MuvPkOoCWLyh5tiOLS3ktlPg=;
  b=JSnR+1NajU5tOxbtZoMRN0WPH9OvvSARUFnTIIK2OieVU2UazuGXrM6F
   ttFOn+NFRAoAiRtxgjYYfzfKHgKqWjqVZi3jkzZPAKkPHVAbK6khKnC8K
   6VfmUXec8Xj1SzIFt0QENReJOBI8CINkdDb5Nrt4awvlb8absbuscv/fW
   vb7SNHUdlQzI0accgpgrC9u0bjcPMyqL+yzdaS5Ly/91iQIbf9ZckEPAH
   OlcrWnA8BizqTAeu9nZ9Lg6MYk+MMFoOqlQ4PMOH0mKBYncm5jqJvV8xY
   41JpECjaUifI2x1hrsX6aa8TGQDV0Ly9ne3SgX3VnpTapjOxPEvR+kKFd
   A==;
X-CSE-ConnectionGUID: q3ZU1JKqSNeQPudSe2hJ5w==
X-CSE-MsgGUID: k5NTww6nQECLijwvJUc1rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84058731"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84058731"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:20:21 -0800
X-CSE-ConnectionGUID: CY61GqzfTMesUVXN0LZfFw==
X-CSE-MsgGUID: OJM5Qx28SX6nU1fRzfGG9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213434934"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2026 08:20:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtTEm-000000014G8-272m;
	Fri, 20 Feb 2026 16:20:16 +0000
Date: Sat, 21 Feb 2026 00:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, m.wieczorretman@pm.me,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] x86/cpu: Check if feature string is non-zero
Message-ID: <202602210027.MJpPrtwD-lkp@intel.com>
References: <bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/smp/core v6.19]
[cannot apply to peterz-queue/sched/core linus/master next-20260219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/x86-cpu-Clear-feature-bits-disabled-at-compile-time/20260220-204916
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman%40pm.me
patch subject: [PATCH v6 2/3] x86/cpu: Check if feature string is non-zero
config: x86_64-randconfig-003-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210027.MJpPrtwD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210027.MJpPrtwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210027.MJpPrtwD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/common.c: In function 'x86_cap_name':
>> arch/x86/kernel/cpu/common.c:1987:29: warning: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Wsizeof-pointer-memaccess]
    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
         |                             ^
>> arch/x86/kernel/cpu/common.c:1987:37: warning: '%u' directive output may be truncated writing between 1 and 9 bytes into a region of size 8 [-Wformat-truncation=]
    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
         |                                     ^~
   arch/x86/kernel/cpu/common.c:1987:36: note: directive argument in the range [0, 134217727]
    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
         |                                    ^~~~~~~
   arch/x86/kernel/cpu/common.c:1987:36: note: directive argument in the range [0, 31]
   arch/x86/kernel/cpu/common.c:1987:9: note: 'snprintf' output between 4 and 13 bytes into a destination of size 8
    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1987 arch/x86/kernel/cpu/common.c

  1973	
  1974	const char *x86_cap_name(unsigned int bit, char *buf)
  1975	{
  1976		unsigned int word = bit >> 5;
  1977		const char *name = NULL;
  1978	
  1979		if (likely(word < NCAPINTS))
  1980			name = x86_cap_flags[bit];
  1981		else if (likely(word < NCAPINTS + NBUGINTS))
  1982			name = x86_bug_flags[bit - 32 * NCAPINTS];
  1983	
  1984		if (name)
  1985			return name;
  1986	
> 1987		snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
  1988		return buf;
  1989	}
  1990	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
