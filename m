Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF918C17
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688660566; x=1720196566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/orTJg41Y1WopFqvoPgKP5Hqo3JWykbLFSQmXyQ9JEA=;
  b=Nzxqz91PYIM1SXcekPP/7jLYrRz2zQ2YQRWj3gnUNvyLo2j2cURv8U/h
   1Dt5Ece5tM4RvN8OCDemXsNXFdtrL9WXoW1Z45+GcpzDDFozqas1OX53r
   RmARBQBk31HjJ1oJa5sO9oh6jS1t3dgcIe+2xtbvjPUkigy67CF1DaQWz
   2Y0j2qmcQOQAcfNd+aGfHz5JkrTCCOnL9cFpeasCo9ZSaLkbNU/eNMNoM
   SJAjA59zkamGJ0M70L4HmQWhO6MV91qCCPa57Os9jLmkEI5DPp5ew7LpP
   86Qy6TWitJtCX/fcF/OcJz7c1qikB+5g0cNA+2+sd/mqepc5u3rwyclia
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409834"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="394409834"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 09:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="669789945"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="669789945"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jul 2023 09:22:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHRkc-0001Ri-0A;
	Thu, 06 Jul 2023 16:22:38 +0000
Date: Fri, 7 Jul 2023 00:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 3/11] crypto/asymmetric_keys/public_key.c:208:33: error:
 'req' undeclared; did you mean 'ret'?
Message-ID: <202307070058.134za1iU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   b00ab70c1d71ab7909ff7a1dd5a39c9228f2a1f3
commit: 969bedc52c38392b57689534503acdd1e61f23d5 [3/11] crypto: ecdsa - Support P1363 signature encoding
config: csky-randconfig-r034-20230706 (https://download.01.org/0day-ci/archive/20230707/202307070058.134za1iU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070058.134za1iU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070058.134za1iU-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/asymmetric_keys/public_key.c: In function 'software_key_query':
>> crypto/asymmetric_keys/public_key.c:208:33: error: 'req' undeclared (first use in this function); did you mean 'ret'?
     208 |                 else if (strcmp(req->encoding, "p1363") == 0)
         |                                 ^~~
         |                                 ret
   crypto/asymmetric_keys/public_key.c:208:33: note: each undeclared identifier is reported only once for each function it appears in


vim +208 crypto/asymmetric_keys/public_key.c

   148	
   149	/*
   150	 * Query information about a key.
   151	 */
   152	static int software_key_query(const struct kernel_pkey_params *params,
   153				      struct kernel_pkey_query *info)
   154	{
   155		struct crypto_akcipher *tfm;
   156		struct public_key *pkey = params->key->payload.data[asym_crypto];
   157		char alg_name[CRYPTO_MAX_ALG_NAME];
   158		u8 *key, *ptr;
   159		int ret, len;
   160	
   161		ret = software_key_determine_akcipher(pkey, params->encoding,
   162						      params->hash_algo, alg_name);
   163		if (ret < 0)
   164			return ret;
   165	
   166		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
   167		if (IS_ERR(tfm))
   168			return PTR_ERR(tfm);
   169	
   170		ret = -ENOMEM;
   171		key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
   172			      GFP_KERNEL);
   173		if (!key)
   174			goto error_free_tfm;
   175		memcpy(key, pkey->key, pkey->keylen);
   176		ptr = key + pkey->keylen;
   177		ptr = pkey_pack_u32(ptr, pkey->algo);
   178		ptr = pkey_pack_u32(ptr, pkey->paramlen);
   179		memcpy(ptr, pkey->params, pkey->paramlen);
   180	
   181		if (pkey->key_is_private)
   182			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
   183		else
   184			ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
   185		if (ret < 0)
   186			goto error_free_key;
   187	
   188		len = crypto_akcipher_maxsize(tfm);
   189		info->key_size = len * 8;
   190	
   191		if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
   192			/*
   193			 * ECDSA key sizes are much smaller than RSA, and thus could
   194			 * operate on (hashed) inputs that are larger than key size.
   195			 * For example SHA384-hashed input used with secp256r1
   196			 * based keys.  Set max_data_size to be at least as large as
   197			 * the largest supported hash size (SHA512)
   198			 */
   199			info->max_data_size = 64;
   200	
   201			/*
   202			 * Verify takes ECDSA-Sig (described in RFC 5480) as input,
   203			 * which is actually 2 'key_size'-bit integers encoded in
   204			 * ASN.1.  Account for the ASN.1 encoding overhead here.
   205			 */
   206			if (strcmp(params->encoding, "x962") == 0)
   207				info->max_sig_size = 2 * (len + 3) + 2;
 > 208			else if (strcmp(req->encoding, "p1363") == 0)
   209				info->max_sig_size = 2 * len;
   210		} else {
   211			info->max_data_size = len;
   212			info->max_sig_size = len;
   213		}
   214	
   215		info->max_enc_size = len;
   216		info->max_dec_size = len;
   217		info->supported_ops = (KEYCTL_SUPPORTS_ENCRYPT |
   218				       KEYCTL_SUPPORTS_VERIFY);
   219		if (pkey->key_is_private)
   220			info->supported_ops |= (KEYCTL_SUPPORTS_DECRYPT |
   221						KEYCTL_SUPPORTS_SIGN);
   222		ret = 0;
   223	
   224	error_free_key:
   225		kfree(key);
   226	error_free_tfm:
   227		crypto_free_akcipher(tfm);
   228		pr_devel("<==%s() = %d\n", __func__, ret);
   229		return ret;
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
