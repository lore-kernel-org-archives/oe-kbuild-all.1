Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65C73D65
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695188951; x=1726724951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZUEDL7pYWpJAmjCHSEuOf/RVj7edVu+Dahbo87wf6A=;
  b=FNljfzAxztu80f5k4/tDj6+PbHNby1QWS4fxS3j3JaAibbGxdD828/ff
   lsR/ai/b7QAP7EOCT1RiRbXgAeSGXyk10i+Ssxgd2iXw9GIkyCouvbgWA
   kzBA0sUzjE9REbZ36jsgsJyIUW5ZIWDVG4V84mV4VXhJjq0yRsJWy0Cie
   CfhjDNwvuOSBX7g7+JvoMmRVVwNHFBzPwqrt05I0NTYBxtAQW1hbek9h0
   EImtWFDuTrucjhIsk6dhEEUq7+1G9TV4li+BqQ6r/YCZyP9c5Y69sb0Qh
   c25gChJjQyITlorAObqzyvpZOdYXYycrLSRYXUGZmNdUkHWzBbpRjB2/D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380031925"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380031925"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 22:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836711601"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="836711601"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2023 22:49:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiq5C-0008MW-2N;
	Wed, 20 Sep 2023 05:49:06 +0000
Date: Wed, 20 Sep 2023 13:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1359/1363]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c:113:1: warning: the
 frame size of 1284 bytes is larger than 1024 bytes
Message-ID: <202309201353.KWCq9I7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: 63a2ddb4ca597d67d4e4e858761c1f7ff81ebd11 [1359/1363] v4l2: xilinx: dprx: Add HDCP2x support
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201353.KWCq9I7V-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201353.KWCq9I7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201353.KWCq9I7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c: In function 'xhdcp2x_rx_calc_mont_nprime':
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c:113:1: warning: the frame size of 1284 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     113 | }
         | ^


vim +113 drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c

