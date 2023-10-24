Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278917FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 06:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhjP7/h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698129225; x=1729665225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lHBo/YOLVBOlKGm0t320LhcbXlD/ELkWc+JSwI+6Lcw=;
  b=PhjP7/h5ptg4x10g2bF9dXWxR1QGzHQZpLUcgmCXoFfCadlRX2hEqqXL
   +TxojJp7+C5tiH0/qMXZ29aYPRvL3yYWYhQF/7WCC4tmwxDL3QAxmQB42
   jrjkRFmfoTe8DQeayKi8BYMAFKpoUEKDfGC78aN/+RXqII+lp5djLc4HX
   1tbFtNQqo83dtBbP8xWYs29wPtHt+O7PUh3nLcotUP115ASw/JPTmVil2
   Z5txCUC6tsEsGUmRVGcKJWyFfRowM+v/l50CNx3gIvbITupsggxhwivTk
   2/6+9ROciGEerSzTYSDNtdszZh1XtDwoAbNUr12qN2nzKqWWsx1PM4jwt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385890769"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385890769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 23:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="6062372"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Oct 2023 23:32:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvAyz-0007dp-0P;
	Tue, 24 Oct 2023 06:33:41 +0000
Date: Tue, 24 Oct 2023 14:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 bpf-next 5/9] bpf, fsverity: Add kfunc
 bpf_get_fsverity_digest
Message-ID: <202310241417.syn0z1ns-lkp@intel.com>
References: <20231023224100.2573116-6-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023224100.2573116-6-song@kernel.org>

Hi Song,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Expose-bpf_dynptr_slice-kfuncs-for-in-kernel-use/20231024-064323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231023224100.2573116-6-song%40kernel.org
patch subject: [PATCH v4 bpf-next 5/9] bpf, fsverity: Add kfunc bpf_get_fsverity_digest
config: parisc-randconfig-002-20231024 (https://download.01.org/0day-ci/archive/20231024/202310241417.syn0z1ns-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241417.syn0z1ns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241417.syn0z1ns-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/verity/verify.c:8:
   fs/verity/fsverity_private.h: In function 'fsverity_init_bpf':
>> fs/verity/fsverity_private.h:155:1: error: no return statement in function returning non-void [-Werror=return-type]
     155 | }
         | ^
   cc1: some warnings being treated as errors


vim +155 fs/verity/fsverity_private.h

   149	
   150	#ifdef CONFIG_BPF_SYSCALL
   151	int __init fsverity_init_bpf(void);
   152	#else
   153	static inline int fsverity_init_bpf(void)
   154	{
 > 155	}
   156	#endif
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
