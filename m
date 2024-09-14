Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234841CFEAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331173; cv=none; b=luPdfrUjnRRP3KZg4sO0sSpsy2I7vx9diW9XRdiNL1nWopwabL3xkcjGMhrGx6g2Rr5tiOOwdCHf+UXnbs3jgBq83qPD148tVFl8AuucJTB4IJ0tG79xLi1QWTB2IJ8m2oFYYrntD3nNC0q+1VQrh9kXtD38GtbB+1vzPSrjvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331173; c=relaxed/simple;
	bh=owm3wLExjKfYS7r9e951leRPb2HIdxsZZnAYlhpppLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL2csRlpIVsb/KelMqei8tGdBX+l2q8qjB2SbBBD3qzxhv4mI4nHpYbG5lg2U6gwymNmpZvnc11kjJUsovRVzV6rW8O0+XSCQ1xB9l7kM9NxaqW19NMJKKup5XM5Xcixn7Jy01LgMowwonOrs7xH7/U8qUchzFwNK35XqXHvss0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwMAhlVk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwMAhlVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726331171; x=1757867171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owm3wLExjKfYS7r9e951leRPb2HIdxsZZnAYlhpppLQ=;
  b=HwMAhlVkb9RlnWBULNNyL2KAuJTYF5UcyB0W+89w7qTha7DsB9bdmfom
   frgccwQWvrRuF4K2FRVlqGjmS0GxAHqKSXoiBjLhK1/JRbfh43i5b1HAs
   s/MRbX8hyVcHdY2zwzxH1THovIc0wxbjHTKkeNuzo26J0GAWE3iWuJqXT
   zgyBeYU5Xvc1PXp9PyhmR1VIsP4KroIkLXznYRXdCnnIIKdA6FYXifYfi
   6ShholQa2MJ2BlwBp4EbSj/+JwBNSSQTerWmhKhu7qfbna4L1MScTB2th
   VednATxFu73ecst839DZ4sUPCQzEt9OeEu8FE/RdxoiSW6PQqHKnsbSMe
   g==;
X-CSE-ConnectionGUID: sdOPgVMJSTCoWjhU0IGWmw==
X-CSE-MsgGUID: Icu/Bf1DRBqJOxz/mwf8EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="29116292"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="29116292"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 09:26:10 -0700
X-CSE-ConnectionGUID: ixyxICedRTWO4oQ7GriRag==
X-CSE-MsgGUID: rCnLIjaMTPutWROq4IwSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="73438157"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Sep 2024 09:26:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spVb4-0007wv-1o;
	Sat, 14 Sep 2024 16:26:06 +0000
Date: Sun, 15 Sep 2024 00:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
Message-ID: <202409150012.aKxn8ZBV-lkp@intel.com>
References: <37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.11-rc7 next-20240913]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/37de872b0894b21408754ae2903b7701cc6dfab7.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 04/11] unwind/x86/64: Add HAVE_USER_UNWIND_SFRAME
config: x86_64-randconfig-121-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150012.aKxn8ZBV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150012.aKxn8ZBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150012.aKxn8ZBV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/sframe.c:94:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sframe_fde [noderef] __user *first @@     got void * @@
   kernel/unwind/sframe.c:94:15: sparse:     expected struct sframe_fde [noderef] __user *first
   kernel/unwind/sframe.c:94:15: sparse:     got void *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:98:21: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:98:21: sparse:     got signed int [usertype] *
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:98:21: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:134:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *f @@     got void * @@
   kernel/unwind/sframe.c:134:11: sparse:     expected void [noderef] __user *f
   kernel/unwind/sframe.c:134:11: sparse:     got void *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:138:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:138:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:138:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:138:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:149:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:149:17: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:149:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:149:17: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:149:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:149:17: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:149:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned char [usertype] * @@
   kernel/unwind/sframe.c:166:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:166:9: sparse:     got unsigned char [usertype] *
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] * @@
   kernel/unwind/sframe.c:166:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:166:9: sparse:     got unsigned short [usertype] *
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   kernel/unwind/sframe.c:166:9: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:166:9: sparse:     got unsigned int [usertype] *
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:166:9: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:173:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed char [usertype] * @@
   kernel/unwind/sframe.c:173:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:173:17: sparse:     got signed char [usertype] *
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:173:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed short [usertype] * @@
   kernel/unwind/sframe.c:173:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:173:17: sparse:     got signed short [usertype] *
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:173:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:173:17: sparse:     got signed int [usertype] *
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:173:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed char [usertype] * @@
   kernel/unwind/sframe.c:179:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:179:17: sparse:     got signed char [usertype] *
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed short [usertype] * @@
   kernel/unwind/sframe.c:179:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:179:17: sparse:     got signed short [usertype] *
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got signed int [usertype] * @@
   kernel/unwind/sframe.c:179:17: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/sframe.c:179:17: sparse:     got signed int [usertype] *
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
   kernel/unwind/sframe.c:179:17: sparse: sparse: cast removes address space '__user' of expression
