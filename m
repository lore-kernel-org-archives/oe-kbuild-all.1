Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7578B35280
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735956227; cv=none; b=rwZ2qhc6KEPidwIM50lfs2Cc2svovFAKj7X82h+JnQ7BPnPQqMCuco9WN6xoa6XAnajEaxbLQqiAKdF46o/utNA4xvZLbM7pjRgF2EcxIFdz5w4IAwuM8m0pNtjM+Zy026umbZ9EpsyyeMU31Ts9lLPwJJ1x2E+oksskMMqBNuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735956227; c=relaxed/simple;
	bh=+9PpK9eBvJfW5OYCFIeVRJ4XhTE1vHARGsQOlXFw+EY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8KTGPXMpHpUut2i6EWlgG9WqpBo2cDBs4e19jtOi5VlEBRje4j8UMZS0NpWAAPmOQjHuWK/nM6uZ/g4NBfeXcMDeZMLjp6N81dHGTjVLRfh116si3N8gJS3lwyqZmfSb2gnE1KoELQQqOozJ1zK9X8avf7yJJN+WeF42qMP55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXu4uhAA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXu4uhAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735956225; x=1767492225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9PpK9eBvJfW5OYCFIeVRJ4XhTE1vHARGsQOlXFw+EY=;
  b=AXu4uhAAL6bWIxaHiG2s5zps+wNOvN4jlclYdG5vo542HAu2uDOOl5mV
   Gi2MaitqNAPEFC4uGVb7D7OCbRZl7EfVBCGbk58feWI/3AI2jqYRLNSX2
   LiFhutlP1GMJlcwDa68WXvadGCpf73i15LOdg9h9XBYoK1pRo4KpQR59e
   sRiQKtIDyatHk5yqsBYHuTnlMTBPc8PVd9HPpG9+q9ts/X1WSEwenXpz5
   CC4WRTFbLNqhiHnrNJe9D7nN5MARfq1FGhnrKpNZUFlGmqziS5pMVJobA
   fDOjXtBcVG2EFJKA8MPJNSK5WXLtEVh27ONH1aK7DOcPZ3U0gFjPLL51v
   Q==;
X-CSE-ConnectionGUID: btNs15wTSX2sUdDlBrnyOg==
X-CSE-MsgGUID: RJmIpaD9Qiq/Elu87UWMcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47612281"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="47612281"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 18:03:44 -0800
X-CSE-ConnectionGUID: GTKYrzBZSxmY+nAAZ81rEw==
X-CSE-MsgGUID: N7x2Wf7mTgGrik9ZtEpXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="102405375"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2025 18:03:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTtVt-000AXd-1e;
	Sat, 04 Jan 2025 02:03:41 +0000
Date: Sat, 4 Jan 2025 10:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function
 parameter or struct member 'fw_shm_pool' not described in
 'tee_bnxt_fw_private'
Message-ID: <202501041056.PcirM7AJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 024f5b597564acced9e69305f7a9ef1202186a61 parisc: Add qemu fw_cfg interface
date:   4 years, 3 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250104/202501041056.PcirM7AJ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041056.PcirM7AJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041056.PcirM7AJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function parameter or struct member 'fw_shm_pool' not described in 'tee_bnxt_fw_private'


vim +62 drivers/firmware/broadcom/tee_bnxt_fw.c

246880958ac939 Vikas Gupta 2019-10-31  50  
246880958ac939 Vikas Gupta 2019-10-31  51  /**
246880958ac939 Vikas Gupta 2019-10-31  52   * struct tee_bnxt_fw_private - OP-TEE bnxt private data
246880958ac939 Vikas Gupta 2019-10-31  53   * @dev:		OP-TEE based bnxt device.
246880958ac939 Vikas Gupta 2019-10-31  54   * @ctx:		OP-TEE context handler.
246880958ac939 Vikas Gupta 2019-10-31  55   * @session_id:		TA session identifier.
246880958ac939 Vikas Gupta 2019-10-31  56   */
246880958ac939 Vikas Gupta 2019-10-31  57  struct tee_bnxt_fw_private {
246880958ac939 Vikas Gupta 2019-10-31  58  	struct device *dev;
246880958ac939 Vikas Gupta 2019-10-31  59  	struct tee_context *ctx;
246880958ac939 Vikas Gupta 2019-10-31  60  	u32 session_id;
246880958ac939 Vikas Gupta 2019-10-31  61  	struct tee_shm *fw_shm_pool;
246880958ac939 Vikas Gupta 2019-10-31 @62  };
246880958ac939 Vikas Gupta 2019-10-31  63  

:::::: The code at line 62 was first introduced by commit
:::::: 246880958ac93989c97c73ae1e60b78b4c4c88c5 firmware: broadcom: add OP-TEE based BNXT f/w manager

:::::: TO: Vikas Gupta <vikas.gupta@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
