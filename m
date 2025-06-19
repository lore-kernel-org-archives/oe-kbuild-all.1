Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC824166F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309417; cv=none; b=I4xTP/j3vm04ZjRfNblOn4RnXTEGKwa8rZtceWj9HRtrE9PY6ggDfgt7lX7abELDlZZjJYuiQJ5DJYirWCgg2qvQEFaD1PsJyLrVC3bFjC+czQaB3TiZXPoJkNXH6ujIeF/oPHHmqz4Zqj/hR0UCKui3XAP91nxU9MFJOY7KgAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309417; c=relaxed/simple;
	bh=MmLdt+MG5rZaZXuzqZBaJrCsCCwx2jlfZ2g01LckApM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZJKEOtaASb09HKy5pPFdSaX+PV0eWwj7BccTu8JD3QEy0k/bHrXIUkdbST6QQMi6uu5Vrn/PwagLQzChfK1bAK1qd4Corc/VKplEhG4r0hmVR9rvyTdJwhYsUk2XLN34uBFg50QH6Wq3NzOQQN6vHv8wv6QmET3xhj19x9vLFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFIUrWx6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFIUrWx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750309410; x=1781845410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MmLdt+MG5rZaZXuzqZBaJrCsCCwx2jlfZ2g01LckApM=;
  b=aFIUrWx6yY9MXUcgWG4V5UvU/Qmd8vwWJZkkcMZsX4p7WuCZf4MXvim+
   ukLMxSRwTr59Tt5k3zvka56+hCWmgI2KxNqvFqNe59uKh3IdDuJZNH/ty
   d01TI5xOqU5yspg1dUC6P7+und+qv2inrVVSkWbd1T92tCtjaBuALIm+t
   ppgXnjSJONk4R8naIuWdrIMtTShSLf7dNxByYFN2T/rBXUzSqnqm44LeT
   1O1SDW7P0w2EXRweJktSeLyzlfRagy39rxjUEJiMWjqAXnZA6+mLA1HU/
   s+p/337gE7fV69qgKVEBshJ0KQb+i8huHVer3ZXm5mNqWhAYDNZriBCF7
   w==;
X-CSE-ConnectionGUID: XXdmOSThQK+/xqObj4kQqQ==
X-CSE-MsgGUID: dka8mVArTi2/DoEuHjJnZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52701978"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="52701978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:03:16 -0700
X-CSE-ConnectionGUID: AwWykYc3ToOTY14Xr8MqUg==
X-CSE-MsgGUID: 3ZgPTWsOSTyYgUis+fGX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="154412185"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 22:03:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7Qc-000KPu-1q;
	Thu, 19 Jun 2025 05:03:10 +0000
Date: Thu, 19 Jun 2025 13:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:arch-to-lib-crypto-v1 19/25]
 lib/crypto/mips/chacha-core.S:264:118: error: unknown instruction, did you
 mean: rol, rotr?
