Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4823F4D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695253591; x=1726789591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HCYa+qHx0H1xppxF/kTD3U/VV8Yqomu+5wAHkXL3OcE=;
  b=Z5Es8/fb/ST7jBalw2mmD15IcvHZRjoy6T68a6dugLhjDDujp8BCPQ4F
   cBMfDguGN2RcA21QZHAeZGZ2O5EgYTBodIaSZ0xgcRe8KUybmUAQLYUce
   m7a/RGPJK5pLyS1C3pa0pCF/W/r+Llrugil2Frzt4dPKJ12q8p2auvIcz
   xxmjvUsnf/tfeHogakd1VQ1FFQR5Zw9E7XyiYnD2tIp0vwZRqbGfRjSKA
   Th8oRrrPMAF5F4boYHT9BjujMLFp9tMLjaY0KDwGOAaNnuN3r0SQ2R87I
   wCubsz12DEAEgPvcXH58noKvY3gR4KX7Z3v2vLAWy+5tJ25Yg8Sbf+E3T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383115023"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383115023"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 16:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776200033"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="776200033"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2023 16:46:29 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj6tn-0009HN-0Q;
	Wed, 20 Sep 2023 23:46:27 +0000
Date: Thu, 21 Sep 2023 07:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v3 07/11] bpf, net: switch to storing struct_ops
 in btf
Message-ID: <202309210738.wbC5aqDV-lkp@intel.com>
References: <20230920155923.151136-8-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920155923.151136-8-thinker.li@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-refactory-struct_ops-type-initialization-to-a-function/20230921-000546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230920155923.151136-8-thinker.li%40gmail.com
patch subject: [RFC bpf-next v3 07/11] bpf, net: switch to storing struct_ops in btf
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309210738.wbC5aqDV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210738.wbC5aqDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210738.wbC5aqDV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_init':
   kernel/bpf/bpf_struct_ops.c:252:15: error: implicit declaration of function 'register_bpf_struct_ops' [-Werror=implicit-function-declaration]
     252 |         ret = register_bpf_struct_ops(&bpf_testmod_struct_ops);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c: At top level:
>> kernel/bpf/bpf_struct_ops.c:258:5: warning: no previous prototype for 'register_bpf_struct_ops' [-Wmissing-prototypes]
     258 | int register_bpf_struct_ops(struct bpf_struct_ops_mod *mod)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/register_bpf_struct_ops +258 kernel/bpf/bpf_struct_ops.c

   257	
 > 258	int register_bpf_struct_ops(struct bpf_struct_ops_mod *mod)
   259	{
   260		struct bpf_struct_ops *st_ops = mod->st_ops;
   261		struct bpf_verifier_log *log;
   262		struct btf *btf;
   263		int err;
   264	
   265		if (mod->st_ops == NULL ||
   266		    mod->owner == NULL)
   267			return -EINVAL;
   268	
   269		log = kzalloc(sizeof(*log), GFP_KERNEL | __GFP_NOWARN);
   270		if (!log) {
   271			err = -ENOMEM;
   272			goto errout;
   273		}
   274	
   275		log->level = BPF_LOG_KERNEL;
   276	
   277		btf = btf_get_module_btf(mod->owner);
   278		if (!btf) {
   279			err = -EINVAL;
   280			goto errout;
   281		}
   282	
   283		bpf_struct_ops_init_one(st_ops, btf, log);
   284	
   285		btf_put(btf);
   286	
   287		st_ops->owner = mod->owner;
   288		err = btf_add_struct_ops(st_ops, st_ops->owner);
   289	
   290	errout:
   291		kfree(log);
   292	
   293		return err;
   294	}
   295	EXPORT_SYMBOL_GPL(register_bpf_struct_ops);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
