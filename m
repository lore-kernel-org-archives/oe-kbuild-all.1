Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E391CD25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Aug 2024 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684593; cv=none; b=VB5nJ3kxc1+xY/28eMQz8YsmPj4Tkso/3do/H4XQzIZ5oQkFWlvTaDcLE1rO4CPDS4GHa+wdf+dTMaB2PgknPW8UKl+5mlbqUFTfpfGhM7E5lXnRu+zh4oXucCgcxqluP7Fypw1Or4mmjigI8Ddc9J5/762Nq/lmyyGzkJgSFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684593; c=relaxed/simple;
	bh=mvQ5myhnbiXdEON7LE8YldO2Dt5f3Rm5sjuWrOd10SI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqJfWumjtRDJDNEnZ/852ns0g8fVQIkRB6AUR1bII8/CVhv8R9ZYVdYpwfWLSLKOX0QtxdLe8agUkJDLLHwUcBFsmJ6TT4vcNCMr7h0KmdEbPIBIxuNh5yWwccb8pT3ZdBI+jJzjsoKDuEh1jcQ86DqQDj2rfalD5j+B0HhbZrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/ej+/TN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/ej+/TN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724684591; x=1756220591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvQ5myhnbiXdEON7LE8YldO2Dt5f3Rm5sjuWrOd10SI=;
  b=T/ej+/TNsLFr+wAyb2D/kk8lmfLB7QDSXZzGC5xyM01gA2XDuK1DVqBi
   TFnNGaL1NpXxDe8+O8sZWHOFRo3dK3xYcgZqhkghc6GXtJdnRSWuv5++M
   8zHBUMMmBq4zJ3nFNUO+NVBpkWNvbgckzJlV20DHz2k/yYjrn+a61pd99
   6sZ+vCo3ACXNzgkGB09NDTa+cl/mqwkGc/HMQLba9bvt4+tmF94HyroOR
   g/zdyN0qVASYW/pq+c9Wbsq17q34IiMTtjk7GlFyS9jm8UWlSUt4J4O61
   hpAxTc6nNMgm/agItiHkPNdbMAgLh77SDpbipifnkrMu4P+xlKzoTIKu8
   w==;
X-CSE-ConnectionGUID: TjNp1rzwQlaQzo0lBqfU9g==
X-CSE-MsgGUID: oicP0bjWSvOct9uLOS+pSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22921532"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22921532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 08:03:11 -0700
X-CSE-ConnectionGUID: LNiOmGh5QyKuGhtbsdwalQ==
X-CSE-MsgGUID: 6W1wIP+tTO+wUr/PYpr5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62698164"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2024 08:03:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sibFL-000HD8-1j;
	Mon, 26 Aug 2024 15:03:07 +0000
Date: Mon, 26 Aug 2024 23:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/dsm-screen-on-off 4/4]
 drivers/acpi/x86/s2idle.c:57:20: sparse: sparse: symbol 'lps0_device' was
 not declared. Should it be static?
Message-ID: <202408262252.jqHjR3Yp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/dsm-screen-on-off
head:   eaf3d006b20716b8e56a8dfe764144ff624e428f
commit: eaf3d006b20716b8e56a8dfe764144ff624e428f [4/4] acpi/x86: s2idle: Add ability to configure wakeup by AC adapter changes
config: i386-randconfig-063-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262252.jqHjR3Yp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262252.jqHjR3Yp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262252.jqHjR3Yp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/x86/s2idle.c:57:20: sparse: sparse: symbol 'lps0_device' was not declared. Should it be static?
   drivers/acpi/x86/s2idle.c:527:13: sparse: sparse: restricted suspend_state_t degrades to integer
   drivers/acpi/x86/s2idle.c:527:33: sparse: sparse: restricted suspend_state_t degrades to integer

vim +/lps0_device +57 drivers/acpi/x86/s2idle.c

    56	
  > 57	struct acpi_device *lps0_device;
    58	static acpi_handle lps0_device_handle;
    59	static guid_t lps0_dsm_guid;
    60	static int lps0_dsm_func_mask;
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
