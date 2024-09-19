Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F51DFF8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Sep 2024 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726760890; cv=none; b=AefEAlub9Hm1Tq9D75V7zcpW9qf3qpVVXiEZ3ioFpTntv1wM9fI54KsPH5Nt1EH0MRlJvMH7J0ginTsArm49e7SBiBC4CVVFWfHeBiJlJCi2YDhxT5LMcT3wzZoWFwKbNftXwcOO3ivdgsMZSUBH58WyR66RICZD3TzNcBTIHWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726760890; c=relaxed/simple;
	bh=LA7YELPus5YOi5udpFbgm3L1a56csyRcqmuviJdyq1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NUXAsrCI5GMlH/iNmGUyrD1DiuOUcIv3xmpg+c45Z2psySaEMnweKIRETgJ5Ur4hIjFAsO34dlHnZXPicwvt4n3xkMdDJJKaMEfCbQoct9poZEu47uEv32gPz0LzEvTYqkBmNV1BLDJALZYK0w19Dg5c9YJRqeRvE4LmAXZ9/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHhJoBig; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHhJoBig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726760889; x=1758296889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LA7YELPus5YOi5udpFbgm3L1a56csyRcqmuviJdyq1g=;
  b=LHhJoBigOrhhx1Pv+AKNkx3dcfrVGTKhxxnCS+eVDGljA6BPir4QL9oF
   8qHdj7iWs4zX2dZZ1s2h6qwLJpDLvrE4tgGyl4MTYiuKNn0Np8V8krumn
   vgEZHgmrmALTjmKk98E8jRuX+uv1owb/+SiP6+sYBqCxW9I6hW7VCwjkx
   bkr6FHwYZVgXfYSNH/N9T5NHSiAs26d+WzS+HKFRLtZY+SRfqsvX/lLoz
   aKCCRYKwYIhuY95ZL891341v2cZELOjLyRffBvhKzjcft1CMjiBjEPxvw
   Jvxt80pm2yhvPO0UjASWXNik7nI+Mlgh2FDbapaEgWq2s5cy2PaKq6Q0L
   g==;
X-CSE-ConnectionGUID: jyjUFaLCRvSOnw6JzdQ4EQ==
X-CSE-MsgGUID: cfan+yvmSBaGVIGkXhhxkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25924963"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25924963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 08:48:08 -0700
X-CSE-ConnectionGUID: am4S7NUDQj67EE9ocQJicw==
X-CSE-MsgGUID: IPtfmp+JRr+htwpiCI+f+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="74098233"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2024 08:48:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srJNy-000DQk-27;
	Thu, 19 Sep 2024 15:48:02 +0000
Date: Thu, 19 Sep 2024 23:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 51/98] net/ceph/ceph_common.c:869:5: sparse:
 sparse: symbol 'cephfs_sysctl_register' was not declared. Should it be
 static?
Message-ID: <202409192338.ZEWv9CXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   45d184515738e4fdb0e2ab06857b080fae646152
commit: 947d529c7971f7f0863344a3ba24abf6aa245464 [51/98] ceph: add sysctl to ignore error epoch barrier
config: arm64-randconfig-r132-20240919 (https://download.01.org/0day-ci/archive/20240919/202409192338.ZEWv9CXe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240919/202409192338.ZEWv9CXe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192338.ZEWv9CXe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ceph/ceph_common.c:869:5: sparse: sparse: symbol 'cephfs_sysctl_register' was not declared. Should it be static?
>> net/ceph/ceph_common.c:877:6: sparse: sparse: symbol 'cephfs_sysctl_unregister' was not declared. Should it be static?
--
>> net/ceph/osd_client.c:57:6: sparse: sparse: symbol 'ceph_epoch_barrier_cmp' was not declared. Should it be static?

vim +/cephfs_sysctl_register +869 net/ceph/ceph_common.c

   868	
 > 869	int cephfs_sysctl_register(void)
   870	{
   871		ceph_table_header = register_sysctl_sz("net/ceph", ceph_table, ARRAY_SIZE(ceph_table));
   872		if (!ceph_table_header)
   873			return -ENOMEM;
   874		return 0;
   875	}
   876	
 > 877	void cephfs_sysctl_unregister(void)
   878	{
   879		unregister_sysctl_table(ceph_table_header);
   880	}
   881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
