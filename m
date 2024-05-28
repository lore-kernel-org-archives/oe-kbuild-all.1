Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E14DF6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716876389; cv=none; b=slyjpk4iLMr53vrXREgET1YcMl0TBqZaL8SYDqgCs1gozKNOCTwmVFKobdJIr9TcWA55WkOAw8yNaI61Hw/cAK4ODyxPvYbbDAHnQUv+77CovbIJrdz7V66d/5aI3yBPA4LkD3X1L06d+O7v03hwKkEg3XMdEma8bE3ZsWxMmLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716876389; c=relaxed/simple;
	bh=+wDb0hViySGzAJkfQnJZc+AXxAi3/1xTmay1Zy7Q7vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BM2O/XVa8MgWyPq3HAwSMiCkDr30XqY5i0Y9fLbbFVwj0mnAkA6UvKKWYmhtEHP5YDce9+SmwNBPYc9q9DDjq7xMbINT2jSTTMrxpEXOgSUEX8qVigAummADnndd9drYVb98yU80srqsGCudeBgeI1ZrrHwETVjawo+fypVv2KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1B5EVtR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1B5EVtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716876387; x=1748412387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+wDb0hViySGzAJkfQnJZc+AXxAi3/1xTmay1Zy7Q7vk=;
  b=O1B5EVtRwUkfNcKls7Pqf57cjeQsaitHHk9tEgkCXARDXip6hxlAr58x
   ovMU+DTCoG+d2MZIsWgxmoT8zQHZgJONBKYKZy8wWPyqQCcPDRgyf93YB
   k+QGHBAwr7DEYJ5+z9VB01tXgONMkH/U9NCYgvvKCt3xZBtmQyzx5PnXb
   AKhX9iCCetoBWG7f3cg0ImWNPZAPCn/Qw5+NBQy5oDihI4iUWjGPN2CHs
   uW08HGEv4ImRW5DQSnPvmyaIpqmqlOlHPaMsK5kFNM+pHv2DvU4U88MDS
   M0oVI0sNIEqo9F7aXHZQienB72i8J6dRg6DI/R117buonJiVzhu8xy+zU
   w==;
X-CSE-ConnectionGUID: 5hUcPl5aTM+B4mYDgjA7KA==
X-CSE-MsgGUID: Bwav4rJ1SMW5/O8JUI7MpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13147897"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13147897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 23:06:27 -0700
X-CSE-ConnectionGUID: V3F9sgd6SEqsmepnP8Diew==
X-CSE-MsgGUID: kVSMYu1hQf2uyIrvoJ/O2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="34877075"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2024 23:06:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBpyZ-000BmJ-0R;
	Tue, 28 May 2024 06:06:23 +0000
Date: Tue, 28 May 2024 14:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 7/7]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:247:20: error: invalid operands to
 binary - (have 'u8 *' {aka 'unsigned char *'} and 'void *')
Message-ID: <202405281432.g5mXeFzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   dc964eb239038a9c46b80b57e5113138949a6c0c
commit: dc964eb239038a9c46b80b57e5113138949a6c0c [7/7] keys: asymmetric: Add tpm2_key_ecdsa
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240528/202405281432.g5mXeFzp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281432.g5mXeFzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281432.g5mXeFzp-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_sign':
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:247:20: error: invalid operands to binary - (have 'u8 *' {aka 'unsigned char *'} and 'void *')
     247 |         return ptr - out;
         |                    ^


