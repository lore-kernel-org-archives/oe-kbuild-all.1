Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA559101E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntItGtCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700406813; x=1731942813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNdiiy7XTXhl52Vpih5pxQqOL8H0D+vttvqAKs6SvfE=;
  b=ntItGtCNpkdw1ztB4f5Av15zvxR55vuMHpPpa/FsPKsL18cBq/3gQxDk
   z34dnd0lr9Dib2yRTPpDsXf9KvSy8E3CpcFr0BDLBmz8Tf0vT9UoZDOhC
   ylqLotOQo7aGS1nc/cA3zS43UXo42Me15BvpcIdttNtQqD/lFik119kwv
   ONZ8kq/KQal1ht0TfiePBPWvph98rmd9ozALEXMP9SAZJtTlyky1TEWEb
   80njF2onfnhWhaLDf6l/vTRsXNEyUQXbGFQHJrTsRn+kcRb1JVIVZv1we
   L0HcFjjMMwxKJ5p4e4YN8yNKT34yk+QjJzf+c4/uMRuXOyuKw3qSL5q5L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390362303"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="390362303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 07:13:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909869611"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="909869611"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 07:13:31 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4jUH-0005Dk-0F;
	Sun, 19 Nov 2023 15:13:29 +0000
Date: Sun, 19 Nov 2023 23:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:master 21/32]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c:113:1: warning: the
 frame size of 1280 bytes is larger than 1024 bytes
Message-ID: <202311192318.dsrbe6Rc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   c8b3583bc86352009c6ac61e2ced0e12118f8ebb
commit: a89e660050e0a228670b89b0a59b5c2827a9e26e [21/32] v4l2: xilinx: dprx: Add HDCP2x support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311192318.dsrbe6Rc-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192318.dsrbe6Rc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192318.dsrbe6Rc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c: In function 'xhdcp2x_rx_calc_mont_nprime':
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c:113:1: warning: the frame size of 1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     113 | }
         | ^


vim +113 drivers/media/platform/xilinx/xilinx-hdcp2x-rx-crypt.c

