Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B104B25FA25
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741110484; cv=none; b=oopdSxfix280RUxac3FDBi8J7XqGE/MqUYtUpYjkGHZNyb/0MQJExsGgan/oGNtZ4hFhXVS/kyVD2aqqljacuR6vL96vIrlTUYkPJUscatWMq3Vf6cSnBMorRq2YzkTXOqDk7jT16i/rar+hLIhC3QnoMXPodaSG5S/4CYFjUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741110484; c=relaxed/simple;
	bh=YE325qDEJzmV1u9RCYzuDCTpJ+47iFLl7uRD3DEgjgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S2ZZCRtP+Wl4nSbanpB/+CBwfsZmjLwhmxIX2vZX6Qcdq22d8aWxIKg+JMS/KKfvBNnYLjQIMprvzxHHNx9m/yuIRN3Kc/KdZUkOIGO10pKrFp3ESa8V3/xCl0hD0GT+irnWwuOgGsKBZ5aatfbKh3ihc0qu9qDfVStBdxSn65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tjdon6aJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tjdon6aJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741110483; x=1772646483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YE325qDEJzmV1u9RCYzuDCTpJ+47iFLl7uRD3DEgjgw=;
  b=Tjdon6aJOr8bYFxjEO8O+GX4VuCVRxYVTKl45LzjgUJI1tOGC258ldkC
   FNWogJF/PQ7zX79okpacP3D2cqDAnOr3C9uqKRHiRIiPp2VHDKBJ/t6/D
   HEQpsTHR7Dci3SzQfftWp7Lm7G8M3aPGcEil6//l+07yI1RoeCYjPKVJb
   /OeuWDxmyG659RmB04PWlaNs4YfzepiXCKVvdg7Sq2cwIXQs/73oE4czK
   9kE2dgY6hVk3tQGTMX7Mox0f/vmUyGrTkvtUMRfYKTHZggn/87E5kdrKK
   HmMfHe44DQNT2kX/Wy2goKhmk9kb94AYAEUt1tSWuxGpRaov/TV5TQytM
   Q==;
X-CSE-ConnectionGUID: RotpvDhjSkSXrwzNtzPXHA==
X-CSE-MsgGUID: JWte0accSUO8FDWiYZ/Juw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53030183"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="53030183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:48:02 -0800
X-CSE-ConnectionGUID: M0iYVuUMTkqzBmIdXDuNrg==
X-CSE-MsgGUID: PikTrMs4RZ+swTmiSNYMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118942648"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2025 09:48:01 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpWN4-000K5c-2I;
	Tue, 04 Mar 2025 17:47:58 +0000
Date: Wed, 5 Mar 2025 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs.all 205/231] WARNING: modpost: vmlinux: section
 mismatch in reference: initramfs_test_cases+0x0 (section: .data) ->
 initramfs_test_extract (section: .init.text)
Message-ID: <202503050109.t5Ab93hX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   ea47e99a3a234837d5fea0d1a20bb2ad1eaa6dd4
commit: b6736cfccb582b7c016cba6cd484fbcf30d499af [205/231] initramfs_test: kunit tests for initramfs unpacking
config: x86_64-buildonly-randconfig-002-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050109.t5Ab93hX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050109.t5Ab93hX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050109.t5Ab93hX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x0 (section: .data) -> initramfs_test_extract (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x30 (section: .data) -> initramfs_test_fname_overrun (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x60 (section: .data) -> initramfs_test_data (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x90 (section: .data) -> initramfs_test_csum (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xc0 (section: .data) -> initramfs_test_hardlink (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0xf0 (section: .data) -> initramfs_test_many (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
