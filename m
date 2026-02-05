Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E222D1A0BD6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 00:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770250963; cv=none; b=HSYl3F102I4lHigTflNbXdgEsNBMHVxMIopggmeXRyy6S3MDjer7LKck4Kh1xZM0q5U1Jp5fPKnNm/YdLiFmWsrDRkViyVES/U7Hfj5w9xI0MM5vesB2bF/ZceYWatYQJlfeqNY+j1FT595buTnUYbYzgIYBAKEroCie+7ipqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770250963; c=relaxed/simple;
	bh=qKnVBjp06wzf7+aavAnZbV3hdac2xNlqU9DLkDRp254=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKrd0eRfla4iZfulBM7g8b4Px1v7XkW2pgyXbpKE4Qwsg9WlnceQ773Mt4KA45gRMUm/52/PZFW/cPYbfPLEM/ESBLFUoj7dQvU+DHf7J6izY4FkBc8dxGZaPz+Pymuf3kmB5KRBJRYpoDiCCPEgk0zmOB031peIPe6FX1+PNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb7/RxXg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb7/RxXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770250963; x=1801786963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qKnVBjp06wzf7+aavAnZbV3hdac2xNlqU9DLkDRp254=;
  b=Yb7/RxXgFZKwPi82nvJv04RNgDp7aP6OogALbGv0p9pBRd4FHt4lrooI
   OESgKSzLYmNqsU0p8aFA64KpkuzY3q1BzPjEO97UvxYsiAIL/wnnuojC2
   yGJ4BBZ/RUzXUYHxEvmhRBDpOnk5g34ploAJzgSRlwS63y5CJUiwlHw55
   ko/fNk6Ewl79cLv08O1j5LjRO2jrP7TOpcx/X0Cs91jsBN00UcWINCApw
   pBychN0suQZJYrFjL6g4np0M8TeCQTSdYw/7VhAzrsOb07DIKX/T7nr/+
   sbB747WBmb929TGvUMDQehPS9jOvx1PH0XUs35TeIB9hKsmi60j2mnLzq
   Q==;
X-CSE-ConnectionGUID: giMCy5a6Sye3PJfaeBnVyQ==
X-CSE-MsgGUID: aOCIlHRcTUa11BIDS9kanw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70642491"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="70642491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 16:22:42 -0800
X-CSE-ConnectionGUID: 8GnRm4buQFiJHCQNQLX9yw==
X-CSE-MsgGUID: G7ADB89USlij3E1aSxJHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="240992148"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2026 16:22:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnn8o-00000000jFo-0NuK;
	Thu, 05 Feb 2026 00:22:38 +0000
Date: Thu, 5 Feb 2026 08:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>, pasha.tatashin@soleen.com,
	rppt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, pratyush@kernel.org,
	linux-kernel@vger.kernel.org, surenb@google.com,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
Message-ID: <202602050807.0QRxP8b3-lkp@intel.com>
References: <20260204182816.2463931-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204182816.2463931-1-sashal@kernel.org>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc8 next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kexec-allow-KEXEC_HANDOVER-to-build-with-COMPILE_TEST/20260205-023202
base:   linus/master
patch link:    https://lore.kernel.org/r/20260204182816.2463931-1-sashal%40kernel.org
patch subject: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260205/202602050807.0QRxP8b3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050807.0QRxP8b3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050807.0QRxP8b3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/liveupdate/kexec_handover_debugfs.c: In function 'scratch_phys_show':
>> kernel/liveupdate/kexec_handover_debugfs.c:99:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
      99 |                 seq_printf(m, "0x%llx\n", kho_scratch[i].addr);
         |                                  ~~~^     ~~~~~~~~~~~~~~~~~~~
         |                                     |                   |
         |                                     |                   phys_addr_t {aka unsigned int}
         |                                     long long unsigned int
         |                                  %x
   kernel/liveupdate/kexec_handover_debugfs.c: In function 'scratch_len_show':
   kernel/liveupdate/kexec_handover_debugfs.c:108:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 seq_printf(m, "0x%llx\n", kho_scratch[i].size);
         |                                  ~~~^     ~~~~~~~~~~~~~~~~~~~
         |                                     |                   |
         |                                     |                   phys_addr_t {aka unsigned int}
         |                                     long long unsigned int
         |                                  %x
   In file included from include/linux/io.h:12,
                    from kernel/liveupdate/kexec_handover_debugfs.c:13:
   kernel/liveupdate/kexec_handover_debugfs.c: In function 'kho_in_debugfs_init':
>> arch/sh/include/asm/io.h:266:34: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     266 | #define phys_to_virt(address)   ((void *)(address))
         |                                  ^
   kernel/liveupdate/kexec_handover_debugfs.c:151:45: note: in expansion of macro 'phys_to_virt'
     151 |                                             phys_to_virt(*fdt_phys));
         |                                             ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CMA
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - KEXEC_HANDOVER [=y] && (ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE || COMPILE_TEST [=y]) && (!DEFERRED_STRUCT_PAGE_INIT [=n] || COMPILE_TEST [=y])


vim +99 kernel/liveupdate/kexec_handover_debugfs.c

03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   92  
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   93  DEFINE_DEBUGFS_ATTRIBUTE(kho_out_finalize_fops, kho_out_finalize_get,
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   94  			 kho_out_finalize_set, "%llu\n");
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   95  
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   96  static int scratch_phys_show(struct seq_file *m, void *v)
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   97  {
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01   98  	for (int i = 0; i < kho_scratch_cnt; i++)
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  @99  		seq_printf(m, "0x%llx\n", kho_scratch[i].addr);
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  100  
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  101  	return 0;
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  102  }
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  103  DEFINE_SHOW_ATTRIBUTE(scratch_phys);
03d3963464a436 kernel/kexec_handover_debugfs.c Pasha Tatashin 2025-11-01  104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