f22aab6b6fea09 Kunal Rane 2023-09-04   51  
f22aab6b6fea09 Kunal Rane 2023-09-04   52  /**
f22aab6b6fea09 Kunal Rane 2023-09-04   53   * xhdcp2x_rx_calc_mont_nprime() - calculate Montgomery NPrime
f22aab6b6fea09 Kunal Rane 2023-09-04   54   * @ref: void pointer for passing dummy structure pointer.
f22aab6b6fea09 Kunal Rane 2023-09-04   55   * @nprime: pointer for nprimep.
f22aab6b6fea09 Kunal Rane 2023-09-04   56   * @n: pointer for privatekey.
f22aab6b6fea09 Kunal Rane 2023-09-04   57   * @ndigits: pointer for key size.
f22aab6b6fea09 Kunal Rane 2023-09-04   58   *
f22aab6b6fea09 Kunal Rane 2023-09-04   59   * The modulus N has a fixed size of k = 512bits and give k,
f22aab6b6fea09 Kunal Rane 2023-09-04   60   * r = 2^(k), and rinv is the modular inverse of r.
f22aab6b6fea09 Kunal Rane 2023-09-04   61   * reference:
f22aab6b6fea09 Kunal Rane 2023-09-04   62   * Analyzing and Comparing Montgomery Multiplication Algorithms
f22aab6b6fea09 Kunal Rane 2023-09-04   63   * IEEE Micro, 16(3):26-33,June 1996
f22aab6b6fea09 Kunal Rane 2023-09-04   64   * By: Cetin Koc, Tolga Acar, and Burton Kaliski
f22aab6b6fea09 Kunal Rane 2023-09-04   65   *
f22aab6b6fea09 Kunal Rane 2023-09-04   66   * Return: 0 on success, otherwise EINVAL.
f22aab6b6fea09 Kunal Rane 2023-09-04   67   */
f22aab6b6fea09 Kunal Rane 2023-09-04   68  int xhdcp2x_rx_calc_mont_nprime(void *ref, u8 *nprime, const u8 *n, int ndigits)
f22aab6b6fea09 Kunal Rane 2023-09-04   69  {
f22aab6b6fea09 Kunal Rane 2023-09-04   70  	u32 n_i[XHDCP2X_RX_HASH_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   71  	u32 nprime_i[XHDCP2X_RX_HASH_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   72  	u32 r[XHDCP2X_RX_HASH_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   73  	u32 rinv[XHDCP2X_RX_HASH_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   74  	u32 t1[XHDCP2X_RX_P_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   75  	u32 t2[XHDCP2X_RX_N_SIZE] = {0};
f22aab6b6fea09 Kunal Rane 2023-09-04   76  
f22aab6b6fea09 Kunal Rane 2023-09-04   77  	struct xlnx_hdcp2x_config *xhdcp2x_rx = (struct xlnx_hdcp2x_config *)ref;
f22aab6b6fea09 Kunal Rane 2023-09-04   78  
f22aab6b6fea09 Kunal Rane 2023-09-04   79  	mp_conv_from_octets(n_i, XHDCP2X_RX_MP_SIZE_OF(n_i), n, XHDCP2X_NDIGITS_MULT * ndigits);
f22aab6b6fea09 Kunal Rane 2023-09-04   80  
f22aab6b6fea09 Kunal Rane 2023-09-04   81  	/* Step 1: R = 2^(NDigits*32) */
f22aab6b6fea09 Kunal Rane 2023-09-04   82  	r[0] = 1;
f22aab6b6fea09 Kunal Rane 2023-09-04   83  	mp_shift_left(r, r, 32 * ndigits, XHDCP2X_RX_MP_SIZE_OF(r));
f22aab6b6fea09 Kunal Rane 2023-09-04   84  
f22aab6b6fea09 Kunal Rane 2023-09-04   85  	/* Step 2: rinv = r^(-1) * mod(N) */
f22aab6b6fea09 Kunal Rane 2023-09-04   86  	t1[0] = 0;
f22aab6b6fea09 Kunal Rane 2023-09-04   87  	memcpy(t1, n_i, sizeof(n_i));
f22aab6b6fea09 Kunal Rane 2023-09-04   88  	if (mp_mod_inv(rinv, r, t1, XHDCP2X_RX_MP_SIZE_OF(rinv))) {
f22aab6b6fea09 Kunal Rane 2023-09-04   89  		dev_err(xhdcp2x_rx->dev, "Error: Failed rinv calculation");
f22aab6b6fea09 Kunal Rane 2023-09-04   90  		return -EINVAL;
f22aab6b6fea09 Kunal Rane 2023-09-04   91  	}
f22aab6b6fea09 Kunal Rane 2023-09-04   92  
f22aab6b6fea09 Kunal Rane 2023-09-04   93  	/* Step 3: NPrime = (r*rinv-1)/N */
f22aab6b6fea09 Kunal Rane 2023-09-04   94  	mp_multiply(t1, r, rinv, 2 * ndigits);
f22aab6b6fea09 Kunal Rane 2023-09-04   95  	t2[0] = 1;
f22aab6b6fea09 Kunal Rane 2023-09-04   96  	mp_subtract(t1, t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1));
f22aab6b6fea09 Kunal Rane 2023-09-04   97  	mp_divide(nprime_i, t2, t1, XHDCP2X_RX_MP_SIZE_OF(nprime_i), (u32 *)n_i, ndigits);
f22aab6b6fea09 Kunal Rane 2023-09-04   98  
f22aab6b6fea09 Kunal Rane 2023-09-04   99  	/* Step 4: Sanity Check, R*Rinv - N*NPrime == 1 */
f22aab6b6fea09 Kunal Rane 2023-09-04  100  	mp_multiply(t1, r, rinv, 2 * ndigits);
f22aab6b6fea09 Kunal Rane 2023-09-04  101  	mp_multiply(t2, (u32 *)n_i, nprime_i, XHDCP2X_RX_MP_SIZE_OF(nprime_i));
f22aab6b6fea09 Kunal Rane 2023-09-04  102  	mp_subtract(t1, t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1));
f22aab6b6fea09 Kunal Rane 2023-09-04  103  	memset(t2, 0, sizeof(t2));
f22aab6b6fea09 Kunal Rane 2023-09-04  104  	t2[0] = 1;
f22aab6b6fea09 Kunal Rane 2023-09-04  105  	if (!mp_equal(t1, t2, XHDCP2X_RX_MP_SIZE_OF(t1))) {
f22aab6b6fea09 Kunal Rane 2023-09-04  106  		dev_err(xhdcp2x_rx->dev, "Error: Failed NPrime calculation");
f22aab6b6fea09 Kunal Rane 2023-09-04  107  		return -EINVAL;
f22aab6b6fea09 Kunal Rane 2023-09-04  108  	}
f22aab6b6fea09 Kunal Rane 2023-09-04  109  
f22aab6b6fea09 Kunal Rane 2023-09-04  110  	mp_conv_to_octets(nprime_i, ndigits, nprime, XHDCP2X_NDIGITS_MULT * ndigits);
f22aab6b6fea09 Kunal Rane 2023-09-04  111  
f22aab6b6fea09 Kunal Rane 2023-09-04  112  	return 0;
f22aab6b6fea09 Kunal Rane 2023-09-04 @113  }
f22aab6b6fea09 Kunal Rane 2023-09-04  114  

:::::: The code at line 113 was first introduced by commit
:::::: f22aab6b6fea09fe2a51968c7f6687eb55886157 v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
