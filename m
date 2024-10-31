Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B02907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730332968; cv=none; b=FPMyR5XJjtZzdgaesKI+Prqv/zGXoN6pIlvnOWZxbbJ0jxY8VvsAItTcgXRLwETtuHILHeVnUeeG64zat96WUeWLfZME+y4RhEnf9dk2uaCRsc6dKJ1k8QBGq13GZ+QR6JUUzE55jLLanIaFW4mTaCehr8KNDifj3FlGUURMS6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730332968; c=relaxed/simple;
	bh=xlSjtUeIps1B0FLs9qknqJRoeloW/4o3v3ezigxmdwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jlxAgwSPJisLY92aHm5M6Py/sE5r8fhPf5oYZMXF0I3WLqM2n3OKiISfeAMNQbxpCrO5lzAyIJQQoMukSapD7P37DilhYif35oVpmgNu3YF0NduTeUUHsgrI/kbE6sCiFywQshQL4184PQVCbQ9k5T/MMwuKgY7B5eWJuyCdjVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTumIhbN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTumIhbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730332966; x=1761868966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlSjtUeIps1B0FLs9qknqJRoeloW/4o3v3ezigxmdwg=;
  b=hTumIhbNXZD2gaTkExG6jEppQlBkT14k6S/NB3xbZNgQeu6gpHWMGgjq
   MMAmZJFsRjEsPVzveEUAgtkJfTq4sy0Omj8DMzsEL563NOepKgObktgnW
   FXEJ5AJ24PkX1IcewfbyVRc81C33mZNBe2TCp4YJdQEMtHysNLjsrSZXh
   hzwXFDaKNPrwtY3h7fy4BxKqMxWEmWaIfaB+smzV1MqZocpCutlZ1j8NW
   sW+x3n0+ulLEk3fcclHqm9KJcD6lvNFSiYvjIDTClIcwN5YUV7lFk6UlL
   lCv0CxY3CFOqSds5vAxN5WKY8ekonyPkQg6amMYHm//3FNXsaw/yA/auJ
   w==;
X-CSE-ConnectionGUID: ytroytDlT7+ED8tgfilKvQ==
X-CSE-MsgGUID: Q2B/ntUuSPev6rAIi5ZRlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29826507"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29826507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 17:02:45 -0700
X-CSE-ConnectionGUID: FuELUzq/Tc6FxYMQ4q4/9w==
X-CSE-MsgGUID: EB5wO2CXTcKzInRVOCKSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87072297"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2024 17:02:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Ie7-000fRY-2W;
	Thu, 31 Oct 2024 00:02:39 +0000
Date: Thu, 31 Oct 2024 08:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7777/13046] drivers/iommu/amd/iommu.c:69:30:
 sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be
 static?
Message-ID: <202410310751.uySUsH70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 48b9cbca2d0ec8d9fc4f05fca1243995f8cbc4b4 [7777/13046] iommu/amd: Access/Dirty bit support in IOPTEs
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241031/202410310751.uySUsH70-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310751.uySUsH70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310751.uySUsH70-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/amd/iommu.c:69:30: sparse: sparse: symbol 'amd_dirty_ops' was not declared. Should it be static?

vim +/amd_dirty_ops +69 drivers/iommu/amd/iommu.c

    67	
    68	const struct iommu_ops amd_iommu_ops;
  > 69	const struct iommu_dirty_ops amd_dirty_ops;
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
