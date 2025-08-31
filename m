Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF338FA3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 01:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756604920; cv=none; b=RQh+dzSBb2xJnXLLX5YicIpf0BIE7puCPqxuKkd9Mzm09Ss2wjK2RPggKT6rCcxvGjkUMXMRS0aHYsmd4fRwMP4AUhgYG09EvFIGtg3SJ+ejbSP64IkGxu8/r6/NTl69jz0sXkBnMCWwwZ2XsuKOXYmzsNkNRhhgyOz7tI1kv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756604920; c=relaxed/simple;
	bh=IGXJTIAVGtct3m5GCpnW8CB3NPcxIhEkcDN3awwnn5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ux765i60XCME7ANVuUuHAiAAh8sO36fKoz/NMzVNsQlvgdSHZ5ixsdDtG7fD92vcEl5YdrQHI7xaBToKXcjZhT2XZiIyALN5i5U4kItzbKd087TPetQyFL7Q1VvfpiyjsiPQvX4rgj7IZDZXSIquWJoc7sFRQd4XDBHok2x9/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZOipBCn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZOipBCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756604919; x=1788140919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGXJTIAVGtct3m5GCpnW8CB3NPcxIhEkcDN3awwnn5A=;
  b=WZOipBCn0uPpoIyX9gWGXa1qVAX3l/TxAs/rlEZqJiXOAJ3O4ExbIdEB
   CVOhVq5HC+jpzw9VZmyyz4TVHcpYtSozY0kDc8XuHmv6WezSpO15i4MEW
   RMIJDVEcS/mGSlhb84anjrGntb5BQdpWnTD496dcBPOoTDNykG85O5EgU
   9qst90t/vklpKVdW+J+0JeI9yxSsssqN/zfYlyc+K9rM/oWnUxkcoHzPh
   52L1m9rYBnHIy4MKynCS8X4EUruQDFHUavobDMh+UulzPYHTFn3fT0JQP
   0XhEYQEpFWG1P7Z1ctQUVUAwKE9egdFoDzcM6EQQSJsHa5CFJBhrYMpc8
   w==;
X-CSE-ConnectionGUID: ybMYTbcqRGWfUJfH8d775g==
X-CSE-MsgGUID: e6Oa6XKMRTqZT5LOq569ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58770859"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58770859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 18:48:39 -0700
X-CSE-ConnectionGUID: MU2V/LwAQP2iBkeOiMJ+mw==
X-CSE-MsgGUID: MwFyDHY+TlG5wyPxPN9JGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171468096"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2025 18:48:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usXAg-000Vqd-2A;
	Sun, 31 Aug 2025 01:48:04 +0000
Date: Sun, 31 Aug 2025 09:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-curve25519 31/32]
 lib/crypto/tests/curve25519_kunit.c:1340:23: warning: ignoring return value
 of 'curve25519' declared with attribute 'warn_unused_result'
Message-ID: <202508310956.EsPxI0F1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-curve25519
head:   1b335ccfea46cf775722f85c30e62e4ab5130968
commit: bdef2233bc5a3841901ce0f16afeb0f7e8f3d237 [31/32] lib/crypto: tests: Add Curve25519 benchmark
config: x86_64-buildonly-randconfig-001-20250831 (https://download.01.org/0day-ci/archive/20250831/202508310956.EsPxI0F1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310956.EsPxI0F1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310956.EsPxI0F1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/crypto/tests/curve25519_kunit.c: In function 'benchmark_curve25519':
>> lib/crypto/tests/curve25519_kunit.c:1340:23: warning: ignoring return value of 'curve25519' declared with attribute 'warn_unused_result' [-Wunused-result]
    1340 |                 (void)curve25519(out, private, public);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/curve25519_kunit.c:1346:23: warning: ignoring return value of 'curve25519' declared with attribute 'warn_unused_result' [-Wunused-result]
    1346 |                 (void)curve25519(out, private, public);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1340 lib/crypto/tests/curve25519_kunit.c

  1326	
  1327	static void benchmark_curve25519(struct kunit *test)
  1328	{
  1329		const u8 *private = curve25519_test_vectors[0].private;
  1330		const u8 *public = curve25519_test_vectors[0].public;
  1331		u8 out[CURVE25519_KEY_SIZE];
  1332		const size_t niter = 1024;
  1333		u64 t;
  1334	
  1335		if (!IS_ENABLED(CONFIG_CRYPTO_LIB_BENCHMARK))
  1336			kunit_skip(test, "not enabled");
  1337	
  1338		/* Warm-up */
  1339		for (size_t i = 0; i < 5000; i++)
> 1340			(void)curve25519(out, private, public);
  1341	
  1342		/* Benchmark */
  1343		preempt_disable();
  1344		t = ktime_get_ns();
  1345		for (size_t i = 0; i < niter; i++)
  1346			(void)curve25519(out, private, public);
  1347		t = ktime_get_ns() - t;
  1348		preempt_enable();
  1349		kunit_info(test, "%llu ops/s",
  1350			   div64_u64((u64)niter * 1000000000, t ?: 1));
  1351	}
  1352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
