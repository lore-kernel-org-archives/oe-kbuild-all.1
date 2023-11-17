Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676B30F95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FagYyY81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700226507; x=1731762507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkaVHL3tFGeBn4BZ93EHL8cAlgVs4wOIQHp2pZFPBFw=;
  b=FagYyY81e8kBiPXcpxt6zGGHw9EsLZ1d250SwtsSbLEwX8X3QOA/+te8
   8jagWEWV0r3/ONhvkS8nqvYfcOYVU6GHXMJiDnhXaerZ5cJuudro6DTaI
   SmYQBFtdE0/mJfhbUUkMIV+uEB/ewPplN6u9D4MJMkpIzrGxs8+zF/V81
   Lf8Eqsxya+y2p8i2urh1govNYlWSa53K63jkMTqGrxyru3IUikRWLr3at
   rK/vHUbZRUVV2OOTsPqgGiYt5P9v0/P+9x3bkqdN+5HubnGD1jNixj7Mi
   vtz06l2MNx6op3ZbnkEi9RE5GW+PTbcmwrPreM2PcKZ5VtyLGwTJdQaz7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395222865"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="395222865"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1012929239"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="1012929239"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2023 05:08:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3ya4-0002od-39;
	Fri, 17 Nov 2023 13:08:20 +0000
Date: Fri, 17 Nov 2023 21:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 1819/1905] htmldocs:
 ./security/landlock/ruleset.h:287: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311172010.AfFjwTiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eff99d8edbed7918317331ebd1e365d8e955d65e
commit: f3672f581e951204d0ff4570a04daef1b81e182c [1819/1905] landlock: Add IOCTL access right
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311172010.AfFjwTiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172010.AfFjwTiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./security/landlock/ruleset.h:287: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

vim +287 ./security/landlock/ruleset.h

   285	
   286	/**
 > 287	 * Returns @access with the synthetic IOCTL group flags enabled if necessary.
   288	 *
   289	 * @handled: Handled FS access rights.
   290	 * @access:  FS access rights to expand.
   291	 *
   292	 * Returns:
   293	 * @access expanded by the necessary flags for the synthetic IOCTL access rights.
   294	 */
   295	static inline access_mask_t expand_all_ioctl(access_mask_t handled,
   296						     access_mask_t access)
   297	{
   298		return access |
   299		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_WRITE_FILE,
   300				    IOCTL_CMD_G1 | IOCTL_CMD_G2 | IOCTL_CMD_G4) |
   301		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_FILE,
   302				    IOCTL_CMD_G1 | IOCTL_CMD_G2 | IOCTL_CMD_G3) |
   303		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_DIR,
   304				    IOCTL_CMD_G1);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
