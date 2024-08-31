Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE19D1D131B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110170; cv=none; b=KJM3PAYPvXLKIYvtV0OMsVWT96xTeGZ3PCQb+EKf0hrCouxTCT/PYGWyZLS9LJe4NfeIrNR4/LhT/1bApVGHm8JNQfoYRwsmOthXpDJSWS77tH/UdjU5TqgqQhZkjFXKMsH4hYofu8mE59HQoaeOfc2FuC4TgDqiHDlZtvdDcSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110170; c=relaxed/simple;
	bh=A99LKkNcS7niui9EVuAH/XAtQsAv2hhyq1y+AGBih9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRKx4ozuVCd6UL9Jetk2uJCpIcKv+NGkPkrlEoPHoNweTceK07UIAMMYJuTgOakdtdapL9RKUcaIpBs62dPtH4BeNgrnxtYcIREI4eYs+SoRgh0VYozeQ4AQQCkCQm0nP2ZAKleaslpllLIb/QIsLBYxhEW6dodkgWqxC8N8GyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzqU0QS7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzqU0QS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725110169; x=1756646169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A99LKkNcS7niui9EVuAH/XAtQsAv2hhyq1y+AGBih9M=;
  b=CzqU0QS7k/bGW1PTQRG3ZK4EBUzi82MoREGgAdR7P4DzuKByMT7lODkb
   FQ7wu4FkCLoSbYhzjJFIpUuIIyXy68fwrxHrDO2Hozbvvs0YifPVGTHc0
   ciU7sD9C+LYqgE4PxUxi6ORFc+tVea+h4q6QneMDKbldSLmqJV7lwRG4R
   XkGC0B7DKJ+Vxfb0uSzEd/uNCSHlFESQtt1qCZy2JTq+wzJ7/fJMXbo/0
   9sBRov94Wrjhl894rkg59ANTXgUDZqUqsnZA6g/NaUrj9OiyX2Ob7HbnS
   abMF1UyZj/dIh4JlYyTmLW1JZVcwu0RgQtJ+zFO6BpaG3ab39lbLa71UR
   w==;
X-CSE-ConnectionGUID: lHgqDnTGSf+3+niQr/NSOA==
X-CSE-MsgGUID: LWtSdWq6R0qPwizrTCHxmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34361159"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="34361159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:16:08 -0700
X-CSE-ConnectionGUID: RdAOcdeQRlaZ0IQeCWan0Q==
X-CSE-MsgGUID: uwrBia2HRa6sHPm6hVRNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64656698"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Aug 2024 06:16:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skNxU-0002m6-2X;
	Sat, 31 Aug 2024 13:16:04 +0000
Date: Sat, 31 Aug 2024 21:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17719/23944] drivers/vhost/vringh.c:1323:
 warning: Function parameter or member 'idx' not described in
 'vringh_recover_desc_iotlb'
Message-ID: <202408312116.0e0esOpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: 11d476e933635a37851ac05f919142a29b03ed6a [17719/23944] bytedance: vduse: Add mmap() interface to support inflight I/O tracking
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240831/202408312116.0e0esOpd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312116.0e0esOpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312116.0e0esOpd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vhost/vringh.c:1323: warning: Function parameter or member 'idx' not described in 'vringh_recover_desc_iotlb'
>> drivers/vhost/vringh.c:1323: warning: Function parameter or member 'head' not described in 'vringh_recover_desc_iotlb'


vim +1323 drivers/vhost/vringh.c

  1315	
  1316	/**
  1317	 * vringh_recover_desc_iotlb - recover desc head.
  1318	 * @vrh: the vringh to initialize.
  1319	 *
  1320	 * Returns an error if recovery fail.
  1321	 */
  1322	int vringh_recover_desc_iotlb(struct vringh *vrh, u16 idx, u16 head)
> 1323	{
  1324		idx = idx & (vrh->vring.num - 1);
  1325	
  1326		return putu16_iotlb(vrh, &vrh->vring.avail->ring[idx], head);
  1327	}
  1328	EXPORT_SYMBOL(vringh_recover_desc_iotlb);
  1329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
