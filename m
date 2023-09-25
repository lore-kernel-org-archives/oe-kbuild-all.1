Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1022611CA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695630678; x=1727166678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KkA6piSLQ+BYJKP6PoFZM1BeoxIb7MNkg1gTjPPbr3s=;
  b=OjZWEVh1O1qdss9ZhWJ70Ximrstu/RRpWr7aOuW6LK8EJ1iMONVS86nr
   MYRUR6m5WZ/MW8RoSa6M5iXxcoPDFNqIBRx9J/fpiZ/rC4ck0sy+kGrrx
   xVMayVRl8YARpWAh5yGFVpEhv+P6mIERmiWSH7ZB4Gy+tJltvb72pgMR0
   XK/2/HKF5dvxSl8U64zlrFz+CqRX8vtSnnTfdun/EJGWyrTdLQXlIXazn
   D/DfvoKb7ZOAEaxkeMP0NFABc1uwbJ+qu4NBFIMiOvnhWWnRenb2mClcn
   rTVz//uZmBl9pFBpxwcA1cXKzCfegsRhQMQm4OkzF87Q9+WSA6YInDec8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360582214"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="360582214"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 01:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741855936"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="741855936"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Sep 2023 01:31:15 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkgzp-0001Mj-0I;
	Mon, 25 Sep 2023 08:31:13 +0000
Date: Mon, 25 Sep 2023 16:30:38 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v3 07/11] bpf, net: switch to storing struct_ops
 in btf
Message-ID: <202309251600.fzViZTWK-lkp@intel.com>
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
config: x86_64-randconfig-016-20230925 (https://download.01.org/0day-ci/archive/20230925/202309251600.fzViZTWK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251600.fzViZTWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251600.fzViZTWK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_init':
   kernel/bpf/bpf_struct_ops.c:252:8: error: implicit declaration of function 'register_bpf_struct_ops'; did you mean 'register_net_sysctl_sz'? [-Werror=implicit-function-declaration]
     ret = register_bpf_struct_ops(&bpf_testmod_struct_ops);
           ^~~~~~~~~~~~~~~~~~~~~~~
           register_net_sysctl_sz
   kernel/bpf/bpf_struct_ops.c: At top level:
>> kernel/bpf/bpf_struct_ops.c:258:5: warning: no previous declaration for 'register_bpf_struct_ops' [-Wmissing-declarations]
    int register_bpf_struct_ops(struct bpf_struct_ops_mod *mod)
        ^~~~~~~~~~~~~~~~~~~~~~~
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
