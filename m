Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4CD2FF67A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771621594; cv=none; b=ukNutxgWnHhhbuqw7ySpbO+KqlyTkJ42Ze4BWd9HR8G8i4TqYl5n8IOqTH62w6BmJOWYXJO4Yw0kzuLSRi/pLTkIJdAT/utI6POQTEF1t78LWGBZZtm1piH0DbHvUuPatdT2EkUyfXb1WIgXauXPqaqvacYjAhOrS7SgHAwZ3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771621594; c=relaxed/simple;
	bh=0l1zRn0BjjZyih9eoGFMd8k872C/OrBIh6RdpoOVbSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQgkc8s38qB3gHVtya2pgNTf4jM6XdhKFcHJ9w2kHIIoL1M85LUkg/wA1d9RTf9xzEztsRn6aEXhgKK1DPlkx08uimHT5iC0LhlmGZKWuq/RLo5HwnC8AMHoCWaMOq4h839TNKTBzV55cu6BivC+A8E9jlazwcgEX3JGpJFvclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gr+SIYgk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gr+SIYgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771621594; x=1803157594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0l1zRn0BjjZyih9eoGFMd8k872C/OrBIh6RdpoOVbSM=;
  b=gr+SIYgk3pk5y0qss44NVy+X8t3Y+IWCfv7QzGj7Rfy93NS2mzLl696W
   23vt5UciaaEt6XEDn3KLg3LMtCx+6VoOqZqFwIigfxwK/xmkwdm2lBxSh
   lYuDaXT2GlybFTU9u1MgWI36bvLXSzdSCX/3DSerC6FeRQbXHrJ37oL52
   oUNBrVbxIx21yK09172aAxyM7DOXXYeb9WBELtY2eSyvwtG1AmuQBvLjJ
   Y4xW6Y7kS05DgbIxZ1VAey7DchLy6FQDF7T3KLDI6b4luiFRAsF4DWNuu
   obQo3rbJYRuZyQ8L60Drj335MXR+GEEozTIYQTAHVk+XZnAtys+Bn72nt
   A==;
X-CSE-ConnectionGUID: uZiwRdn7TGWqLmzRWBOL0Q==
X-CSE-MsgGUID: 75Enw0UkRpyjT87y5rHsFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="83820528"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="83820528"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 13:06:34 -0800
X-CSE-ConnectionGUID: VGF/h1lMSieZ3YzQ4bKR6g==
X-CSE-MsgGUID: jKiZJGnbQCy6OuuX+DIAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="213038238"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Feb 2026 13:06:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtXhk-000000014Tc-1J1j;
	Fri, 20 Feb 2026 21:06:28 +0000
Date: Sat, 21 Feb 2026 05:05:40 +0800
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
Message-ID: <202602210429.MpUz6J91-lkp@intel.com>
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
[cannot apply to peterz-queue/sched/core linus/master next-20260220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/x86-cpu-Clear-feature-bits-disabled-at-compile-time/20260220-204916
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman%40pm.me
patch subject: [PATCH v6 2/3] x86/cpu: Check if feature string is non-zero
config: x86_64-randconfig-r051-20260221 (https://download.01.org/0day-ci/archive/20260221/202602210429.MpUz6J91-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210429.MpUz6J91-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:1987:15-21: ERROR: application of sizeof to pointer

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