Message-ID: <202506191336.092Jpouo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git =
arch-to-lib-crypto-v1
head:   016a3bcca520b894d59ca8a0d493951b2f82bae7
commit: 9a9b4b8ec38cc1e837621e28a422dd43369f6190 [19/25] lib/crypto/mips: m=
ove arch/mips/lib/crypto/ to lib/crypto/mips/
config: mips-randconfig-r113-20250619 (https://download.01.org/0day-ci/arch=
ive/20250619/202506191336.092Jpouo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875=
b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce: (https://download.01.org/0day-ci/archive/20250619/202506191336.0=
92Jpouo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191336.092Jpouo-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> lib/crypto/mips/chacha-core.S:264:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 16; rotl $s4, 16; ro=
tl $s3, 16; rotl $s2, 16;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:264:132: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 16; rotl $s4, 16; ro=
tl $s3, 16; rotl $s2, 16;;
                                                                           =
                                                           ^
   lib/crypto/mips/chacha-core.S:264:146: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 16; rotl $s4, 16; ro=
tl $s3, 16; rotl $s2, 16;;
                                                                           =
                                                                         ^
   lib/crypto/mips/chacha-core.S:264:160: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 16; rotl $s4, 16; ro=
tl $s3, 16; rotl $s2, 16;;
                                                                           =
                                                                           =
            ^
   lib/crypto/mips/chacha-core.S:265:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 12; rotl $t5, 12; ro=
tl $t6, 12; rotl $t7, 12;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:265:132: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 12; rotl $t5, 12; ro=
tl $t6, 12; rotl $t7, 12;;
                                                                           =
                                                           ^
   lib/crypto/mips/chacha-core.S:265:146: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 12; rotl $t5, 12; ro=
tl $t6, 12; rotl $t7, 12;;
                                                                           =
                                                                         ^
   lib/crypto/mips/chacha-core.S:265:160: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 12; rotl $t5, 12; ro=
tl $t6, 12; rotl $t7, 12;;
                                                                           =
                                                                           =
            ^
   lib/crypto/mips/chacha-core.S:266:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 8; rotl $s4, 8; rotl=
 $s3, 8; rotl $s2, 8;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:266:131: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 8; rotl $s4, 8; rotl=
 $s3, 8; rotl $s2, 8;;
                                                                           =
                                                          ^
   lib/crypto/mips/chacha-core.S:266:144: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 8; rotl $s4, 8; rotl=
 $s3, 8; rotl $s2, 8;;
                                                                           =
                                                                       ^
   lib/crypto/mips/chacha-core.S:266:157: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t4; addu $t1, $t5; addu $t2, $t6; addu $t3, $t7; xor $s5, $t=
0; xor $s4, $t1; xor $s3, $t2; xor $s2, $t3; rotl $s5, 8; rotl $s4, 8; rotl=
 $s3, 8; rotl $s2, 8;;
                                                                           =
                                                                           =
         ^
   lib/crypto/mips/chacha-core.S:267:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 7; rotl $t5, 7; rotl=
 $t6, 7; rotl $t7, 7;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:267:131: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 7; rotl $t5, 7; rotl=
 $t6, 7; rotl $t7, 7;;
                                                                           =
                                                          ^
   lib/crypto/mips/chacha-core.S:267:144: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 7; rotl $t5, 7; rotl=
 $t6, 7; rotl $t7, 7;;
                                                                           =
                                                                       ^
   lib/crypto/mips/chacha-core.S:267:157: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t8, $s5; addu $t9, $s4; addu $v1, $s3; addu $s6, $s2; xor $t4, $t=
8; xor $t5, $t9; xor $t6, $v1; xor $t7, $s6; rotl $t4, 7; rotl $t5, 7; rotl=
 $t6, 7; rotl $t7, 7;;
                                                                           =
                                                                           =
         ^
   lib/crypto/mips/chacha-core.S:268:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 16; rotl $s5, 16; ro=
tl $s4, 16; rotl $s3, 16;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:268:132: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 16; rotl $s5, 16; ro=
tl $s4, 16; rotl $s3, 16;;
                                                                           =
                                                           ^
   lib/crypto/mips/chacha-core.S:268:146: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 16; rotl $s5, 16; ro=
tl $s4, 16; rotl $s3, 16;;
                                                                           =
                                                                         ^
   lib/crypto/mips/chacha-core.S:268:160: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 16; rotl $s5, 16; ro=
tl $s4, 16; rotl $s3, 16;;
                                                                           =
                                                                           =
            ^
   lib/crypto/mips/chacha-core.S:269:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 12; rotl $t6, 12; ro=
tl $t7, 12; rotl $t4, 12;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:269:132: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 12; rotl $t6, 12; ro=
tl $t7, 12; rotl $t4, 12;;
                                                                           =
                                                           ^
   lib/crypto/mips/chacha-core.S:269:146: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 12; rotl $t6, 12; ro=
tl $t7, 12; rotl $t4, 12;;
                                                                           =
                                                                         ^
   lib/crypto/mips/chacha-core.S:269:160: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 12; rotl $t6, 12; ro=
tl $t7, 12; rotl $t4, 12;;
                                                                           =
                                                                           =
            ^
   lib/crypto/mips/chacha-core.S:270:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 8; rotl $s5, 8; rotl=
 $s4, 8; rotl $s3, 8;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:270:131: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 8; rotl $s5, 8; rotl=
 $s4, 8; rotl $s3, 8;;
                                                                           =
                                                          ^
   lib/crypto/mips/chacha-core.S:270:144: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 8; rotl $s5, 8; rotl=
 $s4, 8; rotl $s3, 8;;
                                                                           =
                                                                       ^
   lib/crypto/mips/chacha-core.S:270:157: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $t0, $t5; addu $t1, $t6; addu $t2, $t7; addu $t3, $t4; xor $s2, $t=
0; xor $s5, $t1; xor $s4, $t2; xor $s3, $t3; rotl $s2, 8; rotl $s5, 8; rotl=
 $s4, 8; rotl $s3, 8;;
                                                                           =
                                                                           =
         ^
   lib/crypto/mips/chacha-core.S:271:118: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 7; rotl $t6, 7; rotl=
 $t7, 7; rotl $t4, 7;;
                                                                           =
                                             ^
   lib/crypto/mips/chacha-core.S:271:131: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 7; rotl $t6, 7; rotl=
 $t7, 7; rotl $t4, 7;;
                                                                           =
                                                          ^
   lib/crypto/mips/chacha-core.S:271:144: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 7; rotl $t6, 7; rotl=
 $t7, 7; rotl $t4, 7;;
                                                                           =
                                                                       ^
   lib/crypto/mips/chacha-core.S:271:157: error: unknown instruction, did y=
ou mean: rol, rotr?
    addu $v1, $s2; addu $s6, $s5; addu $t8, $s4; addu $t9, $s3; xor $t5, $v=
1; xor $t6, $s6; xor $t7, $t8; xor $t4, $t9; rotl $t5, 7; rotl $t6, 7; rotl=
 $t7, 7; rotl $t4, 7;;
                                                                           =
                                                                           =
         ^
>> lib/crypto/mips/chacha-core.S:285:164: error: too few operands for instr=
uction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                ^
   lib/crypto/mips/chacha-core.S:285:388: error: too few operands for instr=
uction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
               ^
   lib/crypto/mips/chacha-core.S:285:612: error: too few operands for instr=
uction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
              ^
   lib/crypto/mips/chacha-core.S:285:836: error: too few operands for instr=
uction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
             ^
   lib/crypto/mips/chacha-core.S:285:1060: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
            ^
   lib/crypto/mips/chacha-core.S:285:1284: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
           ^
   lib/crypto/mips/chacha-core.S:285:1504: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
      ^
   lib/crypto/mips/chacha-core.S:285:1722: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                          ^
   lib/crypto/mips/chacha-core.S:285:1940: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                   ^
   lib/crypto/mips/chacha-core.S:285:2158: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                            ^
   lib/crypto/mips/chacha-core.S:285:2376: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                     ^
   lib/crypto/mips/chacha-core.S:285:2594: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                              ^
   lib/crypto/mips/chacha-core.S:285:2812: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                       ^
   lib/crypto/mips/chacha-core.S:285:3030: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                ^
   lib/crypto/mips/chacha-core.S:285:3248: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                         ^
   lib/crypto/mips/chacha-core.S:285:3466: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_aligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a0)=
; .endif; lw $s0, (15*4) ($a2); .if (15 =3D=3D 12); addu $s2, $v0; .else; a=
ddu $s2, $s1; .endif; wsbh $s2; rotr $s2, 16;; xor $s2, $s0; sw $s2, (15*4)=
 ($a1);; .Lchacha_mips_xor_aligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)=
