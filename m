Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F48EC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 04:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747887359; cv=none; b=t5XeyDZh+gBwUXzBLlk2ppnMLsAu096dNo0nlSkUk9YRx6ee6AaNQivtsaX/iIhuQztdsg1IlRoQlwJlKzaX8mxi3Gnuu46N9DDNnn9dZUG82Kg7U/xkzkY49xyU7FzdkkrWUCV1HWZrSC++tVaL6cYYblhw2IBLBjE7BFpyvz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747887359; c=relaxed/simple;
	bh=NTuWcTQlY5nP6Jp4jGK0Jk1yteGR/Oac8lKg0Wph608=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4l7CKcG9lHtcFaDreytLc9ZWaVAjnOwBGIlTZqxufkFPv6v1JiXPKaO1jOf33LV1dRlrjRgwpH1Id77Zdkf01W4YJtSC5NDjm3IqYZDCq7HjhwHS53kiaya5gMPrzwq15o5k14MiLuXUUjXeNW2NvEeNcQB/PrafzjakQJpd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrbiOadr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrbiOadr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747887357; x=1779423357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTuWcTQlY5nP6Jp4jGK0Jk1yteGR/Oac8lKg0Wph608=;
  b=KrbiOadrIcivXFJgvf3fzm0QuXS/WNiARm84Ah9uB2LIb323YloN5BIS
   mmTYOYKngP+Y7V3UEPK3XUfAkp92mex1SztxL/SnEu7JtLZwuOOo4/JNb
   voHRFAWh4JjxI/eD9zk1PmRDn6UNNQa+wiUbw/xSbka40DpEom5hLhUD9
   eRYCKE+B7+R27WksTvKBqxvyJcH+k311Oiw1wW714FLDShOuW4nFDpYb0
   lVVMi/snDcDRmOISmKuzuJJ6SfE8uQxyNSWlNQnzgN1JYKkYZiAJs81gw
   qYrEk2bAfhn9UQ4NWj6VWvTT+tTGfuFhd3vm6nkApd+ZTEVNtt9WwhBCD
   g==;
X-CSE-ConnectionGUID: gmtUvGZxSTqhP3jjAklfgA==
X-CSE-MsgGUID: aYTuyChSQJqTjliFs0mckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61238765"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61238765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:15:57 -0700
X-CSE-ConnectionGUID: OWLO6iniQuWhfWE7M9Ed9Q==
X-CSE-MsgGUID: uIiFGzDVTLmwBQvIsENKZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140237168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 May 2025 21:15:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxLW-000OuE-0J;
	Thu, 22 May 2025 04:15:54 +0000
Date: Thu, 22 May 2025 12:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap 38/43] aarch64-linux-ld:
 fs/fuse/file_iomap.c:454: undefined reference to `iomap_seek_data'
Message-ID: <202505221232.WzIurGdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap
head:   5b397601da90a62bdc9e22c480dee2381a16ec90
commit: 34eed77dd10ec56523c33f8a2e3a57b5240e48c4 [38/43] fuse: implement basic iomap reporting such as FIEMAP and SEEK_{DATA,HOLE}
config: arm64-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221232.WzIurGdv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221232.WzIurGdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221232.WzIurGdv-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_bdev.isra.19':
   fs/fuse/file_iomap.c:162: undefined reference to `I_BDEV'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_fiemap':
   fs/fuse/file_iomap.c:420: undefined reference to `iomap_fiemap'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_bmap':
   fs/fuse/file_iomap.c:431: undefined reference to `iomap_bmap'
   aarch64-linux-ld: fs/fuse/file_iomap.o: in function `fuse_iomap_lseek':
   fs/fuse/file_iomap.c:451: undefined reference to `iomap_seek_hole'
>> aarch64-linux-ld: fs/fuse/file_iomap.c:454: undefined reference to `iomap_seek_data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
