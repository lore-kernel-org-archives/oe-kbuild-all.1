Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E5F15A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 May 2024 02:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716604764; cv=none; b=p7xYUl5+e4JY38mguO/FKTavkpFqCvKgg2+VnMaWwD1dlPAEeRWEr0WiABSr0NStqXGcABz8Wr3trVuX28lPBHBPoJA5JsXp05zbRZH06ldI4SJHrunIlbxk2zObV0u6045+UdiElG6bOTwKI13dRtAMF42v4IHQnPL11ddFdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716604764; c=relaxed/simple;
	bh=tx+fk3IAsT85pYcBb5/wkH/n0aBx1PY5fO+4LVZwutA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aatiz8zDfLvMjrUV+TM5SHklxcQ4yURvsoLiRwp8AbugXx3I/51NYnq7FiBqjA2k/XV5DJhbCbCU5SNWwOyYbfWcT131VneMc3mGHMgv7i5iSyfLtje2asoFLf8Mt281XZhstYxkD8aVUTW9JN4mVWOe6pyozjGLSacXS3dnK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HgSoFXo7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HgSoFXo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716604762; x=1748140762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tx+fk3IAsT85pYcBb5/wkH/n0aBx1PY5fO+4LVZwutA=;
  b=HgSoFXo7bDM8/AJ3y9doYUoGmZBsfLj1QYJ4iAfAejqLk4x0b8jxFhse
   mAwR1F8BTuK/6YNcKbUXKQTJqyEQf4PkOge2BaeEMlqpVBjW40+vknv8C
   7LasK6REGvAOcv5oNk0hdO/W8uzirsFHayCj7OWS8rZkC9dDB+vS0wLeE
   yEvg3vZO58c8dPVhgkHALqhzOyzak7AclXZb+n6NYWw5/AyhxMo8lZH3J
   reHNLOOgbwgzi1t7DB+tMUpryAOn8z6hCywmIN8L2EDMg2pC3vjYO8Ph3
   mSL00uylAyRkb4lMQ9WI5ct5viIYdhXlWWQBeZfYWnBfPpDbDZktZxtHC
   w==;
X-CSE-ConnectionGUID: JqW1INoxTMKDcyUAP0YIZA==
X-CSE-MsgGUID: a2p+/8uGRre17UAFJ976eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23599096"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="23599096"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 19:39:21 -0700
X-CSE-ConnectionGUID: WKOwjijlR1u6izYOx3KIXQ==
X-CSE-MsgGUID: Jm8S49P7Qx6rxpdiZem1Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="39053538"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 May 2024 19:39:21 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAhJV-0006Nr-1e;
	Sat, 25 May 2024 02:39:17 +0000
Date: Sat, 25 May 2024 10:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 8/8]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:76:33: error: 'key_ecdsa'
 undeclared; did you mean 'key_ecc'?
Message-ID: <202405251023.BdgQh2Pb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   a3a5d9adc5a9192e99dccaadf05fe70c5ef56971
commit: a3a5d9adc5a9192e99dccaadf05fe70c5ef56971 [8/8] keys: asymmetric: tpm2_key_ecdsa
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405251023.BdgQh2Pb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251023.BdgQh2Pb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251023.BdgQh2Pb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_preparse':
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:76:33: error: 'key_ecdsa' undeclared (first use in this function); did you mean 'key_ecc'?
      76 |         struct tpm2_key *key = &key_ecdsa->key;
         |                                 ^~~~~~~~~
         |                                 key_ecc
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:76:33: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:134:15: error: implicit declaration of function 'tpm_buf_read'; did you mean 'tpm_pcr_read'? [-Werror=implicit-function-declaration]
     134 |         ret = tpm_buf_read(&buf, &offset, x_size, key_ecc);
         |               ^~~~~~~~~~~~
         |               tpm_pcr_read
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:90:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      90 |         int ret;
         |             ^~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:83:13: warning: variable 'name_alg' set but not used [-Wunused-but-set-variable]
      83 |         u16 name_alg;
         |             ^~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:78:13: warning: variable 'object_attributes' set but not used [-Wunused-but-set-variable]
      78 |         u32 object_attributes;
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +76 crypto/asymmetric_keys/tpm2_key_ecdsa.c

    73	
    74	static int tpm2_key_ecdsa_preparse(struct tpm2_key_ecc *key_ecc)
    75	{
  > 76		struct tpm2_key *key = &key_ecdsa->key;
    77		u16 pub_len = get_unaligned_be16(key->pub);
    78		u32 object_attributes;
    79		u16 auth_policy_len;
    80		struct tpm_buf buf;
    81		off_t offset = 2;
    82		u16 symmetric;
    83		u16 name_alg;
    84		u16 scheme;
    85		u16 x_size;
    86		u16 y_size;
    87		u16 type;
    88		u16 ecc;
    89		u16 kdf;
  > 90		int ret;
    91	
    92		buf.flags = TPM_BUF_TPM2B;
    93		buf.length = key->pub_len;
    94		buf.data = (void *)key->pub;
    95	
    96		if (pub_len != buf.length - 2)
    97			return -EBADMSG;
    98	
    99		/* TPMT_PUBLIC */
   100		type = tpm_buf_read_u16(&buf, &offset);
   101		if (type != TPM_ALG_ECC)
   102			return -EBADMSG;
   103	
   104		name_alg = tpm_buf_read_u16(&buf, &offset);
   105		object_attributes = tpm_buf_read_u32(&buf, &offset);
   106	
   107		auth_policy_len = tpm_buf_read_u16(&buf, &offset);
   108		/* Asymmetric keys do not support options string: */
   109		if (auth_policy_len != 0)
   110			return -EBADMSG;
   111	
   112		/* TPMS_ECC_PARMS */
   113		symmetric = tpm_buf_read_u16(&buf, &offset);
   114		if (symmetric != TPM_ALG_NULL)
   115			return -EBADMSG;
   116	
   117		scheme = tpm_buf_read_u16(&buf, &offset);
   118		if (scheme != TPM_ALG_NULL)
   119			return -EBADMSG;
   120	
   121		ecc = tpm_buf_read_u16(&buf, &offset);
   122		if (ecc != TPM2_ECC_NIST_P256 &&  ecc != TPM2_ECC_NIST_P384 &&
   123		    ecc != TPM2_ECC_NIST_P521)
   124			return -EBADMSG;
   125	
   126		kdf = tpm_buf_read_u16(&buf, &offset);
   127		if (kdf != TPM_ALG_NULL)
   128			return -EBADMSG;
   129	
   130		/* TPMS_ECC_POINT */
   131		x_size = tpm_buf_read_u16(&buf, &offset);
   132		if (x_size > ECC_MAX_DIGITS)
   133			return -EBADMSG;
 > 134		ret = tpm_buf_read(&buf, &offset, x_size, key_ecc);
   135	
   136		y_size = tpm_buf_read_u16(&buf, &offset);
   137		if (y_size > ECC_MAX_DIGITS)
   138			return -EBADMSG;
   139		ret = tpm_buf_read(&buf, &offset, y_size, key_ecc);
   140	
   141		return buf.flags & TPM_BUF_BOUNDARY_ERROR ? -EIO : 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