($a0); .endif; lw $s0, (14*4) ($a2); .if (14 =3D=3D 12); addu $s3, $v0; .el=
se; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3, $s0; sw $s3, (=
14*4) ($a1);; .Lchacha_mips_xor_aligned_14_b: ; .if (13 !=3D 12); lw $s1, (=
13*4)($a0); .endif; lw $s0, (13*4) ($a2); .if (13 =3D=3D 12); addu $s4, $v0=
; .else; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; sw $=
s4, (13*4) ($a1);; .Lchacha_mips_xor_aligned_13_b: ; .if (12 !=3D 12); lw $=
s1, (12*4)($a0); .endif; lw $s0, (12*4) ($a2); .if (12 =3D=3D 12); addu $s5=
, $v0; .else; addu $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0;=
 sw $s5, (12*4) ($a1);; .Lchacha_mips_xor_aligned_12_b: ; .if (11 !=3D 12);=
 lw $s1, (11*4)($a0); .endif; lw $s0, (11*4) ($a2); .if (11 =3D=3D 12); add=
u $s6, $v0; .else; addu $s6, $s1; .endif; wsbh $s6; rotr $s6, 16;; xor $s6,=
 $s0; sw $s6, (11*4) ($a1);; .Lchacha_mips_xor_aligned_11_b: ; .if (10 !=3D=
 12); lw $s1, (10*4)($a0); .endif; lw $s0, (10*4) ($a2); .if (10 =3D=3D 12)=
