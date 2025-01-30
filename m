Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607CC135A53
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 06:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216903; cv=none; b=euhUUSGe0aaWO6t2PKbp81ivFeBOWmXqES0glMoO+Z4O2n3EZO7V5pH2uaDj8pmrOMIvoP0IZbdyTiqPfvbWw7qM2ECPtA4iKKQZ0CdOauhwXSU2O4m/kqzzl1ZHmStt4sllhEOkZ0liIHZ5P6TuAClalKzFkbIGlisRDufXq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216903; c=relaxed/simple;
	bh=v+KroOf5iY7MZqmbB5PIK7l+GtbHRHFC8knm+WKwDIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/eeciNno+0maPFKO85sdZuIVEHJgU1v4jHsB37rpvDkSuxG85h7DiCZHfBNX67ksUDCzeAO0XgiDeS9GEJUSyhMCENyhFXLwLZqMmaeQ9CMJpX6u4FfgzUR9XTYGwOSGaPIhT8Tb8GnIG6DaouF2p3XvgdyZETgiq4E0ZK4GLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mo3baUXg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mo3baUXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216903; x=1769752903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+KroOf5iY7MZqmbB5PIK7l+GtbHRHFC8knm+WKwDIY=;
  b=mo3baUXgEozKLA9P2Y+7SiH+XLWm08S2Ylq3Wvgu1n3IMmJyH6p9QV8f
   a1tAnT5MG3WBDG4rES9PkWw4JIJT/pIxbb5/o6TOevaVi7hyb4iY0L5mL
   7ISRPlX8W1X/i5pSEzDf0r7Kgmr3AofrEVFwkujfcjhYOJOcrFQrU9XN0
   V1OiWzzBCgRMmXijs08bwwYIUlr5HxCNnHaiGYDLMP2WS78xNjkFXuT88
   Bt6z5dWR3n3uQa+Or+34mzcf1HZcSIY6myKhGIu+2mZPpS4MqfrBTz5Nt
   yMVPtufkoVBHLX81/lbzrqNyzvx9arIuS8K1bRvKllWnS7MlhQQR+rQYn
   g==;
X-CSE-ConnectionGUID: MalA/vPNR5q5Crab5+tmwA==
X-CSE-MsgGUID: uyN+XzLZQLeVGF9ZLWEDvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="49340062"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="49340062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 22:01:41 -0800
X-CSE-ConnectionGUID: wAe2LOGUSK69ZRX5cEo3uA==
X-CSE-MsgGUID: 79o5qJWxRHyQ0a+oez32Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="114273721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Jan 2025 22:01:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNcP-000jjP-0j;
	Thu, 30 Jan 2025 06:01:37 +0000
Date: Thu, 30 Jan 2025 14:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-folio 17/18] ERROR: modpost:
 "__SCT__tp_func_netfs_folio" [fs/ceph/ceph.ko] undefined!
Message-ID: <202501301410.t8qlAD2v-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501301410.t8qlAD2v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301410.t8qlAD2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301410.t8qlAD2v-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__SCT__tp_func_netfs_folio" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__SCT__tp_func_netfs_ceph_wp_get_folios" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__SCT__tp_func_netfs_ceph_writepages" [fs/ceph/ceph.ko] undefined!
ERROR: modpost: "__tracepoint_netfs_ceph_writepages" [fs/ceph/ceph.ko] undefined!
ERROR: modpost: "__tracepoint_netfs_ceph_wp_track" [fs/ceph/ceph.ko] undefined!
ERROR: modpost: "__tracepoint_netfs_ceph_wp_get_folios" [fs/ceph/ceph.ko] undefined!
ERROR: modpost: "__tracepoint_netfs_folio" [fs/ceph/ceph.ko] undefined!
>> ERROR: modpost: "__SCT__tp_func_netfs_ceph_wp_track" [fs/ceph/ceph.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
