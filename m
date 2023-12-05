Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7C39876
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRXn4jsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701763365; x=1733299365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QIOkhm0gALKjGzbgLxGsPjX2kcP68mlAYfB69wuLqwg=;
  b=SRXn4jsZ2MYC0KKLW8kKePitom191Fkg/uM8BO0V3KATi3v6mFY63bj3
   ZQuZ2ro1ZKF3fqywl3DJCN64sFzSYX7uuCG5Tnw4KhEHxg+GCFveJCgro
   meBxPP2e5x1Is6+CtGsaLKZKbhLllqGlZP20mvMBqOmDkUfMJrhXyMZRx
   OM2YuDbGAzyp8DX+c4+f0U4rRnNxbGpQZdHWbT5/U89e2fbq2L51sqYyK
   iS3iwlI7rXz25vyG0ZEk9tvEa9pgf1FkHVoGKYiyoV15OXZ+Zq1gKICHM
   Nt6epNFlLHtKpnFK6OTe2yp2av2LZ3w4n2Rmz23ncfkv9N+IRTZo6nYsX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="12575213"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="12575213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 00:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="18871583"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 00:02:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAQNg-0008Xc-0u;
	Tue, 05 Dec 2023 08:02:12 +0000
Date: Tue, 5 Dec 2023 16:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrii@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH bpf-next 08/13] bpf: move subprog call logic back to
 verifier.c
Message-ID: <202312051530.hEAmx5zj-lkp@intel.com>
References: <20231204233931.49758-9-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204233931.49758-9-andrii@kernel.org>

Hi Andrii,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-log-PTR_TO_MEM-memory-size-in-verifier-log/20231205-074451
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231204233931.49758-9-andrii%40kernel.org
patch subject: [PATCH bpf-next 08/13] bpf: move subprog call logic back to verifier.c
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051530.hEAmx5zj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051530.hEAmx5zj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051530.hEAmx5zj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:5083:5: warning: no previous prototype for 'check_ptr_off_reg' [-Wmissing-prototypes]
    5083 | int check_ptr_off_reg(struct bpf_verifier_env *env,
         |     ^~~~~~~~~~~~~~~~~
>> kernel/bpf/verifier.c:7268:5: warning: no previous prototype for 'check_mem_reg' [-Wmissing-prototypes]
    7268 | int check_mem_reg(struct bpf_verifier_env *env, struct bpf_reg_state *reg,
         |     ^~~~~~~~~~~~~
>> kernel/bpf/verifier.c:8254:5: warning: no previous prototype for 'check_func_arg_reg_off' [-Wmissing-prototypes]
    8254 | int check_func_arg_reg_off(struct bpf_verifier_env *env,
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/check_ptr_off_reg +5083 kernel/bpf/verifier.c

e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5082  
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15 @5083  int check_ptr_off_reg(struct bpf_verifier_env *env,
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5084  		      const struct bpf_reg_state *reg, int regno)
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5085  {
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5086  	return __check_ptr_off_reg(env, reg, regno, false);
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5087  }
e9147b4422e1f3 Kumar Kartikeya Dwivedi 2022-04-15  5088  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