; addu $v1, $v0; .else; addu $v1, $s1; .endif; wsbh $v1; rotr $v1, 16;; xor=
 $v1, $s0; sw $v1, (10*4) ($a1);; .Lchacha_mips_xor_aligned_10_b: ; .if (9 =
!=3D 12); lw $s1, (9*4)($a0); .endif; lw $s0, (9*4) ($a2); .if (9 =3D=3D 12=
); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9, 16;; xo=
r $t9, $s0; sw $t9, (9*4) ($a1);; .Lchacha_mips_xor_aligned_9_b: ; .if (8 !=
=3D 12); lw $s1, (8*4)($a0); .endif; lw $s0, (8*4) ($a2); .if (8 =3D=3D 12)=
; addu $t8, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor=
 $t8, $s0; sw $t8, (8*4) ($a1);; .Lchacha_mips_xor_aligned_8_b: ; .if (7 !=
=3D 12); lw $s1, (7*4)($a0); .endif; lw $s0, (7*4) ($a2); .if (7 =3D=3D 12)=
; addu $t7, $v0; .else; addu $t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor=
 $t7, $s0; sw $t7, (7*4) ($a1);; .Lchacha_mips_xor_aligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lw $s0, (6*4) ($a2); .if (6 =3D=3D 12)=
; addu $t6, $v0; .else; addu $t6, $s1; .endif; wsbh $t6; rotr $t6, 16;; xor=
 $t6, $s0; sw $t6, (6*4) ($a1);; .Lchacha_mips_xor_aligned_6_b: ; .if (5 !=
=3D 12); lw $s1, (5*4)($a0); .endif; lw $s0, (5*4) ($a2); .if (5 =3D=3D 12)=
; addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 16;; xor=
 $t5, $s0; sw $t5, (5*4) ($a1);; .Lchacha_mips_xor_aligned_5_b: ; .if (4 !=
=3D 12); lw $s1, (4*4)($a0); .endif; lw $s0, (4*4) ($a2); .if (4 =3D=3D 12)=
; addu $t4, $v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor=
 $t4, $s0; sw $t4, (4*4) ($a1);; .Lchacha_mips_xor_aligned_4_b: ; .if (3 !=
=3D 12); lw $s1, (3*4)($a0); .endif; lw $s0, (3*4) ($a2); .if (3 =3D=3D 12)=
; addu $t3, $v0; .else; addu $t3, $s1; .endif; wsbh $t3; rotr $t3, 16;; xor=
 $t3, $s0; sw $t3, (3*4) ($a1);; .Lchacha_mips_xor_aligned_3_b: ; .if (2 !=
=3D 12); lw $s1, (2*4)($a0); .endif; lw $s0, (2*4) ($a2); .if (2 =3D=3D 12)=
; addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $t2; rotr $t2, 16;; xor=
 $t2, $s0; sw $t2, (2*4) ($a1);; .Lchacha_mips_xor_aligned_2_b: ; .if (1 !=
=3D 12); lw $s1, (1*4)($a0); .endif; lw $s0, (1*4) ($a2); .if (1 =3D=3D 12)=
; addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; xor=
 $t1, $s0; sw $t1, (1*4) ($a1);; .Lchacha_mips_xor_aligned_1_b: ; .if (0 !=
=3D 12); lw $s1, (0*4)($a0); .endif; lw $s0, (0*4) ($a2); .if (0 =3D=3D 12)=
; addu $t0, $v0; .else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor=
 $t0, $s0; sw $t0, (0*4) ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                  ^
   lib/crypto/mips/chacha-core.S:352:194: error: too few operands for instr=
uction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                              ^
   lib/crypto/mips/chacha-core.S:352:476: error: too few operands for instr=
uction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                            ^
   lib/crypto/mips/chacha-core.S:352:758: error: too few operands for instr=
