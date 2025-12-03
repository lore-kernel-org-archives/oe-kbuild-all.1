Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B629A9E9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747085; cv=none; b=oJcSq51r/KBY2Ie25G6YETj9vqiqIxYecHKyh4JL3VVwx+3dVa4OK2MMZKf2g9GxuN2ry7d4pl6A/HyBOLxK3cSoKTyI4uWFOona+wsvpggSKgv7YG22iGTGhaCADBMmc7d5KMn6Yut4skqTj8zSfUVoReCm6q/ijlzbNQBiQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747085; c=relaxed/simple;
	bh=G1g4kTeDoN/gzH0PTtN/ZSScTjIaNIu2g7J/DD0IXaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUaZ5GewhzTabp94n7EpMf9SQPEeXtWl+JW3S1MAHH/vjcGl7kUE/+racUz9n+hW+NNm6eZXBanurBNLMuaejfgBg2AlZRdMCPeGqW4slLKPCYBjXt9wkEiOfhQMndUkRADrCcSAcpDSej+3QQbAr709meiF6AJGsYeNav0ZgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEv49g9N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEv49g9N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764747084; x=1796283084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G1g4kTeDoN/gzH0PTtN/ZSScTjIaNIu2g7J/DD0IXaY=;
  b=CEv49g9N57iCb4clVP/7MzZcGTG2qAZ2X10LK9ezsubiTDOvKFJT4EyR
   G1lzyV8f9eehefx1T0hFHAT3aFdHUyXGm0ZvzWGGvTKThWRAP8ZL3vyDi
   Quiw99JxCYdLSDEsVVwuEcQYv6c+y/IvQ5eRM4e9wJxnX+ZKAREC3j3G/
   4WddywFpN7anoBXI28OimHBoKVmbeN1tfKbZJPrIUFeZtjkR4M3UsMHQ2
   2+kK74hDtX0am3iEuLHY+R+JEbwL+rwVgNktjUBwHwzUqNzjJsu9Jc3zH
   vLxztdaAzQBbWvbeFEJHZPtno4nkByfgYOv+EpEDbhnDGTNqDM7sCf1f+
   g==;
X-CSE-ConnectionGUID: orPfdA5UT1y8SFMrroXLKg==
X-CSE-MsgGUID: bU4WwsaARAmu6+Sly/A1sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77412475"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77412475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 23:31:23 -0800
X-CSE-ConnectionGUID: Dn76+ZHVQ+GaRIClVt0zcA==
X-CSE-MsgGUID: ATwKRMtlTvaAWAynPf12WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="217933721"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Dec 2025 23:31:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQhKZ-00000000Ai1-1LjY;
	Wed, 03 Dec 2025 07:31:19 +0000
Date: Wed, 3 Dec 2025 15:30:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: error[E0560]: struct `bindings::file_operations` has no field named
 `mmap`
Message-ID: <202512031542.URVb8ITS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alice,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: f8c78198816f04619da6eebfc5b67741bff56325 rust: miscdevice: add mmap support
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031542.URVb8ITS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031542.URVb8ITS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031542.URVb8ITS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `bindings::file_operations` has no field named `mmap`
   --> rust/kernel/miscdevice.rs:338:9
   |
   338 |         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
   |         ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
