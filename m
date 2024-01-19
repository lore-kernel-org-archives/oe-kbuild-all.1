Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7B5810D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705708101; cv=none; b=PMKCxdD+pGUtXJJunjBPKQT9tXO7TX15LYT6B5xD6ptsa1xjT5lBKslMhP5+jUJpJqtb/AI9TULYCYrJoAd20QU6fTn+XEMhbKfkRNeywdvvcnn0LIGqVjI3lkwM077cG3BXU9wcf5jPlgtlIwTz8eFUJVFBBqvnoGKHnbKmof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705708101; c=relaxed/simple;
	bh=isQ3TQE/bGMHHU3RGuiYg0H8wjJm4jPGMyFOKfqdyA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mghqLG6HJPr3R/SWJoATMruGTCApuZWgTqKEzn6sCniqF2R4Tg1n03aEVfHWKNTOu3nKkAp8q3nR3JaEfxfxSpRuV/vhAjS7qEY62/H9AyhS950kka6MvVC7ldFLil2mnhyxrAxuCCq37Y0DvKKi/Dtqth2zjL08BvKsnf0r7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ue/EbrEM; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue/EbrEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705708099; x=1737244099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=isQ3TQE/bGMHHU3RGuiYg0H8wjJm4jPGMyFOKfqdyA4=;
  b=Ue/EbrEMjvJ4WPuSRfta9PxH7CmImGlBoj3R1bJYMPNDSNIRhkjsxhRA
   q1zn8UOGMBHCZJWTSAdSh3IPpblStObcgKrHb7VukAnIUc+VAN+LIll0Y
   AZLceEZ1PGsD/dt3btzahhT0qfozxz0SAzDjRIXf90ha/xIHyVQ5dOhvh
   nk93BAsp/PYhzUW43aIIo1DskNDYcS9AFVc0K9I4wGur3/VSyYwBUFCpB
   oH/lwPgUFJyGf59KD1f7himr5ozxFVpxQedfuKNEmJurlOSX4HqQtx5p9
   0BiEolF9vrJdExntMRmQkjYIpHZkDyrH3O5Z6Xbgedq8NHO21mMsq6pug
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467243021"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="467243021"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 15:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1032078739"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="1032078739"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Jan 2024 15:48:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQyat-0004VU-1y;
	Fri, 19 Jan 2024 23:48:15 +0000
Date: Sat, 20 Jan 2024 07:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 13/13] drivers/cxl/core/cdat.c:632:10:
 error: call to undeclared function 'acpi_node_backed_by_real_pxm'; ISO C99
 and later do not support implicit function declarations
Message-ID: <202401200753.HgOzENaW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   b720bb8edd5a52abe7d5c888245352e3dbaefdb1
commit: 1be4f7102ff8722322c7935ae6c9a75527e3fd91 [13/13] cxl: Deal with numa nodes not enumarated by SRAT
config: x86_64-randconfig-121-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200753.HgOzENaW-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200753.HgOzENaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200753.HgOzENaW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/cdat.c:632:10: error: call to undeclared function 'acpi_node_backed_by_real_pxm'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     632 |         return !acpi_node_backed_by_real_pxm(nid);
         |                 ^
   1 error generated.


vim +/acpi_node_backed_by_real_pxm +632 drivers/cxl/core/cdat.c

   629	
   630	bool cxl_need_node_perf_attrs_update(int nid)
   631	{
 > 632		return !acpi_node_backed_by_real_pxm(nid);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
