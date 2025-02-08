Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE562A41
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991166; cv=none; b=C7eapy70Ez7beouiZu1DDQzUetRTYCP/aAWQolB5D9vHCHylVafZdeyJge8Y6mtq4tmL9A8hE1ZfQdvInu1pKc+INf44bRsVZLaUUrxOhC++fC6UradyoZoJ+MuLX50GJcLPhOUcrEWj3ylaO2uET2ME7xR4ojNL2ViXpztRLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991166; c=relaxed/simple;
	bh=7GlmMXsyf2YOtCOiMEh/z91ESUkCiR1kSOH2PUzuaKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJ1yGIsGNxH2jpfs8A6GF3v0i6UA9gCKzhTmQ2+SP3Wdii1QzN6Vfq+MAzJQ2hOQ2o1RsO0v1twKEWmBgBVn4o38YYtXCn/+45GUkjhTb6g94uTwzm3j23wOFSFJzru5oMSmrawkdDN0mHG2ffTJmXVrsI4TR8WuXSqfRrp1pW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUxUpMRj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUxUpMRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738991164; x=1770527164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GlmMXsyf2YOtCOiMEh/z91ESUkCiR1kSOH2PUzuaKQ=;
  b=JUxUpMRjumXnNnSxQiq8WzbzUkCYDOfQ6UOjkoX8wdpmowXZjEqfUrJt
   ACu7yyAjEzZxasyR8rIeoq7/yxjTaO1ws2VN0bZy5uf0Mw06+L0odW2pH
   iPTA+PRWBulcdEjBbrhh5IBbCpqnqWNAqhjwLcHOKUUbUMquHONlaBIay
   RnX4BpSo9Ry9IEl6g2yJVaT9jJpKLZ5Db6WW2WKTKTZnx3qoKE1qCcK5H
   imB4O3oi5LzF/ftTuMw4zZ0q7CkVm2Q5BMWtFtdiNKb+iBBweWUuO/ZjQ
   +ki9/+rtDiASRdWiB2lbUYMFTPRw5e+0BjMEYCsD7745688ToOzX6Ybi8
   Q==;
X-CSE-ConnectionGUID: Rl7Ql3psRU+T/NK92S2sUA==
X-CSE-MsgGUID: 8n0eGk5ZTIiNOEQTP8m81w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39330033"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="39330033"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 21:06:03 -0800
X-CSE-ConnectionGUID: bzHrysvDQIOk5Tkfwi3udA==
X-CSE-MsgGUID: eBJ3aUqrSeG/fVQZEx8YNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116651553"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Feb 2025 21:06:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgd2V-000zYI-20;
	Sat, 08 Feb 2025 05:05:59 +0000
Date: Sat, 8 Feb 2025 13:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 12/14] WARNING: modpost: vmlinux: section mismatch in
 reference: kho_reserve_scratch+0x4d (section: .text) ->
 memblock_alloc_try_nid (section: .init.text)
Message-ID: <202502081206.ByU0qriv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   c46ab1adade1c0ece83ff5ad4c3aa57ea0126275
commit: 2201f6a39fa2540d835be3859cf650251641f920 [12/14] x86: Add KHO support
config: x86_64-randconfig-074-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081206.ByU0qriv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081206.ByU0qriv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081206.ByU0qriv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x4d (section: .text) -> memblock_alloc_try_nid (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x5f (section: .text) -> scratch_size_global (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x66 (section: .text) -> scratch_size_pernode (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x8e (section: .text) -> memblock_phys_alloc_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x116 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x122 (section: .text) -> scratch_size_pernode (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x153 (section: .text) -> memblock_alloc_range_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x1d7 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x250 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
