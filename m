Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2801869
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690148220; x=1721684220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kipkXcm71q65zOIOIeVRJBFlxk77vrYSvOoFVYoRJ+s=;
  b=EsA6zww2gFw5y4ooBWP6iZKoclD8Ie23BmHJmm2hRXPQIW+h32FiXb30
   VoisKu3nX3tP76XzR5KCFbPtTzlfDV8CTrXm39EOWpJnuwBD/KU+12XQd
   A1Qf6lQpDxXtZehAVNpyk8W70+gXeMm2Wjbn5JOQF0JzLtMRl15PqHEJT
   99Gs21/0PIFCBD8dcWs1BEfEgaDKmCvfkxSikyw16PgMSeTDfDg21xKRE
   cGJxHAeYSlamFFetapgRBqfDg/G58yMUnL1i6i49Xgi4JhTqey9HXFk6m
   f9aNLysErCbarC+qYAeYMvxQ86tYfe7W/Y4o9f6/0DduMt97LO8i1l+8r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="346910420"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="346910420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 14:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="755091418"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="755091418"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 23 Jul 2023 14:36:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNgl7-0009He-2s;
	Sun, 23 Jul 2023 21:36:57 +0000
Date: Mon, 24 Jul 2023 05:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 114/120] net/ipv4/esp4.c:958:2: error:
 implicit declaration of function 'kfree_sensitive'; did you mean
 'kvfree_sensitive'?
Message-ID: <202307240510.UGKQdyzw-lkp@intel.com>
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
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230724/202307240510.UGKQdyzw-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240510.UGKQdyzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240510.UGKQdyzw-lkp@intel.com/

All errors (new ones prefixed by >>):

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
