Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25166217F53
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762794974; cv=none; b=HTooij6oTAyQMrit7RdPSRszZJa43uiZz8rF9gGpGYd4KpDmNjRUqLEvIFrEyoYI99eZ7WjP84LhrUurqQAOaV+R8NDEU/Oj9cJR+SeqiF16RUGK3qGb5/XOzrmfP7Wm60sitsC9USpes3YAGvfW6OehrazGxVKivuhDwFzqBN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762794974; c=relaxed/simple;
	bh=Q2Mxbsv8T6237AEDUSVYx+jeCmcsm3LFOZw0ZhKAQuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYVQOzkCIe1RZo5nBriBA+STUXph02fHBzXI+vK3GJJr+OQNKyjRA6yVb9irbmqCBFbaypN8AG2uy5TO0gNq/6asNJZkchS0Hg4PFt2U8138XLAMoIu1zoX+95Vq+Pn9Vkm4LuUtF6z37KFyL08bjktrX5JId9F8vcIxY1gUlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMC9e447; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMC9e447"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762794973; x=1794330973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q2Mxbsv8T6237AEDUSVYx+jeCmcsm3LFOZw0ZhKAQuY=;
  b=cMC9e447ZqWIKBtyRXkblO1GyOrsyMbw2IN4MNsPobmPBDev+mAnS4gi
   Qx5FuaxKmc1BmPNlEpnGu147AJ9+ocTfafVVKwweHf1C58SWNmNlBt4U7
   y5oViCNSle9IKaQZXeeAdxikd8k9Bul+xvcTmluSQUm1CP2Jifk8BdsYh
   MzPldJ9kTUyO7Rpu4yniNm5dw8s1hOYLrY+/nj3tjisr8wzwIA3RLd26+
   BjDvVkHfn5x4QSs1wrKTgx6pTOp/GMDDdBBiJOx3s2+T+0bqLTX1ZRyI4
   pf50zekjZm5MXHlY7yoca5ni3y1PTLkfvjG4Xjbhq31eEYDY3fUdNu0EY
   g==;
X-CSE-ConnectionGUID: vV9p7ViYRkmLggpIt+4cRg==
X-CSE-MsgGUID: Fj+162WCQfGgw7C2bFVBIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68697316"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="68697316"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 09:16:13 -0800
X-CSE-ConnectionGUID: 1X3bAiOxSze6tk2+GHIV+Q==
X-CSE-MsgGUID: X7WS2uHcTFacIe1/JszFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188033016"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Nov 2025 09:16:12 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIVUv-0000j9-2I;
	Mon, 10 Nov 2025 17:16:09 +0000
Date: Tue, 11 Nov 2025 01:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 2/8]
 crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202511110107.cresrLdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   445b842b50b449ceb18cbbfc72dc28bc25fa8b08
commit: 7ae730f92709e7f54f560e4ca88b10ef1aeb6c22 [2/8] crypto: Add ML-DSA/Dilithium verify support
config: mips-randconfig-r134-20251110 (https://download.01.org/0day-ci/archive/20251111/202511110107.cresrLdf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d445cba39f4dd3dcda4fa1433eca825cf8fc09)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110107.cresrLdf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110107.cresrLdf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/ml_dsa/dilithium_44.c: note: in included file (through crypto/ml_dsa/dilithium_signature_c.c):
>> crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [addressable] [usertype] nonce @@     got restricted __le16 [usertype] @@
   crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse:     expected unsigned short [addressable] [usertype] nonce
   crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse:     got restricted __le16 [usertype]
>> crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [addressable] [usertype] nonce @@     got restricted __le16 [usertype] @@
   crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse:     expected unsigned short [addressable] [usertype] nonce
   crypto/ml_dsa/dilithium_polyvec_c.h:41:33: sparse:     got restricted __le16 [usertype]

vim +41 crypto/ml_dsa/dilithium_polyvec_c.h

    21	
    22	/*
    23	 * @brief expand_mat - Implementation of ExpandA. Generates matrix A with
    24	 *		       uniformly random coefficients a_{i,j} by performing
    25	 *		       rejection sampling on the output stream of
    26	 *		       SHAKE128(rho|j|i).
    27	 *
    28	 * @param [out] mat output matrix
    29	 * @param [in] rho byte array containing seed rho
    30	 */
    31	static inline void
    32	polyvec_matrix_expand(polyvecl mat[DILITHIUM_K],
    33			      const uint8_t rho[DILITHIUM_SEEDBYTES], void *ws_buf)
    34	{
    35		unsigned int i, j;
    36	
    37		for (i = 0; i < DILITHIUM_K; ++i)
    38			for (j = 0; j < DILITHIUM_L; ++j)
    39				poly_uniform(
    40					&mat[i].vec[j], rho,
  > 41					cpu_to_le16((uint16_t)(i << 8) + (uint16_t)j),
    42					ws_buf);
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