uction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
          ^
   lib/crypto/mips/chacha-core.S:352:1040: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                   ^
   lib/crypto/mips/chacha-core.S:352:1322: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                 ^
   lib/crypto/mips/chacha-core.S:352:1604: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                               ^
   lib/crypto/mips/chacha-core.S:352:1881: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
        ^
   lib/crypto/mips/chacha-core.S:352:2155: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                         ^
   lib/crypto/mips/chacha-core.S:352:2429: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                               ^
   lib/crypto/mips/chacha-core.S:352:2703: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
     ^
   lib/crypto/mips/chacha-core.S:352:2977: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                      ^
   lib/crypto/mips/chacha-core.S:352:3251: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                            ^
   lib/crypto/mips/chacha-core.S:352:3525: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
  ^
   lib/crypto/mips/chacha-core.S:352:3799: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                   ^
   lib/crypto/mips/chacha-core.S:352:4073: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                         ^
   lib/crypto/mips/chacha-core.S:352:4347: error: too few operands for inst=
ruction
    .Lchacha_mips_xor_unaligned_16_b: ; .if (15 !=3D 12); lw $s1, (15*4)($a=
0); .endif; lwl $s0, (15*4)+0 ($a2); lwr $s0, (15*4)+3 ($a2); .if (15 =3D=
=3D 12); addu $s2, $v0; .else; addu $s2, $s1; .endif; wsbh $s2; rotr $s2, 1=
6;; xor $s2, $s0; swl $s2, (15*4)+0 ($a1); swr $s2, (15*4)+3 ($a1);; .Lchac=
ha_mips_xor_unaligned_15_b: ; .if (14 !=3D 12); lw $s1, (14*4)($a0); .endif=
; lwl $s0, (14*4)+0 ($a2); lwr $s0, (14*4)+3 ($a2); .if (14 =3D=3D 12); add=
u $s3, $v0; .else; addu $s3, $s1; .endif; wsbh $s3; rotr $s3, 16;; xor $s3,=
 $s0; swl $s3, (14*4)+0 ($a1); swr $s3, (14*4)+3 ($a1);; .Lchacha_mips_xor_=
