Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62D19D890
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657725; cv=none; b=hlcRGol9CK03/vvmQgmxfiqul9c1VzfVyjAE/33a/T5za0cusDgQS6I8XmGFia8PC6j4N+P2UOcHziwTdQH1Z1i/P9uMiuUoSQGDt5x8B0VMSFtac3GzdQ9OoQI2A6xgLyOQt1es2+9ort1p7vqM5Rn9IwIWuKyPaX3UGXdJFtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657725; c=relaxed/simple;
	bh=YB37oGKOw9glfGTUg9LUzNmlU8CqsHIRQug6MaWMTuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBvmnLcM4lzPISLPdHLGpG6DQhbQLMMMFXW/QKs2iW4nWDlky0mOAwOoZKKIIMZu5SmMOO50bzt9Bl/MhoB9VX6ZhmOE5vV7l0MdyNfOqlWUQs8q0AkrceKg0Pzm+Zg+IQRm5DJodImwUWkTLC8WxaLRjeaMedje6Slvv0SFs6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPcxSfno; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPcxSfno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717657725; x=1749193725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YB37oGKOw9glfGTUg9LUzNmlU8CqsHIRQug6MaWMTuo=;
  b=hPcxSfno5/8EUWAX/GJMF1TAusJ9dDoe40fc0c2K3Sgc8W0P0AIO2C4n
   z+iVxpHG5PIRn/Qxc6yACvLCuPAqyBlY3ZVj7Fp2RrxIAcKlwqeEEnAv/
   hDuG/BRiNmrTmvYscJMDvWbyH/74ImHKpPfQ3LxtEirZRSnF5EtGnNTkg
   arIgqwHEln5r/CMAyzZCGxkqfWPT1KsSMn94JRmCHKVKjS06F76RKgJqB
   hdL4qYFRfFYagAD47+Se7Gdl/mOVY0RPT3a7KeOlhMcGv/XlTAemt+qda
   YY7t3sMG8+L0o7wIaciqqL/HJIbVrrX4bkRmaDkP4BeuvZ8AImSL6etNX
   Q==;
X-CSE-ConnectionGUID: HMDl0VmcTT+VOmFG6pzAjw==
X-CSE-MsgGUID: h3xRUrCJSv6qQZl77kyXmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14424678"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14424678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:08:44 -0700
X-CSE-ConnectionGUID: hny7cWAPSM2iJqn6gZUKBA==
X-CSE-MsgGUID: q3bcquIVQJ2skfy7K3GhoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37965949"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 00:08:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF7Em-0002mM-0t;
	Thu, 06 Jun 2024 07:08:40 +0000
Date: Thu, 6 Jun 2024 15:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v8 4/6]
 crypto/asymmetric_keys/tpm2_key_rsa.c:221:13: warning: variable 'ret' set
 but not used
Message-ID: <202406061412.X67VR0nK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   f2eae1791f88b0221e88b85339edce52becfdb93
commit: e881ac401f3e2e17c3346d2fcb0a4ade003571bc [4/6] keys: asymmetric: TPM2 RSAPKCS1 signing key
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406061412.X67VR0nK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061412.X67VR0nK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061412.X67VR0nK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_rsa.c: In function 'tpm2_key_rsa_sign':
>> crypto/asymmetric_keys/tpm2_key_rsa.c:221:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     221 |         int ret;
         |             ^~~


vim +/ret +221 crypto/asymmetric_keys/tpm2_key_rsa.c

   207	
   208	/*
   209	 * Sign a RSAPKCS1 signature with a TPM2 private key.
   210	 */
   211	static int tpm2_key_rsa_sign(struct tpm_chip *chip, struct tpm2_key *key,
   212				     struct kernel_pkey_params *params,
   213				     const void *in, void *out)
   214	{
   215		void *asn1_wrapped __free(kfree) = NULL;
   216		const struct rsa_asn1_template *asn1;
   217		const struct tpm2_rsa *parameters;
   218		u32 in_len = params->in_len;
   219		int modulus_size;
   220		u8 *padded;
 > 221		int ret;
   222	
   223		parameters = to_tpm2_rsa(key);
   224		modulus_size = be16_to_cpu(parameters->modulus_size);
   225	
   226		if (params->hash_algo) {
   227			asn1 = rsa_lookup_asn1(params->hash_algo);
   228			if (!asn1)
   229				return -ENOPKG;
   230	
   231			asn1_wrapped = kzalloc(in_len + asn1->size, GFP_KERNEL);
   232			if (!asn1_wrapped)
   233				return -ENOMEM;
   234	
   235			/* ASN.1 template, then the input: */
   236			memcpy(asn1_wrapped, asn1->data, asn1->size);
   237			memcpy(asn1_wrapped + asn1->size, in, in_len);
   238	
   239			in = asn1_wrapped;
   240			in_len += asn1->size;
   241		}
   242	
   243		padded = kzalloc(modulus_size, GFP_KERNEL);
   244		if (!padded)
   245			return -ENOMEM;
   246	
   247		tpm2_pad_pkcs1(in, in_len, padded, modulus_size);
   248		ret = __tpm2_key_rsa_decrypt(chip, key, params, padded,
   249					     modulus_size, out);
   250		kfree(padded);
   251	
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
