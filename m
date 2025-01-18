Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31A34F5E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737175345; cv=none; b=MFVymr43gw84nXfiuLupdjBR31nbLE+ox2sAeSuicBz2ejAkkjtceIh1CBVclOboWfQYP72Y2Ipyi5OkzqEZPEcrkLJ8jB3sK1mv4WNcApw9nk9pOTP1BxoIR69i/M0I97a59ClcTcLU9X5MlHqRyex+yHaFrxHkJBYM+XU+uBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737175345; c=relaxed/simple;
	bh=MFvTBCuZE3UW7C/r/Ap7mhuJ4QOZW+clofJKRPxgmOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXQQCK8jFepNqyN4BA2NvxSClOK4A/+A+BvumSxgE34wM0Qk+qB6VYFUYHDYZjpcs+N/k7qeGRE5eeNOS3V8upCmvJBQLJ9UkGgN5fX2yFL2+o2RM2qoVU3NZYY2DU7AZ4kBJST71DgY+l/ilv+Hpb1ckP6RUaXBLanfXgIEscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPij32iE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPij32iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737175343; x=1768711343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFvTBCuZE3UW7C/r/Ap7mhuJ4QOZW+clofJKRPxgmOI=;
  b=WPij32iE8wJynWyVwBEFaQy2DCvKpDyJklpOarRqC4xTi1LFoHMTqvA3
   4bgkY/m00SDNbYVNWhgm9zgHnMxZkttwnaLkfEHmPO6is6JyBweHzmb1l
   KE96E/iN2Asdo4ghT5UUd2EBcm/JiKsvnK9rMUgXQfrhIrbWitvIYsF1z
   9pD2RPd1fxXS9VCTaqlqjECm+7wDYagxonql6FlV28zGAB/v5qQhcuKxe
   54bHNCcMytbkBBpiYP4nGyD1jjOZsnCgnU3lsqdEmqEFaKtzQ+hfJFNHG
   S9Nt1TkNd7IWz7OFp3IOzl3hzNs90053ecZ/PIQjdDYLHajqnByeRiRhp
   w==;
X-CSE-ConnectionGUID: kGlPTk69SLe1h/pIuRuVGA==
X-CSE-MsgGUID: pv3sMj2UTqyHOusjcFufxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37501323"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37501323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 20:42:22 -0800
X-CSE-ConnectionGUID: yU9d5SaJRvGvBtw3B3tpJQ==
X-CSE-MsgGUID: KJlDbZxTT3+sBFR2FUXxpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129261679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2025 20:42:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ0f4-000U67-2s;
	Sat, 18 Jan 2025 04:42:18 +0000
Date: Sat, 18 Jan 2025 12:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] crypto/jitterentropy.c:134:
 warning: Function parameter or member 'ec' not described in 'jent_apt_reset'
