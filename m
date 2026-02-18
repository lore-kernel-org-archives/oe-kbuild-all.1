Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B803090E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451954; cv=none; b=gl6NCUlkH7yE2QCw2MpySI89gGs4kVMm+n3oHujyU29XifrLd6ARVmELWhdxOhHFkF4ywc2YCbGuTIBKEsFmJGDTiOCcUe66WfD1jeoUvS8aK4AlaJUGYH+A4nxNQjUCNMkr7HV7WhR+ceY0lhwh9YfRAkfkJuUGxBMbnb/KfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451954; c=relaxed/simple;
	bh=M/jN9igvRPJTrp2UfJ99pRzYp5TGzjLemF6J2jM/Bwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQm544EN0VtlGjH6JQ8ikSMsHdCQA5rmkNqnLhYTEUvR3uTAZGh1bptHPQk0Hf+0P+P/UONyOVX/eBs/+JlEs6n4LAI6VhBFtSbAFEk6jB5U51X/o2yttbLMvXnap/tC3TW/krFsnp1XhvC+i7ZR5BHtHkPzmYLDiGF2imbNy84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJcmPn6g; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJcmPn6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771451954; x=1802987954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M/jN9igvRPJTrp2UfJ99pRzYp5TGzjLemF6J2jM/Bwo=;
  b=WJcmPn6gUfsHGaoKNaXXUSkek00Zb/9IWRo6rqAf+78BMmX18SI+SKwz
   aobDVWZENLPxerLdQfC2yZO7Ad07kP2xJyidGFDm9clBd/sDzQFl1HFeA
   1eU+T7/2JvzlaSDkJa788uuMrtxfnBC/cZm3xpXCNd+wnccun45DHWMH3
   4sMNhqT545rbbMYyUNeE3bWLoKr+ll2gDA0PrplMt+hDBzxs72VWbELRa
   Rh9tD0hWV7zPTufMh7/ShWhpRK4XTdG9FdLH7wptmI4Vqm0cN1kZrzh8k
   F+5msy9hi3ujkdSgbZMY5dj475/aEY/SJxj4ZhmOiyMhTliWmgxzvQIAx
   w==;
X-CSE-ConnectionGUID: GyxxrIIgQAS66hZ24/Hgzw==
X-CSE-MsgGUID: zPQ6hZjlT8OHeBHkUPSitw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72579901"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72579901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 13:59:14 -0800
X-CSE-ConnectionGUID: MygxkFxzQmqeBTIvp9yt2Q==
X-CSE-MsgGUID: yBFqPkw5RU+cUU79iMsXew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="243064741"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2026 13:59:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vspZc-000000012lU-1TWe;
	Wed, 18 Feb 2026 21:59:08 +0000
Date: Thu, 19 Feb 2026 05:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Reda CHERKAOUI <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Reda CHERKAOUI <redacherkaoui67@gmail.com>
Subject: Re: [PATCH] x86/boot/compressed: make error() take const char *
Message-ID: <202602190529.eucRnnqd-lkp@intel.com>
References: <20260218160319.31884-1-redacherkaoui67@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218160319.31884-1-redacherkaoui67@gmail.com>

Hi Reda,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.19 next-20260218]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Reda-CHERKAOUI/x86-boot-compressed-make-error-take-const-char/20260219-000605
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218160319.31884-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: make error() take const char *
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260219/202602190529.eucRnnqd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190529.eucRnnqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190529.eucRnnqd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/boot/compressed/misc.c: In function 'extract_kernel':
>> arch/x86/boot/compressed/misc.c:521:61: error: passing argument 3 of 'decompress_kernel' from incompatible pointer type [-Wincompatible-pointer-types]
     521 |         entry_offset = decompress_kernel(output, virt_addr, error);
         |                                                             ^~~~~
         |                                                             |
         |                                                             __attribute__((noreturn)) void (*)(const char *)
   arch/x86/boot/compressed/misc.c:345:40: note: expected 'void (*)(char *)' but argument is of type '__attribute__((noreturn)) void (*)(const char *)'
     345 |                                 void (*error)(char *x))
         |                                 ~~~~~~~^~~~~~~~~~~~~~~


vim +/decompress_kernel +521 arch/x86/boot/compressed/misc.c

^1da177e4c3f41 arch/i386/boot/compressed/misc.c Linus Torvalds  2005-04-16  513  
e605a425975b07 arch/x86/boot/compressed/misc.c  Joe Millenbach  2012-07-19  514  	debug_putstr("\nDecompressing Linux... ");
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  515  
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  516  	if (init_unaccepted_memory()) {
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  517  		debug_putstr("Accepting memory... ");
5adfeaecc487e7 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2024-08-09  518  		accept_memory(__pa(output), needed_size);
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  519  	}
3fd1239a783522 arch/x86/boot/compressed/misc.c  Kiryl Shutsemau 2023-06-06  520  
83381519352d6b arch/x86/boot/compressed/misc.c  Ard Biesheuvel  2023-08-07 @521  	entry_offset = decompress_kernel(output, virt_addr, error);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
