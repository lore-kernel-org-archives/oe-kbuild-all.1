Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDD5139CFA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 May 2024 22:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716764010; cv=none; b=e0InYgoPwGZ4tpvCpSfpOis5LqbQ6Q3AFZkjX5RWtTAjsxjxHBeYEFRGFgcnfJQB11lDUQVC2PSwSKnNobDbzPFV69fTPC67p4W6eCssNeo+/mRbEB4itlfjqaDcUtphDw8BZUq7E745NSlMOtKg/VpuRhYC0g98vSJmC13QHvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716764010; c=relaxed/simple;
	bh=XTMwu0gdDeSTFKxbFL9KPKJk98ee/Xb4gS9eLqp41+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mojOShFMg4Ksk+vtzVxZKcsJHizqdYIc3Xva8ehEGQbJfxPZ2oeqoYCFwJ916j4eQjTDhTBGzM9NY/ccrev8io2B4cWTvyrMEbdUl89Zr7FFtz/vu2Tjc4UOjIjWYAtsV8c78IdegpdW4Odw1Ju7qku4BPikNhc7dz2/amf9JlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVSLBNhJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVSLBNhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716764009; x=1748300009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTMwu0gdDeSTFKxbFL9KPKJk98ee/Xb4gS9eLqp41+I=;
  b=RVSLBNhJ972awGNMrNXohyDnI8azUFuRANPrn9gZCKHPRbdJc/6uwpNi
   RQjeD8i6apLrpoBFKWVhlenmBWtjIRZ8Rs0bZf4rjIbjAXw/PREtpYYFc
   4v92M/uLX94jJfFzV6HcpaMl3rSwCsbr+CQZ34+LWvWQCrmDQ7o2E71KS
   nhCy7LFSznkiXGO21BK0OZSrNPTgWVV2VC3n2f+bz+k/oM0cs7eMB5Rwv
   qQv3+ysRB1JR1sCupM6mvshuq9BVejVCq6Yjn2OKEtmdIlayoiTxKGuJZ
   wpVvrsw2Twhwe5JMPzpult3LcBfiGJp1MiKckzUrB2nkeAuk680Ac3T5x
   g==;
X-CSE-ConnectionGUID: B6HWwNRXSMK/GwtrmqSfKw==
X-CSE-MsgGUID: IesP9pwvR+Cfg9DqDLZ8xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12845869"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="12845869"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 15:53:29 -0700
X-CSE-ConnectionGUID: 1u90e6kZRM+dHiekhK+8yA==
X-CSE-MsgGUID: 1+FfSzzYQIalSmaBTDMRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; 
   d="scan'208";a="39543051"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2024 15:53:27 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBMjw-0008om-1r;
	Sun, 26 May 2024 22:53:20 +0000
Date: Mon, 27 May 2024 06:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 7/7]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:84:22: warning: unused variable
 'len'
Message-ID: <202405270613.jdm9W2jH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   eb4797bb025eda068fe4a70da5769bbea787aa86
commit: ac0763f2eda2f57350f51e9a05597f5c0f32b74d [7/7] keys: asymmetric: tpm2_key_ecdsa
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240527/202405270613.jdm9W2jH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405270613.jdm9W2jH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270613.jdm9W2jH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_query':
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:84:22: warning: unused variable 'len' [-Wunused-variable]
      84 |         unsigned int len;
         |                      ^~~
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:83:12: warning: unused variable 'pub_key' [-Wunused-variable]
      83 |         u8 pub_key[2 * ECC_MAX_BYTES];
         |            ^~~~~~~
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:82:33: warning: unused variable 'tfm' [-Wunused-variable]
      82 |         struct crypto_akcipher *tfm;
         |                                 ^~~
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:80:19: warning: unused variable 'y' [-Wunused-variable]
      80 |         const u8 *y = tpm2_key_ecdsa_ecc_y(key);
         |                   ^
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:107:16: warning: 'ret' is used uninitialized [-Wuninitialized]
     107 |         return ret;
         |                ^~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:86:13: note: 'ret' was declared here
      86 |         int ret;
         |             ^~~


vim +/len +84 crypto/asymmetric_keys/tpm2_key_ecdsa.c

    71	
    72	static int tpm2_key_ecdsa_query(const struct kernel_pkey_params *params,
    73					struct kernel_pkey_query *info)
    74	{
    75		const struct tpm2_key *key = params->key->payload.data[asym_crypto];
    76		const off_t o = key->priv_len + 2 + sizeof(*key->desc);
    77		const struct tpm2_ecc_parms *p =
    78			(const struct tpm2_ecc_parms *)&key->data[o];
    79		const u8 *x = tpm2_key_ecdsa_ecc_x(key);
  > 80		const u8 *y = tpm2_key_ecdsa_ecc_y(key);
    81		const u16 x_size = get_unaligned_be16(&x[0]);
  > 82		struct crypto_akcipher *tfm;
  > 83		u8 pub_key[2 * ECC_MAX_BYTES];
  > 84		unsigned int len;
    85		char *cipher;
    86		int ret;
    87	
    88		switch (be16_to_cpu(p->ecc)) {
    89		case TPM2_ECC_NIST_P521:
    90			cipher = "ecdsa-nist-p521";
    91			break;
    92		case TPM2_ECC_NIST_P384:
    93			cipher = "ecdsa-nist-p384";
    94			break;
    95		/* TPM2_ECC_NIST_P256: */
    96		default:
    97			cipher = "ecdsa-nist-p256";
    98			break;
    99		}
   100	
   101		pr_info("cipher=%s\n", cipher);
   102	
   103		info->key_size = x_size * 8;
   104		info->max_data_size = x_size;
   105		info->max_sig_size = x_size;
   106		info->supported_ops = KEYCTL_SUPPORTS_SIGN | KEYCTL_SUPPORTS_VERIFY;
 > 107		return ret;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
