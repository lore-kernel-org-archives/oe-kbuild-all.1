Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BA0279784
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921764; cv=none; b=JQLJ5wDA8GxXrt7bmVYqbbTx03lLnRDC2CijutTkMVB2xRJnHCqN93j1K44GVfKmOle3kMc3vVnQd049h4zKgWoB/RvwoYwX0fX9Jf3xUdcFECdti3SAnYcbItLv47PUwPFt7TQcA1wcxoXfPjfYzqv4flM/KDLUrBk81T9SbUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921764; c=relaxed/simple;
	bh=awxb1jL5ydmjyV2eediW1eyu5fuW7TaoJIKxXHG5yXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o18XyJG/lw5elh8xdBybtQABiDp2mbCfzVRYr55G6eXeC0r1/fXkFfjXBbsj49fmDlRYI40qR6LCz3Y4HfLsho0/VciRebGaLBquw51R3mYwrbuiq6093AxhbHR9pXcU+ZVsdUGUMxdcs3u2h2BDzHiM5QsrkMYOnTKCIx1gy9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaBrFCe9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaBrFCe9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757921763; x=1789457763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awxb1jL5ydmjyV2eediW1eyu5fuW7TaoJIKxXHG5yXU=;
  b=jaBrFCe9cDzonsxsZ3rs//iZLmFfLjVCpX2ez1hXb0CLDZzRT9zaZSw8
   UW7xbtQ3PE7weMeLgDfKEZiRcFckecnbCcQbV+9W215y4qimzjTHgjehr
   CySa1Nd3bfEGB/88IIGyG+OT4EJ5iIhxiAc9XboR7W428cOUNbsjAc4si
   DwcqwkMdTN81sltztKo0wIZtBz+Bd+m7yX0FcPa7UihwdOElgIYdHy428
   +xmBB4zjb9QEQjojq28BeWrnI3l0F4sld5bzRPOX9D1W7/EwcFMXqNJ7o
   PuD1B5EnXmPSIBibG36S2oUNgQo7wRSgnizNZHhiuR7tdM0ax5IBA4q67
   w==;
X-CSE-ConnectionGUID: 5hyyU9BNQ92bSJa35Tae/g==
X-CSE-MsgGUID: /mzSGrEZTNyYI2EUF7O5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60114592"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60114592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 00:36:02 -0700
X-CSE-ConnectionGUID: 0tMMMj4hSS+nCzjriQ2DiQ==
X-CSE-MsgGUID: iqixr3XoSFaw+U5F2e5LjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="178554755"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Sep 2025 00:36:01 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uy3kk-00001P-0C;
	Mon, 15 Sep 2025 07:35:58 +0000
Date: Mon, 15 Sep 2025 15:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] mm/mmzone.c:117:47: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202509151517.B1n6lHFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f6c0c3b85a08f10bd2f765c12d0afebcb101edb
commit: 31feff06a014b0241a77c06162831ea027d2946d [0/1] ANDROID: mm: Create hooks for ZONE_MOVABLE allocs
config: i386-randconfig-062-20250915 (https://download.01.org/0day-ci/archive/20250915/202509151517.B1n6lHFi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509151517.B1n6lHFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509151517.B1n6lHFi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mmzone.c:117:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/mmzone.c:117:47: sparse:     expected unsigned int *flags
   mm/mmzone.c:117:47: sparse:     got restricted gfp_t *
--
>> mm/readahead.c:151:51: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int *flags @@     got restricted gfp_t * @@
   mm/readahead.c:151:51: sparse:     expected unsigned int *flags
   mm/readahead.c:151:51: sparse:     got restricted gfp_t *

vim +117 mm/mmzone.c

   114	
   115	enum zone_type gfp_zone(gfp_t flags)
   116	{
 > 117		trace_android_rvh_set_gfp_zone_flags(&flags);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
