Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A1E1C861A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771461259; cv=none; b=CNeJOL9sVJtzrB2a8q4Ty//Zl5otn9YQLQtzvInFmfWPjzSUZl1c1DTh7X4Tak/oVfUHSlwiydkmHZVWSYBlYgeNRKGnFV1dy+66qhDcjTkmpuR3W2UBtF5I47WJQ+Jmk68lBFxnCbEKro616UOCfbogfsAAl2EqC8ZVRtOPGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771461259; c=relaxed/simple;
	bh=6dCPg7iD5q15ZG1EV1/k1+vlVGaZqXrGn9/zen4jC1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWydtA4DMuNL4uFhpLfeRaSX8WIIBaQoOc1PLVdqmfEVwQnR5CLmTHR7DOBkyDGFo+HWgBj/WGF8JJRC0W2z4vb8l41Q/BUOxifNE1U3qV0tnYsfJd6CSTVdTaBIHRkT1qMfrm7rOSl+IgbZebPssWo9hXYoKAGcAxdcfkRyUVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REnxm6PT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REnxm6PT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771461259; x=1802997259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6dCPg7iD5q15ZG1EV1/k1+vlVGaZqXrGn9/zen4jC1M=;
  b=REnxm6PTDGL+2DgbXGoNGvahXwJ1dKacb9rL58/XqId/8bP9f+DiV8Wa
   Jyii1Z6Z2jeQYOxgQyYYSgewAKWYX9VS8Il5aaTpeRkdkz8awk3He1AMn
   Bo2cIM4Gc9dOW4zuDWDKlbJ49nLXhu7CzabznSkalU4xGcYGSItH/43Dg
   iyC9DZNJK4/TMoH+Mc0NDVbckwru3ECtyl54ZHT4n8qJAS8nj6F4BmzEn
   FMzG0/4fiI4hqxLJlylcDe0jNNmxDB3xSvoSnZVbj1DDlruy1Tn4cfwTF
   +N360jey5KgMkr1hVa53xOr9MQPq2U/j+Emh3lv726bBOK0BTYPe92QNJ
   g==;
X-CSE-ConnectionGUID: SciVyuQeSBOCLGwsu6QENw==
X-CSE-MsgGUID: 4OyQYQs/Qoil2H8jnKIbEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72435043"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72435043"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:34:17 -0800
X-CSE-ConnectionGUID: eikbvqaiSUuKl55eXoehkQ==
X-CSE-MsgGUID: FWs6AVsBSB+L68Kc+Z3QCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="252056758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Feb 2026 16:34:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsrzg-000000012pk-08gZ;
	Thu, 19 Feb 2026 00:34:12 +0000
Date: Thu, 19 Feb 2026 08:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Reda CHERKAOUI <redacherkaoui67@gmail.com>, x86@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	Reda CHERKAOUI <redacherkaoui67@gmail.com>
Subject: Re: [PATCH] x86/boot/compressed: make error() take const char *
Message-ID: <202602190801.5xGbl6Eh-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.19 next-20260218]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Reda-CHERKAOUI/x86-boot-compressed-make-error-take-const-char/20260219-000605
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260218160319.31884-1-redacherkaoui67%40gmail.com
patch subject: [PATCH] x86/boot/compressed: make error() take const char *
config: x86_64-buildonly-randconfig-002-20260219 (https://download.01.org/0day-ci/archive/20260219/202602190801.5xGbl6Eh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190801.5xGbl6Eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190801.5xGbl6Eh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/boot/compressed/misc.c: In function 'extract_kernel':
>> arch/x86/boot/compressed/misc.c:521:61: warning: passing argument 3 of 'decompress_kernel' from incompatible pointer type [-Wincompatible-pointer-types]
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
