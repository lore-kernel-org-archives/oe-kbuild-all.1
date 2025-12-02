Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E4221FB4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764662952; cv=none; b=aAQKfh7I/SejJXpus5BQfyCpbBowGDS25WRQ8hEWVrLGSfyKt+YDTh5XWfbHwRCIVofBLoroP3yDTsNn+VGSe0NiMq7MC5BzKqVh1rL114ANAobXaZRJKr7pA2+ZTg5/Rk8/AuKn86JbZOpmlhPrtVw38N4k0XXFhdTLqrglTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764662952; c=relaxed/simple;
	bh=oZlhyjO/Uc4ae++H4kNMJU9I1/TCh3tXQk4g9M0X++U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMes3oByLfkKIwut3WF9UiOfCMXjflcUxqK1/ih6PGisnUzzO8bwsXku6NAohM93x6vxFpZeYwz7lZa0rb5ET7qjgxcNblFXJAzjxEw2VdgWeto+QztddqrK9Mo4H5Qk5vDMWkMb2uQR7NUiuqGcnsaXaZebaLUdwR4WO/6PQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZCnwuY9I; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZCnwuY9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764662950; x=1796198950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZlhyjO/Uc4ae++H4kNMJU9I1/TCh3tXQk4g9M0X++U=;
  b=ZCnwuY9IwxDYMZOk7TJOaN9rcuciF96tES63NfbNT21w+SphFnXlLcqL
   MX/+r0h7BPDXP2Cc2jb4RRQbZvh2hPWswqHhdM4Do7SH1/kptpJdqH8SA
   EedFB8E6h8O/9Mnp48TDtzNORWPN5LRrz1fiD6VXJ+jgHThybS8SenbwU
   Ht1UPZ4285nGPvtLvke8meaIoYrCEi1cqS6sRv41Kp/VLKYk7NMl06zKJ
   zIBuIB5J55JL5p781AZsU2bD4XGNTzeAzmSaj/8to+uf51H5ZeXnXrgCp
   L8yArA6NHTE5ukJFZl7lfxON8sk2Q+wtl6QwVBngIJZOulTQAdZcifbnY
   A==;
X-CSE-ConnectionGUID: JJPudCbwTkCxsd7lU9C3dQ==
X-CSE-MsgGUID: UW0NSmZMStaOKx/IKkfG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66576767"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66576767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 00:09:10 -0800
X-CSE-ConnectionGUID: s+nSb3KARA2RTXA4+oiC3Q==
X-CSE-MsgGUID: t2BLgB8CTJeLxUTSv27ifQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="198688641"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 00:09:08 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQLRZ-000000009Z9-1OG5;
	Tue, 02 Dec 2025 08:09:05 +0000
Date: Tue, 2 Dec 2025 16:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lyude Paul <lyude@redhat.com>
Subject: error[E0609]: no field `driver_priv` on type `drm_file`
Message-ID: <202512021620.lHWA8obt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a26e7032d7d57c998598c08a034872d6f0d3945
commit: a98a73be9ee9c42495690b2fe56e1ce27768289a rust: drm: file: Add File abstraction
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251202/202512021620.lHWA8obt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021620.lHWA8obt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021620.lHWA8obt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `driver_priv` on type `drm_file`
   --> rust/kernel/drm/file.rs:46:35
   |
   46 |         unsafe { (*self.as_raw()).driver_priv }.cast()
   |                                   ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `driver_priv` on type `drm_file`
   --> rust/kernel/drm/file.rs:81:35
   |
   81 |         unsafe { (*file.as_raw()).driver_priv = driver_priv.cast() };
   |                                   ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
