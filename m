Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A119C2FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222732; cv=none; b=Yd2NkuiLGEmHpfo8uTC+eaH4q+aPTCYaP3FNg9+jtUyyHF1XZ3HJ2SV6vkSy1kNkfSn+Au/ybyO9jyYx8RNOoqDXsbPWnkfeQ0k3N6ZDa8TlSKXKLJat7SreMEQjm3OnI7xV9kLySzYfUI24zWHHBpEpaFJj/Ka6nBnQKifYor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222732; c=relaxed/simple;
	bh=fEdPRsbKYXgOv34iPUGQXnO2A24//YAgpv0v2wCpRcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTa5qSB7vlXtrbpv+qRy7E+LNWIKi9QjGloapplwuchAQPsO6Dj+p25S2QhRdzKDoz+bobQtrlRlKGNOwgsTkZSDWmbJekir4D1o+dRR3/mIm/bKww2VygGmN0fRFOD/xbmAPoEAPSHiP5M0j0DFTSUB+w8YKkX7eZqT/4USEoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ni774Y3L; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ni774Y3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738222730; x=1769758730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fEdPRsbKYXgOv34iPUGQXnO2A24//YAgpv0v2wCpRcs=;
  b=Ni774Y3LflAr6sOBtlZLAaneV6mAq/ExtZG8tejVlxvcaWEv2n4ROVlF
   QVX8umC57aRwewBt8ltirBT50ojp56SCx5g8A43g9S9hbAY4LjSROkIuP
   DhlPNHdbnmgMgwSH0892KRdSrx4CfjBK2iRILWMffbrE/xNSrYxLgSKoh
   9niufekIe/erKmqYY5VhXxP7ZiqZwD3XQRkN0ZXFBo4zQ4aVTC5vmQzOp
   /c5GuWMQ5sZswox0ReVKfkezcr0YP4UjUCDQmffHoiO4TcWNwm1pYdfil
   W/RglCds9ZzUQ0Bs4kCI8yDCKONuqjIzfRnJO+MtSYjN+4PGsfyMq0R4D
   w==;
X-CSE-ConnectionGUID: AmolVVMpTMm9AFXQvMOtZw==
X-CSE-MsgGUID: B/CSbG3kSdGJH8eYqT9ZFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38862949"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38862949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 23:38:50 -0800
X-CSE-ConnectionGUID: ZvNqmBylQFuy39vYpjVHaQ==
X-CSE-MsgGUID: RU8tKnjoReyOVywKpNJz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109227717"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 23:38:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdP8Q-000jpD-37;
	Thu, 30 Jan 2025 07:38:46 +0000
Date: Thu, 30 Jan 2025 15:38:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-folio 17/18] ERROR: modpost:
 "__tracepoint_netfs_ceph_writepages" [fs/ceph/ceph.ko] undefined!
Message-ID: <202501301511.YhqHB7a3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-folio
head:   d01d7c43100840cbbcf69f614c36db17028fab8c
commit: 711a62785425ddaea0844473e1d45c7d36944f38 [17/18] debug ceph hang
config: arm-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501301511.YhqHB7a3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301511.YhqHB7a3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301511.YhqHB7a3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "__tracepoint_netfs_ceph_writepages" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__tracepoint_netfs_ceph_wp_track" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__tracepoint_netfs_ceph_wp_get_folios" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__traceiter_netfs_ceph_writepages" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__traceiter_netfs_ceph_wp_track" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__traceiter_netfs_ceph_wp_get_folios" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__traceiter_netfs_folio" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__tracepoint_netfs_folio" [fs/ceph/ceph.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
