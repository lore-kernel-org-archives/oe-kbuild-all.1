Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBD1BF37
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745154108; cv=none; b=MHXE9XrXbapoe2i0zgE8lu5s5ZHpPw4OgoagAfJDjrmivkPQ9Wmd6BGROk/8dHLRfgNTscLy0OFV/Ny6CQmxD3rWBgt0xyi5y/7WW30WcFHaUmRaZUThKi2UWWf+XuCC25BopJYZCyA6LuxPogo/oVTHIcIhnqldCAWXNblE5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745154108; c=relaxed/simple;
	bh=H7adaQT2WaN8fEqIYzVkw2ob1WL5NC74/ERoKxwxN+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDKY+UD60P0TaFNCYFo1a08KDI4wQ42g37TmCBS2hNxAkYPUk8l7VsMg/r4rjwxjtl8APpBHSjKHw4kTqU2IkZgKlH4o6naiB9vf4Jsrlhad9hTl6+JRmSgCLVnSy7hy56DgdTxKP/lYrw+VeXwj44Obs9CjQwRQzcI/708kF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4fomgkl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4fomgkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745154106; x=1776690106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H7adaQT2WaN8fEqIYzVkw2ob1WL5NC74/ERoKxwxN+c=;
  b=A4fomgklxHRmkpLj+8QONYPYTDVhl7Au/vrTvNQnbpvu+Oq88Y8ci7u8
   f5gy2Oo7LeARQnIkG7364fyvTusZ1kiBejFZzJq/cpNYtsLxmPK8tkQMK
   vD0foVbZ+rxlP15ekkA3GQEXObsOmkVLZHnIi5Pw1td6hQMUvNqUqv/bL
   9rPNhHeSU1HQ/ryqu3iXO9ZFoC8vo9tu3rCnsdF41Wi8HBnsfDlmceAha
   8/mq8QE0fP3WymBUq6cpfGOmE9ms0v9GDy3l3f6nqe02C5y28BfgUuk4W
   zRULL/dWMY4T+qHSTzPoxii+bAJGlbl3XjKblYM5eF5vrtAK6yt1LKLrU
   Q==;
X-CSE-ConnectionGUID: FOnwcQfuQQmzHuYnjO7/+w==
X-CSE-MsgGUID: Ef7tAK3JTrevxZD23fu2Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46629667"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46629667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 06:01:45 -0700
X-CSE-ConnectionGUID: sNfUTpgKTcqfevl41JYVcQ==
X-CSE-MsgGUID: j0ut/kFIQMyZnn1lCmiAew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131515106"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2025 06:01:43 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6UIn-0004eH-1M;
	Sun, 20 Apr 2025 13:01:41 +0000
Date: Sun, 20 Apr 2025 21:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF
 program for termination
Message-ID: <202504202023.4uZ3cq9I-lkp@intel.com>
References: <20250420105524.2115690-4-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-4-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-4-rjsu26%40gmail.com
patch subject: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF program for termination
config: x86_64-buildonly-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202023.4uZ3cq9I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202023.4uZ3cq9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202023.4uZ3cq9I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_prog_load':
   kernel/bpf/syscall.c:2981:14: warning: variable 'have_termination_prog' set but not used [-Wunused-but-set-variable]
    2981 |         bool have_termination_prog = false;
         |              ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/syscall.c: In function 'clone_bpf_prog':
>> kernel/bpf/syscall.c:2785:9: warning: 'strncpy' output truncated before terminating nul copying 6 bytes from a string of the same length [-Wstringop-truncation]
    2785 |         strncpy(patch_prog->aux->name, patch_prefix, strlen(patch_prefix));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +2785 kernel/bpf/syscall.c

  2770	
  2771	static int clone_bpf_prog(struct bpf_prog *patch_prog, struct bpf_prog *prog)
  2772	{
  2773		int err = 0;
  2774		patch_prog->expected_attach_type = prog->expected_attach_type;
  2775		patch_prog->len = prog->len;
  2776		patch_prog->gpl_compatible = prog->gpl_compatible;
  2777	
  2778		memcpy(patch_prog->insnsi, prog->insnsi,  bpf_prog_insn_size(prog));
  2779	
  2780		patch_prog->orig_prog = NULL;
  2781		patch_prog->jited = 0;
  2782		patch_prog->type = prog->type;
  2783	
  2784		char *patch_prefix = "patch_";
> 2785		strncpy(patch_prog->aux->name, patch_prefix, strlen(patch_prefix));
  2786		strncat(patch_prog->aux->name, prog->aux->name, sizeof(prog->aux->name));
  2787	
  2788		return err;
  2789	}
  2790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
