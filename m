Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA1FC12
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706498946; cv=none; b=dG6irkbDq34AVSPVWV1ihBLNudVgn0jLLinSCNof5bQQUyvckwpeMvm2f71/ogUSS2jU5pdwLawZG3DBjzSKClpGQvojGYZ/aV4YzTcwofpYYFNEQiK3CVRIbSsqK6VAvAf+SFceXwv6mF+8oEkInBOq5EurLRj9Pml5luMaB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706498946; c=relaxed/simple;
	bh=auehIQqucPdmR9WghQmJJO+lqsYQ4OtkGbBt2yogXSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8XJvYOrn5Ec7o5cygeIvRrx2x70KQlxXK3fvAa73BJ6V0w2Jme3463OvcoTdIs4pkYYAMg7C9O5qaHgvR3Np7E4axStwrzY84cbGmLDjWTnoDr4lnQMOTk22uw4TYDssd8WORECr2ROLktX3F9VEND9+eYsZFS6HxbFb3ppaeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9v0ArXt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9v0ArXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706498944; x=1738034944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=auehIQqucPdmR9WghQmJJO+lqsYQ4OtkGbBt2yogXSU=;
  b=I9v0ArXtosoXz3RZO+d0/VKein4Mxh8iEQXyKze43fDVKzgaOv9HQaFH
   IT2dbRqTYKE4joOO0jwZyeJqkPbrznreED5XijsFzREmR/nWAbw65NaY1
   gH5CTaYJo+fp7rizwSk4z2JDw2xTm1nd57aaQqmwGy/G1hTW9ieDrUND2
   SQHiSP3ZNtLc6+FSOAuxzNb7gYowDn7Io9Fvi9XCsXD27tG9uRpE6yuqK
   IXYREFdWO5M1wHvl++NoayHlsQIs1Ouip4t5sx0llOgFeBTzoGO32ffRl
   xymghpDMyIOOD2PZSj9VHjlje2qmQq0Hc2pZlmsfiJCXpfLfJld4h1euy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9950600"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9950600"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 19:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="3325517"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2024 19:29:03 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUIKS-00040G-1R;
	Mon, 29 Jan 2024 03:29:00 +0000
Date: Mon, 29 Jan 2024 11:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v3 13/17] WARNING: modpost: vmlinux: section
 mismatch in reference: cmdline_find_option_bool+0x17 (section: .pi.text) ->
 __sanitizer_cov_trace_pc (section: .text)
Message-ID: <202401291157.bD9sDyeu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v3
head:   76018d102c84ba52d1ee5747cf97577d60e299f7
commit: 0fe954066fb5e85812b4dbe94bd26c3ed7c335d7 [13/17] x86/sev: Make all code reachable from 1:1 mapping __pitext
config: x86_64-buildonly-randconfig-003-20240129 (https://download.01.org/0day-ci/archive/20240129/202401291157.bD9sDyeu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291157.bD9sDyeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291157.bD9sDyeu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x17 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x37 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x40 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x4e (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x5c (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x6a (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x77 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x89 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xa4 (section: .pi.text) -> __sanitizer_cov_trace_switch (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xb7 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xc0 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xce (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xdc (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xe7 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0xfa (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x10d (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x11b (section: .pi.text) -> __sanitizer_cov_trace_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x133 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x141 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x14b (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x157 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x166 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x17e (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option_bool+0x187 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x23 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x4f (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x5d (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x6d (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x7d (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x8c (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x9a (section: .pi.text) -> __sanitizer_cov_trace_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xa9 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xb7 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xc5 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xd8 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xea (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0xf9 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x103 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x111 (section: .pi.text) -> __sanitizer_cov_trace_switch (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x124 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x130 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x13f (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x153 (section: .pi.text) -> __sanitizer_cov_trace_cmp4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x163 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x17e (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x18b (section: .pi.text) -> __sanitizer_cov_trace_const_cmp4 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x194 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x1a1 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x1b8 (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x1c2 (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x1ee (section: .pi.text) -> __sanitizer_cov_trace_pc (section: .text)
WARNING: modpost: vmlinux: section mismatch in reference: cmdline_find_option+0x1fd (section: .pi.text) -> __sanitizer_cov_trace_const_cmp1 (section: .text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