unaligned_14_b: ; .if (13 !=3D 12); lw $s1, (13*4)($a0); .endif; lwl $s0, (=
13*4)+0 ($a2); lwr $s0, (13*4)+3 ($a2); .if (13 =3D=3D 12); addu $s4, $v0; =
=2Eelse; addu $s4, $s1; .endif; wsbh $s4; rotr $s4, 16;; xor $s4, $s0; swl =
$s4, (13*4)+0 ($a1); swr $s4, (13*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
13_b: ; .if (12 !=3D 12); lw $s1, (12*4)($a0); .endif; lwl $s0, (12*4)+0 ($=
a2); lwr $s0, (12*4)+3 ($a2); .if (12 =3D=3D 12); addu $s5, $v0; .else; add=
u $s5, $s1; .endif; wsbh $s5; rotr $s5, 16;; xor $s5, $s0; swl $s5, (12*4)+=
0 ($a1); swr $s5, (12*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_12_b: ; .if =
(11 !=3D 12); lw $s1, (11*4)($a0); .endif; lwl $s0, (11*4)+0 ($a2); lwr $s0=
, (11*4)+3 ($a2); .if (11 =3D=3D 12); addu $s6, $v0; .else; addu $s6, $s1; =
=2Eendif; wsbh $s6; rotr $s6, 16;; xor $s6, $s0; swl $s6, (11*4)+0 ($a1); s=
wr $s6, (11*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_11_b: ; .if (10 !=3D 1=
2); lw $s1, (10*4)($a0); .endif; lwl $s0, (10*4)+0 ($a2); lwr $s0, (10*4)+3=
 ($a2); .if (10 =3D=3D 12); addu $v1, $v0; .else; addu $v1, $s1; .endif; ws=
bh $v1; rotr $v1, 16;; xor $v1, $s0; swl $v1, (10*4)+0 ($a1); swr $v1, (10*=
4)+3 ($a1);; .Lchacha_mips_xor_unaligned_10_b: ; .if (9 !=3D 12); lw $s1, (=
9*4)($a0); .endif; lwl $s0, (9*4)+0 ($a2); lwr $s0, (9*4)+3 ($a2); .if (9 =
=3D=3D 12); addu $t9, $v0; .else; addu $t9, $s1; .endif; wsbh $t9; rotr $t9=
, 16;; xor $t9, $s0; swl $t9, (9*4)+0 ($a1); swr $t9, (9*4)+3 ($a1);; .Lcha=
cha_mips_xor_unaligned_9_b: ; .if (8 !=3D 12); lw $s1, (8*4)($a0); .endif; =
lwl $s0, (8*4)+0 ($a2); lwr $s0, (8*4)+3 ($a2); .if (8 =3D=3D 12); addu $t8=
, $v0; .else; addu $t8, $s1; .endif; wsbh $t8; rotr $t8, 16;; xor $t8, $s0;=
 swl $t8, (8*4)+0 ($a1); swr $t8, (8*4)+3 ($a1);; .Lchacha_mips_xor_unalign=
ed_8_b: ; .if (7 !=3D 12); lw $s1, (7*4)($a0); .endif; lwl $s0, (7*4)+0 ($a=
2); lwr $s0, (7*4)+3 ($a2); .if (7 =3D=3D 12); addu $t7, $v0; .else; addu $=
t7, $s1; .endif; wsbh $t7; rotr $t7, 16;; xor $t7, $s0; swl $t7, (7*4)+0 ($=
a1); swr $t7, (7*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_7_b: ; .if (6 !=
=3D 12); lw $s1, (6*4)($a0); .endif; lwl $s0, (6*4)+0 ($a2); lwr $s0, (6*4)=
+3 ($a2); .if (6 =3D=3D 12); addu $t6, $v0; .else; addu $t6, $s1; .endif; w=
sbh $t6; rotr $t6, 16;; xor $t6, $s0; swl $t6, (6*4)+0 ($a1); swr $t6, (6*4=
)+3 ($a1);; .Lchacha_mips_xor_unaligned_6_b: ; .if (5 !=3D 12); lw $s1, (5*=
4)($a0); .endif; lwl $s0, (5*4)+0 ($a2); lwr $s0, (5*4)+3 ($a2); .if (5 =3D=
=3D 12); addu $t5, $v0; .else; addu $t5, $s1; .endif; wsbh $t5; rotr $t5, 1=
6;; xor $t5, $s0; swl $t5, (5*4)+0 ($a1); swr $t5, (5*4)+3 ($a1);; .Lchacha=
_mips_xor_unaligned_5_b: ; .if (4 !=3D 12); lw $s1, (4*4)($a0); .endif; lwl=
 $s0, (4*4)+0 ($a2); lwr $s0, (4*4)+3 ($a2); .if (4 =3D=3D 12); addu $t4, $=
v0; .else; addu $t4, $s1; .endif; wsbh $t4; rotr $t4, 16;; xor $t4, $s0; sw=
l $t4, (4*4)+0 ($a1); swr $t4, (4*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_=
4_b: ; .if (3 !=3D 12); lw $s1, (3*4)($a0); .endif; lwl $s0, (3*4)+0 ($a2);=
 lwr $s0, (3*4)+3 ($a2); .if (3 =3D=3D 12); addu $t3, $v0; .else; addu $t3,=
 $s1; .endif; wsbh $t3; rotr $t3, 16;; xor $t3, $s0; swl $t3, (3*4)+0 ($a1)=
; swr $t3, (3*4)+3 ($a1);; .Lchacha_mips_xor_unaligned_3_b: ; .if (2 !=3D 1=
2); lw $s1, (2*4)($a0); .endif; lwl $s0, (2*4)+0 ($a2); lwr $s0, (2*4)+3 ($=
a2); .if (2 =3D=3D 12); addu $t2, $v0; .else; addu $t2, $s1; .endif; wsbh $=
t2; rotr $t2, 16;; xor $t2, $s0; swl $t2, (2*4)+0 ($a1); swr $t2, (2*4)+3 (=
$a1);; .Lchacha_mips_xor_unaligned_2_b: ; .if (1 !=3D 12); lw $s1, (1*4)($a=
0); .endif; lwl $s0, (1*4)+0 ($a2); lwr $s0, (1*4)+3 ($a2); .if (1 =3D=3D 1=
2); addu $t1, $v0; .else; addu $t1, $s1; .endif; wsbh $t1; rotr $t1, 16;; x=
or $t1, $s0; swl $t1, (1*4)+0 ($a1); swr $t1, (1*4)+3 ($a1);; .Lchacha_mips=
_xor_unaligned_1_b: ; .if (0 !=3D 12); lw $s1, (0*4)($a0); .endif; lwl $s0,=
 (0*4)+0 ($a2); lwr $s0, (0*4)+3 ($a2); .if (0 =3D=3D 12); addu $t0, $v0; .=
else; addu $t0, $s1; .endif; wsbh $t0; rotr $t0, 16;; xor $t0, $s0; swl $t0=
, (0*4)+0 ($a1); swr $t0, (0*4)+3 ($a1);;
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                           =
                                                                          ^
   lib/crypto/mips/chacha-core.S:375:2: error: too few operands for instruc=
tion
    wsbh $s2; rotr $s2, 16;
    ^
   lib/crypto/mips/chacha-core.S:383:2: error: unknown instruction, did you=
 mean: rol, rotr?
    rotl $s2, 8


vim +264 lib/crypto/mips/chacha-core.S

49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  126 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  127  #define STORE_UNALIGNED(x) \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  128  CONCAT3(.Lchacha_mips_xor_unaligned_, PLUS_ONE(x), _b: ;) \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  129  	.if (x !=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  130  		lw	T0, (x*4)(STATE); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  131  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  132  	lwl	T1, (x*4)+MSB ## (IN); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  133  	lwr	T1, (x*4)+LSB ## (IN); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  134  	.if (x =3D=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  135  		addu	X ## x, NONCE_0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  136  	.else; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  137  		addu	X ## x, T0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  138  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  139  	CPU_TO_LE32(X ## x); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  140  	xor	X ## x, T1; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  141  	swl	X ## x, (x*4)+MSB ## (OUT); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  142  	swr	X ## x, (x*4)+LSB ## (OUT);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  143 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  144  #define STORE_ALIGNED(x) \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  145  CONCAT3(.Lchacha_mips_xor_aligned_, PLUS_ONE(x), _b: ;) \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  146  	.if (x !=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  147  		lw	T0, (x*4)(STATE); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  148  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  149  	lw	T1, (x*4) ## (IN); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  150  	.if (x =3D=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  151  		addu	X ## x, NONCE_0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  152  	.else; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  153  		addu	X ## x, T0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  154  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  155  	CPU_TO_LE32(X ## x); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  156  	xor	X ## x, T1; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  157  	sw	X ## x, (x*4) ## (OUT);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  158 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  159  /* Jump table macro.
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  160   * Used for setup and handling the last bytes, which are not multipl=
e of 4.
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  161   * X15 is free to store Xn
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  162   * Every jumptable entry must be equal in size.
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  163   */
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  164  #define JMPTBL_ALIGNED(x) \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  165  .Lchacha_mips_jmptbl_aligned_ ## x: ; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  166  	.set	noreorder; \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  167  	b	.Lchacha_mips_xor_aligned_ ## x ## _b; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  168  	.if (x =3D=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  169  		addu	SAVED_X, X ## x, NONCE_0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  170  	.else; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  171  		addu	SAVED_X, X ## x, SAVED_CA; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  172  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  173  	.set	reorder
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  174 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  175  #define JMPTBL_UNALIGNED(x) \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  176  .Lchacha_mips_jmptbl_unaligned_ ## x: ; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  177  	.set	noreorder; \
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  178  	b	.Lchacha_mips_xor_unaligned_ ## x ## _b; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  179  	.if (x =3D=3D 12); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  180  		addu	SAVED_X, X ## x, NONCE_0; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  181  	.else; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  182  		addu	SAVED_X, X ## x, SAVED_CA; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  183  	.endif; \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  184  	.set	reorder
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  185 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  186  #define AXR(A, B, C, D,  K, L, M, N,  V, W, Y, Z,  S) \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  187  	addu	X(A), X(K); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  188  	addu	X(B), X(L); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  189  	addu	X(C), X(M); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  190  	addu	X(D), X(N); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  191  	xor	X(V), X(A); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  192  	xor	X(W), X(B); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  193  	xor	X(Y), X(C); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  194  	xor	X(Z), X(D); \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  195  	rotl	X(V), S;    \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  196  	rotl	X(W), S;    \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  197  	rotl	X(Y), S;    \
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  198  	rotl	X(Z), S;
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  199 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  200  .text
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  201  .set	reorder
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  202  .set	noat
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  203  .globl	chacha_crypt_arch
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  204  .ent	chacha_crypt_arch
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  205  chacha_crypt_arch:
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  206  	.frame	$sp, STACK_SIZE, $ra
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  207 =20
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  208  	/* Load number of rounds */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  209  	lw	$at, 16($sp)
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  210 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  211  	addiu	$sp, -STACK_SIZE
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  212 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  213  	/* Return bytes =3D 0. */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  214  	beqz	BYTES, .Lchacha_mips_end
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  215 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  216  	lw	NONCE_0, 48(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  217 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  218  	/* Save s0-s7 */
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  219  	sw	$s0,  0($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  220  	sw	$s1,  4($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  221  	sw	$s2,  8($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  222  	sw	$s3, 12($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  223  	sw	$s4, 16($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  224  	sw	$s5, 20($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  225  	sw	$s6, 24($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  226  	sw	$s7, 28($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  227 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  228  	/* Test IN or OUT is unaligned.
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  229  	 * IS_UNALIGNED =3D ( IN | OUT ) & 0x00000003
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  230  	 */
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  231  	or	IS_UNALIGNED, IN, OUT
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  232  	andi	IS_UNALIGNED, 0x3
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  233 =20
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  234  	b	.Lchacha_rounds_start
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  235 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  236  .align 4
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  237  .Loop_chacha_rounds:
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  238  	addiu	IN,  CHACHA20_BLOCK_SIZE
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  239  	addiu	OUT, CHACHA20_BLOCK_SIZE
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  240  	addiu	NONCE_0, 1
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  241 =20
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  242  .Lchacha_rounds_start:
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  243  	lw	X0,  0(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  244  	lw	X1,  4(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  245  	lw	X2,  8(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  246  	lw	X3,  12(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  247 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  248  	lw	X4,  16(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  249  	lw	X5,  20(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  250  	lw	X6,  24(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  251  	lw	X7,  28(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  252  	lw	X8,  32(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  253  	lw	X9,  36(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  254  	lw	X10, 40(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  255  	lw	X11, 44(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  256 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  257  	move	X12, NONCE_0
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  258  	lw	X13, 52(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  259  	lw	X14, 56(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  260  	lw	X15, 60(STATE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  261 =20
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  262  .Loop_chacha_xor_rounds:
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  263  	addiu	$at, -2
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
 @264  	AXR( 0, 1, 2, 3,  4, 5, 6, 7, 12,13,14,15, 16);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  265  	AXR( 8, 9,10,11, 12,13,14,15,  4, 5, 6, 7, 12);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  266  	AXR( 0, 1, 2, 3,  4, 5, 6, 7, 12,13,14,15,  8);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  267  	AXR( 8, 9,10,11, 12,13,14,15,  4, 5, 6, 7,  7);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  268  	AXR( 0, 1, 2, 3,  5, 6, 7, 4, 15,12,13,14, 16);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  269  	AXR(10,11, 8, 9, 15,12,13,14,  5, 6, 7, 4, 12);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  270  	AXR( 0, 1, 2, 3,  5, 6, 7, 4, 15,12,13,14,  8);
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  271  	AXR(10,11, 8, 9, 15,12,13,14,  5, 6, 7, 4,  7);
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  272  	bnez	$at, .Loop_chacha_xor_rounds
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  273 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  274  	addiu	BYTES, -(CHACHA20_BLOCK_SIZE)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  275 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  276  	/* Is data src/dst unaligned? Jump */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  277  	bnez	IS_UNALIGNED, .Loop_chacha_unaligned
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  278 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  279  	/* Set number rounds here to fill delayslot. */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  280  	lw	$at, (STACK_SIZE+16)($sp)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  281 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  282  	/* BYTES < 0, it has no full block. */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  283  	bltz	BYTES, .Lchacha_mips_no_full_block_aligned
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  284 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
 @285  	FOR_EACH_WORD_REV(STORE_ALIGNED)
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  286 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  287  	/* BYTES > 0? Loop again. */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  288  	bgtz	BYTES, .Loop_chacha_rounds
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  289 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  290  	/* Place this here to fill delay slot */
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  291  	addiu	NONCE_0, 1
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  292 =20
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  293  	/* BYTES < 0? Handle last bytes */
3a2f58f3ba4f6f arch/mips/crypto/chacha-core.S Ard Biesheuvel     2019-11-08=
  294  	bltz	BYTES, .Lchacha_mips_xor_bytes
49aa7c00eddf8d arch/mips/crypto/chacha-core.S Jason A. Donenfeld 2019-11-08=
  295 =20

:::::: The code at line 264 was first introduced by commit
:::::: 49aa7c00eddf8d8f462b0256bd82e81762d7b0c6 crypto: mips/chacha - impor=
t 32r2 ChaCha code from Zinc

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
