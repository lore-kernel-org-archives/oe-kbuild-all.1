Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E861FE7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716832022; cv=none; b=jPhHRp2j089KHx3HMWtwRxyIh2HxcxGpYgK4Linm581huDT+sY6vpjP0bhW23RHoYd2qjOKzgQ3Rqp+MvgtiU+r2inM56suZPCVURSm2FWdpCI6nTL+mQ6Rh1+NW2WFuXP71BYkn6VAt4jxuQYnWsAGCGzl5ER7X1zH/VWCmer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716832022; c=relaxed/simple;
	bh=lzsknMuMmeYUyXwMP1tIrtstyOxXBsf4kpevJQuaL4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7rn4gxomW81sTzmtBj1v5CIwgdTl9nHZqf61HCWqg4d7caPxU1bmAcFrDcEmxu9ZRu/f1lixMshjFGE5Dl/Lyv3OlRp58R4as6ARxA/+atRdRk0dTk+bnwb3l+/2dF6jqSvcPCYCt41yP1fG/j9eGU460M9AsivGUAFA2RGPcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S28A7siX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S28A7siX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716832021; x=1748368021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lzsknMuMmeYUyXwMP1tIrtstyOxXBsf4kpevJQuaL4I=;
  b=S28A7siXWzu6cA1cpWlWWG/8qVy9ozacDzfQvx9rAX555tea0XTiPYKL
   dRadc9TXLS0B2HnF15vtdZD0qZS/ofCqdQI3y5akWjua1ythaLfv0rzVk
   Jzx0IWSLIyLI6ckgQB/PqetFCeQ0drrotfAdHmmQiC+8Cz2wKwnLBDXWG
   lB2kWWklzk5T9tXb6DkLPAfDaNa5Qz1lzK+yDYOrUGpcZbrcVN/0iAKNd
   tYbs+g0hwTsZXM+QVdgWHDQI8bWIxsK5Zta2wA47wjv8Sl6zUtBp7JNg5
   A7f1GgsnHH3j/n5iwAQZX0/6iuOXl3fOsE4baiuM6xFHpN68WWMF/dsnw
   A==;
X-CSE-ConnectionGUID: R3j/HyKhQiekpR4Gc/BPEw==
X-CSE-MsgGUID: NRoalsGfRdm0xkPhYBXgkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13003632"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13003632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 10:47:00 -0700
X-CSE-ConnectionGUID: SHKjsKb4THSzfAziPcK7jw==
X-CSE-MsgGUID: 6LypNPhyRLyzCnM0CNObxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="66032615"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2024 10:46:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBeQj-000Ay7-0E;
	Mon, 27 May 2024 17:46:48 +0000
Date: Tue, 28 May 2024 01:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 7/7]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:105:15: warning: unused variable
 'ptr'
Message-ID: <202405280151.R2xH4gM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   9ee263d95b12a67095b49704b67ccd5aebd117a3
commit: 9ee263d95b12a67095b49704b67ccd5aebd117a3 [7/7] keys: asymmetric: Add tpm2_key_ecdsa
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240528/202405280151.R2xH4gM4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280151.R2xH4gM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280151.R2xH4gM4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_query':
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:105:15: warning: unused variable 'ptr' [-Wunused-variable]
     105 |         void *ptr;
         |               ^~~


vim +/ptr +105 crypto/asymmetric_keys/tpm2_key_ecdsa.c

    90	
    91	static int tpm2_key_ecdsa_query(const struct kernel_pkey_params *params,
    92					struct kernel_pkey_query *info)
    93	{
    94		const struct tpm2_key *key = params->key->payload.data[asym_crypto];
    95		const off_t o = key->priv_len + 2 + sizeof(*key->desc);
    96		const struct tpm2_ecc_parms *p =
    97			(const struct tpm2_ecc_parms *)&key->data[o];
    98		u16 ecc = be16_to_cpu(p->ecc);
    99		const char *ecc_name = tpm2_ecc_name(ecc);
   100		const u8 *x = tpm2_key_ecdsa_ecc_x(key);
   101		u16 x_size = get_unaligned_be16(&x[0]);
   102		struct crypto_akcipher *tfm;
   103		int len, ret;
   104		u8 in[256];
 > 105		void *ptr;
   106	
   107		tfm = crypto_alloc_akcipher(ecc_name, 0, 0);
   108		if (IS_ERR(tfm))
   109			return PTR_ERR(tfm);
   110	
   111		len = crypto_akcipher_maxsize(tfm);
   112		pr_info("len=%d, x_size=%u\n", len, x_size);
   113	
   114		memcpy(&in[0], &x[0], x_size);
   115		memcpy(&in[x_size], &x[x_size + 2], x_size);
   116		ret = crypto_akcipher_set_pub_key(tfm, in, 2 * x_size);
   117		crypto_free_akcipher(tfm);
   118	
   119		if (ret < 0)
   120			return ret;
   121	
   122		info->max_sig_size = 256;
   123		info->key_size = 256;
   124		info->max_data_size = 256;
   125		info->max_enc_size = 256;
   126		info->max_dec_size = 256;
   127		info->supported_ops = KEYCTL_SUPPORTS_SIGN | KEYCTL_SUPPORTS_VERIFY;
   128	
   129		return ret;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
