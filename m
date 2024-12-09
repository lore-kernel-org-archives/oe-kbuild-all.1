Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C74155C87
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717957; cv=none; b=mc8FMoKhxkNDGVrPY8usa8NB7NwL/DkLPq4EVKCuF/3cshVMS8cx2HkTWMc3o/UcW8JW1/2zo6eYq47mBZsSxJONH3SEjrabsHu/2neqvpnojHm2TIFJOaoG65rSaHSbPjjAQ/Fp8kprJIuhcXalNLPzkHgdOq6yIQrYhRbSTQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717957; c=relaxed/simple;
	bh=zp8zwg1v/0rRuvtcn1LIzYdetcNxAtZ4+5efiS+tdxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyJ1W88wz+XuqRQtkbpK/+yB6nMb2jdTAnFoki1DAY5FDy8ooFsmoXFHSg/qHj7EnV1G8A3/QtvUxbnu6CdO0aO+eGHgFc5+qwmfZSpu9kw6x/dGc8bjajvf/JMb6YSFM/WwfFFbbtaIpxjSwIj/TWzlQMvz0F7AO3vBWOhAqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIwi1rHz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIwi1rHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717955; x=1765253955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zp8zwg1v/0rRuvtcn1LIzYdetcNxAtZ4+5efiS+tdxA=;
  b=EIwi1rHzu61Ho6Kj+1jQWui9MBPpQm3NqCuf95pokE0CsFCLx1UikqB4
   fiiMGHA3crxUOyTUlrXOs6IABo95goCwJNafXcp1xv6AimsupS4BTCa2G
   TYaE4oQBeFHJIiwOd2lOgIRJ7uIQVz3hupzJ9tWP8P6sUa/nNavBLnZCm
   Ju4TCEiAmGojrTu7oLCLlBmenYcLCHWYcKcWMu/bXXZ/AnMavUlRhhluZ
   55howb1mYg2jz+EXjHEuSVJy3i5wG792rCznvLz8DrY/1FL5QLoo6L/V6
   c0mifvpKlGU3JXvyRTwAqJVlRMF6IIFkoZ4ajh6WZy211k+6DnXV3n4mT
   g==;
X-CSE-ConnectionGUID: LB1yPAU+T3m1ShSh5v1rQQ==
X-CSE-MsgGUID: ytePWOTbSseSEcKI60vV1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34236163"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34236163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:19:15 -0800
X-CSE-ConnectionGUID: 7XnRLWcQTAOCyxGyb0LRFw==
X-CSE-MsgGUID: gekYYh6HQUiFahOzGbcbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95750385"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:19:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVEg-0003pR-25;
	Mon, 09 Dec 2024 04:19:06 +0000
Date: Mon, 9 Dec 2024 12:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Tony Luck <tony.luck@intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Eric Biggers <ebiggers@google.com>, Xin Li <xin3.li@intel.com>,
	Alexander Shishkin <alexander.shishkin@intel.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86/cpufeature: Add a debug print for unmet
 dependencies
Message-ID: <202412071926.MHYBbSb1-lkp@intel.com>
References: <20241207004126.2054658-2-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207004126.2054658-2-sohil.mehta@intel.com>

Hi Sohil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/master]
[also build test WARNING on tip/x86/core tip/auto-latest bp/for-next linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sohil-Mehta/x86-cpufeature-Add-a-debug-print-for-unmet-dependencies/20241207-084543
base:   tip/master
patch link:    https://lore.kernel.org/r/20241207004126.2054658-2-sohil.mehta%40intel.com
patch subject: [PATCH v3 2/2] x86/cpufeature: Add a debug print for unmet dependencies
config: x86_64-randconfig-103-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071926.MHYBbSb1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071926.MHYBbSb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071926.MHYBbSb1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/cpuid-deps.c: In function 'filter_feature_dependencies':
>> arch/x86/kernel/cpu/cpuid-deps.c:160:30: warning: '*32+' directive output may be truncated writing 4 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |                              ^~~~
   In function 'x86_feature_name',
       inlined from 'x86_feature_name' at arch/x86/kernel/cpu/cpuid-deps.c:155:20,
       inlined from 'filter_feature_dependencies' at arch/x86/kernel/cpu/cpuid-deps.c:172:4:
   arch/x86/kernel/cpu/cpuid-deps.c:160:27: note: directive argument in the range [0, 31]
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |                           ^~~~~~~~~~~
   arch/x86/kernel/cpu/cpuid-deps.c:160:9: note: 'snprintf' output between 8 and 16 bytes into a destination of size 12
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/cpuid-deps.c: In function 'filter_feature_dependencies':
>> arch/x86/kernel/cpu/cpuid-deps.c:160:30: warning: '*32+' directive output may be truncated writing 4 bytes into a region of size between 3 and 11 [-Wformat-truncation=]
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |                              ^~~~
   In function 'x86_feature_name',
       inlined from 'x86_feature_name' at arch/x86/kernel/cpu/cpuid-deps.c:155:20,
       inlined from 'filter_feature_dependencies' at arch/x86/kernel/cpu/cpuid-deps.c:172:4:
   arch/x86/kernel/cpu/cpuid-deps.c:160:27: note: directive argument in the range [0, 31]
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |                           ^~~~~~~~~~~
   arch/x86/kernel/cpu/cpuid-deps.c:160:9: note: 'snprintf' output between 8 and 16 bytes into a destination of size 12
     160 |         snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +160 arch/x86/kernel/cpu/cpuid-deps.c

   149	
   150	/*
   151	 * Return the feature "name" if available otherwise return
   152	 * the X86_FEATURE_* numerals to make it easier to identify
   153	 * the feature.
   154	 */
   155	static const char *x86_feature_name(unsigned int feature, char *buf)
   156	{
   157		if (x86_cap_flags[feature])
   158			return x86_cap_flags[feature];
   159	
 > 160		snprintf(buf, 12, "%d*32+%2d", feature / 32, feature % 32);
   161	
   162		return buf;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
