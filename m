Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4C20C038
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771764796; cv=none; b=lP6723ywqwNUOMjs4AEu6ofyO6pSOZNcPAgzmUAgioPfdhhfSfJ/BMdKDHA0OWiQIPDuDCx5ZGzxjHC+lFfVb+TFRukaJNbHMJbQZ+hgcSu6KZpfA6FXC3QvkOj4yotTuEtdrvGQ+b5JO5YJMc+Jrc1txR36RUW60z+uxwQSdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771764796; c=relaxed/simple;
	bh=0VwjcA1iBs91TDKLK8HNQc6t6Xg3jZGIN3Z8f3IU72M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l5UR68QNwUxLZTIgGb4OI2JF9YPKOcUK6sdFX2ZL8VeubWnx+Fch3QdH+SMyYcrAchWLqYQc2CbPEQ8voXL6+VyU5zys+kUlavKcAF0P8QdNAwE87Rtds4BudLwOs0knBjDjWB1TkXVOPSjXpVhT8O0WOfbjz51cthKybxU55bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dGVothlJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dGVothlJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771764793; x=1803300793;
  h=date:from:to:cc:subject:message-id;
  bh=0VwjcA1iBs91TDKLK8HNQc6t6Xg3jZGIN3Z8f3IU72M=;
  b=dGVothlJd8Zn7yBHlFpUvhkK6+S/vdHneL0JqTbrTbntlQ6CU131mPF7
   ihna7/kYpNUOuO93dIHjLvnx3jBUMkNMFbi9OMgDCDIdzN7b1HABQ3Xjo
   3vWJ1U82kovui0yESxiu0aIQKiwpsO8jUkLKWK2XE7gQ4DlWG1LLEEZkB
   Px7iLqnuSvCmpmkzLeI5rX87vnOkADtkTEw6AM/9Bu8RGHjmrX41aZ8IE
   eC4rHMC4n4y/uODNGGUrQr8ycYTmTgz1kWvPPcD+GMWe8UlSdHtUqNVsl
   f+8q7G5AigYvhuKUqvjluA+WmjVVFkeF6FMK5W0Hovc3GF1uR7LARy5pT
   g==;
X-CSE-ConnectionGUID: 7TfTrX9aQM6WzxTB8VSX4w==
X-CSE-MsgGUID: zzu2o47dSmmEmYqWYEBueA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="71987497"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="71987497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 04:53:12 -0800
X-CSE-ConnectionGUID: V76TdxH9RAquh8PoF3jy4w==
X-CSE-MsgGUID: 2KgVB87mSXCmKpwXJs6PjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="213735029"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2026 04:53:11 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu8xR-000000004cz-0KiZ;
	Sun, 22 Feb 2026 12:53:09 +0000
Date: Sun, 22 Feb 2026 13:52:58 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 16/19] error[E0405]: cannot find
 trait `FromBytes` in this scope
Message-ID: <202602221313.dcB4ETX2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   c4a22eafa4aa47b5c3c75d57488c44e653827fc6
commit: d12fb6412e5338bb69eab42f45ede455a57fbfbf [16/19] rust: io: add view type
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260222/202602221313.dcB4ETX2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221313.dcB4ETX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221313.dcB4ETX2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `FromBytes` in this scope
   --> rust/kernel/io.rs:667:24
   |
   667 |         T: KnownSize + FromBytes + AsBytes,
   |                        ^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::FromBytes;
   |
--
>> error[E0405]: cannot find trait `AsBytes` in this scope
   --> rust/kernel/io.rs:667:36
   |
   667 |         T: KnownSize + FromBytes + AsBytes,
   |                                    ^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::AsBytes;
   |
--
>> error[E0405]: cannot find trait `FromBytes` in this scope
   --> rust/kernel/io.rs:668:12
   |
   668 |         U: FromBytes + AsBytes,
   |            ^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::FromBytes;
   |
--
>> error[E0405]: cannot find trait `AsBytes` in this scope
   --> rust/kernel/io.rs:668:24
   |
   668 |         U: FromBytes + AsBytes,
   |                        ^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use crate::transmute::AsBytes;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
