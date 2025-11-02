Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88A1C84BC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762051144; cv=none; b=W+Y8mNo8kiVrhvoMuvUOd7Ql6tlTl0XWIG9NdYtpFClSJ7/pl5k5RgwBpsHgrJDbWFzxJQ03jOW4AARLNqCLWRrHApW+IuA4PQBHgabDUrOegmTAPgr5n0xOf/xtz6EsrIMX9gDB6t7tlgdhjOLCezmQsOL8BFDWtO2pkufVKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762051144; c=relaxed/simple;
	bh=E24JpW3Zwl7Fi09C+ApscV0GkEpG47SJBRL+ERW9Cts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ruMz4gFBb/7oZp6Fe6jXqr0WVGQOkVcB1IVxznqN4j8DIdM3B9MhAxHRpTjDEG5+ED0fWPHFBHWqk5tlyTEory5WueSZxd7xtTrYDNb3s958TSqPphep8Mg5FsT7cu9+AUE/mv8SJe7dReWbKtmnxuzy+5xp5JQcgP/7dcY58As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxHnpXLG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxHnpXLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762051142; x=1793587142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E24JpW3Zwl7Fi09C+ApscV0GkEpG47SJBRL+ERW9Cts=;
  b=AxHnpXLGC952BLgHp8Sj1+USS/Vu1WNg7oLy4R2lEToTnpsegP60WNSn
   G7MPSFzUQuR8YUyXTRaEKf9CyB+WrI3wS+CwokUrC5j8toXXBb63Iuzva
   vr1Ok0VE/g8qsNKALCn2dZ8ykPWgX4iysPy843OzSECImuTVHa1uaOKv9
   r7HwTntLE6slDp2NdTEd01ocyEeOkc9piC6m9m8seWyfzMb+gsSL4glOh
   MowWveTo+l8tgMJgNeX802ct7hYza0APBzRa6LTioY9YyV5POAD09oAS3
   fIjrZf7Fv+xWw3p1DlxMdjD0V4neXJhrZDmSlxSi4ZiNXFKFznhC1ssZ2
   Q==;
X-CSE-ConnectionGUID: PdPUnu7eRx+jc8iXKwqhYg==
X-CSE-MsgGUID: IJ1FGH3VQvWr3qkPhi6nfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64199463"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64199463"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 19:39:02 -0700
X-CSE-ConnectionGUID: 7T3y0y4YR2OK0fuaXT6BdA==
X-CSE-MsgGUID: 4U5mgPRkSiqU5GklKUBlcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="190645032"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 19:39:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFNze-000OvW-2C;
	Sun, 02 Nov 2025 02:38:58 +0000
Date: Sun, 2 Nov 2025 10:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/for-next 20/23] Warning:
 drivers/soc/tegra/pmc.c:475 struct member 'node' not described in
 'tegra_pmc'
Message-ID: <202511021050.oDg49iBk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/for-next
head:   81fd782ed38611bf9fd5b9623044544d10ed5844
commit: 6534130e56430e415ef51bd0baeb5100f669c50d [20/23] soc/tegra: Add list for handling PMC instances
config: arm-randconfig-002-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021050.oDg49iBk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021050.oDg49iBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021050.oDg49iBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/soc/tegra/pmc.c:475 struct member 'reboot_notifier' not described in 'tegra_pmc'
   Warning: drivers/soc/tegra/pmc.c:475 struct member 'syscore' not described in 'tegra_pmc'
>> Warning: drivers/soc/tegra/pmc.c:475 struct member 'node' not described in 'tegra_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
