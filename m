Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862701CEE8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726322884; cv=none; b=ZMthq47hKpAQzYW1xVLHsV0eLnuOy7Ro6vB+Pvv7lpivsn8etW8FxUZGxmr2dej9PpLEEz8Dm49pvNrLZ/xKt2kY6Kk/sXZL/DFxdHQENKiMjmfh6LV2SzpKcQnv6ZI3r1bfqW2SklgCEIscNZff0igyErvuQkjqtr0ghy92yIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726322884; c=relaxed/simple;
	bh=7E247dReZZ8zaoQnDlTMawaWQoBdK39N7JxxGk6rxwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X55XOks6T+GQrDBIMbzklhlkkWq+zc9n2nlXRBymP2gM+VjWNNLTLa08VVG7wtqNMR6X9LzxUpuBusrWNwwKyCRBGWY5vvOlCDpPJca1ua11uphdKuVXkB2UTMpvMlPbKCMDXz6AvcR0Mqy+rHS/2aehXkRX/I5atMAcicADwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5kg7Nrh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5kg7Nrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726322882; x=1757858882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7E247dReZZ8zaoQnDlTMawaWQoBdK39N7JxxGk6rxwM=;
  b=e5kg7NrhcvPu5ukQ0PzXNi+h9ix3pOy61ACJ8I+L3dHWIIpkpfoW3nN2
   2ZRdPJjR3R9qfnOxC3re++8l+gGLPDWlAOEBCRnOR1r+WJsyB3I47X9ev
   s+4ZxXvqexZdA7zDRVPY2hbo4LmzzFYKwxsq2W2T5/ZyI8YIIgkljx0G0
   ZLz9gznuk1edA3nyKIxGutoepQoRlbKj96M0zwqn0OJCpu5JZXoNG/LQY
   adx8dUpB5P4LxbDlr7j6wRI2BrFQbgYMomTK+TVb6y8OnWxfXb1LrujzU
   7DpSS8yKyhsldOsU26X2x/Y4OYypFM2IBhX9zOGx5ySg4iPwTedg0e325
   w==;
X-CSE-ConnectionGUID: ZcH0uK6NR0C4psPcxXbKAA==
X-CSE-MsgGUID: z2Lnwd+xR9e6zB4QlYEMVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25311542"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25311542"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 07:08:02 -0700
X-CSE-ConnectionGUID: CKCj9hJQR/OECFiEGLNSwA==
X-CSE-MsgGUID: 3qW6yf/uS+O5j+rdtpUQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="73413093"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Sep 2024 07:08:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spTRP-0007ow-0I;
	Sat, 14 Sep 2024 14:07:59 +0000
Date: Sat, 14 Sep 2024 22:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
Message-ID: <202409142115.HyZ7W4HU-lkp@intel.com>
References: <82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe@kernel.org>

Hi Josh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.11-rc7 next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Poimboeuf/unwind-Introduce-generic-user-space-unwinding-interface/20240914-070619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/82ef19a767cb75e76a985ecc0d47a39400b4fdf5.1726268190.git.jpoimboe%40kernel.org
patch subject: [PATCH v2 02/11] unwind/x86: Add HAVE_USER_UNWIND
config: x86_64-randconfig-121-20240914 (https://download.01.org/0day-ci/archive/20240914/202409142115.HyZ7W4HU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409142115.HyZ7W4HU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409142115.HyZ7W4HU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/user.c:38:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long * @@
   kernel/unwind/user.c:38:30: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/user.c:38:30: sparse:     got unsigned long *
   kernel/unwind/user.c:41:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long * @@
   kernel/unwind/user.c:41:30: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/user.c:41:30: sparse:     got unsigned long *

vim +38 kernel/unwind/user.c

c970b852d500d4 Josh Poimboeuf 2024-09-14  17  
c970b852d500d4 Josh Poimboeuf 2024-09-14  18  int user_unwind_next(struct user_unwind_state *state)
c970b852d500d4 Josh Poimboeuf 2024-09-14  19  {
c970b852d500d4 Josh Poimboeuf 2024-09-14  20  	struct user_unwind_frame _frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  21  	struct user_unwind_frame *frame = &_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  22  	unsigned long cfa, fp, ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  23  	int ret = -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  24  
c970b852d500d4 Josh Poimboeuf 2024-09-14  25  	if (state->done)
c970b852d500d4 Josh Poimboeuf 2024-09-14  26  		return -EINVAL;
c970b852d500d4 Josh Poimboeuf 2024-09-14  27  
c970b852d500d4 Josh Poimboeuf 2024-09-14  28  	switch (state->type) {
c970b852d500d4 Josh Poimboeuf 2024-09-14  29  	case USER_UNWIND_TYPE_FP:
c970b852d500d4 Josh Poimboeuf 2024-09-14  30  		frame = &fp_frame;
c970b852d500d4 Josh Poimboeuf 2024-09-14  31  		break;
c970b852d500d4 Josh Poimboeuf 2024-09-14  32  	default:
c970b852d500d4 Josh Poimboeuf 2024-09-14  33  		BUG();
c970b852d500d4 Josh Poimboeuf 2024-09-14  34  	}
c970b852d500d4 Josh Poimboeuf 2024-09-14  35  
c970b852d500d4 Josh Poimboeuf 2024-09-14  36  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
c970b852d500d4 Josh Poimboeuf 2024-09-14  37  
c970b852d500d4 Josh Poimboeuf 2024-09-14 @38  	if (frame->ra_off && get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  39  		goto the_end;
c970b852d500d4 Josh Poimboeuf 2024-09-14  40  
c970b852d500d4 Josh Poimboeuf 2024-09-14  41  	if (frame->fp_off && get_user(fp, (unsigned long *)(cfa + frame->fp_off)))
c970b852d500d4 Josh Poimboeuf 2024-09-14  42  		goto the_end;
c970b852d500d4 Josh Poimboeuf 2024-09-14  43  
c970b852d500d4 Josh Poimboeuf 2024-09-14  44  	state->sp = cfa;
c970b852d500d4 Josh Poimboeuf 2024-09-14  45  	state->ip = ra;
c970b852d500d4 Josh Poimboeuf 2024-09-14  46  	if (frame->fp_off)
c970b852d500d4 Josh Poimboeuf 2024-09-14  47  		state->fp = fp;
c970b852d500d4 Josh Poimboeuf 2024-09-14  48  
c970b852d500d4 Josh Poimboeuf 2024-09-14  49  	return 0;
c970b852d500d4 Josh Poimboeuf 2024-09-14  50  
c970b852d500d4 Josh Poimboeuf 2024-09-14  51  the_end:
c970b852d500d4 Josh Poimboeuf 2024-09-14  52  	state->done = true;
c970b852d500d4 Josh Poimboeuf 2024-09-14  53  	return ret;
c970b852d500d4 Josh Poimboeuf 2024-09-14  54  }
c970b852d500d4 Josh Poimboeuf 2024-09-14  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
