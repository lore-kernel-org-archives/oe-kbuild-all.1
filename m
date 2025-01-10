Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C318C03A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736544915; cv=none; b=dP8ll6GMiEkiW8LKapKAIG5AYwHLp1+OxAH5kpy1XAbczoGiSIPjrDNjwYjYkgdUGYMV5JgICQCOaG1AdhwzE1M3ASt3WlDNI8OSL9ZOKQgR55m0Z6gvNqWaug/6HXClDv70+0FpQkyyWDU6s+RzaXvwYx6GaUY0PBgMxS+MDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736544915; c=relaxed/simple;
	bh=93sEhWjY4aUUJ9SCk7Nn7P8xfYlXh/t089vSmYfihgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FtwvjFUL84lj44q0sIa/8+8SiVsqi85cI47m5aMYySPlM9J2pDVe+a4mUZxttdSHXLT/2m6id6KvPozDXFwStclbSGdzjKNfvpf7Er2L/wN0JMiTRNx8OQQJyCzq3KiguESsTHe0kS/f+CKnqS773QubaRh+PCxxC8k7qf9szuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWO9fFiK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWO9fFiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736544913; x=1768080913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93sEhWjY4aUUJ9SCk7Nn7P8xfYlXh/t089vSmYfihgc=;
  b=FWO9fFiKR0rxNxkdF0raTL1eaRNtZqzRyyAeb7H6yCFK3yJR+YoE/khE
   xZESBxUA+E0vudrfvjQWVQ2LegrfQXIsvKPDL4BIMgPD7/a7gZoiSsY+P
   TEv7xI+WHMr8U68oaXj2KEq2dofRJ/QcJ/a8UB1E96jOTA3P/WnOeSm+b
   Yz6nsEFWuMX12D7IXHJJyZU4m/DsORxYGc6KTqeGaHXkwB804NZYq0LkH
   CTHFL5WtjIBAYHyisvnT8KTimvEDZhyKJxOgnuO5ta7fhyfkrckQXtt3D
   rBmoxiZc0q99Q32MHPuBzuHnVFcz2SgUvc2q1TIshWH1AUwzS2vM84G9Q
   Q==;
X-CSE-ConnectionGUID: Z3AIBVySTYW2LhL/G9IIhQ==
X-CSE-MsgGUID: p4rn4UZyQEeO1O44xm0c0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36135747"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36135747"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 13:35:11 -0800
X-CSE-ConnectionGUID: VsEv9LuHTOCKuoK2gJ+tvQ==
X-CSE-MsgGUID: 1H0UJ4V4SCW3oA02SULAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108469791"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jan 2025 13:35:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWMeq-000Jlo-0i;
	Fri, 10 Jan 2025 21:35:08 +0000
Date: Sat, 11 Jan 2025 05:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 109/504]
 drivers/iio/adc/versal-sysmon.h:186:27: warning: 'sysmon_oversampling_avail'
 defined but not used
Message-ID: <202501110544.ykW5haRI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 59a66a1264420bbb3debb4492eec2c28677d5628 [109/504] iio: versal-sysmon: add driver for Versal Sysmon
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110544.ykW5haRI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110544.ykW5haRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110544.ykW5haRI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/versal-sysmon-core.c:16:
>> drivers/iio/adc/versal-sysmon.h:186:27: warning: 'sysmon_oversampling_avail' defined but not used [-Wunused-const-variable=]
     186 | static const unsigned int sysmon_oversampling_avail[5] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sysmon_oversampling_avail +186 drivers/iio/adc/versal-sysmon.h

   185	
 > 186	static const unsigned int sysmon_oversampling_avail[5] = {
   187		SYSMON_AVERAGE_FULL_SAMPLE_RATE,
   188		SYSMON_AVERAGE_2_SAMPLE_RATE,
   189		SYSMON_AVERAGE_4_SAMPLE_RATE,
   190		SYSMON_AVERAGE_8_SAMPLE_RATE,
   191		SYSMON_AVERAGE_16_SAMPLE_RATE,
   192	};
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
