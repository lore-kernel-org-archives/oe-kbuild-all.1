Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7717233F393
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411047; cv=none; b=V5izCo72s9KcgMhq1qRQZNAh5X+04JaWx4x5BY30ZaX9GyJw+m+LU3EE+FItnOVpukpVJN/B58Df2G/NfqzxOgmw0eHymWyn1br56uySTr4QBFF9I3ME1nX24VpfGKeV6Z04BvRtKemPvHR7Nnq7WF6nLgI8Pki1bUXMmgh9cbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411047; c=relaxed/simple;
	bh=vRR2yFYXXVMLF4amAkJozJ5fShMDPLpkCS8laVtx1g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nTN5TE8ShukUEWFF97JGzsbRPUWO9zbl2Kc/M71VoU0o+wOVBrq9sGBowJZ+qGAfGEVdrkD7qQJ2Jj599tXObzRcQVGWAA2xXy21ImS2kygxTxSbBZp7+M9YPR88plGK0aZJv/T/YM36aK1gHUL/pcpioMJtD9J1XVbuuwQ5qCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6PuF4zz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6PuF4zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763411033; x=1794947033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRR2yFYXXVMLF4amAkJozJ5fShMDPLpkCS8laVtx1g4=;
  b=I6PuF4zzUIZ5F6+H46F+tkLXbIZT5BqDyM0xoOS3b6mtHJ4x0MkhbON8
   g5Jgv5MaG8WORUnp581zcLU65XaR8BTHmpzsgpiDJ2APz0sFRjNpHwzKk
   SNUvyhOgM2NFdX+nxC6hg26cVz/Jeu8KbchkQGPjEk5zD3Fa5i3b8x9tq
   fESzCR88FnbrZlytdV1cnMwu7cJBfm0mFVzKMvTRTwtOpaEh3ynGU97KR
   Jv7ujQr6tyggQ29RM2yDyWn0/FYdcovoJv1ztPz2psLrmpb2HOamKxKzU
   Q7OFYi54i7rRLFRJv8t/dKrKdt3ngLbX1sZu/lYRd84bzyF7di3NnadpF
   w==;
X-CSE-ConnectionGUID: rC+ZMIIzQBWMUQtQxGwqPg==
X-CSE-MsgGUID: CagWfJYeRWeA41JKK2eoMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76775663"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76775663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:23:47 -0800
X-CSE-ConnectionGUID: gGlNV5wPTKaoutGjbV4Kxw==
X-CSE-MsgGUID: lbVrNT7pRd6wRzxZwF3UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195479488"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 12:23:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5lI-00011t-1s;
	Mon, 17 Nov 2025 20:23:44 +0000
Date: Tue, 18 Nov 2025 04:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/9]
 lib/crypto/tests/mldsa_kunit.c:65:undefined reference to `mldsa_65_verify'
Message-ID: <202511180426.egt704uW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 07d3d88631ed18eaf8c87bb7b310c2673be68be3 [5/9] crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
config: sparc-randconfig-r072-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180426.egt704uW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180426.egt704uW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180426.egt704uW-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_65_kunit_test':
>> lib/crypto/tests/mldsa_kunit.c:65:(.text+0x40): undefined reference to `mldsa_65_verify'
   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_44_kunit_test':
   lib/crypto/tests/mldsa_kunit.c:49:(.text+0x110): undefined reference to `mldsa_44_verify'


vim +65 lib/crypto/tests/mldsa_kunit.c

    57	
    58	static void dilithium_65_kunit_test(struct kunit *test)
    59	{
    60		const struct dilithium_testvector *tc = dilithium_65_testvectors;
    61		int count = ARRAY_SIZE(dilithium_65_testvectors);
    62		int ret;
    63	
    64		for (int index = 0; index < count; index++) {
  > 65			ret = mldsa_65_verify(tc->pk, tc->pk_len,
    66					      tc->msg, tc->msg_len,
    67					      tc->sig, tc->sig_len);
    68			KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Verify failed");
    69		}
    70	
    71		KUNIT_SUCCEED(test);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
