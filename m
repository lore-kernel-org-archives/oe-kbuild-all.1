Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903015B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 03:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681788980; x=1713324980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VxdjGqodyBzAUhUNRnOWrg9RC2IJeBwHgQAZO5WtRQE=;
  b=mbfgV40tHaciJeSDblRzqc20MpL0pXh1dzC1gEq7OW19yaIuOtMvc5bi
   bfUAATj9E1XYVw9w6e1PXnlMIMG7XwzFCifuX62/8+lQOe3miNo1p5lCp
   YD9VWoOqxpcVvDhPXq94utojsAVht9cMg3MHKGD3cKbeCqdDJwCn76Cn0
   muAx1xZAJSBSV5IN7is4OCXWGPBoQtSo1/V40rkr5zyV03dmyKjrm/ynV
   FVhadjOjpup1Fiq34ddySmwELjkSxkLEtvExe6CqLvpALbe218lov3mL4
   OclxWn7US8jqaU6D3JzsnLQlcrDNHb6SVSJ+Qdxa8glCHMXKbyQKOHM9N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="407961415"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="407961415"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 20:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834696936"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="834696936"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 20:36:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poc8f-000cvE-2g;
	Tue, 18 Apr 2023 03:36:17 +0000
Date: Tue, 18 Apr 2023 11:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 30/37] fuse: Provide registration functions for
 fuse-bpf
Message-ID: <202304181127.pawkQbm9-lkp@intel.com>
References: <20230418014037.2412394-31-drosen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418014037.2412394-31-drosen@google.com>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 49859de997c3115b85544bce6b6ceab60a7fabc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
base:   49859de997c3115b85544bce6b6ceab60a7fabc4
patch link:    https://lore.kernel.org/r/20230418014037.2412394-31-drosen%40google.com
patch subject: [RFC PATCH v3 30/37] fuse: Provide registration functions for fuse-bpf
config: m68k-randconfig-r016-20230418 (https://download.01.org/0day-ci/archive/20230418/202304181127.pawkQbm9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ff2c02ca675655ec88e525c51defda64d7774b0d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Rosenberg/bpf-verifier-Accept-dynptr-mem-as-mem-in-herlpers/20230418-094717
        git checkout ff2c02ca675655ec88e525c51defda64d7774b0d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181127.pawkQbm9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/fuse/bpf_register.c: In function 'qstr_eq':
>> fs/fuse/bpf_register.c:52:26: warning: variable 'r3' set but not used [-Wunused-but-set-variable]
      52 |         int res, r1, r2, r3;
         |                          ^~
>> fs/fuse/bpf_register.c:52:22: warning: variable 'r2' set but not used [-Wunused-but-set-variable]
      52 |         int res, r1, r2, r3;
         |                      ^~
>> fs/fuse/bpf_register.c:52:18: warning: variable 'r1' set but not used [-Wunused-but-set-variable]
      52 |         int res, r1, r2, r3;
         |                  ^~
   fs/fuse/bpf_register.c: In function 'get_fuse_ops':
>> fs/fuse/bpf_register.c:82:37: error: 'BPF_MODULE_OWNER' undeclared (first use in this function)
      82 |         if (bpf_try_module_get(ops, BPF_MODULE_OWNER))
         |                                     ^~~~~~~~~~~~~~~~
   fs/fuse/bpf_register.c:82:37: note: each undeclared identifier is reported only once for each function it appears in
   fs/fuse/bpf_register.c: In function 'put_fuse_ops':
   fs/fuse/bpf_register.c:91:37: error: 'BPF_MODULE_OWNER' undeclared (first use in this function)
      91 |                 bpf_module_put(ops, BPF_MODULE_OWNER);
         |                                     ^~~~~~~~~~~~~~~~
   fs/fuse/bpf_register.c: In function 'register_fuse_op':
   fs/fuse/bpf_register.c:145:39: error: 'BPF_MODULE_OWNER' undeclared (first use in this function)
     145 |         if (bpf_try_module_get(value, BPF_MODULE_OWNER))
         |                                       ^~~~~~~~~~~~~~~~
   fs/fuse/bpf_register.c: In function 'unregister_fuse_op':
   fs/fuse/bpf_register.c:171:31: error: 'BPF_MODULE_OWNER' undeclared (first use in this function)
     171 |         bpf_module_put(value, BPF_MODULE_OWNER);
         |                               ^~~~~~~~~~~~~~~~
   fs/fuse/bpf_register.c: In function 'get_fuse_ops':
   fs/fuse/bpf_register.c:86:1: error: control reaches end of non-void function [-Werror=return-type]
      86 | }
         | ^
   cc1: some warnings being treated as errors


vim +/BPF_MODULE_OWNER +82 fs/fuse/bpf_register.c

    49	
    50	static inline int qstr_eq(const struct qstr *s1, const struct qstr *s2)
    51	{
  > 52		int res, r1, r2, r3;
    53	
    54		r1 = s1->len == s2->len;
    55		r2 = s1->hash == s2->hash;
    56		r3 = memcmp(s1->name, s2->name, s1->len);
    57		res = (s1->len == s2->len && s1->hash == s2->hash && !memcmp(s1->name, s2->name, s1->len));
    58		return res;
    59	}
    60	
    61	static struct fuse_ops *__find_fuse_ops(const struct qstr *key)
    62	{
    63		struct hashtable_entry *hash_cur;
    64		unsigned int hash = key->hash;
    65		struct fuse_ops *ret_ops;
    66	
    67		rcu_read_lock();
    68		hash_for_each_possible_rcu(name_to_ops, hash_cur, hlist, hash) {
    69			if (qstr_eq(key, &hash_cur->key)) {
    70				ret_ops = hash_cur->ops;
    71				ret_ops = get_fuse_ops(ret_ops);
    72				rcu_read_unlock();
    73				return ret_ops;
    74			}
    75		}
    76		rcu_read_unlock();
    77		return NULL;
    78	}
    79	
    80	struct fuse_ops *get_fuse_ops(struct fuse_ops *ops)
    81	{
  > 82		if (bpf_try_module_get(ops, BPF_MODULE_OWNER))
    83			return ops;
    84		else
    85			return NULL;
    86	}
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
