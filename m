Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFCF1869
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 21:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690147560; x=1721683560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lHMb9uGDRwchu6DTx6VKmZlfMT1+303h2n13oTaMOo=;
  b=UL74O6KWb264fgO/xFtfSrUl4O7JHyDqF+bG8bRe89Ov/JrBQCNbK2KR
   3CVDauw5A7x/tCbr6pJh/Zb29FJnbpPqE5WiS1qIGUqUBbTHhJWIGzIUn
   X0PBqO9nX9TPHxHa2XfeI29iHRwMflhPoHWJ3GFdAjosbtJih8bgbenJ1
   zC7mXfqg5/Jfygr5WBvgeAZv2sFsAC91CK5Pty/xPYFu+FsyE53zwQPlP
   VhJXuvdngAwPsk9+atX50Lsq2wepPAhzZOTC0Fd9bRuOSCY+W1nG2Ef1u
   loadI19SdH1WRIOkUJUEQV89HOczlZpo/MX0nvK7GfoNukOSHCBGJWWAH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433548255"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="433548255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 14:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="719439662"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="719439662"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Jul 2023 14:25:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNgaT-0009HF-27;
	Sun, 23 Jul 2023 21:25:57 +0000
Date: Mon, 24 Jul 2023 05:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 114/120] net/ipv4/esp4.c:958:2: error:
 implicit declaration of function 'kfree_sensitive'; did you mean
 'kvfree_sensitive'?
Message-ID: <202307240506.1MC5a0gk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   c2d2c0265cd3cae12a5cb246c47461cfa7a08593
commit: b7455391d0b7d215e4b7f4a9460cd416e6629823 [114/120] net: ipv4: Use kfree_sensitive instead of kfree
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230724/202307240506.1MC5a0gk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240506.1MC5a0gk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240506.1MC5a0gk-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/uaccess.h:14:0,
                    from include/linux/crypto.h:26,
                    from include/crypto/aead.h:16,
                    from net/ipv4/esp4.c:3:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
       (((unsigned long) (addr) >= FIXADDR_USER_START) && \
                                ^
   arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_ok_vsyscall'
      __access_ok_vsyscall(addr, size) ||
      ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/atomic.h:5:0,
                    from include/linux/atomic.h:5,
                    from include/linux/crypto.h:20,
                    from include/crypto/aead.h:16,
                    from net/ipv4/esp4.c:3:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:19: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
                      ^
   include/linux/compiler.h:313:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:336:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:47:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:71:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
     ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:8:0,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:34,
                    from include/linux/ip.h:20,
                    from include/net/ip.h:26,
                    from net/ipv4/esp4.c:7:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
    #define pgtable_cache_init() do ; while (0)
                                    ^
   include/linux/mm.h:1793:2: note: in expansion of macro 'pgtable_cache_init'
     pgtable_cache_init();
     ^~~~~~~~~~~~~~~~~~
   net/ipv4/esp4.c: In function 'esp_init_authenc':
>> net/ipv4/esp4.c:958:2: error: implicit declaration of function 'kfree_sensitive'; did you mean 'kvfree_sensitive'? [-Werror=implicit-function-declaration]
     kfree_sensitive(key);
     ^~~~~~~~~~~~~~~
     kvfree_sensitive
   cc1: some warnings being treated as errors


vim +958 net/ipv4/esp4.c

   866	
   867	static int esp_init_authenc(struct xfrm_state *x)
   868	{
   869		struct crypto_aead *aead;
   870		struct crypto_authenc_key_param *param;
   871		struct rtattr *rta;
   872		char *key;
   873		char *p;
   874		char authenc_name[CRYPTO_MAX_ALG_NAME];
   875		unsigned int keylen;
   876		int err;
   877		u32 mask = 0;
   878	
   879		err = -EINVAL;
   880		if (!x->ealg)
   881			goto error;
   882	
   883		err = -ENAMETOOLONG;
   884	
   885		if ((x->props.flags & XFRM_STATE_ESN)) {
   886			if (snprintf(authenc_name, CRYPTO_MAX_ALG_NAME,
   887				     "%s%sauthencesn(%s,%s)%s",
   888				     x->geniv ?: "", x->geniv ? "(" : "",
   889				     x->aalg ? x->aalg->alg_name : "digest_null",
   890				     x->ealg->alg_name,
   891				     x->geniv ? ")" : "") >= CRYPTO_MAX_ALG_NAME)
   892				goto error;
   893		} else {
   894			if (snprintf(authenc_name, CRYPTO_MAX_ALG_NAME,
   895				     "%s%sauthenc(%s,%s)%s",
   896				     x->geniv ?: "", x->geniv ? "(" : "",
   897				     x->aalg ? x->aalg->alg_name : "digest_null",
   898				     x->ealg->alg_name,
   899				     x->geniv ? ")" : "") >= CRYPTO_MAX_ALG_NAME)
   900				goto error;
   901		}
   902	
   903		if (x->xso.offload_handle)
   904			mask |= CRYPTO_ALG_ASYNC;
   905	
   906		aead = crypto_alloc_aead(authenc_name, 0, mask);
   907		err = PTR_ERR(aead);
   908		if (IS_ERR(aead))
   909			goto error;
   910	
   911		x->data = aead;
   912	
   913		keylen = (x->aalg ? (x->aalg->alg_key_len + 7) / 8 : 0) +
   914			 (x->ealg->alg_key_len + 7) / 8 + RTA_SPACE(sizeof(*param));
   915		err = -ENOMEM;
   916		key = kmalloc(keylen, GFP_KERNEL);
   917		if (!key)
   918			goto error;
   919	
   920		p = key;
   921		rta = (void *)p;
   922		rta->rta_type = CRYPTO_AUTHENC_KEYA_PARAM;
   923		rta->rta_len = RTA_LENGTH(sizeof(*param));
   924		param = RTA_DATA(rta);
   925		p += RTA_SPACE(sizeof(*param));
   926	
   927		if (x->aalg) {
   928			struct xfrm_algo_desc *aalg_desc;
   929	
   930			memcpy(p, x->aalg->alg_key, (x->aalg->alg_key_len + 7) / 8);
   931			p += (x->aalg->alg_key_len + 7) / 8;
   932	
   933			aalg_desc = xfrm_aalg_get_byname(x->aalg->alg_name, 0);
   934			BUG_ON(!aalg_desc);
   935	
   936			err = -EINVAL;
   937			if (aalg_desc->uinfo.auth.icv_fullbits / 8 !=
   938			    crypto_aead_authsize(aead)) {
   939				pr_info("ESP: %s digestsize %u != %hu\n",
   940					x->aalg->alg_name,
   941					crypto_aead_authsize(aead),
   942					aalg_desc->uinfo.auth.icv_fullbits / 8);
   943				goto free_key;
   944			}
   945	
   946			err = crypto_aead_setauthsize(
   947				aead, x->aalg->alg_trunc_len / 8);
   948			if (err)
   949				goto free_key;
   950		}
   951	
   952		param->enckeylen = cpu_to_be32((x->ealg->alg_key_len + 7) / 8);
   953		memcpy(p, x->ealg->alg_key, (x->ealg->alg_key_len + 7) / 8);
   954	
   955		err = crypto_aead_setkey(aead, key, keylen);
   956	
   957	free_key:
 > 958		kfree_sensitive(key);
   959	
   960	error:
   961		return err;
   962	}
   963	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
