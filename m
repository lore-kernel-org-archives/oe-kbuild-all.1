Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C2453E31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716497218; cv=none; b=HKK+uuvswv8Ed1WjJtLjZV5/YnJiaGy6l+oREH+GIpUt6x7i3eFqUhho7fEJAvITkNrhqXh6sDOJQ0EG+lOWuvXlNhfLX8WpHABf/2d9FnAPV5/Nmtc0NJ5CLQnTfpI0GPGJWhX0K9HWBwKiw4jhJSXjhi48yrdnaA3lFs9ZZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716497218; c=relaxed/simple;
	bh=B0oEjk84BZdc/YNTT8IwF2cJTOIqibBHEY/BVFQACWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBrn8LP0rCxdGemQUEAl95lhKGWIA27AptNZaWiHgtDiOznPXNadprG3KvyYa0IYfGJLHENHWIOdvtJH9GH7XPCG6bT1u5syr8jUduVAciYeOZrVVGynPCjYA5yz4q3PTrm5gi51dAfksX9xPwFrxTQ0oVE3YEOHPApLTOBrT0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ai6dqIVD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ai6dqIVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716497216; x=1748033216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0oEjk84BZdc/YNTT8IwF2cJTOIqibBHEY/BVFQACWo=;
  b=ai6dqIVDGg7EYFJCs+ZLNDrDING39TJpKstjfWXBGbBEf61SBbE5Nhc1
   tFWppA1otgrVkD7I/Z26ZCGRtro//6LVocic65hDgW3Jk3THz+ykTKQGH
   gTvfiJLVvN+0lcQ0rogM6F+OCwnt9gT4hd7qsoU9BGBDtd4jg2bL1Vr+X
   yII9CzRdXfeTiQJ7SlpKzSq1ytB0+Tz3wD1dhXGOmLE7EA3D09p2/bCM4
   R+qwSFqO/U1vwsqoQZmtRUVIrgBqkSip0BHuJKamfW/GXBXVXwGoG7wtg
   yMFHniEHOImUus0l2kM5P1VH7mYALbUejd0CLxKaV6fyGPhx1ec9is38l
   g==;
X-CSE-ConnectionGUID: aEiKrjlrQfyC7XL3SPOtWQ==
X-CSE-MsgGUID: 6GNohheHTI69yGFgYxV37A==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12694213"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="12694213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 13:46:50 -0700
X-CSE-ConnectionGUID: jzY30ZFCRaqCJSkWQaiESg==
X-CSE-MsgGUID: KpOyLXnORRS8MR/i1sF5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="71213568"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2024 13:46:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAFKo-0003WN-2F;
	Thu, 23 May 2024 20:46:46 +0000
Date: Fri, 24 May 2024 04:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 37/107] fs/netfs/buffered_read.o: warning:
 objtool: unexpected relocation symbol type in .rela.discard.unreachable
Message-ID: <202405240409.B943xSTk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   c65920c76a977c2b73c3a8b03b4c0c00cc1285ed
commit: e580acc57af8fdffcbe8681b0e53a225ca4e261b [37/107] netfs: drop usage of folio_file_pos
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240524/202405240409.B943xSTk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405240409.B943xSTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405240409.B943xSTk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