>> kernel/unwind/sframe.c:303:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   kernel/unwind/sframe.c:303:36: sparse:     expected void const [noderef] __user *from
   kernel/unwind/sframe.c:303:36: sparse:     got void *

vim +94 kernel/unwind/sframe.c

6ce9812d0cc74f Josh Poimboeuf 2024-09-14   85  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   86  static int find_fde(struct sframe_section *sec, unsigned long ip,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   87  		    struct sframe_fde *fde)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   88  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   89  	s32 func_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   90  	struct sframe_fde __user *first, *last, *mid, *found;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   91  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   92  	ip_off = ip - sec->sframe_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   93  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  @94  	first = (void *)sec->fdes_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   95  	last = first + sec->fdes_nr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   96  	while (first <= last) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   97  		mid = first + ((last - first) / 2);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  @98  		if (get_user(func_off, (s32 *)mid))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14   99  			return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  100  		if (ip_off >= func_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  101  			found = mid;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  102  			first = mid + 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  103  		} else
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  104  			last = mid - 1;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  105  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  106  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  107  	if (!found)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  108  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  109  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  110  	if (copy_from_user(fde, found, sizeof(*fde)))
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  111  		return -EFAULT;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  112  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  113  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  114  }
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  115  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  116  static int find_fre(struct sframe_section *sec, struct sframe_fde *fde,
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  117  		    unsigned long ip, struct user_unwind_frame *frame)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  118  {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  119  	unsigned char fde_type = SFRAME_FUNC_FDE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  120  	unsigned char fre_type = SFRAME_FUNC_FRE_TYPE(fde->info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  121  	s32 fre_ip_off, cfa_off, ra_off, fp_off, ip_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  122  	unsigned char offset_count, offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  123  	unsigned char addr_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  124  	void __user *f, *last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  125  	u8 fre_info;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  126  	int i;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  127  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  128  	addr_size = fre_type_to_size(fre_type);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  129  	if (!addr_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  130  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  131  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  132  	ip_off = ip - sec->sframe_addr - fde->start_addr;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  133  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @134  	f = (void *)sec->fres_addr + fde->fres_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  135  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  136  	for (i = 0; i < fde->fres_num; i++) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  137  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @138  		SFRAME_GET_USER_UNSIGNED(fre_ip_off, f, addr_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  139  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  140  		if (fde_type == SFRAME_FDE_TYPE_PCINC) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  141  			if (fre_ip_off > ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  142  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  143  		} else {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  144  			/* SFRAME_FDE_TYPE_PCMASK */
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  145  			if (ip_off % fde->rep_size < fre_ip_off)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  146  				break;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  147  		}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  148  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  149  		SFRAME_GET_USER_UNSIGNED(fre_info, f, 1);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  150  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  151  		offset_count = SFRAME_FRE_OFFSET_COUNT(fre_info);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  152  		offset_size  = offset_size_enum_to_size(SFRAME_FRE_OFFSET_SIZE(fre_info));
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  153  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  154  		if (!offset_count || !offset_size)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  155  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  156  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  157  		last_f = f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  158  		f += offset_count * offset_size;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  159  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  160  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  161  	if (!last_f)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  162  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  163  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  164  	f = last_f;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  165  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  166  	SFRAME_GET_USER_UNSIGNED(cfa_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  167  	offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  168  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  169  	ra_off = sec->ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  170  	if (!ra_off) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  171  		if (!offset_count--)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  172  			return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14 @173  		SFRAME_GET_USER_SIGNED(ra_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  174  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  175  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  176  	fp_off = sec->fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  177  	if (!fp_off && offset_count) {
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  178  		offset_count--;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  179  		SFRAME_GET_USER_SIGNED(fp_off, f, offset_size);
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  180  	}
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  181  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  182  	if (offset_count)
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  183  		return -EINVAL;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  184  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  185  	frame->cfa_off = cfa_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  186  	frame->ra_off = ra_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  187  	frame->fp_off = fp_off;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  188  	frame->use_fp = SFRAME_FRE_CFA_BASE_REG_ID(fre_info) == SFRAME_BASE_REG_FP;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  189  
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  190  	return 0;
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  191  }
6ce9812d0cc74f Josh Poimboeuf 2024-09-14  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
