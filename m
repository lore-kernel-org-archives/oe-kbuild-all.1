Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A330C618
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150745; cv=none; b=io9P9WnC8nqH2vgNpeQ6KR2Zv8K6JVSE611mfELaN55P23rdzVOP6vjw2Vd2y9xUBXqrkSqBfcPoNfRtU4RfC73PGnTWGbVws1RuGPA9dV8/2zGFVqjLkBQxD0DqUmbhsYmWLKoDbO/s+5gRaOXFCFe02uhvDoFNrGR9SfUiVW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150745; c=relaxed/simple;
	bh=DukO3/jsO/X7wOPQQvFZEWTaY6DBx63idfGw8ecHMqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbSkPG++eG1RMoVMe2ob/wZr5GjZG3SR0JxjbspCsSElZXA9oguTNN1ZtyM/aeAsDkLwCcJAx60Y+LxmPq6K/xygsEsSC1NBETDIab3YOA0MDqwuFPnG0Tw+xcA2VkJlncL+CsoI/VPywr+XqJ9jT5u/A/MOS18UsyINuDeN588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmrncKQU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmrncKQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786150744; x=1817686744;
  h=date:from:to:cc:subject:message-id;
  bh=DukO3/jsO/X7wOPQQvFZEWTaY6DBx63idfGw8ecHMqk=;
  b=JmrncKQUKK2YRW+kt7854p2j2L0497ZbT2QqgHx88OVbdvGaFqBxjDAL
   3tGXYylwtwySvoE9VyiyTAYwqw+fAhWBsjBMYTPW1y2AhFZx0CAGbtJWn
   EQWZp40rwKN8Lz6W57iQzK+S7NpYN4yLX6qWbBx/0aviKOlAYLluQc1/I
   A94wXiioJkZb59JQXePFTIKyRg83uZadC+6zGt5q50SAu5yD++4YoHXUM
   lUsZFVRFsHvuYSNYt5h3H1XINXryvN+r/dBZuTOkIyb8TYMDp4KwRgZfp
   uiJJz2aHmF63hqMc58BbR7/j8A7vH/9Nt69Ldth919nw5ptLbhYwwwEtk
   A==;
X-CSE-ConnectionGUID: WngzBwKnQcuVi+K38uzaqw==
X-CSE-MsgGUID: 5dN6SD2iRLKdtkPOBuxRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86841938"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86841938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 17:59:02 -0700
X-CSE-ConnectionGUID: ponESUX1SM+IvKY7K9rSbQ==
X-CSE-MsgGUID: iQYf9skDSWS5VNiaGlf72Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="256310038"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Aug 2026 17:59:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsVOr-00000000Jag-3TPD;
	Sat, 08 Aug 2026 00:58:57 +0000
Date: Sat, 08 Aug 2026 08:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [linux-next:master 11333/13846]
 lib/crypto/tests/aes_ccm_kunit.c:317 test_aes_ccm_data_len_too_large() warn:
 always true condition '(max_data_len + 1 <= (~0)) => (0-u64max <= u64max)'
Message-ID: <202608080705.p6XFlhbr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 78c1bc21eb055681672da1de139d27865b67d1b2 [11333/13846] lib/crypto: tests: Add KUnit test suite for AES-CCM
config: s390-randconfig-r072-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080705.p6XFlhbr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080705.p6XFlhbr-lkp@intel.com/

smatch warnings:
lib/crypto/tests/aes_ccm_kunit.c:317 test_aes_ccm_data_len_too_large() warn: always true condition '(max_data_len + 1 <= (~0)) => (0-u64max <= u64max)'

vim +317 lib/crypto/tests/aes_ccm_kunit.c

   261	
   262	/*
   263	 * Test that for each AES-CCM nonce length, the message length is validated
   264	 * against the correct corresponding maximum message length.
   265	 */
   266	static void test_aes_ccm_data_len_too_large(struct kunit *test)
   267	{
   268		static const struct {
   269			size_t nonce_len;
   270			u64 max_data_len;
   271		} lens[] = {
   272			/* clang-format off */
   273			{ 7, 0xffffffffffffffff }, /* U64_MAX */
   274			{ 8, 0xffffffffffffff },
   275			{ 9, 0xffffffffffff },
   276			{ 10, 0xffffffffff },
   277			{ 11, 0xffffffff },
   278			{ 12, 0xffffff },
   279			{ 13, 0xffff },
   280			/* clang-format on */
   281		};
   282		u8 nonce[13] = {};
   283		u8 raw_key[AES_KEYSIZE_256] = {};
   284		int err;
   285		struct aes_ccm_key *key = alloc_buf(test, sizeof(*key));
   286		struct aes_ccm_ctx ctx;
   287	
   288		err = aes_ccm_preparekey(key, raw_key, sizeof(raw_key), 16);
   289		KUNIT_ASSERT_EQ(test, 0, err);
   290	
   291		for (size_t i = 0; i < ARRAY_SIZE(lens); i++) {
   292			size_t nonce_len = lens[i].nonce_len;
   293			u64 max_data_len = lens[i].max_data_len;
   294	
   295			/* data_len <= max_data_len should be accepted. */
   296			err = aes_ccm_init(&ctx, 0, 0, nonce, nonce_len, key);
   297			KUNIT_ASSERT_EQ_MSG(
   298				test, 0, err,
   299				"data_len=0 wasn't accepted with nonce_len=%zu",
   300				nonce_len);
   301			err = aes_ccm_init(&ctx, max_data_len, 0, nonce, nonce_len,
   302					   key);
   303			KUNIT_ASSERT_EQ_MSG(
   304				test, 0, err,
   305				"data_len=%llu wasn't accepted with nonce_len=%zu",
   306				max_data_len, nonce_len);
   307	
   308			/* data_len > max_data_len should be rejected. */
   309			if (max_data_len == U64_MAX)
   310				continue;
   311			err = aes_ccm_init(&ctx, max_data_len + 1, 0, nonce, nonce_len,
   312					   key);
   313			KUNIT_ASSERT_EQ_MSG(
   314				test, -EOVERFLOW, err,
   315				"data_len=%llu wasn't rejected with -EOVERFLOW with nonce_len=%zu (aes_ccm_init)",
   316				max_data_len + 1, nonce_len);
 > 317			if (max_data_len + 1 <= SIZE_MAX) {
   318				err = aes_ccm_encrypt(NULL, NULL, max_data_len + 1,
   319						      NULL, NULL, 0, nonce, nonce_len,
   320						      key);
   321				KUNIT_ASSERT_EQ_MSG(
   322					test, -EOVERFLOW, err,
   323					"data_len=%llu wasn't rejected with -EOVERFLOW with nonce_len=%zu (aes_ccm_encrypt)",
   324					max_data_len + 1, nonce_len);
   325				err = aes_ccm_decrypt(NULL, NULL, max_data_len + 1,
   326						      NULL, NULL, 0, nonce, nonce_len,
   327						      key);
   328				KUNIT_ASSERT_EQ_MSG(
   329					test, -EOVERFLOW, err,
   330					"data_len=%llu wasn't rejected with -EOVERFLOW with nonce_len=%zu (aes_ccm_decrypt)",
   331					max_data_len + 1, nonce_len);
   332			}
   333			err = aes_ccm_init(&ctx, U64_MAX, 0, nonce, nonce_len, key);
   334			KUNIT_ASSERT_EQ_MSG(
   335				test, -EOVERFLOW, err,
   336				"data_len=U64_MAX wasn't rejected with -EOVERFLOW with nonce_len=%zu (aes_ccm_init)",
   337				nonce_len);
   338		}
   339	}
   340	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
