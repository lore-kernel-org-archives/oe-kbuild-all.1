Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0428EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731854925; cv=none; b=NTzD4qtWLu7Wo3kRpxzkp18o7yQnfIXTbX8zsKs3qFnJflwzt3EPTP+iq6pO7BYYTmNPChUAJnqy8o3qPVi9kzyj/5Q5G8bXuqbU6j/svzDgQE4AoUCHsm4ALAdoDnee17RJ302LuNmwOeMQpfhpaeakHCvOYo9niVMSFoDgJag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731854925; c=relaxed/simple;
	bh=LNvxRrKmp1QTzxQfep1yGkqHDLmXiDw5bo2jWQi4f4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u732537UEWrn8xoC7UX/LUPkYW4B4edfnuS2JcVCv2X+So13tE4wO24yoT25vtoZ4d15DGLi1sLQ5+ATjyYYDu5x+a0E2eLRRgmsb6ct/IE2JIJMBYvzryiwIlxJSZr6pcaPEsAi2AuaMHU4WuWe5V13jQ+6CTSLHs7W79+T91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYOPkOEz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYOPkOEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731854923; x=1763390923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LNvxRrKmp1QTzxQfep1yGkqHDLmXiDw5bo2jWQi4f4k=;
  b=jYOPkOEz0izT1egGjJIdb1EgpWdhcen9Izfxve5So5mFfnt11Cckcd02
   Umq1HiEfvKg78RAWIJMFStx6y7t2cpb8V75NcPP6llj85eV4zWS5xquIU
   FPhJg7gr0TTiUa/2N82KaHHP7EPtcxGaYImVbI5zr5w/LyVNabNiOLw5j
   Vqx4m8DoeAYqTFVZpZypIo8yHzSpoqrGhYgrEf6pruwyvgZ3JsBVG1AKG
   RdYNrdlys/x9pNTlLcRs9taYiEqxQplRpehr1dyfNd/p8U7U2wyk0C7Zp
   ZrBfwuQZkW97+OZCJ4CBaaf5qJYjk3cLoZ5FVd2eUFDvtJvtyJm4UU4LO
   A==;
X-CSE-ConnectionGUID: fEXm2EtHTeSuzQUbkK5Jxw==
X-CSE-MsgGUID: laVOapvaSpyBgIpo5Ym/Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="34671643"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="34671643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 06:48:43 -0800
X-CSE-ConnectionGUID: vdunmkO+S66905Kr4ecboQ==
X-CSE-MsgGUID: sC3hvgMUSUqGjx2E2AnKcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89394828"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2024 06:48:42 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCgZr-0001o9-2A;
	Sun, 17 Nov 2024 14:48:39 +0000
Date: Sun, 17 Nov 2024 22:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/PATCH v2 bpf-next fanotify 6/7] fanotify: Enable bpf based
 fanotify fastpath handler
Message-ID: <202411172228.9Z5nYxqv-lkp@intel.com>
References: <20241114084345.1564165-7-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114084345.1564165-7-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master bpf/master v6.12-rc7]
[cannot apply to bpf-next/master next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241114-164824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20241114084345.1564165-7-song%40kernel.org
patch subject: [RFC/PATCH v2 bpf-next fanotify 6/7] fanotify: Enable bpf based fanotify fastpath handler
config: x86_64-randconfig-161-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172228.9Z5nYxqv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172228.9Z5nYxqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172228.9Z5nYxqv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify_fastpath.c:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/notify/fanotify/fanotify_fastpath.c:347:7: error: call to undeclared function 'bpf_tracing_btf_ctx_access'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     347 |         if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
         |              ^
   3 warnings and 1 error generated.


vim +/bpf_tracing_btf_ctx_access +347 fs/notify/fanotify/fanotify_fastpath.c

   341	
   342	static bool bpf_fanotify_fastpath_is_valid_access(int off, int size,
   343							  enum bpf_access_type type,
   344							  const struct bpf_prog *prog,
   345							  struct bpf_insn_access_aux *info)
   346	{
 > 347		if (!bpf_tracing_btf_ctx_access(off, size, type, prog, info))
   348			return false;
   349	
   350		return true;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
