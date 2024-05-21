Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E481B970
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261208; cv=none; b=uTCkyK38S+/pQVW7PR3OneH9Lh3DpL8hxs61IB2iQTAdLcjZhqq+HzCQUCw5DBxSyzcYyRLDuvQZ1U5LumDIoOr5rS4neT4Cz/pjRGbyE2zHYi0d7ZTQuL5HSr/HU4+5G0ZjW5F83igLGaxnVDSif3xtiDhjfauJGTU4Y4wez3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261208; c=relaxed/simple;
	bh=02M9UlR7N207DP92jLhLMeyYRHpSrGLiOtVzaTHT5tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcqKVFiQbLg7W8xvRFkKsZkJWk55o1XbgQ6nEhIeST3THuiDzzd3qXxM+mxdRqG7m1OYaaNwBNmegc6La8c2gK+VyX48GQVSjdd9fa899xNAlO2DuhqMuL9KWT0IBAHQjFk1n2oc+o1if+bgq5VhF9rtCTl8Evf1bq1zts/1zs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAJc3e8t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAJc3e8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716261207; x=1747797207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02M9UlR7N207DP92jLhLMeyYRHpSrGLiOtVzaTHT5tY=;
  b=iAJc3e8tXRhmGbtZ1KcshvSSlGfxYcjQobm48G7+bYkc5eKtY/ayTmeJ
   k1wDG5yift2W8U6GAbkAnL7yOHhMGbbEX4OcgePGxS+N5vvbml5AZvavO
   05+Swi6Wxuoy9R8UKXWz0YUWCV3Y1eT5axlTH2K5xNFR+q7CV6rpCCK4I
   WbFGxF5tbf0YetdHte9CbrVYiN8/baM8MCRJcDeT+5cVsO8bkL9wlXYVx
   OPcLhsw2AHd73nPq2jdvWJGcfcwnjpmL90+Q6ugY949Kv0OowLoFL5Usl
   jpqRVgOx/9Ifajsq50KO84ESfzCNukRH+xf3HbVW+RhcpxD4e5R6kAkle
   Q==;
X-CSE-ConnectionGUID: 65EZSlNnQDKmHv1iSYPa6A==
X-CSE-MsgGUID: 3AA1bluIQMOEJLCQKPdO5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12602277"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12602277"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 20:13:26 -0700
X-CSE-ConnectionGUID: UGGOW0+wQ8mQCKKa1pqOEw==
X-CSE-MsgGUID: WVPJ9QwCRsmsvuj7gf0lPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37359713"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2024 20:13:25 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9FwI-0005Ts-2s;
	Tue, 21 May 2024 03:13:22 +0000
Date: Tue, 21 May 2024 11:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:drm-next 514/580] kfd_topology.c:undefined reference to
 `crc16'
Message-ID: <202405211126.zefeRMPT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   9c1a429217d294ade1a88eddde987a183d4d3ae4
commit: 3ed181b8ff43fc03c85d43a726e578bd131d39e4 [514/580] drm/amdkfd: Ensure gpu_id is unique
config: powerpc64-randconfig-r063-20240306 (https://download.01.org/0day-ci/archive/20240521/202405211126.zefeRMPT-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405211126.zefeRMPT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211126.zefeRMPT-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `crc16'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_topology.o: in function `kfd_generate_gpu_id':
>> kfd_topology.c:(.text+0xce8): undefined reference to `crc16'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