727d5d0c59572f Kunal Rane 2023-09-04   51  
727d5d0c59572f Kunal Rane 2023-09-04   52  /**
727d5d0c59572f Kunal Rane 2023-09-04   53   * xhdcp2x_rx_calc_mont_nprime() - calculate Montgomery NPrime
727d5d0c59572f Kunal Rane 2023-09-04   54   * @ref: void pointer for passing dummy structure pointer.
727d5d0c59572f Kunal Rane 2023-09-04   55   * @nprime: pointer for nprimep.
727d5d0c59572f Kunal Rane 2023-09-04   56   * @n: pointer for privatekey.
727d5d0c59572f Kunal Rane 2023-09-04   57   * @ndigits: pointer for key size.
727d5d0c59572f Kunal Rane 2023-09-04   58   *
727d5d0c59572f Kunal Rane 2023-09-04   59   * The modulus N has a fixed size of k = 512bits and give k,
727d5d0c59572f Kunal Rane 2023-09-04   60   * r = 2^(k), and rinv is the modular inverse of r.
727d5d0c59572f Kunal Rane 2023-09-04   61   * reference:
727d5d0c59572f Kunal Rane 2023-09-04   62   * Analyzing and Comparing Montgomery Multiplication Algorithms
727d5d0c59572f Kunal Rane 2023-09-04   63   * IEEE Micro, 16(3):26-33,June 1996
727d5d0c59572f Kunal Rane 2023-09-04   64   * By: Cetin Koc, Tolga Acar, and Burton Kaliski
727d5d0c59572f Kunal Rane 2023-09-04   65   *
727d5d0c59572f Kunal Rane 2023-09-04   66   * Return: 0 on success, otherwise EINVAL.
727d5d0c59572f Kunal Rane 2023-09-04   67   */
727d5d0c59572f Kunal Rane 2023-09-04   68  int xhdcp2x_rx_calc_mont_nprime(void *ref, u8 *nprime, const u8 *n, int ndigits)
727d5d0c59572f Kunal Rane 2023-09-04   69  {
727d5d0c59572f Kunal Rane 2023-09-04   70  	u32 n_i[XHDCP2X_RX_HASH_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   71  	u32 nprime_i[XHDCP2X_RX_HASH_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   72  	u32 r[XHDCP2X_RX_HASH_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   73  	u32 rinv[XHDCP2X_RX_HASH_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   74  	u32 t1[XHDCP2X_RX_P_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   75  	u32 t2[XHDCP2X_RX_N_SIZE] = {0};
727d5d0c59572f Kunal Rane 2023-09-04   76  
727d5d0c59572f Kunal Rane 2023-09-04   77  	struct xlnx_hdcp2x_config *xhdcp2x_rx = (struct xlnx_hdcp2x_config *)ref;
727d5d0c59572f Kunal Rane 2023-09-04   78  
727d5d0c59572f Kunal Rane 2023-09-04   79  	mp_conv_from_octets(n_i, XHDCP2X_RX_MP_SIZE_OF(n_i), n, XHDCP2X_NDIGITS_MULT * ndigits);
727d5d0c59572f Kunal Rane 2023-09-04   80  
727d5d0c59572f Kunal Rane 2023-09-04   81  	/* Step 1: R = 2^(NDigits*32) */
727d5d0c59572f Kunal Rane 2023-09-04   82  	r[0] = 1;
727d5d0c59572f Kunal Rane 2023-09-04   83  	mp_shift_left(r, r, 32 * ndigits, XHDCP2X_RX_MP_SIZE_OF(r));
727d5d0c59572f Kunal Rane 2023-09-04   84  
727d5d0c59572f Kunal Rane 2023-09-04   85  	/* Step 2: rinv = r^(-1) * mod(N) */
727d5d0c59572f Kunal Rane 2023-09-04   86  	t1[0] = 0;
727d5d0c59572f Kunal Rane 2023-09-04   87  	memcpy(t1, n_i, sizeof(n_i));
727d5d0c59572f Kunal Rane 2023-09-04   88  	if (mp_mod_inv(rinv, r, t1, XHDCP2X_RX_MP_SIZE_OF(rinv))) {
727d5d0c59572f Kunal Rane 2023-09-04   89  		dev_err(xhdcp2x_rx->dev, "Error: Failed rinv calculation");
727d5d0c59572f Kunal Rane 2023-09-04   90  		return -EINVAL;
727d5d0c59572f Kunal Rane 2023-09-04   91  	}
727d5d0c59572f Kunal Rane 2023-09-04   92  
727d5d0c59572f Kunal Rane 2023-09-04   93  	/* Step 3: NPrime = (r*rinv-1)/N */
727d5d0c59572f Kunal Rane 2023-09-04   94  	mp_multiply(t1, r, rinv, 2 * ndigits);
727d5d0c59572f Kunal Rane 2023-09-04   95  	t2[0] = 1;
727d5d0c59572f Kunal Rane 2023-09-04   96  	mp_subtract(t1, t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1));
727d5d0c59572f Kunal Rane 2023-09-04   97  	mp_divide(nprime_i, t2, t1, XHDCP2X_RX_MP_SIZE_OF(nprime_i), (u32 *)n_i, ndigits);
727d5d0c59572f Kunal Rane 2023-09-04   98  
727d5d0c59572f Kunal Rane 2023-09-04   99  	/* Step 4: Sanity Check, R*Rinv - N*NPrime == 1 */
727d5d0c59572f Kunal Rane 2023-09-04  100  	mp_multiply(t1, r, rinv, 2 * ndigits);
727d5d0c59572f Kunal Rane 2023-09-04  101  	mp_multiply(t2, (u32 *)n_i, nprime_i, XHDCP2X_RX_MP_SIZE_OF(nprime_i));
727d5d0c59572f Kunal Rane 2023-09-04  102  	mp_subtract(t1, t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1));
727d5d0c59572f Kunal Rane 2023-09-04  103  	memset(t2, 0, sizeof(t2));
727d5d0c59572f Kunal Rane 2023-09-04  104  	t2[0] = 1;
727d5d0c59572f Kunal Rane 2023-09-04  105  	if (!mp_equal(t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1))) {
727d5d0c59572f Kunal Rane 2023-09-04  106  		dev_err(xhdcp2x_rx->dev, "Error: Failed NPrime calculation");
727d5d0c59572f Kunal Rane 2023-09-04  107  		return -EINVAL;
727d5d0c59572f Kunal Rane 2023-09-04  108  	}
727d5d0c59572f Kunal Rane 2023-09-04  109  
727d5d0c59572f Kunal Rane 2023-09-04  110  	mp_conv_to_octets(nprime_i, ndigits, nprime, XHDCP2X_NDIGITS_MULT * ndigits);
727d5d0c59572f Kunal Rane 2023-09-04  111  
727d5d0c59572f Kunal Rane 2023-09-04  112  	return 0;
727d5d0c59572f Kunal Rane 2023-09-04 @113  }
727d5d0c59572f Kunal Rane 2023-09-04  114  

:::::: The code at line 113 was first introduced by commit
:::::: 727d5d0c59572f086ee1f33334aac4b02205f87c v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
