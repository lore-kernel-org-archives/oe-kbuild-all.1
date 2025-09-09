Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B631CA46
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757415355; cv=none; b=i7C56kwbyz/4Yxd1/X9ckGWIjCxbK9dzbGVVGXNFQ/IvzbHJZQ68yi/Gn/3SsR9Nmy8J2M2m/f6vnEGmLtrqMnvhCFtfFMGx68dXjjPZ3nqcibnij3j/IZemEBwMuko0kq135Mj6VmW//RHRjSKwltZpB9nV+rqNZaZt779DLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757415355; c=relaxed/simple;
	bh=t4xjMCmtXze7NBEqy2auJC+EDzUCTi7i/+obAuFDZtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLfwrvwOR18YDSPA6r9MZbPOKmmFGwsE3TFiy4D4ApOx+gXQbfoaBd7ws9pCPlet69TXmUgkgzctaUtQNCDBvQY4W5XZ+8xG1eqIhY+pdepnEa9VwnjLIm0pJBMASACGHhCVnJa0GqyHm7vRjDcj4y2tRwFpKmj59LsZ3jHrFh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3spK2U0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3spK2U0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757415351; x=1788951351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4xjMCmtXze7NBEqy2auJC+EDzUCTi7i/+obAuFDZtc=;
  b=V3spK2U0E7Ma/I1sHiBVIxHh2oEpyVuP2Kjw6cK3r5xOPgWvC8Ds+mVi
   dZy85VTDCU97ov9KDkzZZeJuey2uQG34k4a2awTvUh4zKt1AIu7nj2IU7
   vMjUxrZWZnZnJmfLxOBFgP2PkKedRo0h4YstnHwL1Im6BimxyKxI3Pt79
   0vWIdKpAZRTLsL6oOS223QO518Q6RBsmWLLmkPoAia817A8XCvtDL0X7u
   chGRzXhAFsfKJ9JdG7DftUJxdHymvvdlCHmFp/YJSNBhTTuJGDXJ/tI6T
   rO/FaqEdIgI1qgOgTD3QrqZXM1W8SYy6WPSesStbvZ2VyQxc92FRuqnR4
   A==;
X-CSE-ConnectionGUID: 1KUvwSTeQqakkYm9kskFKA==
X-CSE-MsgGUID: qPJ56SUOSm+pCFk4NI+eMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59553003"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59553003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 03:55:50 -0700
X-CSE-ConnectionGUID: I8OU58cNS9GpVw+prZJQBw==
X-CSE-MsgGUID: KUHdfZS4T2iTfjVtSyQe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177405867"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2025 03:55:47 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvw0n-0004lT-1g;
	Tue, 09 Sep 2025 10:55:45 +0000
Date: Tue, 9 Sep 2025 18:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: T Pratham <t-pratham@ti.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Kamlesh Gurudasani <kamlesh@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kavitha Malarvizhi <k-malarvizhi@ti.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] crypto: ti: Add support for AES-CCM in DTHEv2
 driver
Message-ID: <202509091806.ibkQZYuz-lkp@intel.com>
References: <20250908140928.2801062-5-t-pratham@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908140928.2801062-5-t-pratham@ti.com>

