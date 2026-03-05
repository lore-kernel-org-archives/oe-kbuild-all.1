Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698584A35
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696565; cv=none; b=oTA3ADSpAU87o/pLlTmxFLB5zntzrRAVf8VbAcz01VXiaaLh/KARSWIgBPjMPRvVrnbJ6LRQT9cA3Xq9qIj7fdWraUX4iCKuNCw6QfvbprjN29KLUsZ+8fWy2piRG6+G4oVmDywiThxqQYsMbg0ZplsBKixTbpsy1UZ+GZ0tXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696565; c=relaxed/simple;
	bh=aTEKmG/bJVF+7L9aCCwxzx6bR86zTZQNrEVW4vv9mbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rl51EBPpBEbtcUJqPw5dPM9u6E4jlpUYqkgab6ZJCtbaydbqZXzu71NC+FT70UKoMeRypPb5c2SxtvpMRqTosXpBCgTJJvyzf+Kdw+KDmVC5IlULgrjr8BdS0nYWTSju4l9DJP0HuQe3DkOj5+8UgQA3aLw6scX9Un4CZFh2Tnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbxFkiyb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbxFkiyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772696563; x=1804232563;
  h=date:from:to:cc:subject:message-id;
  bh=aTEKmG/bJVF+7L9aCCwxzx6bR86zTZQNrEVW4vv9mbk=;
  b=UbxFkiybJh8VdSKjV+aJxdAIl6+ny874cwaZY7QcoUWUC4nohdUdtPGQ
   1AcC46kGVZ8wfqkRD4W+aCxEEnpU6GXe/HIg3zbvqzkD0KCGtN2RZrHH/
   Tl4htD2rNQx2fpoMAT5NjbyQQ58kO0ThUSC4ZPTK6/gRPk0zDxgecOnok
   y8/tZf5xG9Xr7Zps1mb7B6+GdIS30NMDne5xl4Id3rZSscMxuLGA0swv8
   WakcMfpCdxZUanodk0fjkJnnPZX4Gp416CtOrnNhsx3LtB68j0BMu9M0u
   r5scNt32+xnKu4PK/mkHILSNSst78vFk45fLsh6pbhRuJePrQrhz6dUjv
   A==;
X-CSE-ConnectionGUID: WqAHrEQ9SUKabeJ3auFdhw==
X-CSE-MsgGUID: kGfG8lZMQoi7DcXZ1n9sSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="85246925"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="85246925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:42:42 -0800
X-CSE-ConnectionGUID: sq2HvynpR4OQCJwsE2Xjtg==
X-CSE-MsgGUID: CcIktV1lQ6qvGHquMOmtjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215869128"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 23:42:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy3Lz-000000001y9-34Bb;
	Thu, 05 Mar 2026 07:42:39 +0000
Date: Thu, 05 Mar 2026 08:42:34 +0100
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hotplug_vmemmap 14/14] WARNING: modpost:
 vmlinux: section mismatch in reference: vmemmap_alloc_block+0x138 (section:
 .text) -> memmap_alloc (section: .init.text)
Message-ID: <202603050831.jjFsPnaO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux hotplug_vmemmap
head:   477d3b2da9f8d7d098328023598f9403fba2d478
commit: 477d3b2da9f8d7d098328023598f9403fba2d478 [14/14] mm/sparse-vmemmap: inline __earlyonly_bootmem_alloc()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260305/202603050831.jjFsPnaO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050831.jjFsPnaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050831.jjFsPnaO-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: vmemmap_alloc_block+0x138 (section: .text) -> memmap_alloc (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
