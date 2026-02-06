Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD982FFF8D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770394808; cv=none; b=oFcJpbMluabjMFbbhn0gBoXOhjuMFarm9wBa2WtSrgFS8fhCgnjQQqeIM/xX7BIDEVnt+ag/QaYs7OvbfFjEqleG6IK3Ozkfxbc4BkyCB9AJk/DrkEQWFrMd+B6rq6jplkGKtEMV8l6E61iyzlb0VjzjM8rTOU1LUPWkxEyawyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770394808; c=relaxed/simple;
	bh=DxBDBx0HX1G8Jq7WFCjuIr6UtcZn8s8DgSoiht84fmY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HgFb76pK019Aa8/9E2NyKKht6KGWG0nGBPOxQEwNGiaZ68lfi7aL3Hrw/WrGE+Hf+EHOqJC8AJ+1Y84xJI32eDW0AUJKUjyM8JvP2bFpOR3klq2LPc9vcDZygtT5UvmThQ6icu/dCJCxS5nc8nVODLyUam78o3US4iLN6422rlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaJ9SaOS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaJ9SaOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770394807; x=1801930807;
  h=date:from:to:cc:subject:message-id;
  bh=DxBDBx0HX1G8Jq7WFCjuIr6UtcZn8s8DgSoiht84fmY=;
  b=HaJ9SaOSXfU8mPSAwmFACibHOcH7ow1CBPLa3Z07fE055jEXsX/VCEB5
   7m7IZ4+Tb78BSn8PYGzeWEIq/DYJvpSLJTgBvXtosngsEaq/2//Wo7mYX
   joULHTGmgvEkdm2nbCbBLzn6gEp6baCg7Rn2TGmdHQ3x2hMG62VDFJVKH
   qztGSidmbdkF6AVDP5NHXDyfMSdw7oySRV/ooXR89cUNbsiTXY0hd24xQ
   OtFr/XZk3pi7XxoiEWgC1kgvtoS5SyTBSrMvOirsu/4x9YzTGi0g9vTzS
   Gw4zvQ5kcTtBTIt0kytQgrpnxJhgOETlRxDU54+l++VSmEM95LU63Lf1I
   w==;
X-CSE-ConnectionGUID: EhCmPKwNTFOPvHN5D1w4Lw==
X-CSE-MsgGUID: XrZu8rNVTfelU+mga7MEXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75224956"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75224956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 08:20:06 -0800
X-CSE-ConnectionGUID: d5UDX7E1QH6PhZsZXUGNZg==
X-CSE-MsgGUID: pT49wR0+SWmi479tVW+epg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215085465"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 08:20:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voOYs-00000000ktO-1hn6;
	Fri, 06 Feb 2026 16:20:02 +0000
Date: Sat, 07 Feb 2026 00:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 334/342] Warning:
 fs/bcachefs/fs/check.c:555 function parameter 'trans' not described in
 'bch2_key_visible_in_snapshot'
Message-ID: <202602070028.8OHuKim6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   005fe2d67b081f027d991b3adf7082bcc05b40df
commit: 97a3660140c09dc6c698781146e1a3560236aafe [334/342] bcachefs: Plumb btree_trans to snapshot_is_ancestor()
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602070028.8OHuKim6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070028.8OHuKim6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070028.8OHuKim6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/fs/check.c:555 function parameter 'trans' not described in 'bch2_key_visible_in_snapshot'
>> Warning: fs/bcachefs/fs/check.c:594 function parameter 'trans' not described in 'bch2_ref_visible'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
