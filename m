Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95210E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 01:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681002441; x=1712538441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmMNJgQr1+KVvzzW8tehkN83J9tBLtR7mUtXv0CW45Y=;
  b=Iw66IuC6eTO8UIx5xuObBpUArrY6D9wykZzwr6C868RHqLE5u7nYO+Nm
   fbZ63rKsyMJhHp6kyzK0hFWEkIm/okfGbqNSBwSsRedDvzv2QzWpqO5El
   xyzOtnlluZlswPxp3bodRBm6Za66Y9DuV6z+p0NAf/5pO1NWAXJnc8hv0
   EnuFr4vhH2WokyRvZg5y5PX4kqRkcKpled4vOv/84tIhOPfmJ+vWZlspz
   Vi8A9ZCDYFI/2jOcq4HbSKsKfBkvl6IWbHOBYVkgz390pp4eqJENRBP/W
   4W4i/rL2wglmxl2X39/a+RB4R/2rttUSoLWHHwiOwPhL/AvXNNabBvufc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="344959493"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="344959493"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 18:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="690396108"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="690396108"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2023 18:07:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plJWY-000UFp-1v;
	Sun, 09 Apr 2023 01:07:18 +0000
Date: Sun, 9 Apr 2023 09:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fix-asciici-bugs-6.3 17/17] htmldocs:
 Documentation/admin-guide/xfs.rst:243: WARNING: Malformed table.
Message-ID: <202304090921.yBVYbovG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fix-asciici-bugs-6.3
head:   f44b12bb658172f1bff9622ed23024a35913fe61
commit: f44b12bb658172f1bff9622ed23024a35913fe61 [17/17] xfs: deprecate the ascii-ci feature
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=f44b12bb658172f1bff9622ed23024a35913fe61
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs fix-asciici-bugs-6.3
        git checkout f44b12bb658172f1bff9622ed23024a35913fe61
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090921.yBVYbovG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/xfs.rst:243: WARNING: Malformed table.

vim +243 Documentation/admin-guide/xfs.rst

   238	
   239	===========================     ================
   240	  Name				Removal Schedule
   241	===========================     ================
   242	Mounting with V4 filesystem     September 2030
 > 243	Mounting ascii-ci filesystem    September 2030
   244	ikeep/noikeep			September 2025
   245	attr2/noattr2			September 2025
   246	===========================     ================
   247	
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
