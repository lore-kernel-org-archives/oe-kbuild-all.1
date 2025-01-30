Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220C28BEC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738198274; cv=none; b=GsomwNE2sGKkeQcVMtEHVN4YVD9X5Ej/nxpm087wCr7Vdc2QFpBONBpRjRwcRMnf54VvBb9gOwzetq5pDA6YjfCru1wyvKK3aOBEHpkeOBJTAIFVFiYdOCqz33g45kKhAlCH5usyVJL1w2FqNfcq9xHAXlpI6ySI7bmdkbf8c1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738198274; c=relaxed/simple;
	bh=vBEOqxELc4iN7SMmnwylc3YCD24vREP0eHOVzT5oi2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ui44ekziYUOHrUVbD69q2Td+w2pXdndURCGZdl1W+ybGA1TxWbSYLK0F3na7qP7VHhQOaOoWu0Rl9Ciz3qSxKhW0mKb+m359V+16LXYpZNA31lyKa2DTjTXaXmqQOTHhi/FHYPqJNVDUUIdMqfxOVAVLi22YfIXWkZ1r2xyXHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8rsMvfn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8rsMvfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738198272; x=1769734272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBEOqxELc4iN7SMmnwylc3YCD24vREP0eHOVzT5oi2Y=;
  b=M8rsMvfnYAza6eVinxIz8TF+yROfttdpPwlhXQiAaBKnwJ7xo6xKWZ/P
   0VBnLP1rp6ZYY33GYhUDd+tfulytnicdZTZFPj+7Tu7+I4i3jRujBcd47
   Fe3fQyc3OHFXn8ZIMAUhE/hNHF0Yk3aFyk7mnH+Y/tGeBT1XZCEW5C1a7
   O1POhTt9+jE4Ma7fiTtwUOgmDyqz6Va0JjItT29CuyuKE7CVZTSY9gBk7
   HbxKxyL1CO9fjT/PUVUK+hqRTAgjbPNjR7H/QI5FuAaq4QKTV8vWElxpw
   zubTpihvP0T+rZ1S0qgsgCVfqGAx4hO9S9ocI64h8E5Ww88BZDcneXUYJ
   w==;
X-CSE-ConnectionGUID: 2C1bYAf/RvqAr/YcsHnOUg==
X-CSE-MsgGUID: UMlc4XKfQRCWypR+qitR6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38625686"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38625686"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 16:51:12 -0800
X-CSE-ConnectionGUID: 52I0E8NdTJCgLwScCSC4KQ==
X-CSE-MsgGUID: +RDWCTD1RJyGC5uvuvG7mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132451744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 16:51:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdIlw-000jW5-1Y;
	Thu, 30 Jan 2025 00:51:08 +0000
Date: Thu, 30 Jan 2025 08:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:rust/cpufreq-dt 1/20] warning: single-character string
 constant used as pattern
Message-ID: <202501300843.uPawv99i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt
head:   b08a5923033c11f3b1122b5aae1699b6abe46a22
commit: 07214aa5c28a2e6d300cbb68e79b002aafedea5d [1/20] rust: macros: enable use of hyphens in module names
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250130/202501300843.uPawv99i-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300843.uPawv99i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300843.uPawv99i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: single-character string constant used as pattern
   --> rust/macros/module.rs:186:45
   |
   186 |     let name_identifier = info.name.replace("-", "_");
   |                                             ^^^ help: consider using a `char`: `'-'`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#single_char_pattern
   = note: `-W clippy::single-char-pattern` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::single_char_pattern)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