Hi Pratham,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on next-20250909]
[cannot apply to herbert-crypto-2.6/master linus/master v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/T-Pratham/crypto-ti-Add-support-for-AES-XTS-in-DTHEv2-driver/20250908-221357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20250908140928.2801062-5-t-pratham%40ti.com
patch subject: [PATCH v2 4/4] crypto: ti: Add support for AES-CCM in DTHEv2 driver
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20250909/202509091806.ibkQZYuz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091806.ibkQZYuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091806.ibkQZYuz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/ti/dthev2-aes.c: In function 'dthe_aes_set_ctrl_key':
>> drivers/crypto/ti/dthev2-aes.c:258:29: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     258 |                 ctrl_val |= FIELD_PREP(DTHE_AES_CTRL_CCM_L_MASK,
         |                             ^~~~~~~~~~


vim +/FIELD_PREP +258 drivers/crypto/ti/dthev2-aes.c

   186	
   187	static void dthe_aes_set_ctrl_key(struct dthe_tfm_ctx *ctx,
   188					  struct dthe_aes_req_ctx *rctx,
   189					  u32 *iv_in)
   190	{
   191		struct dthe_data *dev_data = dthe_get_dev(ctx);
   192		void __iomem *aes_base_reg = dev_data->regs + DTHE_P_AES_BASE;
   193		u32 ctrl_val = 0;
   194	
   195		writel_relaxed(ctx->key[0], aes_base_reg + DTHE_P_AES_KEY1_0);
   196		writel_relaxed(ctx->key[1], aes_base_reg + DTHE_P_AES_KEY1_1);
   197		writel_relaxed(ctx->key[2], aes_base_reg + DTHE_P_AES_KEY1_2);
   198		writel_relaxed(ctx->key[3], aes_base_reg + DTHE_P_AES_KEY1_3);
   199	
   200		if (ctx->keylen > AES_KEYSIZE_128) {
   201			writel_relaxed(ctx->key[4], aes_base_reg + DTHE_P_AES_KEY1_4);
   202			writel_relaxed(ctx->key[5], aes_base_reg + DTHE_P_AES_KEY1_5);
   203		}
   204		if (ctx->keylen == AES_KEYSIZE_256) {
   205			writel_relaxed(ctx->key[6], aes_base_reg + DTHE_P_AES_KEY1_6);
   206			writel_relaxed(ctx->key[7], aes_base_reg + DTHE_P_AES_KEY1_7);
   207		}
   208	
   209		if (ctx->aes_mode == DTHE_AES_XTS) {
   210			size_t key2_offset = ctx->keylen / sizeof(u32);
   211	
   212			writel_relaxed(ctx->key[key2_offset + 0], aes_base_reg + DTHE_P_AES_KEY2_0);
   213			writel_relaxed(ctx->key[key2_offset + 1], aes_base_reg + DTHE_P_AES_KEY2_1);
   214			writel_relaxed(ctx->key[key2_offset + 2], aes_base_reg + DTHE_P_AES_KEY2_2);
   215			writel_relaxed(ctx->key[key2_offset + 3], aes_base_reg + DTHE_P_AES_KEY2_3);
   216	
   217			if (ctx->keylen > AES_KEYSIZE_128) {
   218				writel_relaxed(ctx->key[key2_offset + 4], aes_base_reg + DTHE_P_AES_KEY2_4);
   219				writel_relaxed(ctx->key[key2_offset + 5], aes_base_reg + DTHE_P_AES_KEY2_5);
   220			}
   221			if (ctx->keylen == AES_KEYSIZE_256) {
   222				writel_relaxed(ctx->key[key2_offset + 6], aes_base_reg + DTHE_P_AES_KEY2_6);
   223				writel_relaxed(ctx->key[key2_offset + 7], aes_base_reg + DTHE_P_AES_KEY2_7);
   224			}
   225		}
   226	
   227		if (rctx->enc)
   228			ctrl_val |= DTHE_AES_CTRL_DIR_ENC;
   229	
   230		if (ctx->keylen == AES_KEYSIZE_128)
   231			ctrl_val |= DTHE_AES_CTRL_KEYSIZE_16B;
   232		else if (ctx->keylen == AES_KEYSIZE_192)
   233			ctrl_val |= DTHE_AES_CTRL_KEYSIZE_24B;
   234		else
   235			ctrl_val |= DTHE_AES_CTRL_KEYSIZE_32B;
   236	
   237		// Write AES mode
   238		ctrl_val &= DTHE_AES_CTRL_MODE_CLEAR_MASK;
   239		switch (ctx->aes_mode) {
   240		case DTHE_AES_ECB:
   241			ctrl_val |= AES_CTRL_ECB_MASK;
   242			break;
   243		case DTHE_AES_CBC:
   244			ctrl_val |= AES_CTRL_CBC_MASK;
   245			break;
   246		case DTHE_AES_CTR:
   247			ctrl_val |= AES_CTRL_CTR_MASK;
   248			ctrl_val |= DTHE_AES_CTRL_CTR_WIDTH_128B;
   249			break;
   250		case DTHE_AES_XTS:
   251			ctrl_val |= AES_CTRL_XTS_MASK;
   252			break;
   253		case DTHE_AES_GCM:
   254			ctrl_val |= AES_CTRL_GCM_MASK;
   255			break;
   256		case DTHE_AES_CCM:
   257			ctrl_val |= AES_CTRL_CCM_MASK;
 > 258			ctrl_val |= FIELD_PREP(DTHE_AES_CTRL_CCM_L_MASK,
   259					       (iv_in[0] & DTHE_AES_CCM_L_FROM_IV_MASK));
   260			ctrl_val |= DTHE_AES_CTRL_CCM_M_MAXVAL;
   261			break;
   262		}
   263	
   264		if (iv_in) {
   265			ctrl_val |= DTHE_AES_CTRL_SAVE_CTX_SET;
   266			for (int i = 0; i < AES_IV_WORDS; ++i)
   267				writel_relaxed(iv_in[i],
   268					       aes_base_reg + DTHE_P_AES_IV_IN_0 + (DTHE_REG_SIZE * i));
   269		}
   270	
   271		writel_relaxed(ctrl_val, aes_base_reg + DTHE_P_AES_CTRL);
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
