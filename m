Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388D1CAB1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 16:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710694175; cv=none; b=Qv8ZdmX0AKM1WaGwvyHRhFHwQzLa44+mrEZHlhJba9nEhJfebiXzfL4fZaw7y5LAHW/lrDDd3Xn5cZGXL1k464BMQy846C+Udq2XNDIRGmbRrs9Yu8yhQ3fyoTgFqbeIQEEWpjnb45Lyfc1BEQYGVJqCCvQRf2LVKNEOqRPADHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710694175; c=relaxed/simple;
	bh=q33gyK59mOuuswDzc+2hWhb82MfWhrmI3cpMSasXnOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vd0HQqyGjLqqeSHdnW0PGFTrMey9IXXVkUx+rC2GfOuhcDKkGsqjn0Mtnhe14Hjix0GSLYZ3EP0DhnVRQsE/WxB72cNFNjeipxXq+3f7+n6qsM+uXRIml5fwgk02JsDJD7XbB6UOsppNm0s9Ct6GwN4Nrk2FSzC8Vsj8YeU5vMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MNZLZBLn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNZLZBLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710694172; x=1742230172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q33gyK59mOuuswDzc+2hWhb82MfWhrmI3cpMSasXnOg=;
  b=MNZLZBLnBUBmARHcw5RY1r25Ai4eQMbI99wR6sDOuozPWllGi0+gmZBI
   /tTt0K5IZ9QOleXXKxm84Krkb8TFAsMKS78btRIELL99QCYxmAPMo7du1
   /qxEFbfygoYtW9bnQQTUeGlYPtHuRNID1z3NFFAqEivwm1L/FZ/5/eJA4
   18omHjrVX3golwi4+LydXiGErq+Er8mPPE+E9aYP1dq9DWGAqclcyRkuP
   cD7e/UMLBQGMd/y4iF6S9SnMz9rI4sADuBZQMb7bM8vDPUcFbRe9/GjeL
   v+FvVwX8TY1iiLCSy5xaoXY6VRW7yq6rYIxRQWGiudBreTEvdn+t0d359
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9316994"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="9316994"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 09:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13121246"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2024 09:49:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlthP-000GMT-1J;
	Sun, 17 Mar 2024 16:49:27 +0000
Date: Mon, 18 Mar 2024 00:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 11/34] lib/spdm_requester.c:1226: warning: Excess
 function parameter 's' description in 'spdm_verify_signature'
Message-ID: <202403180054.SsWQy132-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux spdm-future
head:   6f91b73ee535f0add2932dca6ad981fc7117245b
commit: 77471952a6c044ad21b007c26f74703633e13213 [11/34] PCI/CMA: Authenticate devices on enumeration
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240318/202403180054.SsWQy132-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180054.SsWQy132-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180054.SsWQy132-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/spdm_requester.c:1226: warning: Excess function parameter 's' description in 'spdm_verify_signature'


vim +1226 lib/spdm_requester.c

