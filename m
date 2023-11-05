Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1272D61C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOG17ws5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699203765; x=1730739765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xgau/fowZra5PCvOZ7j6uy60RQWVA3KY8ZqZAIWrduQ=;
  b=GOG17ws5Kv8EJRpPnhV6aCmcuqT+aeAXSN/dgXr43h0m8iiQiKS0zBvr
   72skJok/HTNRevB/DnnVk/DN13eV2ObCRTqfcqrLjcZRwroy5Akk2uW//
   n3lkLgmi/SwcqGQ45g2Fk5snPXz9RTwjboWF49Q16+IfguuNUxix2HTAd
   lltfuVSmkgvXtR/b1j9Ub+9qvfrlhuLhbhys0eanueQyryJGpR/TijxSm
   xVRwAS6h3OAG/O3kx5hj0/ReCKV0jg+JJZo+tsN7B0HSdKySqRCbEIt88
   kCxSBE/tczCmO51BKUlJn07ibRn8Fc/EyFmdk80no2kkvhLekrEAEsq5a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2070102"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2070102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 09:02:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1009315118"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1009315118"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Nov 2023 09:02:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzgWG-0005dk-0J;
	Sun, 05 Nov 2023 17:02:40 +0000
Date: Mon, 6 Nov 2023 01:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 15372/29121]
 crypto/jitterentropy.c:134: warning: Function parameter or member
 'delta_masked' not described in 'jent_apt_reset'
Message-ID: <202311060029.kbrnOnyl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   2ac128c04e339e37898b7a798b7fcaa391d965c5
commit: 8d07be2893b7b7abe3cfe60ac487a98a9ab99105 [15372/29121] UPSTREAM: crypto: jitter - SP800-90B compliance
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231106/202311060029.kbrnOnyl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060029.kbrnOnyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060029.kbrnOnyl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/jitterentropy.c:134: warning: Function parameter or member 'ec' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:134: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:148: warning: Function parameter or member 'ec' not described in 'jent_apt_insert'
   crypto/jitterentropy.c:148: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_insert'
   crypto/jitterentropy.c:192: warning: Function parameter or member 'ec' not described in 'jent_rct_insert'
   crypto/jitterentropy.c:192: warning: Function parameter or member 'stuck' not described in 'jent_rct_insert'
   crypto/jitterentropy.c:236: warning: Function parameter or member 'ec' not described in 'jent_rct_failure'
   crypto/jitterentropy.c:265: warning: Function parameter or member 'ec' not described in 'jent_stuck'
   crypto/jitterentropy.c:265: warning: Function parameter or member 'current_delta' not described in 'jent_stuck'
   crypto/jitterentropy.c:301: warning: Function parameter or member 'ec' not described in 'jent_health_failure'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'ec' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'bits' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'min' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'ec' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'time' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'loop_cnt' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'stuck' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:463: warning: Function parameter or member 'ec' not described in 'jent_memaccess'
   crypto/jitterentropy.c:463: warning: Function parameter or member 'loop_cnt' not described in 'jent_memaccess'
   crypto/jitterentropy.c:517: warning: Function parameter or member 'ec' not described in 'jent_measure_jitter'
   crypto/jitterentropy.c:549: warning: Function parameter or member 'ec' not described in 'jent_gen_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'ec' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'data' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'len' not described in 'jent_read_entropy'


vim +134 crypto/jitterentropy.c

   121	
   122	/***************************************************************************
   123	 * Adaptive Proportion Test
   124	 *
   125	 * This test complies with SP800-90B section 4.4.2.
   126	 ***************************************************************************/
   127	
   128	/**
   129	 * Reset the APT counter
   130	 *
   131	 * @ec [in] Reference to entropy collector
   132	 */
   133	static void jent_apt_reset(struct rand_data *ec, unsigned int delta_masked)
 > 134	{
   135		/* Reset APT counter */
   136		ec->apt_count = 0;
   137		ec->apt_base = delta_masked;
   138		ec->apt_observations = 0;
   139	}
   140	
   141	/**
   142	 * Insert a new entropy event into APT
   143	 *
   144	 * @ec [in] Reference to entropy collector
   145	 * @delta_masked [in] Masked time delta to process
   146	 */
   147	static void jent_apt_insert(struct rand_data *ec, unsigned int delta_masked)
 > 148	{
   149		/* Initialize the base reference */
   150		if (!ec->apt_base_set) {
   151			ec->apt_base = delta_masked;
   152			ec->apt_base_set = 1;
   153			return;
   154		}
   155	
   156		if (delta_masked == ec->apt_base) {
   157			ec->apt_count++;
   158	
   159			if (ec->apt_count >= JENT_APT_CUTOFF)
   160				ec->health_failure = 1;
   161		}
   162	
   163		ec->apt_observations++;
   164	
   165		if (ec->apt_observations >= JENT_APT_WINDOW_SIZE)
   166			jent_apt_reset(ec, delta_masked);
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
