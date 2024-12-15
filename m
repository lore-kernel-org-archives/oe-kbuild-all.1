Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC223A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734223484; cv=none; b=hMbkDnX0+Ond9IsBGz4ILDqV44hNhOpiVCB/BkuYOw7DSu3ja4XM3t0VsqUoSGIDb8mIp/R7fkIgnt9/yHF4BgUAKJcn5P5bKkrSG9yfD5QDLk213NrEdXuKdP+j+gXz3AUa04Q99yLIJfqi20K+xoZNgP1SNVX3Nua/wxFr4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734223484; c=relaxed/simple;
	bh=MPg1dGpgzSYHYi77vvCo+B8RCmydMjPRizy/8FrtW84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azZMvXDkpYD5pN9rUC9JYf7Gu7mtKau89P4XefyNbnbEEou19XnLitsTkVQRk4JCobRLcRi7UqIEHw+nUjXNbXhEnNkhZY+VYpj1ucF0ZEZgWLv8wYHoddC0gvPc26F15s0ZJtw5Qjh384ft9WajRu+tlnVv+mWoDRVONcdk3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdjKpycr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdjKpycr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734223482; x=1765759482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MPg1dGpgzSYHYi77vvCo+B8RCmydMjPRizy/8FrtW84=;
  b=cdjKpycropSTbsBN3VvgwKZV+JfCxrRIMzhDcbYsnHBFO+KSGoLjY1TR
   WFjZPSBPwBGS1j8YuuKDMDQ5mlqTX8gm2dGZmVNSkREpFaLLtkEzqUqfx
   xAwruzhfGHx2hkogcALSaZpARQm+KRWxUGirvMdvie4nntUPiqrv1YTHG
   gwecQstxUBzt5PmXQQ+58Re5HHLGkO1QTbehLOl2rhYYMoSli7XR/9g25
   4pJC+RDQFMiyXlJN8rOgKhSWomemXGh8uZoUM7MoKQnBHVQfYU8p7x1A+
   hYESR3VmkRuEkr2fWqYcdTItlLMzjEEz4GSdu2qX3Xv5aZVIRW/3rXz24
   w==;
X-CSE-ConnectionGUID: fY+ZFUCwRHOvR7uQjjdYBA==
X-CSE-MsgGUID: ZWJ9E7OlQgeUQvwsXEcMqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34561367"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34561367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 16:44:42 -0800
X-CSE-ConnectionGUID: F1eV1zBVTZ6U2t440B6hmw==
X-CSE-MsgGUID: IcQg7wJCRi6bgxlHJAxM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134210674"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 16:44:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMckQ-000DLW-0G;
	Sun, 15 Dec 2024 00:44:38 +0000
Date: Sun, 15 Dec 2024 08:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Jain <anand.jain@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:misc-next 46/71] sysfs.c:undefined reference to
 `__moddi3'
Message-ID: <202412150804.DZXsnS8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   9f01557aff0e022286507dc84b26a8094764e713
commit: 185fa5c7ac5add0f1a109a22a972ca99780ee49e [46/71] btrfs: introduce RAID1 round-robin read balancing
config: i386-buildonly-randconfig-002-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150804.DZXsnS8n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150804.DZXsnS8n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150804.DZXsnS8n-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/btrfs/sysfs.o: in function `btrfs_read_policy_store':
>> sysfs.c:(.text+0x1341): undefined reference to `__moddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