0a415a0296e041 Jonathan Cameron 2022-09-06  1211  
0a415a0296e041 Jonathan Cameron 2022-09-06  1212  /**
0a415a0296e041 Jonathan Cameron 2022-09-06  1213   * spdm_verify_signature() - Verify signature against leaf key
0a415a0296e041 Jonathan Cameron 2022-09-06  1214   *
0a415a0296e041 Jonathan Cameron 2022-09-06  1215   * @spdm_state: SPDM session state
0a415a0296e041 Jonathan Cameron 2022-09-06  1216   * @s: Signature
0a415a0296e041 Jonathan Cameron 2022-09-06  1217   * @spdm_context: SPDM context (used to create combined_spdm_prefix)
0a415a0296e041 Jonathan Cameron 2022-09-06  1218   *
0a415a0296e041 Jonathan Cameron 2022-09-06  1219   * Implementation of the abstract SPDMSignatureVerify() function described in
0a415a0296e041 Jonathan Cameron 2022-09-06  1220   * SPDM 1.2.0 section 16:  Compute the hash in @spdm_state->desc and verify
0a415a0296e041 Jonathan Cameron 2022-09-06  1221   * that its signature @s was generated with @spdm_state->leaf_key.
0a415a0296e041 Jonathan Cameron 2022-09-06  1222   * Return 0 on success or a negative errno.
0a415a0296e041 Jonathan Cameron 2022-09-06  1223   */
0a415a0296e041 Jonathan Cameron 2022-09-06  1224  static int spdm_verify_signature(struct spdm_state *spdm_state,
0a415a0296e041 Jonathan Cameron 2022-09-06  1225  				 const char *spdm_context)
0a415a0296e041 Jonathan Cameron 2022-09-06 @1226  {
0a415a0296e041 Jonathan Cameron 2022-09-06  1227  	struct public_key_signature sig = {
0a415a0296e041 Jonathan Cameron 2022-09-06  1228  		.s = spdm_state->transcript_end - spdm_state->sig_len,
0a415a0296e041 Jonathan Cameron 2022-09-06  1229  		.s_size = spdm_state->sig_len,
0a415a0296e041 Jonathan Cameron 2022-09-06  1230  		.encoding = spdm_state->base_asym_enc,
0a415a0296e041 Jonathan Cameron 2022-09-06  1231  		.hash_algo = spdm_state->base_hash_alg_name,
0a415a0296e041 Jonathan Cameron 2022-09-06  1232  	};
0a415a0296e041 Jonathan Cameron 2022-09-06  1233  	size_t transcript_sz = spdm_state->transcript_end -
0a415a0296e041 Jonathan Cameron 2022-09-06  1234  			       spdm_state->transcript;
0a415a0296e041 Jonathan Cameron 2022-09-06  1235  	u8 *mhash __free(kfree) = NULL;
0a415a0296e041 Jonathan Cameron 2022-09-06  1236  	u8 *m __free(kfree);
0a415a0296e041 Jonathan Cameron 2022-09-06  1237  	int rc;
0a415a0296e041 Jonathan Cameron 2022-09-06  1238  
0a415a0296e041 Jonathan Cameron 2022-09-06  1239  	m = kmalloc(SPDM_COMBINED_PREFIX_SZ + spdm_state->hash_len, GFP_KERNEL);
0a415a0296e041 Jonathan Cameron 2022-09-06  1240  	if (!m)
0a415a0296e041 Jonathan Cameron 2022-09-06  1241  		return -ENOMEM;
0a415a0296e041 Jonathan Cameron 2022-09-06  1242  
0a415a0296e041 Jonathan Cameron 2022-09-06  1243  	/* Hash the transcript (sans trailing signature) */
0a415a0296e041 Jonathan Cameron 2022-09-06  1244  	rc = crypto_shash_digest(spdm_state->desc, spdm_state->transcript,
0a415a0296e041 Jonathan Cameron 2022-09-06  1245  				 transcript_sz - spdm_state->sig_len,
0a415a0296e041 Jonathan Cameron 2022-09-06  1246  				 m + SPDM_COMBINED_PREFIX_SZ);
0a415a0296e041 Jonathan Cameron 2022-09-06  1247  	if (rc)
0a415a0296e041 Jonathan Cameron 2022-09-06  1248  		return rc;
0a415a0296e041 Jonathan Cameron 2022-09-06  1249  
0a415a0296e041 Jonathan Cameron 2022-09-06  1250  	if (spdm_state->version <= 0x11) {
0a415a0296e041 Jonathan Cameron 2022-09-06  1251  		/*
0a415a0296e041 Jonathan Cameron 2022-09-06  1252  		 * SPDM 1.0 and 1.1 compute the signature only over the hash
0a415a0296e041 Jonathan Cameron 2022-09-06  1253  		 * (SPDM 1.0.0 section 4.9.2.7).
0a415a0296e041 Jonathan Cameron 2022-09-06  1254  		 */
0a415a0296e041 Jonathan Cameron 2022-09-06  1255  		sig.digest = m + SPDM_COMBINED_PREFIX_SZ;
0a415a0296e041 Jonathan Cameron 2022-09-06  1256  		sig.digest_size = spdm_state->hash_len;
0a415a0296e041 Jonathan Cameron 2022-09-06  1257  	} else {
0a415a0296e041 Jonathan Cameron 2022-09-06  1258  		/*
0a415a0296e041 Jonathan Cameron 2022-09-06  1259  		 * From SPDM 1.2, the hash is prefixed with spdm_context before
0a415a0296e041 Jonathan Cameron 2022-09-06  1260  		 * computing the signature over the resulting message M
0a415a0296e041 Jonathan Cameron 2022-09-06  1261  		 * (SPDM 1.2.0 margin no 841).
0a415a0296e041 Jonathan Cameron 2022-09-06  1262  		 */
0a415a0296e041 Jonathan Cameron 2022-09-06  1263  		spdm_create_combined_prefix(spdm_state, spdm_context, m);
0a415a0296e041 Jonathan Cameron 2022-09-06  1264  
0a415a0296e041 Jonathan Cameron 2022-09-06  1265  		/*
0a415a0296e041 Jonathan Cameron 2022-09-06  1266  		 * RSA and ECDSA algorithms require that M is hashed once more.
0a415a0296e041 Jonathan Cameron 2022-09-06  1267  		 * EdDSA and SM2 algorithms omit that step.
0a415a0296e041 Jonathan Cameron 2022-09-06  1268  		 * The switch statement prepares for their introduction.
0a415a0296e041 Jonathan Cameron 2022-09-06  1269  		 */
0a415a0296e041 Jonathan Cameron 2022-09-06  1270  		switch (spdm_state->base_asym_alg) {
0a415a0296e041 Jonathan Cameron 2022-09-06  1271  		default:
0a415a0296e041 Jonathan Cameron 2022-09-06  1272  			mhash = kmalloc(spdm_state->hash_len, GFP_KERNEL);
0a415a0296e041 Jonathan Cameron 2022-09-06  1273  			if (!mhash)
0a415a0296e041 Jonathan Cameron 2022-09-06  1274  				return -ENOMEM;
0a415a0296e041 Jonathan Cameron 2022-09-06  1275  
0a415a0296e041 Jonathan Cameron 2022-09-06  1276  			rc = crypto_shash_digest(spdm_state->desc, m,
0a415a0296e041 Jonathan Cameron 2022-09-06  1277  				SPDM_COMBINED_PREFIX_SZ + spdm_state->hash_len,
0a415a0296e041 Jonathan Cameron 2022-09-06  1278  				mhash);
0a415a0296e041 Jonathan Cameron 2022-09-06  1279  			if (rc)
0a415a0296e041 Jonathan Cameron 2022-09-06  1280  				return rc;
0a415a0296e041 Jonathan Cameron 2022-09-06  1281  
0a415a0296e041 Jonathan Cameron 2022-09-06  1282  			sig.digest = mhash;
0a415a0296e041 Jonathan Cameron 2022-09-06  1283  			sig.digest_size = spdm_state->hash_len;
0a415a0296e041 Jonathan Cameron 2022-09-06  1284  			break;
0a415a0296e041 Jonathan Cameron 2022-09-06  1285  		}
0a415a0296e041 Jonathan Cameron 2022-09-06  1286  	}
0a415a0296e041 Jonathan Cameron 2022-09-06  1287  
0a415a0296e041 Jonathan Cameron 2022-09-06  1288  	return public_key_verify_signature(spdm_state->leaf_key, &sig);
0a415a0296e041 Jonathan Cameron 2022-09-06  1289  }
0a415a0296e041 Jonathan Cameron 2022-09-06  1290  

:::::: The code at line 1226 was first introduced by commit
:::::: 0a415a0296e0412ac8675b7ee2085d0ea76d5d74 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
