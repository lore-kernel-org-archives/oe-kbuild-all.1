Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EA157487
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590155; cv=none; b=sClVFgcDxydke2PFHfg2nXqZu+ZO4bAmv2lA1blqKslNSHoqCqvkqMAWN2m+Pc+D6FOgbjwR+W86rHByRxbCX529dRntlvVmuHfo/kycAw2Ye+U6996QXf4s8FeUo9Es+o8dex/GMqCcA0m4/FidrkLkvptujWlRND+YJ4JuV/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590155; c=relaxed/simple;
	bh=jul31kOHUhPAblfAaUln6WewDrEML5rbTym5IdM6yLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czqM8QqAUs/05AAGuXyHwTnacOvfVihkhm5EuCDYKf20FtsX1wja/nPqaJ5XvVbEmHKE9ji7SBwGYMT8VRqp5FjbOmiqN9Z9q2dynIt5WW6wbIwPsIAVa2VjhjY0WKTvlSfdJNAT+e8J2mIoB85+TMqALqG/HCTuc4D6enZCSzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TD+p5y6t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TD+p5y6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729590153; x=1761126153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jul31kOHUhPAblfAaUln6WewDrEML5rbTym5IdM6yLM=;
  b=TD+p5y6tWnJMtkHsVqeZj8MUzL2dHQRuAiuo9ztSv/JrwIAVIgRkykOV
   k1iEiW6wYg6pa2yuVCHWKFXuLR1+E5yGE6XCDGkDNAyFd8PlmTdIanigu
   syprDmkEG6wFAKS8/FZS/EHpsNAMK+Dcbd8afLkbUZhzB2GcMljBUDOrw
   hGZqLnHhT8FAe2SiPYZ0QpzjuMFpFOq+AUx7v5HWFu9osWCfYakUFEnQa
   HCt4U6sso0tX36uO/8NWODB4Il3UJNSnC20ge3rMTpqrBWYe3fZ5A67L6
   EK1ldd3nzfdY8zFz+NGQuPSsvSylgIryvnz7w6gQGW+pO/6LFiMUxtil9
   w==;
X-CSE-ConnectionGUID: MT5bmFphRNOosAr8cR4OEw==
X-CSE-MsgGUID: 5yLCZuC1S3CNXUh/LQ6fiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46577796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46577796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 02:42:32 -0700
X-CSE-ConnectionGUID: cL1s5IDQS0a/14YDxAdnAA==
X-CSE-MsgGUID: F5IXtFZWRZmeRoFqFENCQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="84624981"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2024 02:42:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3BPG-000TOq-2c;
	Tue, 22 Oct 2024 09:42:26 +0000
Date: Tue, 22 Oct 2024 17:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-s390x 14/14] crash_dump.c:undefined
 reference to `vmcore_get_device_ram_ranges'
Message-ID: <202410221735.zkxnds1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x
head:   5b48126cb1d985f75946d2a7e2e1d1f008489770
commit: 9f9732a9a04b8623dfd458cc40f05a50538add7e [14/14] s390/crash_dump: consider device RAM ranges when building elfcore hdr
config: s390-randconfig-001-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221735.zkxnds1K-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221735.zkxnds1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221735.zkxnds1K-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_alloc':
>> crash_dump.c:(.text+0xf0c): undefined reference to `vmcore_get_device_ram_ranges'
>> s390-linux-ld: crash_dump.c:(.text+0x103e): undefined reference to `vmcore_free_device_ram_ranges'
   s390-linux-ld: crash_dump.c:(.text+0x1e6a): undefined reference to `vmcore_free_device_ram_ranges'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