vim +247 crypto/asymmetric_keys/tpm2_key_ecdsa.c

   130	
   131	static int tpm2_key_ecdsa_sign(struct tpm_chip *chip, struct tpm2_key *key,
   132				       struct kernel_pkey_params *params,
   133				       const void *in, void *out)
   134	{
   135		off_t offset = sizeof(struct tpm_header) + 4;
   136		u16 hash_algo = TPM_ALG_SHA256;
   137		u8 digest[SHA256_DIGEST_SIZE];
   138		u32 in_len = params->in_len;
   139		struct tpm_buf buf;
   140		u16 digest_size;
   141		u32 key_handle;
   142		u8 *ptr = out;
   143		u16 sig_algo;
   144		int ret;
   145	
   146		/* Require explicit hash algorithm: */
   147		if (!params->hash_algo)
   148			return -EINVAL;
   149	
   150		/* Currently only support SHA256: */
   151		if (!!strcmp(params->hash_algo, "sha256"))
   152			return -EINVAL;
   153	
   154		ret = tpm_try_get_ops(chip);
   155		if (ret)
   156			return ret;
   157	
   158		ret = tpm2_start_auth_session(chip);
   159		if (ret)
   160			goto err_ops;
   161	
   162		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   163		if (ret < 0) {
   164			tpm2_end_auth_session(chip);
   165			goto err_ops;
   166		}
   167	
   168		tpm_buf_append_name(chip, &buf, key->parent, NULL);
   169		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
   170					    TPM2_SA_ENCRYPT, NULL, 0);
   171		tpm_buf_append(&buf, &key->data[0], key->priv_len + key->pub_len);
   172		if (buf.flags & TPM_BUF_OVERFLOW) {
   173			tpm2_end_auth_session(chip);
   174			ret = -E2BIG;
   175			goto err_buf;
   176		}
   177		tpm_buf_fill_hmac_session(chip, &buf);
   178		ret = tpm_transmit_cmd(chip, &buf, 4, "ECDSA loading");
   179		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   180		if (ret) {
   181			tpm2_end_auth_session(chip);
   182			ret = -EIO;
   183			goto err_buf;
   184		}
   185	
   186		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   187	
   188		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_SIGN);
   189		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   190		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
   191	
   192		sha256(in, in_len, digest);
   193		tpm_buf_append_u16(&buf, SHA256_DIGEST_SIZE);
   194		tpm_buf_append(&buf, digest, SHA256_DIGEST_SIZE);
   195		tpm_buf_append_u16(&buf, TPM_ALG_ECDSA);
   196		tpm_buf_append_u16(&buf, TPM_ALG_SHA256);
   197	
   198		/* 10.7.2 A NULL Ticket */
   199		tpm_buf_append_u16(&buf, TPM2_ST_HASHCHECK);
   200		tpm_buf_append_u32(&buf, TPM2_RH_NULL);
   201		tpm_buf_append_u16(&buf, 0);
   202	
   203		tpm_buf_fill_hmac_session(chip, &buf);
   204		ret = tpm_transmit_cmd(chip, &buf, 4, "ECDSA signing");
   205		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   206		if (ret) {
   207			tpm2_end_auth_session(chip);
   208			ret = -EIO;
   209			goto err_blob;
   210		}
   211	
   212		ret = -EIO;
   213		sig_algo = tpm_buf_read_u16(&buf, &offset);
   214		if (sig_algo != TPM_ALG_ECDSA)
   215			goto err_blob;
   216	
   217		hash_algo = tpm_buf_read_u16(&buf, &offset);
   218		if (hash_algo != TPM_ALG_SHA256)
   219			goto err_blob;
   220	
   221		/* SEQUENCE */
   222		*ptr++ = 0x30;
   223		*ptr++ = 2 * (1 + SHA256_DIGEST_SIZE);
   224	
   225		digest_size = tpm_buf_read_u16(&buf, &offset);
   226		if (digest_size != SHA256_DIGEST_SIZE)
   227			goto err_blob;
   228	
   229		/* INTEGER */
   230		*ptr++ = 0x02;
   231		*ptr++ = SHA256_DIGEST_SIZE;
   232		memcpy(ptr, &buf.data[offset], SHA256_DIGEST_SIZE);
   233		offset += SHA256_DIGEST_SIZE;
   234		ptr += SHA256_DIGEST_SIZE;
   235	
   236		digest_size = tpm_buf_read_u16(&buf, &offset);
   237		if (digest_size != SHA256_DIGEST_SIZE)
   238			goto err_blob;
   239	
   240		/* INTEGER */
   241		*ptr++ = 0x02;
   242		*ptr++ = SHA256_DIGEST_SIZE;
   243		memcpy(ptr, &buf.data[offset], SHA256_DIGEST_SIZE);
   244		offset += SHA256_DIGEST_SIZE;
   245		ptr += SHA256_DIGEST_SIZE;
   246	
 > 247		return ptr - out;
   248	
   249	err_blob:
   250		tpm2_flush_context(chip, key_handle);
   251	
   252	err_buf:
   253		tpm_buf_destroy(&buf);
   254	
   255	err_ops:
   256		tpm_put_ops(chip);
   257		return ret;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
