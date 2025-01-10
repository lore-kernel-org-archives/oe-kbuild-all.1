Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2982320E714
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527478; cv=none; b=DXhxVTRgxGXsifCdB1pbzHnxRuzwVWwbqiPY3ZZJZ+Ry8LJNbsQ64eijslQKliQIe4oYi2FldGqem3t0dc7lTfAlxNZ+/c7JS0R+jYV04DBpOnqKzINd1UN9l2wfERwwEG0zFCOlZBknshtA6ZbFVMuCiWBvuiRCSi5kB9IXVMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527478; c=relaxed/simple;
	bh=Vr80ozaSDxKrE1km3pp/GdmNVNqzQREaYCx8QF05Gk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=seHxxZNWYHaPECatl1rdtr+vcny6QvNjo7o9ffwppnV7MOrU1StGR1ns8Dw6W5M3CWXnDR4tdSIeMw7DGrtiE7XLx4SfNg18fLuN+9t124kVcpQfKgSXskYN/hKCkli2xYvkZIE2qTUt9y6WubcYct5g6ZBKyIyXSMK8nNx+als=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4kNE1pf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4kNE1pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736527476; x=1768063476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vr80ozaSDxKrE1km3pp/GdmNVNqzQREaYCx8QF05Gk4=;
  b=h4kNE1pf5vNGsraxuKBmPem8Eo3Y9S0WXEXw5cWEzZ5EMqyHA25HqRie
   GL3uXRB4ffvBiD5QLMLh+fYeJZysdZ2sJwGTjS2DPerKF38UjigXJzNiC
   y/laGnH/hTpbjHMLAQmZW7UQLbMKwHQCvDT2PpFEWP9dPJwkA12V12zbU
   aX2tHjFvnonvZOLxy4PeLteWLfmPpXQLhOvKlmyf7nwi7IXS0inWicHzv
   l0nYPVfVb3ndLwgrtM3jLxuduiSnWhzdyTVYSMZS+uRKJ73YqjxTYxAca
   ZUCQ9MXLXLyBLLSaaxBuaj++x9x3G3XXbyD1QgumcdeumPQ09sGI8HY/A
   A==;
X-CSE-ConnectionGUID: sEMGnqWXQZSU91pq9zpcPw==
X-CSE-MsgGUID: zyWFcY9aTTuP49mewO6Ohw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36728117"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36728117"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 08:44:35 -0800
X-CSE-ConnectionGUID: hyGFa3ojThmqjJoI2dCG3A==
X-CSE-MsgGUID: FYE2QuYHRGq0h1lpDu/O4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107823248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2025 08:44:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWI7c-000JUr-20;
	Fri, 10 Jan 2025 16:44:32 +0000
Date: Sat, 11 Jan 2025 00:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/mailbox/phytium_mailbox.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202501110053.tHD92bDr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: 1ae9436b02e93f1f2b9cfc10226812197fbfcd04 [1359/1359] mailbox: add phytium mailbox driver
config: x86_64-buildonly-randconfig-003-20241231 (https://download.01.org/0day-ci/archive/20250111/202501110053.tHD92bDr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110053.tHD92bDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110053.tHD92bDr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/phytium_mailbox.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
