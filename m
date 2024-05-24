Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E04729422
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716542175; cv=none; b=jw6ffroBci0iBw+ACiP+C1N+w36YIJ2jYtI9muQREroob259F4c3dvuWM5/HmJBjKQWn85NLMFGUYCWYvmaA3qYjA56nhlCTrBSIIS/VbGlQGVu2UIPEdft0pDJE5c3bJdDFuwcs422sE88Vtj5Oz01U1UrKmfmQr/XXtHvRt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716542175; c=relaxed/simple;
	bh=ZAE+U74S1MXU4O63Cr0eakb7GIFqrYck3N86KI/xxT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CI7KUJCuoLiggpZL0H70DVhwO16LoZKeopfU3rip0QEEQImGREcSnxGd1rW0FDrM74xoGzP6ZbFsrngzYzmj9jysi8nWGYQtSPaGv0TKRvtZDG7epAcCoHNt59B1erflGU0wZovQetlcd8TsecLL7seciYpOgBSu1rXkdECT73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOss4oyK; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOss4oyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716542174; x=1748078174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAE+U74S1MXU4O63Cr0eakb7GIFqrYck3N86KI/xxT0=;
  b=WOss4oyKXFSy15cH8Eq/FlZqV8AOaYjKK0t7VMD5NCbUPD6KfcbDm8Dp
   ZwlEVgQN2NTGHLRaj9eN7MwHACAcu89ojkg4VZQLvpS/B7qBPR5nvvtKQ
   OgTydiHNMjh/AFMV+1wsL8xlunjbxD5klitT8K37l7jMUTNNbWxcLCSZE
   +ThU1ckT/eYH0YCyxB0j4C9RQwHqxFqZAnRQyFlQJdHVR2ntzDdHHf8s7
   ORdtyvWVJ+XeHrBkc/zFaKQwoXUAkIeQpBCMK02+UiMJZ2p3PsgS+zY2H
   OawSb0/4hyIicdKPBdhOBeCxIkqbVaoyiP3EAHkOmt3mXB32KCcwBzs0R
   w==;
X-CSE-ConnectionGUID: pJzyx15GShmh7kQVdRQ71w==
X-CSE-MsgGUID: E9HzrarNQhedwTrqa0XyMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16739247"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="16739247"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 02:16:13 -0700
X-CSE-ConnectionGUID: sdIpA40qQl6GrWaRZTX32A==
X-CSE-MsgGUID: N5+jGVPTRouMW2rgAzfm2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34067569"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 May 2024 02:16:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAR22-0004NT-0x;
	Fri, 24 May 2024 09:16:10 +0000
Date: Fri, 24 May 2024 17:16:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 8/8]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:80:13: warning: variable 'name_alg'
 set but not used
Message-ID: <202405241719.kuImXsYd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   e757613ecd3146679925b1d4fcdaf8da2332d5a2
commit: e757613ecd3146679925b1d4fcdaf8da2332d5a2 [8/8] keys: asymmetric: tpm2_key_ecdsa
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240524/202405241719.kuImXsYd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241719.kuImXsYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405241719.kuImXsYd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_probe':
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:80:13: warning: variable 'name_alg' set but not used [-Wunused-but-set-variable]
      80 |         u16 name_alg;
         |             ^~~~~~~~
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:75:13: warning: variable 'object_attributes' set but not used [-Wunused-but-set-variable]
      75 |         u32 object_attributes;
         |             ^~~~~~~~~~~~~~~~~


vim +/name_alg +80 crypto/asymmetric_keys/tpm2_key_ecdsa.c

    70	
    71	static int tpm2_key_ecdsa_probe(struct tpm2_key_ecdsa *key_ecdsa)
    72	{
    73		struct tpm2_key *key = &key_ecdsa->key;
    74		u16 pub_len = get_unaligned_be16(key->pub);
  > 75		u32 object_attributes;
    76		u16 auth_policy_len;
    77		struct tpm_buf buf;
    78		off_t offset = 2;
    79		u16 symmetric;
  > 80		u16 name_alg;
    81		u16 scheme;
    82		u16 type;
    83		u16 ecc;
    84	
    85		buf.flags = TPM_BUF_TPM2B;
    86		buf.length = key->pub_len;
    87		buf.data = (void *)key->pub;
    88	
    89		if (pub_len != buf.length - 2)
    90			return -EBADMSG;
    91	
    92		type = tpm_buf_read_u16(&buf, &offset);
    93		if (type != TPM_ALG_ECC)
    94			return -EBADMSG;
    95	
    96		name_alg = tpm_buf_read_u16(&buf, &offset);
    97		object_attributes = tpm_buf_read_u32(&buf, &offset);
    98		auth_policy_len = tpm_buf_read_u16(&buf, &offset);
    99		offset += auth_policy_len;
   100	
   101		/* TPMS_ECC_PARMS */
   102		symmetric = tpm_buf_read_u16(&buf, &offset);
   103		if (symmetric != TPM_ALG_NULL)
   104			return -EBADMSG;
   105	
   106		scheme = tpm_buf_read_u16(&buf, &offset);
   107		if (scheme != TPM_ALG_NULL)
   108			return -EBADMSG;
   109	
   110		ecc = tpm_buf_read_u16(&buf, &offset);
   111		pr_info("ecc=%u\n", ecc);
   112		if (ecc != TPM2_ECC_NIST_P256 &&  ecc != TPM2_ECC_NIST_P384 &&
   113		    ecc != TPM2_ECC_NIST_P521)
   114			return -EBADMSG;
   115	
   116		return buf.flags & TPM_BUF_BOUNDARY_ERROR ? -EIO : 0;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
