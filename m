Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1597A29
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 05:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730523739; cv=none; b=aDMX4NCbuGidYmVmiPvOIub8u1BPV++WOZnkLUjm9qXmLoAMVIt5awVdknXPrxPlERLP0pb+oVQHMpaElwMg7WcITDzEBpmtPDetaPYBhfRWrzxdlkvyqdzsul8XmFTlQDDXaLzN50Wy7nuUr/J3JuvDue9AuFSKPys3HJSF3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730523739; c=relaxed/simple;
	bh=MedRfl0s5WTMZvSZe4JMF77afAkFhK9LhLwxHvYxLKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQpLqWERq4p1Qn8arTLwMvbBGkGtaTiSA/FVs+VO+BwhF2nJmpnvvK+6TSeshJ70zfBq/PuDdCaAl6cwhI7ueXol/UnQhKY2/uqk/3Lltlssy22KYvOI+BGPi82CE17Sxsva1dl9QTGxD4aK7Zbaxk26qNDSLpPDj8JQxFs8+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pi5fbQ7p; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pi5fbQ7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730523738; x=1762059738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MedRfl0s5WTMZvSZe4JMF77afAkFhK9LhLwxHvYxLKE=;
  b=Pi5fbQ7pUp7qMxe5nigmsxEFaePIXPiYr/6iSYB/aG4J0zR8KicwOq6n
   gVHZWN8vue6TQjPzdm68pbM6ySAkoKgmov9uSqcFFxZEono7bxV/2W0aL
   yY0+WFGhnMvEIJHXmHN6kDnnjGOfJujicyFOgvEk7FrCKFLG6kIi+V1HI
   vyanPlDII6No3ntp9jW0tyyrL4Y+GXNz3V2NPQ5Q8bhbYQ83g+UTfIrHt
   pRTTnBDFUmYZ6dtC1TAWzR1u7TlM14WXbUHSoTD9g+pB3AbQCL1VAm1oI
   ZZt6kFSHW6/9g+3bqEd6wX7nAMkMcTJ+is/IxKSZqOn5b9FS6IBswy1rA
   A==;
X-CSE-ConnectionGUID: 8bhFJrdeRbm92XJ0dDlGjQ==
X-CSE-MsgGUID: nuttjFZkRCyUG/x3MhT7VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55684077"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="55684077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:02:17 -0700
X-CSE-ConnectionGUID: HI6foiYaR+OTSD4Xr/S3gA==
X-CSE-MsgGUID: smOXAIQKScG3ehLtESfTTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82680849"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 22:02:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76H8-000iRS-05;
	Sat, 02 Nov 2024 05:02:14 +0000
Date: Sat, 2 Nov 2024 13:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next fanotify 4/5] fanotify: Enable bpf based fanotify
 fastpath handler
Message-ID: <202411021247.TwBBZ3ZJ-lkp@intel.com>
References: <20241029231244.2834368-5-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029231244.2834368-5-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]
[also build test ERROR on jack-fs/fsnotify linus/master v6.12-rc5]
[cannot apply to bpf-next/master next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241030-071530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20241029231244.2834368-5-song%40kernel.org
patch subject: [RFC bpf-next fanotify 4/5] fanotify: Enable bpf based fanotify fastpath handler
config: i386-randconfig-016-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021247.TwBBZ3ZJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021247.TwBBZ3ZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411021247.TwBBZ3ZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/fanotify/fanotify_fastpath.c: In function 'bpf_fanotify_fastpath_is_valid_access':
>> fs/notify/fanotify/fanotify_fastpath.c:217:14: error: implicit declaration of function 'bpf_tracing_btf_ctx_access' [-Werror=implicit-function-declaration]
     217 |         if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/notify/fanotify/fanotify_fastpath.c:4:
   fs/notify/fanotify/fanotify_fastpath.c: In function 'bpf_fanotify_fastpath_struct_ops_init':
   include/linux/bpf.h:1868:50: warning: statement with no effect [-Wunused-value]
    1868 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_fastpath.c:315:22: note: in expansion of macro 'register_bpf_struct_ops'
     315 |         ret = ret ?: register_bpf_struct_ops(&bpf_fanotify_fastpath_ops, fanotify_fastpath_ops);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bpf_tracing_btf_ctx_access +217 fs/notify/fanotify/fanotify_fastpath.c

   211	
   212	static bool bpf_fanotify_fastpath_is_valid_access(int off, int size,
   213							  enum bpf_access_type type,
   214							  const struct bpf_prog *prog,
   215							  struct bpf_insn_access_aux *info)
   216	{
 > 217		if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
   218			return false;
   219	
   220		return true;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
