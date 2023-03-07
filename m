Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F05386
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678231650; x=1709767650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cFQK4yoJNwJ2MYUgHEj7uj88LU7UNUl/bdTmD3rdioU=;
  b=mKi8iLb4rjYlo5DNzZ7NaklIm6Jrf7+90gzRl/RlsPv4QaZlXP0CrNtR
   Eu1NdaCUAwqSWZnQ4DUa8OR09cXXcgBKo7eTKr74n04qgHEb+23fKbSiz
   9UtivUhZBPkp7e2yQisiEOhBzFRWjT0R8aZ/UVFIUeH7oBtIH0J2Lpqem
   MH8hH9ZcnX6FHVnA6fsOrziDt74PN9Ex8wKkBdV665NGWbZlmliPMyao7
   4ehoiwoW0VRoMfHUXx5w/9AkpPnsGu7rAFMeRnaq3lzBYs4rpNL85j+Cu
   oHWlh3CaH0dvOsvtBJJXpydYEkaSz+Ygu+WOZLRoOPiqYDWXz3vf5P/jw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422272300"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="422272300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 15:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="786880360"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; 
   d="scan'208";a="786880360"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 15:27:26 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZgiL-0001gN-2l;
	Tue, 07 Mar 2023 23:27:25 +0000
Date: Wed, 8 Mar 2023 07:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net
Cc: oe-kbuild-all@lists.linux.dev, andrii@kernel.org, kernel-team@fb.com,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH v2 bpf-next 3/8] bpf: add support for open-coded iterator
 loops
Message-ID: <202303080733.7uzHxIB0-lkp@intel.com>
References: <20230307215329.3895377-4-andrii@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307215329.3895377-4-andrii@kernel.org>

Hi Andrii,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-055530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230307215329.3895377-4-andrii%40kernel.org
patch subject: [PATCH v2 bpf-next 3/8] bpf: add support for open-coded iterator loops
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230308/202303080733.7uzHxIB0-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9eada50b93c4fc3f41032699fda73bc125b37d0e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrii-Nakryiko/bpf-factor-out-fetching-basic-kfunc-metadata/20230308-055530
        git checkout 9eada50b93c4fc3f41032699fda73bc125b37d0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080733.7uzHxIB0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'is_iter_reg_valid_init':
>> kernel/bpf/verifier.c:1255:32: warning: variable 't' set but not used [-Wunused-but-set-variable]
    1255 |         const struct btf_type *t;
         |                                ^


vim +/t +1255 kernel/bpf/verifier.c

  1250	
  1251	static bool is_iter_reg_valid_init(struct bpf_verifier_env *env, struct bpf_reg_state *reg,
  1252					   struct btf *btf, u32 btf_id, int nr_slots)
  1253	{
  1254		struct bpf_func_state *state = func(env, reg);
> 1255		const struct btf_type *t;
  1256		int spi, i, j;
  1257	
  1258		spi = iter_get_spi(env, reg, nr_slots);
  1259		if (spi < 0)
  1260			return false;
  1261	
  1262		t = btf_type_by_id(btf, btf_id);
  1263	
  1264		for (i = 0; i < nr_slots; i++) {
  1265			struct bpf_stack_state *slot = &state->stack[spi - i];
  1266			struct bpf_reg_state *st = &slot->spilled_ptr;
  1267	
  1268			/* only main (first) slot has ref_obj_id set */
  1269			if (i == 0 && !st->ref_obj_id)
  1270				return false;
  1271			if (i != 0 && st->ref_obj_id)
  1272				return false;
  1273			if (st->iter.btf != btf || st->iter.btf_id != btf_id)
  1274				return false;
  1275	
  1276			for (j = 0; j < BPF_REG_SIZE; j++)
  1277				if (slot->slot_type[j] != STACK_ITER)
  1278					return false;
  1279		}
  1280	
  1281		return true;
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
