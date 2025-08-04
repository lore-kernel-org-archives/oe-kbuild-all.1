Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4097411713
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318300; cv=none; b=QqCEslWxniEIXyqYgLmzbK1tIKHCehRC8WOuXQdZXcM/i6WWJ0E1KlPgeryoAtxj3UNSCGADjjtWejw+qNQbQ0INBCoPPHCeBG198vyvvaVio+sinOwBh3tn4Tg7vIffjoMg0wSuf8ax5m6KzvvaNlPr8Mo158T5drXCPgJKiRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318300; c=relaxed/simple;
	bh=Lu75tjQzuSsgybzXqIPqJfeC+1xSBtpY56Bw6j127xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMSrhx5y6111wY4bOpysFHa2Tfn5ghvN0fvIO2r0jV/0M3nLox/i1uvI+nFExzGIajeD4Xs5Zv9cNuRuiCtDK/EeqrTwrSKp8DVpxMmxdBx5q/o3SqFDiMGD7kFzlg6M783TxkvOa51+DtpfkfdXhWx+oyXl1Lsor41rPwmP82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckNaTtsT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckNaTtsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754318297; x=1785854297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lu75tjQzuSsgybzXqIPqJfeC+1xSBtpY56Bw6j127xQ=;
  b=ckNaTtsTdXPlmjfDjewEizhWUm2I2fORHpZ849wTCNREv9clBVN3THBM
   DL4Yp2cCYJD54qLCaaAbum6BdoaZijz5AlGPi7ZcusSo5r3iMlzI2hboE
   OXshltvhMcA6cnQRI6k5iuKBh2E9A2VKUP/Bw29JxINkwCosPoGriSIl6
   xgODUWifeVoYu+re4wsexu4GWcisSPNMUjW/HcYUCTm3b4M1IML7TDEC4
   wiKdkHwFe8F0QzuU3uwQljrV73cqrGxDv0alHZcWbKIKzLqLO3wVWSmt9
   PNvBp2dUZu7wK/JkbZ/I5zi+MMXldRSTZQ79oIqkj1krasJgkOlQa4YoI
   w==;
X-CSE-ConnectionGUID: Blmi6kScScmbKcsH2Qd8zA==
X-CSE-MsgGUID: i11V737aRbWTEW+ylAkmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60395884"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60395884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 07:38:16 -0700
X-CSE-ConnectionGUID: SSdsQb+1Tu67MN+TiXGrhw==
X-CSE-MsgGUID: a1A2xAhTRwSiDPBdxzAqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168382308"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 04 Aug 2025 07:38:16 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiwKK-0001oL-2Z;
	Mon, 04 Aug 2025 14:38:12 +0000
Date: Mon, 4 Aug 2025 16:37:46 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2635/2635] fs/nfs/dir.c:1498:6: warning: no
 previous prototype for 'nfs_check_have_lookup_cache_flag'
Message-ID: <202508041629.6wf4G1eb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e46fbbc0ad301c3517340bf966d39b8493a2ebb0
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [2635/2635] add enfs feature
config: x86_64-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041629.6wf4G1eb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041629.6wf4G1eb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041629.6wf4G1eb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/dir.c:1498:6: warning: no previous prototype for 'nfs_check_have_lookup_cache_flag' [-Wmissing-prototypes]
    1498 | bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nfs_check_have_lookup_cache_flag +1498 fs/nfs/dir.c

  1497	
> 1498	bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
  1499	{
  1500	#if IS_ENABLED(CONFIG_ENFS)
  1501		return enfs_check_have_lookup_cache_flag(server, flag);
  1502	#else
  1503		return (server->flags & NFS_MOUNT_LOOKUP_CACHE_NONE);
  1504	#endif
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