Message-ID: <202501181200.W6cqXCRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   23d1ade7402eba239eb9bb4a5494d92a497b5021
commit: 8d07be2893b7b7abe3cfe60ac487a98a9ab99105 [1/1] UPSTREAM: crypto: jitter - SP800-90B compliance
config: x86_64-buildonly-randconfig-003-20250116 (https://download.01.org/0day-ci/archive/20250118/202501181200.W6cqXCRw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181200.W6cqXCRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181200.W6cqXCRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/jitterentropy.c:134: warning: Function parameter or member 'ec' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:134: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_reset'
>> crypto/jitterentropy.c:148: warning: Function parameter or member 'ec' not described in 'jent_apt_insert'
>> crypto/jitterentropy.c:148: warning: Function parameter or member 'delta_masked' not described in 'jent_apt_insert'
>> crypto/jitterentropy.c:192: warning: Function parameter or member 'ec' not described in 'jent_rct_insert'
>> crypto/jitterentropy.c:192: warning: Function parameter or member 'stuck' not described in 'jent_rct_insert'
>> crypto/jitterentropy.c:236: warning: Function parameter or member 'ec' not described in 'jent_rct_failure'
   crypto/jitterentropy.c:265: warning: Function parameter or member 'ec' not described in 'jent_stuck'
   crypto/jitterentropy.c:265: warning: Function parameter or member 'current_delta' not described in 'jent_stuck'
>> crypto/jitterentropy.c:301: warning: Function parameter or member 'ec' not described in 'jent_health_failure'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'ec' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'bits' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:327: warning: Function parameter or member 'min' not described in 'jent_loop_shuffle'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'ec' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'time' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:383: warning: Function parameter or member 'loop_cnt' not described in 'jent_lfsr_time'
>> crypto/jitterentropy.c:383: warning: Function parameter or member 'stuck' not described in 'jent_lfsr_time'
   crypto/jitterentropy.c:463: warning: Function parameter or member 'ec' not described in 'jent_memaccess'
   crypto/jitterentropy.c:463: warning: Function parameter or member 'loop_cnt' not described in 'jent_memaccess'
   crypto/jitterentropy.c:517: warning: Function parameter or member 'ec' not described in 'jent_measure_jitter'
   crypto/jitterentropy.c:549: warning: Function parameter or member 'ec' not described in 'jent_gen_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'ec' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'data' not described in 'jent_read_entropy'
   crypto/jitterentropy.c:594: warning: Function parameter or member 'len' not described in 'jent_read_entropy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


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
   169	/***************************************************************************
   170	 * Stuck Test and its use as Repetition Count Test
   171	 *
   172	 * The Jitter RNG uses an enhanced version of the Repetition Count Test
   173	 * (RCT) specified in SP800-90B section 4.4.1. Instead of counting identical
   174	 * back-to-back values, the input to the RCT is the counting of the stuck
   175	 * values during the generation of one Jitter RNG output block.
   176	 *
   177	 * The RCT is applied with an alpha of 2^{-30} compliant to FIPS 140-2 IG 9.8.
   178	 *
   179	 * During the counting operation, the Jitter RNG always calculates the RCT
   180	 * cut-off value of C. If that value exceeds the allowed cut-off value,
   181	 * the Jitter RNG output block will be calculated completely but discarded at
   182	 * the end. The caller of the Jitter RNG is informed with an error code.
   183	 ***************************************************************************/
   184	
   185	/**
   186	 * Repetition Count Test as defined in SP800-90B section 4.4.1
   187	 *
   188	 * @ec [in] Reference to entropy collector
   189	 * @stuck [in] Indicator whether the value is stuck
   190	 */
   191	static void jent_rct_insert(struct rand_data *ec, int stuck)
 > 192	{
   193		/*
   194		 * If we have a count less than zero, a previous RCT round identified
   195		 * a failure. We will not overwrite it.
   196		 */
   197		if (ec->rct_count < 0)
   198			return;
   199	
   200		if (stuck) {
   201			ec->rct_count++;
   202	
   203			/*
   204			 * The cutoff value is based on the following consideration:
   205			 * alpha = 2^-30 as recommended in FIPS 140-2 IG 9.8.
   206			 * In addition, we require an entropy value H of 1/OSR as this
   207			 * is the minimum entropy required to provide full entropy.
   208			 * Note, we collect 64 * OSR deltas for inserting them into
   209			 * the entropy pool which should then have (close to) 64 bits
   210			 * of entropy.
   211			 *
   212			 * Note, ec->rct_count (which equals to value B in the pseudo
   213			 * code of SP800-90B section 4.4.1) starts with zero. Hence
   214			 * we need to subtract one from the cutoff value as calculated
   215			 * following SP800-90B.
   216			 */
   217			if ((unsigned int)ec->rct_count >= (31 * ec->osr)) {
   218				ec->rct_count = -1;
   219				ec->health_failure = 1;
   220			}
   221		} else {
   222			ec->rct_count = 0;
   223		}
   224	}
   225	
   226	/**
   227	 * Is there an RCT health test failure?
   228	 *
   229	 * @ec [in] Reference to entropy collector
   230	 *
   231	 * @return
   232	 * 	0 No health test failure
   233	 * 	1 Permanent health test failure
   234	 */
   235	static int jent_rct_failure(struct rand_data *ec)
 > 236	{
   237		if (ec->rct_count < 0)
   238			return 1;
   239		return 0;
   240	}
   241	
   242	static inline __u64 jent_delta(__u64 prev, __u64 next)
   243	{
   244	#define JENT_UINT64_MAX		(__u64)(~((__u64) 0))
   245		return (prev < next) ? (next - prev) :
   246				       (JENT_UINT64_MAX - prev + 1 + next);
   247	}
   248	
   249	/**
   250	 * Stuck test by checking the:
   251	 * 	1st derivative of the jitter measurement (time delta)
   252	 * 	2nd derivative of the jitter measurement (delta of time deltas)
   253	 * 	3rd derivative of the jitter measurement (delta of delta of time deltas)
   254	 *
   255	 * All values must always be non-zero.
   256	 *
   257	 * @ec [in] Reference to entropy collector
   258	 * @current_delta [in] Jitter time delta
   259	 *
   260	 * @return
   261	 * 	0 jitter measurement not stuck (good bit)
   262	 * 	1 jitter measurement stuck (reject bit)
   263	 */
   264	static int jent_stuck(struct rand_data *ec, __u64 current_delta)
 > 265	{
   266		__u64 delta2 = jent_delta(ec->last_delta, current_delta);
   267		__u64 delta3 = jent_delta(ec->last_delta2, delta2);
   268		unsigned int delta_masked = current_delta & JENT_APT_WORD_MASK;
   269	
   270		ec->last_delta = current_delta;
   271		ec->last_delta2 = delta2;
   272	
   273		/*
   274		 * Insert the result of the comparison of two back-to-back time
   275		 * deltas.
   276		 */
   277		jent_apt_insert(ec, delta_masked);
   278	
   279		if (!current_delta || !delta2 || !delta3) {
   280			/* RCT with a stuck bit */
   281			jent_rct_insert(ec, 1);
   282			return 1;
   283		}
   284	
   285		/* RCT with a non-stuck bit */
   286		jent_rct_insert(ec, 0);
   287	
   288		return 0;
   289	}
   290	
   291	/**
   292	 * Report any health test failures
   293	 *
   294	 * @ec [in] Reference to entropy collector
   295	 *
   296	 * @return
   297	 * 	0 No health test failure
   298	 * 	1 Permanent health test failure
   299	 */
   300	static int jent_health_failure(struct rand_data *ec)
 > 301	{
   302		/* Test is only enabled in FIPS mode */
   303		if (!jent_fips_enabled())
   304			return 0;
   305	
   306		return ec->health_failure;
   307	}
   308	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
