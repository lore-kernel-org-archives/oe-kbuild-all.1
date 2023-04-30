Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D762119
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682853866; x=1714389866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kammavdvX7Mwwx+G/gUvXTD0nKfLUC0pS7GyD/dz2yM=;
  b=ZwORdATQ2y5lQcHvqfpVRRDWSAB4ejSoKdJIMMprk9J6llVYzDJmdZMK
   8Hm6jYlIZ33bQkTdzTDGxZ0QF6OKgnrIzPCPoxhX6zncfWlcBNrUwOn1f
   nP/9tXAGf4bNw+Yv00Mh6qBgjfCNevJa59eB1Z3AORrAOKj4rEBW3axx3
   Es/8fbYmaKJf3s9xMmMzM05S1bsgr4Qhkuv6zm3kApJcB/KV4e4El4hJv
   ai5+O2lvrjUpuroT7XUMRsvb5pFXTbGKNI5qxBZHay9vw9ZSfKfbiJdPI
   uuL20NC/PeBusGJ8aNl6qYVzYUbeMfBSM/1D2Jt86nL3NK7ultnpSR6r2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="350961431"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350961431"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 04:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="726035181"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="726035181"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Apr 2023 04:24:25 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt5AG-0001dh-1J;
	Sun, 30 Apr 2023 11:24:24 +0000
Date: Sun, 30 Apr 2023 19:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 17409/27008] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202304301957.6JA6tNc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d5ed2ca98e482beb70819315665172025f8a3bc6
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/27008] UPSTREAM: Documentation: Add details for pstore/blk
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout c0003a71672a751ec23d85451cbe43ff64609ab1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301957.6JA6tNc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
