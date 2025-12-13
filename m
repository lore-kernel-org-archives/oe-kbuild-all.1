Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E344C8F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765622038; cv=none; b=YJpBH+stqldRMp+xWVdDKIRl/imH1q65ZzoYeKnhwDfzmToP/o8JJqfXGlvS35gPaIkV9vLV20QFdD6D7MKHj+XGoQ5XD02wXxAnpWGcLXZSpAxh/ixthjxqHcDemd7Ot4r15nBpuK6V2q98GiCW4q1XlItISZHf1Xc+myZ9VEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765622038; c=relaxed/simple;
	bh=flWF7d7lPCJTnN+CMBFSo2WvfL4ujDqQrDZwLK425eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKQNCBVjOm+ArvlOMnr88FmTCkN9ynQ3Av4cZFfjWxLB5v1PEHqSgmfZUrpVB4rpYF1s3YmA4L9a0zIPdOU+2UTmqt6ngH2tkrgK7VF3iGFlDNro4dfgTmYbIsK/FID+4qUrmLJMHGye85Po22D4F+fz7+Ob11TZPn4n5AwLshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0ZeiGrz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0ZeiGrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765622035; x=1797158035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flWF7d7lPCJTnN+CMBFSo2WvfL4ujDqQrDZwLK425eU=;
  b=G0ZeiGrzC1VnGDme733+ZlrtTnNGWd2wbwtU+lt933mx/GJq8KL7fHdi
   doH0syaNh1/vgO2k6kw0axaRSzMDq8HamSOqlOOuFLdUbFpvSnDMJ2Xsi
   VaWiDhO94oKjK6qF0BgwWB5FnRFauc3P+7JrDRtEP390V1PlDR28/VWwM
   FadnMm/G0dkxxcl1Vn6te2afieuigyV2x1joaTi1B9h5Do1VSca4etuXE
   WEAfEvfpW6DBQLWVE5cOSsllnK1hQYqNa9IB71xCmW3CSBjOy/Z7rCeXS
   5ZaNcSt2h//0YY5zbcZ7iRstuL2OM80fZJ+84GOLKoKVn0g4qbSklrlsl
   w==;
X-CSE-ConnectionGUID: hExTmJlHSIKidnbZVsvghw==
X-CSE-MsgGUID: ESmbskk7RzuDgQjGSVXqpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67567516"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67567516"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:33:55 -0800
X-CSE-ConnectionGUID: iGYWOXVTSHm0bMAM5Ox6uA==
X-CSE-MsgGUID: fn5C8ML5Tfq2g/o6kLWWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="202378394"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Dec 2025 02:33:30 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMwI-0000000021q-2tmL;
	Sat, 13 Dec 2025 10:33:26 +0000
Date: Sat, 13 Dec 2025 11:32:49 +0100
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0463]: can't find crate for `core`
Message-ID: <202512131120.ZkMRotGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Maurer/rust-transmute-Support-transmuting-slices-of-AsBytes-FromBytes-types/20251213-074604
head:   834dde2d0b10730b051c0f5d3ab6a2a1b5ef8f28
commit: 834dde2d0b10730b051c0f5d3ab6a2a1b5ef8f28 rust: Support deriving `AsBytes`/`FromBytes` on bindgen types
date:   11 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131120.ZkMRotGq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131120.ZkMRotGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131120.ZkMRotGq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `core`
   |
   = note: the `target` target may not be installed
   = help: consider downloading the target with `rustup target add target`
   = help: consider building the standard library from source with `cargo build -Zbuild-std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
