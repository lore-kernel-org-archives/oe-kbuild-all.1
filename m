Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BB1547E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168235; cv=none; b=SzNs8buhbeydHTozjLjChg+VXgwU0/9Aw+6p0lMqfgVFwBZJVNRCDS7NT8rM/fMn5MyRfKaN0XfFIpT6FvgY1NtKQv1ftiBAeL78CwYl16a/i47TOlM4w8raq1GlHVd/1uDqdY3raTIT7btL7PD4lz/8DDHfEH5Oy6ms5WqALH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168235; c=relaxed/simple;
	bh=U1ss8//5WJtkxBEK/nqS3lDObtNdWjlSKvB2d69XIc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbjCZuK3Pv/trgdM6Lgpja+e4RvmhVHS2+CsB+KXL2zz79J3/6eYvFnloQ7Rpp+YniDM4NHs9U5BrU8vVYxxWiG/akuC5xDHZo2LiLmRvbpfbdpnuXGmNBSzPM3ubw7WNzA8tnLjoTVKw8Hu6ofDMHsMcZVbCS80tF3EHONnkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPGsfWl9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPGsfWl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727168234; x=1758704234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1ss8//5WJtkxBEK/nqS3lDObtNdWjlSKvB2d69XIc4=;
  b=VPGsfWl9Y/wLYsCn1c9EGnEsxkpR+ibhNE4MoGmsldMFrm8pSmE3lL8U
   BZf76RU4hI6p4ILfS4V+zmlo+9DJMzstIZYPkifNeVyGPgXX/JZzw12P/
   D45DCEj6PYI1hzZqPZzgm177+3stScugBZAWXiYmJG46phZd7lAzjFB4Q
   1oQ50z8kMNwtbDpZDEITNkXB072LcgJ8yTaFxT/d7RDOX/y1kmpXuAw69
   i7cS19RJ9AS0bc3f027D/NbiNgh5MOnbtxKRugEPECuh6lYLpHE0mWB+y
   5FPNESzR3x1tToz8T6wBJ0/82RsMsrpUEmWAju1SF4PVpJMnOeJ9Nzy+b
   Q==;
X-CSE-ConnectionGUID: 1hpT6d7QTEeWusE3PeZRcA==
X-CSE-MsgGUID: Rw97ARTXRo+q/zJKGCpZZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48681200"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="48681200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:57:13 -0700
X-CSE-ConnectionGUID: F2ardt+pQXW2Cvl1oKzJpg==
X-CSE-MsgGUID: nWcILfPBTc+D3prPCaddrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="108802286"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2024 01:57:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1M3-000I8u-0k;
	Tue, 24 Sep 2024 08:57:07 +0000
Date: Tue, 24 Sep 2024 16:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1434/2441]
 drivers/iommu/ioasid.c:527: warning: Cannot understand  * @brief Free an
 ioasid_set if empty. Restore pending notification list.
Message-ID: <202409241646.pzgC4plP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: dc05c36e47d0a11399068744f5c60658b58a2929 [1434/2441] iommu/ioasid: Redefine IOASID set and allocation APIs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240924/202409241646.pzgC4plP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241646.pzgC4plP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241646.pzgC4plP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ioasid.c:280: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 280 - I thought it was a doc line
   drivers/iommu/ioasid.c:307: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 307 - I thought it was a doc line
>> drivers/iommu/ioasid.c:527: warning: Cannot understand  * @brief Free an ioasid_set if empty. Restore pending notification list.
    on line 527 - I thought it was a doc line


vim +527 drivers/iommu/ioasid.c

   525	
   526	/**
 > 527	 * @brief Free an ioasid_set if empty. Restore pending notification list.
   528	 *
   529	 * @param set to be freed
   530	 * @return
   531	 */
   532	int ioasid_set_free(struct ioasid_set *set)
   533	{
   534		int ret = 0;
   535	
   536		spin_lock(&ioasid_allocator_lock);
   537		ret = ioasid_set_free_locked(set);
   538		spin_unlock(&ioasid_allocator_lock);
   539		return ret;
   540	}
   541	EXPORT_SYMBOL_GPL(ioasid_set_free);
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
