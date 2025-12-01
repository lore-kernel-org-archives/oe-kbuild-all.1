Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D9271A9D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764623681; cv=none; b=YzqRplIBHKFTsDR7pKCRZhs0aKR8YWylDJvytEtcRcg4ERwnLG+yuUt0uL/7gD2gq/c6ffMS7+NNR2uniKEUf9CUMdEmOXuAaOsozxNQo14rA+2Fl53DBPWhJflprpjyCb/0QuLHSoRNgfQPtSl2JLxRaREQfLzIRTaiPPiZI3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764623681; c=relaxed/simple;
	bh=NiNc557a4WNHYr9dngezRQYBt5t9iq6gRUjTWuHxH1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6ZycNAdMi456PF3WwHf6fW2OT93yiiCBilKGdinKK4sSijifLFVSTmdjuXk47hgLnfDUTBQbJnJ83rShSZOalP8OWP6vFnv0NUrrz+B/Wnh5V7eVQs7Xv+Zp2GsNlxjd2gkO91oDQXvkNA/OJ1Z4Kyfuuk8GiI21zon+6vnSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6vNvTd5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6vNvTd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764623680; x=1796159680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NiNc557a4WNHYr9dngezRQYBt5t9iq6gRUjTWuHxH1E=;
  b=A6vNvTd5dy6nhvQ4tHFUUgdDv9IzaKqWjemEvX8cizr7gxtQ1nUg+2/f
   p0r7cmjy1H8QsCi3lAjhL3orba2UvyIymrIJnrJWCgDt5kJpYw17GPrqT
   ry0CAmkUmDUILuiSgARkFMzv4GS7myk69ddRKIBDmy8hCDfj5yus5Neq2
   KMKjjpXzEokB6wUliapPvp+9h7imZgCj8dbYoJcTjLjBzb0t/3lfp6FcC
   oDze+jkJRp85+GgdABSXG42UcGtSVTUROm9qlygimxHHz0aifQf3WYiel
   ThlX9fmiNCDwM8zwYuECY1pP4BGya9pcQv020k3NON5dO05cRLPCUqkVs
   A==;
X-CSE-ConnectionGUID: +NfKEbHKTI+Sd8vGmTEQBQ==
X-CSE-MsgGUID: jjfDUXUkR/OiHfwK2kXdRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66741814"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66741814"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 13:14:37 -0800
X-CSE-ConnectionGUID: M3F4r4b0ShykVDjcBIgHoQ==
X-CSE-MsgGUID: kKwD/sFQRAWaWoF/OJ+Jcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198381864"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2025 13:14:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQBE9-0000000099N-35Ea;
	Mon, 01 Dec 2025 21:14:33 +0000
Date: Tue, 2 Dec 2025 05:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap-for-next 31/34] error[E0599]: no method named
 `acquire_next_id` found for struct `IdPool` in the current scope
Message-ID: <202512020552.NejH5iaK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap-for-next
head:   3513371f4425c2cac8ba6f31a6e5715e4a7f9f20
commit: a5726454470c6c99d404038eb519dda7dac6c9b3 [31/34] rust: id_pool: do not immediately acquire new ids
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251202/202512020552.NejH5iaK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020552.NejH5iaK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020552.NejH5iaK-lkp@intel.com/

Note: the norov/bitmap-for-next HEAD 3513371f4425c2cac8ba6f31a6e5715e4a7f9f20 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `acquire_next_id` found for struct `IdPool` in the current scope
   --> rust/doctests_kernel_generated.rs:6451:24
   |
   6451 |     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
   |                        ^^^^^^^^^^^^^^^ method not found in `IdPool`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
