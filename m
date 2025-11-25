Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0118DB1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764074445; cv=none; b=WC8KUV2K6kT8bzfltympa+pnGLs+Qe2P+JR2suL76W/H5m+/vELXkB5gHn7O9FmW30VzohTnMmHTxxTdKKmY7rlO9sFCeZ78x1BMvTree3ogy5Jd+p60hovlrqHWOwRltz3JxAJIN3ZptnpXHFjXvYH5ixLOjqHJt+fWyvtbv2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764074445; c=relaxed/simple;
	bh=HcWpqPEfD5umDhSDKe1rwPKcqspd9/5JZEjCOu+f+QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAeWxPUT30K11vpo9HogWwB1I+CCqvNrHEzFPm+u6/1UeDAEMYn+AUFyfzCmJClePvYOrNt07UYqqdR0uWc4enWzglHHueEyqNtb5NHBkb52aJzNEUgSXkoi++VImpBiei9MVHs8yiELXcal/8sGSpZ8dk4M2ucke5/efwvnwrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIBavgih; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIBavgih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764074444; x=1795610444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HcWpqPEfD5umDhSDKe1rwPKcqspd9/5JZEjCOu+f+QE=;
  b=OIBavgihuwgqU2CV3Vdwa7HD3iIxbTaSAL0xQr+AZ4rmVw+cppaGWd0r
   BUnOPJ5BNL3c3ACUvXSdwBx1T6q0Lm/7dTyHV7SlQSAysCPHasFP2vJX+
   s/vxCRSbpby2sVWBgU28ErAiSjRa/Piwssh9ICK/VCseI0VXGHjzTAEy7
   fW81Oy4+25Sny2VfNRuF8w0FKX6A9EA2L9gZJh5b2XWji52ebUbDoBkyH
   dqZnYM5CeiOY4jRu/KI8CylNKCW8rwOdBu8dp/s+hEucW4YQEYYSF6fRs
   jWq7aNysenC7eIUwreWZ9tIsFUdP4RFOAZPBzNpWIBXCODrKERNykgRfB
   A==;
X-CSE-ConnectionGUID: 3JiI4Q8XR3OPAHQWCHUMHA==
X-CSE-MsgGUID: hWm7TIDZQAa1HK+2LZyK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69716287"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="69716287"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:40:44 -0800
X-CSE-ConnectionGUID: nk3NscyLS3KaUpsFwXolrw==
X-CSE-MsgGUID: /+3yUfEbSDu1Yhu04DURJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192863177"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2025 04:40:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNsLX-000000001mh-32Cs;
	Tue, 25 Nov 2025 12:40:39 +0000
Date: Tue, 25 Nov 2025 20:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: error[E0609]: no field `data` on type `bindings::of_device_id`
Message-ID: <202511252003.dkoqEyZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
commit: ce735e73dd59b169b877cedd0753297c81c2a091 rust: auxiliary: add auxiliary device / driver abstractions
date:   7 months ago
config: loongarch-randconfig-r061-20251125 (https://download.01.org/0day-ci/archive/20251125/202511252003.dkoqEyZq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252003.dkoqEyZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252003.dkoqEyZq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `data` on type `bindings::of_device_id`
   --> rust/kernel/of.rs:22:85
   |
   22 |     const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::of_device_id, data);
   |                                                                                     ^^^^
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `data` on type `bindings::of_device_id`
   --> rust/kernel/of.rs:25:16
   |
   25 |         self.0.data as _
   |                ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `compatible` on type `bindings::of_device_id`
   --> rust/kernel/of.rs:40:16
   |
   40 |             of.compatible[i] = src[i] as _;
   |                ^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
