Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82D7464
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751949735; cv=none; b=YVAYch4tf+81pZ58NF4OEFugA3pMLbXGG5qb9J29A9agBwb+irEuU0Ujaf4Qs6ihNalsZOQtJb7v9T7JtpADb0YneYpRu4fa+iBnV1+fs8IZSIoIw+pemYd7/4iNIisPtRtB6gajQAvh6Dp4Nzr5VdQsxaPTvcw95gtvu9k7nas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751949735; c=relaxed/simple;
	bh=y0vjD0a6Uu4q45qcPnkHzIjFTyqdPQfXAm4wfJq2X0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/vq+5+LBQ/uDb53kPip8ynnI2Cwn0lIx0sWRRtvy6WbGiqmQKGUJC9ZfMgYCGOnF05CBov+5phJi7ZGaZKekR1+ZCc6jZrxjA/D3eshUNwYmRozVTsAPf4n6NxgFxgBUTWi+HZOCLuvNRw9V7YgNNxcevMzNcaSzP1aLs63Wfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktsxkPYg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktsxkPYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751949732; x=1783485732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0vjD0a6Uu4q45qcPnkHzIjFTyqdPQfXAm4wfJq2X0o=;
  b=ktsxkPYgDoGKPFXItU+iEQ50JBvet38NcbvfLrZoYXlPHZ/4L9HNpRLL
   L+l1xm8T1+OilFGTEdU9IWgKZfSCDV2YpAEE5lvH44UAGvwYgZU9KAalU
   hbGcuDkuXFBZ4/fTQaPyKdapfyXV4FVSgStASSACamg20y+3vd19edoc+
   I54uv81Dh9V+aGudFK5mXh7k7UWiwwmnNYXUOwU9iW2Vz8BuCYFt8gdDP
   lQTRqFtgH8GEAAGc2GjW6XixU6T2WMtB8fdC3iAzBVvndPnriGaMCZWIa
   jV0tPm7rqx5BvGJf3ACKVdmb58f0p/8dcrmXZhxUVb9EXBfMqfhe6Zlm+
   g==;
X-CSE-ConnectionGUID: 7Ti1l9xeS5WkeoCOG3LemA==
X-CSE-MsgGUID: 8Ofnvy5lSp+2ZgH8PYEuwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57850122"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="57850122"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 21:42:12 -0700
X-CSE-ConnectionGUID: RW/7hZpYRMCBHpAf/1byBQ==
X-CSE-MsgGUID: eWzfa1mXS5+B7UgxZ2c70g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154814490"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2025 21:42:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ09h-0000zb-1K;
	Tue, 08 Jul 2025 04:42:09 +0000
Date: Tue, 8 Jul 2025 12:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-kunit-v4 53/53]
 lib/crypto/tests/hash-test-template.h:567:1: warning: the frame size of 1584
 bytes is larger than 1280 bytes
Message-ID: <202507081257.9sV2D0Ys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-kunit-v4
head:   209b69596ef0822c920f9c1a74d2f21282401a6c
commit: 209b69596ef0822c920f9c1a74d2f21282401a6c [53/53] lib/crypto: tests: Add KUnit tests for Poly1305
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250708/202507081257.9sV2D0Ys-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081257.9sV2D0Ys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507081257.9sV2D0Ys-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/crypto/tests/poly1305_kunit.c:44:
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_interrupt_context_2':
>> lib/crypto/tests/hash-test-template.h:567:1: warning: the frame size of 1584 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     567 | }
         | ^


vim +567 lib/crypto/tests/hash-test-template.h

e5c9afdf075863 Eric Biggers 2025-07-06  533  
e5c9afdf075863 Eric Biggers 2025-07-06  534  /*
e5c9afdf075863 Eric Biggers 2025-07-06  535   * Test that if hashes are computed in task, softirq, and hardirq context
e5c9afdf075863 Eric Biggers 2025-07-06  536   * concurrently, *including doing different parts of the same incremental
e5c9afdf075863 Eric Biggers 2025-07-06  537   * computation in different contexts*, then all results are as expected.
e5c9afdf075863 Eric Biggers 2025-07-06  538   * Besides detecting bugs similar to those that test_hash_interrupt_context_1
e5c9afdf075863 Eric Biggers 2025-07-06  539   * can detect, this test case can also detect bugs where hash function
e5c9afdf075863 Eric Biggers 2025-07-06  540   * implementations don't correctly handle these mixed incremental computations.
e5c9afdf075863 Eric Biggers 2025-07-06  541   */
e5c9afdf075863 Eric Biggers 2025-07-06  542  static void test_hash_interrupt_context_2(struct kunit *test)
e5c9afdf075863 Eric Biggers 2025-07-06  543  {
e5c9afdf075863 Eric Biggers 2025-07-06  544  	struct hash_irq_test2_state state = {};
e5c9afdf075863 Eric Biggers 2025-07-06  545  	int remaining = TEST_BUF_LEN;
e5c9afdf075863 Eric Biggers 2025-07-06  546  
e5c9afdf075863 Eric Biggers 2025-07-06  547  	rand_bytes(test_buf, TEST_BUF_LEN);
e5c9afdf075863 Eric Biggers 2025-07-06  548  	HASH(test_buf, TEST_BUF_LEN, state.expected_hash);
e5c9afdf075863 Eric Biggers 2025-07-06  549  
e5c9afdf075863 Eric Biggers 2025-07-06  550  	/*
e5c9afdf075863 Eric Biggers 2025-07-06  551  	 * Generate a list of update lengths to use.  Ensure that it contains
e5c9afdf075863 Eric Biggers 2025-07-06  552  	 * multiple entries but is limited to a maximum length.
e5c9afdf075863 Eric Biggers 2025-07-06  553  	 */
e5c9afdf075863 Eric Biggers 2025-07-06  554  	static_assert(TEST_BUF_LEN / 4096 > 1);
e5c9afdf075863 Eric Biggers 2025-07-06  555  	for (state.num_steps = 0;
e5c9afdf075863 Eric Biggers 2025-07-06  556  	     state.num_steps < ARRAY_SIZE(state.update_lens) - 1 && remaining;
e5c9afdf075863 Eric Biggers 2025-07-06  557  	     state.num_steps++) {
e5c9afdf075863 Eric Biggers 2025-07-06  558  		state.update_lens[state.num_steps] =
e5c9afdf075863 Eric Biggers 2025-07-06  559  			rand_length(min(remaining, 4096));
e5c9afdf075863 Eric Biggers 2025-07-06  560  		remaining -= state.update_lens[state.num_steps];
e5c9afdf075863 Eric Biggers 2025-07-06  561  	}
e5c9afdf075863 Eric Biggers 2025-07-06  562  	if (remaining)
e5c9afdf075863 Eric Biggers 2025-07-06  563  		state.update_lens[state.num_steps++] = remaining;
e5c9afdf075863 Eric Biggers 2025-07-06  564  	state.num_steps += 2; /* for init and final */
e5c9afdf075863 Eric Biggers 2025-07-06  565  
e5c9afdf075863 Eric Biggers 2025-07-06  566  	run_irq_test(test, hash_irq_test2_func, 250000, &state);
e5c9afdf075863 Eric Biggers 2025-07-06 @567  }
e5c9afdf075863 Eric Biggers 2025-07-06  568  

:::::: The code at line 567 was first introduced by commit
:::::: e5c9afdf0758637851e024f16b114bdd44e2d58d lib/crypto: tests: Add hash-test-template.h and gen-hash-testvecs.py

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
