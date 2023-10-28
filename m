Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DCAB667
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzPw0eEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698527261; x=1730063261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKp8P4f4QiE8AvJvE7U+YuxE59+jpeAcbECJQrixP7Q=;
  b=ZzPw0eEcQ4qbO2dS/7p2XvRCfMbqanud0N99LgNLS8VWesoFMoX7eim5
   zVQuBOg817b+kjhdthys/lK2Uzt2cJkSwfzjluChdNNrsXdbQdCA8qhEt
   wPvyy430ut/ZlDkKZN8TpS0KQNrbSoJ8GWY5mWGLa27ur7d/gpM0OMcq9
   P07wIttrTqvBgZdBEFhRSTPIyfaIxGFoD0GgvCeRICSFdxoxniBYkCf4m
   d5uLeXRnUy2vk0pRJrq/heZTlV7hZrJcwbGZzQp0i0feNS8cZvbqGZtXD
   IlhFB3Rw5JTK1kLqzs5xfcdYpAypn5o3Aj+dQ06EE1vIq7kPi66KwFjH7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454385614"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="454385614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 14:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="933416263"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="933416263"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Oct 2023 14:07:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwqWv-000C59-0P;
	Sat, 28 Oct 2023 21:07:37 +0000
Date: Sun, 29 Oct 2023 05:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: warning:
 'gcm_init_htable' accessing 256 bytes in a region of size 224
Message-ID: <202310290551.CnFwE5xz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Danny,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2af9b20dbb39f6ebf9b9b6c090271594627d818e
commit: 9c716e1bd369afa2d1c5038297e8ceda3f82db7d crypto: p10-aes-gcm - Remove POWER10_CPU dependency
date:   6 months ago
config: powerpc64-randconfig-r004-20230830 (https://download.01.org/0day-ci/archive/20231029/202310290551.CnFwE5xz-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290551.CnFwE5xz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290551.CnFwE5xz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/crypto/aes-gcm-p10-glue.c: In function 'gcmp10_init':
>> arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: warning: 'gcm_init_htable' accessing 256 bytes in a region of size 224 [-Wstringop-overflow=]
     121 |         gcm_init_htable(hash->Htable+32, hash->H);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: note: referencing argument 1 of type 'unsigned char[256]'
   arch/powerpc/crypto/aes-gcm-p10-glue.c:121:9: note: referencing argument 2 of type 'unsigned char[16]'
   arch/powerpc/crypto/aes-gcm-p10-glue.c:41:17: note: in a call to function 'gcm_init_htable'
      41 | asmlinkage void gcm_init_htable(unsigned char htable[256], unsigned char Xi[16]);
         |                 ^~~~~~~~~~~~~~~


vim +/gcm_init_htable +121 arch/powerpc/crypto/aes-gcm-p10-glue.c

cdcecfd9991fe9 Danny Tsen 2023-02-20  113  
cdcecfd9991fe9 Danny Tsen 2023-02-20  114  static void gcmp10_init(struct gcm_ctx *gctx, u8 *iv, unsigned char *rdkey,
cdcecfd9991fe9 Danny Tsen 2023-02-20  115  			struct Hash_ctx *hash, u8 *assoc, unsigned int assoclen)
cdcecfd9991fe9 Danny Tsen 2023-02-20  116  {
cdcecfd9991fe9 Danny Tsen 2023-02-20  117  	__be32 counter = cpu_to_be32(1);
cdcecfd9991fe9 Danny Tsen 2023-02-20  118  
cdcecfd9991fe9 Danny Tsen 2023-02-20  119  	aes_p8_encrypt(hash->H, hash->H, rdkey);
cdcecfd9991fe9 Danny Tsen 2023-02-20  120  	set_subkey(hash->H);
cdcecfd9991fe9 Danny Tsen 2023-02-20 @121  	gcm_init_htable(hash->Htable+32, hash->H);
cdcecfd9991fe9 Danny Tsen 2023-02-20  122  
cdcecfd9991fe9 Danny Tsen 2023-02-20  123  	*((__be32 *)(iv+12)) = counter;
cdcecfd9991fe9 Danny Tsen 2023-02-20  124  
cdcecfd9991fe9 Danny Tsen 2023-02-20  125  	gctx->Plen = 0;
cdcecfd9991fe9 Danny Tsen 2023-02-20  126  
cdcecfd9991fe9 Danny Tsen 2023-02-20  127  	/*
cdcecfd9991fe9 Danny Tsen 2023-02-20  128  	 * Encrypt counter vector as iv tag and increment counter.
cdcecfd9991fe9 Danny Tsen 2023-02-20  129  	 */
cdcecfd9991fe9 Danny Tsen 2023-02-20  130  	aes_p8_encrypt(iv, gctx->ivtag, rdkey);
cdcecfd9991fe9 Danny Tsen 2023-02-20  131  
cdcecfd9991fe9 Danny Tsen 2023-02-20  132  	counter = cpu_to_be32(2);
cdcecfd9991fe9 Danny Tsen 2023-02-20  133  	*((__be32 *)(iv+12)) = counter;
cdcecfd9991fe9 Danny Tsen 2023-02-20  134  	memcpy(gctx->iv, iv, 16);
cdcecfd9991fe9 Danny Tsen 2023-02-20  135  
cdcecfd9991fe9 Danny Tsen 2023-02-20  136  	gctx->aadLen = assoclen;
cdcecfd9991fe9 Danny Tsen 2023-02-20  137  	memset(gctx->aad_hash, 0, 16);
cdcecfd9991fe9 Danny Tsen 2023-02-20  138  	if (assoclen)
cdcecfd9991fe9 Danny Tsen 2023-02-20  139  		set_aad(gctx, hash, assoc, assoclen);
cdcecfd9991fe9 Danny Tsen 2023-02-20  140  }
cdcecfd9991fe9 Danny Tsen 2023-02-20  141  

:::::: The code at line 121 was first introduced by commit
:::::: cdcecfd9991fe9aac8160a9731b0ffd1e702d19d crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation

:::::: TO: Danny Tsen <dtsen@linux.ibm.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
