Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795832836;
	b=cqbrYPi5cVch2E/8acaQUa3rE292dqSjNmI07higtEXnhtkdC+J49pJmAk2TnZ9fxWK/
	 LVl9RXj0T+zDrOuTVkZgHji0mvltpmmtx2lSSEl86XoGiUcjebgW3lQAsGba3C4A9nhsQ
	 k/pr4J1BZ7vb/Y8QO7vEvnzriOF//1pnSWv4IdSVplC56rewDRDUquSu4rQnf3CE2RuZG
	 buIHiuq3WJjT5+leXgeZsCbEG/a4L0Qf3RilebOt12iHkQRjRm55F9ErxO2x5JotVo4mH
	 s+dXkwfs6YSLk3YgfOvlezDLkUdSmwhBcsAMOlaAMEOGyW3POQOC5eeExDsqYhBk5/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795832836;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QsxolSRgqL6SupU91Wco24m6oVPlwtSJPbi1KnhTwTY=;
	b=etbbwTXoI9gReJ9pRR9pbYviKB+IgNGCVrtutb8MmYXvdaywPL6ofpDR5lFH82orfzqx
	 1SOAaO/fqF3L0V128XzvfJJijLWERUcPs0a+0CcTNzvI2h/MaD8oJXVhgSx42tddlKLc+
	 oIZ9+jOIncNNPkparbBZLRLVm5ZwUjw+O9bN7x48MkERFxS1KZmIMgP5O49PLQKGRCddn
	 RIY2i2dLrOsV7wRly9kmD+Nn3rkxm4dBTBwWB+JkamGrpnpJsfSQ7FISyfJHPPQpNSKCR
	 kFI2LLZC7y6dbeUB+yjh0/5hq+v0nG11hHFnqJI4bRAbxKUF5Wp45JCyOjlLXg00BOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzKBj6gq;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102D606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 02:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E102D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WzKBj6gq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795832834; x=1827368834;
  h=date:from:to:cc:subject:message-id;
  bh=AHsdU5zv5tQn3NiftbxCpZX2Ybtt26NEdSdIsWZOunk=;
  b=WzKBj6gqw6SmGIl+7WB6Dh4QkeLCO9rLShBhWV4Lf7jn4E8PzpOwDQUT
   Efj1/8d1J3NRhfGptyuYICxVBAN2qfJokuQ/M+INxTaf1kPHXGjd98Y0Q
   Tz2MK/QCGcvKFdcE+Td3ZicCR+I5xU9xo13zEQ0a9TJsLFewMC4DY67QZ
   DDpMu8qrd7PVZFYJiejsHdT132vfPTcs2QUDMGzF9YfKyFc1P/gtfjBmJ
   YU8M5JciqdM03c8vL5Fiew5NiDjutsYI4ppS3OnuJ1cPmoMhT/l6uTjyy
   LnFToZkB0coso8tUY7efXn1zfhxXA97os5pPsJ9H7DdJhTEzbZVHeVVwU
   w==;
X-CSE-ConnectionGUID: v9IL9rCJTceGOuRsZbBQ0g==
X-CSE-MsgGUID: KEo+g/NpSTmLRnEbQmlMEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4702379"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4702379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 18:27:13 -0800
X-CSE-ConnectionGUID: 3N56Wy5wQ5uDYFIs0h21sQ==
X-CSE-MsgGUID: L8nzbIOBS6a1vWhn3UmqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12817889"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 18:27:12 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX89d-000000000UE-2khF;
	Sat, 28 Nov 2026 02:27:09 +0000
Date: Sat, 28 Nov 2026 03:26:40 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 15/50] error[E0425]: cannot find
 type `Registration` in module `soc`
Message-ID: <20261128031824.WRYIemYe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: 71fd659c0ab04990ed9afe35cf4895f68937efea [15/50] rust: soc: apple: rtkit: Add Apple RTKit abstraction
config: x86_64-randconfig-2103-20261126 (https://download.01.org/0day-ci/archive/20261128/20261128031824.WRYIemYe-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128031824.WRYIemYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128031824.WRYIemYe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find type `Registration` in module `soc`
   --> samples/rust/rust_soc.rs:21:20
   |
   21 |     _dev_reg: soc::Registration,
   |                    ^^^^^^^^^^^^ not found in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Registration;
   |
   5 + use kernel::auxiliary::Registration;
   |
   5 + use kernel::driver::Registration;
   |
   5 + use kernel::faux::Registration;
   |
   = and 4 other candidates
   help: if you import `Registration`, refer to it directly
   |
   21 -     _dev_reg: soc::Registration,
   21 +     _dev_reg: Registration,
   |
--
>> error[E0422]: cannot find struct, variant or union type `Attributes` in module `soc`
   --> samples/rust/rust_soc.rs:56:29
   |
   56 |             let attr = soc::Attributes {
   |                             ^^^^^^^^^^ not found in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Attributes;
   |
   5 + use kernel::soc::bus::Attributes;
   |
   help: if you import `Attributes`, refer to it directly
   |
   56 -             let attr = soc::Attributes {
   56 +             let attr = Attributes {
   |
--
>> error[E0433]: cannot find `Registration` in `soc`
   --> samples/rust/rust_soc.rs:66:34
   |
   66 |                 _dev_reg <- soc::Registration::new(attr),
   |                                  ^^^^^^^^^^^^ could not find `Registration` in `soc`
   |
   help: consider importing one of these structs
   |
   5 + use crate::soc::bus::Registration;
   |
   5 + use kernel::auxiliary::Registration;
   |
   5 + use kernel::driver::Registration;
   |
   5 + use kernel::faux::Registration;
   |
   = and 4 other candidates
   help: if you import `Registration`, refer to it directly
   |
   66 -                 _dev_reg <- soc::Registration::new(attr),
   66 +                 _dev_reg <- Registration::new(attr),
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
