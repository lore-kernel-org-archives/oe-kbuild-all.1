Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA6A4426
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 21:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMR72ATT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698355664; x=1729891664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYVywW+mhrSoBbazyLBQ0fJ/e6HNurFco8voehj3E74=;
  b=FMR72ATTnEsNKv97q4yJzjsECpHASrWgBKVBYrORD4AkKl6vWQwkK/73
   7ffRfJEbG2X1sFR5czNI/gS/lOZpywXewPqTLBaXzY1GnmK27GXZc9wIn
   mZYhl5SJ8nCM/HcdpNqXH/a0N+D1YJtUutioWJS10yCpUVFvAGEi8LYLT
   MxSpIvnZh6InSnFUpijXf3clsWRDZKWHfNvBL2TK79rYq5xvpUSTIdUwh
   GXfEP05jvbeqCVy4W+BnFci1ZT/tmyewZNPhOcOU2jP2uGgOuWtLLGLrm
   3NNJyM7Vb+NdSa7mZN8G6HmhOFPR5If0fWGZzGtFKFVerVCpXghKfYqUj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="451888618"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="451888618"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 14:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="932857883"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="932857883"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2023 14:27:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw7tE-000A8F-1V;
	Thu, 26 Oct 2023 21:27:40 +0000
Date: Fri, 27 Oct 2023 05:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 375/29903] htmldocs:
 Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202310270514.VUWj9sd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: 2d4a45a8388023a4a1f35813cad0e2bab225047b [375/29903] FROMGIT: docs: driver-model: Add documentation for sync_state
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270514.VUWj9sd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270514.VUWj9sd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.

vim +215 Documentation/driver-api/driver-model/driver.rst

2d4a45a8388023 Documentation/driver-api/driver-model/driver.rst Saravana Kannan 2019-10-11  214  
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16 @215  	int 	(*remove)	(struct device *dev);
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16  216  

:::::: The code at line 215 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
