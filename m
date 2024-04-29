Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56311E4A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714389824; cv=none; b=nrlU8N5L/j6ubitXyN+w3wx6DY5lWnSCzaLTGr8A7yNvOqx12pCawY54cNeMDfFYFi9/hhdih2BWpWjj9uDyKIbVUBeFRmJj+HpInj01kdFv2iQxI28dgnpy7SKXb02+EJ1JMYty/Hhc1rhbbCI2L11vuHBHkHPkGmqzK122zWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714389824; c=relaxed/simple;
	bh=+kbKdZq90Dj8TMFcScdIErMoneyjyGxR3ZZL//Z3KAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JJwIQLJyRtGepAusLiwOfk5xnpigaz/ESfr7riKMnQS8bfYfVUFaS+kzwycCk2YNgQ8mHnTcDOiqq0ohfXS9M6mFw+8E3NAC/nmM6af0cAdWM4y55FwbZNso0xUzLGUeSNV7upRar9PkH8XY+UVewaapxEh9RonvyoMhZJHGYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBr7k1z4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBr7k1z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714389823; x=1745925823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kbKdZq90Dj8TMFcScdIErMoneyjyGxR3ZZL//Z3KAQ=;
  b=kBr7k1z44ZT/7FTcj344SUZSrno+Jk2wBA6JkLOgMTjdtmAGA8HAn4Mc
   OzpcalxA28dziy6ZwBSRwzfIynpaOJ3C+fAz3eyzWFvfaZ4aNtukR2UvP
   nefi6CwGCYvP5t4GH4ZYDS4rL3ZUh5YWBxX/BMvQUIpScE9f1X9P+AI29
   tnCVs3c1/XcO8YB10ff14BxQwp3ewUpW8rS6RBP1Yd1yGjmTTSuk9kYIH
   oIk5mKqFECwtbclTobDcVpecKg3SOu70+esHvRubZkBEsFGfCRU5VNnM4
   opPCKDNhzP9n0d3X5XoNo++Z2URxtW6YHrpV4w0BCNFfh6O+/BfwfyVpe
   A==;
X-CSE-ConnectionGUID: VpTxsFiASt6i3cILeBNPGg==
X-CSE-MsgGUID: jdMQ6GyxR+Wwlq93zGSgLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10204999"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10204999"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 04:23:42 -0700
X-CSE-ConnectionGUID: KcyXjd9ESBe8E/b82FTphA==
X-CSE-MsgGUID: sdW0+S4tTY2igZj16ktFtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30765142"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Apr 2024 04:23:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1P6e-000794-2M;
	Mon, 29 Apr 2024 11:23:36 +0000
Date: Mon, 29 Apr 2024 19:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6476/6485]
 drivers/crypto/ccp/hygon/csv-dev.c:32:6: warning: no previous prototype for
 'csv_update_api_version'
Message-ID: <202404291931.AJfvOC5E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   45b5b15bb932275755ab22d7b335eaab37cd60f5
commit: 09b3268eecd23214c4399153584862a2e1a9cdef [6476/6485] crypto: ccp: Print Hygon CSV API version when CSV support is detected
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291931.AJfvOC5E-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291931.AJfvOC5E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291931.AJfvOC5E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:32:6: warning: no previous prototype for 'csv_update_api_version' [-Wmissing-prototypes]
      32 | void csv_update_api_version(struct sev_user_data_status *status)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/csv-dev.c:40:5: warning: no previous prototype for 'csv_cmd_buffer_len' [-Wmissing-prototypes]
      40 | int csv_cmd_buffer_len(int cmd)
         |     ^~~~~~~~~~~~~~~~~~


vim +/csv_update_api_version +32 drivers/crypto/ccp/hygon/csv-dev.c

    26	
    27	/*
    28	 * csv_update_api_version used to update the api version of HYGON CSV
    29	 * firmwareat driver side.
    30	 * Currently, we only need to update @hygon_csv_build.
    31	 */
  > 32	void csv_update_api_version(struct sev_user_data_status *status)
    33	{
    34		if (status) {
    35			hygon_csv_build = (status->flags >> 9) |
    36					   ((u32)status->build << 23);
    37		}
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
