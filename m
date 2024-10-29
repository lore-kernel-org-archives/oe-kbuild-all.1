Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC320720D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 17:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222848; cv=none; b=P8UqY18XprlXNgboIeGZYe+4wJrnNVpn4+5nmq+N/EQRqKXIWF6a/ztMJglgYTE85Z3WZZiuqoSyFzZ6hRGd9IceSg5XzR1O1yzxHlfDR8gHhvIJhTPlN9qQhgHN+8OgzM476xGXpkEDq1mrs/VjyPAXrHqyoqmujwwgHA86xbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222848; c=relaxed/simple;
	bh=1abY/+pGFG5yFjRJ7YLFUZpsGMx5bU6Eat6W5f6l2DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6KapQS5LXO4K/2Q9H4ybUPpkGZHCGl23fCCyv8NGXQTNPgHikHkeyPxdSBk/IGeauM1urZ/rr8ITukg+B0Ffc89VTb9XUbOwG2Ixxp/MvdKpNI/C1adlERbJPNm+U4vSfOzSQsnaRo7U3LAu/RrMd7i6rgpmKXdhD5pwDruQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHjH3pHP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHjH3pHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730222846; x=1761758846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1abY/+pGFG5yFjRJ7YLFUZpsGMx5bU6Eat6W5f6l2DM=;
  b=YHjH3pHPd2Ubk/LaXX+Hoxsx73Py1i9bfKoIp2yFarztMHR2ESylpr0M
   D3Io5Nn6k+u0xlUfPgwfwph0BIHXat0vf/xCKh6IFpvKof64CgSDUNvjB
   BSoWnPKN41YFs3xgC4ECNQrzbzxwHPYnRu5eMh8wxYngCClYWAgNH8c04
   Jyx6qi3BculqO0Fxb4cIK/Kp9ryLH1XhSL3Qf2fW4F19lxQ6cu0K2hdB4
   hj/Dss4nxowgCkLGMXdh3rMhbvl1fn639Be0KKwpamu87U3hh0YtDBy+u
   zECxhneLnoJcu3V05JbEr2FmgefVNlzfVg45aOo1+hqYMssYibXw6fXrF
   Q==;
X-CSE-ConnectionGUID: noaPl36vQN2G4FLVwfOuJA==
X-CSE-MsgGUID: Wzf+T95iRx+k8VO0rPxPdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40497760"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40497760"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:27:22 -0700
X-CSE-ConnectionGUID: zLDXfIWfTCmSkFtczX+Gmw==
X-CSE-MsgGUID: kBWAxDilTASn3OpputHnGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="112834554"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Oct 2024 10:27:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5pzw-000dwG-1X;
	Tue, 29 Oct 2024 17:27:16 +0000
Date: Wed, 30 Oct 2024 01:26:18 +0800
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
Message-ID: <202410300153.BfEHKTYC-lkp@intel.com>
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
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300153.BfEHKTYC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300153.BfEHKTYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300153.BfEHKTYC-lkp@intel.com/

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
