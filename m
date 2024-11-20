Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8152F2A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732141611; cv=none; b=Cid8aT1L0FqQiDTvzo99e5VWpeIoK+sO2Tm+gtRwiTQtlf/aOXJ9KleOLk3BE1nC7rcXiLKsNCU106YTGfoT05dudQPsfeoIlvsVi0wjBVDNow1EpzR3XnL0y4mC3IOJNaXKsagqsftx+84eK1CPXWWYcHpRnCVR7/CsylGbPPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732141611; c=relaxed/simple;
	bh=sWm8ECDX1aipGeyoKB0/u5WIIiHAUBq4VypGtimguPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTbShy64EIXzQKTY8Pi9edcyopsnp+W/0QeQsqnB6uYCZrSntnStywb6tY5oYY3pLkL5mctHJiR26NK103WaDZTF8XlI4E69OWex6vaA5Bv2hNzm1F9G1YuN4a5fUELRwtDpgMRJrrnqk34lXJAW8H0KO1gv1g3KtsbxWlfdcok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIBY111c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIBY111c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732141609; x=1763677609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWm8ECDX1aipGeyoKB0/u5WIIiHAUBq4VypGtimguPU=;
  b=iIBY111csPl7M/af30q6r8HkGWsAF+HFj1x6oJby/L8zgv0BtQkxy+gp
   MAKMjSY+cChsDPl/5nRHyUiI0G5U8JEcPhpsP5XtXocfyX0ltWStuNAIC
   2FQfzbm9RbiepMDTrBQtopRQ0ZzP93mJrvEvlqvfoFXT2ErxjtS/a/vrM
   P7zfvoOwYIBI8e1bGrV2SIlTGcZAQNvbxgn2QHrhj7Vkxb4vIYGV/wkO1
   wApAmed0lFugpZtI4rIcZInabQwssHVbAkcx/JjAdT4SGErLijT0NcaHH
   yfeMOWvgHyHEC0FVH4JqyRexexsbv4fZL8eZjBI/0tcZ6bZXr19UHBI1x
   Q==;
X-CSE-ConnectionGUID: HgTMCPAXQkyocEewE2D+aQ==
X-CSE-MsgGUID: +zrzBJhYTKCXSLhXMejNpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54727773"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="54727773"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 14:26:48 -0800
X-CSE-ConnectionGUID: TFuymUOdQse9aQ2yKvD29A==
X-CSE-MsgGUID: I9+aXVpoTaazQLYFJ4ypFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="89849970"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2024 14:26:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDt9p-0001CO-2M;
	Wed, 20 Nov 2024 22:26:45 +0000
Date: Thu, 21 Nov 2024 06:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 72/77] ERROR: modpost: "xfs_unmount_zones"
 [fs/xfs/xfs.ko] undefined!
Message-ID: <202411210621.pWj9qTho-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   90d9623aee06c9da4a4d1c15fe048020476ad457
commit: 03b06a1a9f51e9625907b0ee5e448a2955a1e686 [72/77] xfs: don't indirect zone mount handling through xfs_rtalloc.c
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241121/202411210621.pWj9qTho-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411210621.pWj9qTho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411210621.pWj9qTho-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "xfs_unmount_zones" [fs/xfs/xfs.ko] undefined!
>> ERROR: modpost: "xfs_mount_zones" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
