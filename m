Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A83217
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675538457; x=1707074457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Afid3zaFp4mpWRXkdxce1eCKZmyROBHMlXwaq+EaIvI=;
  b=PJMKdE5afbhOqxM45K6RSTPfBUhfAp5v8Loss1y3xRqWoBrlb1r4+Tga
   DlXUQIGC6yKeXQLNx+MLBVJMl8wJF2JSr8OoBKPardnWODDx0cIDjL6hH
   v6CWUA8ACbkbHi5ZfV0YuqWz7FtuT1PelG3970/MRvugoMl6MmukBlnN2
   WsttcKkjaFZqHCkMbdK5hsQOpCvmaxHPWJnaNfcv0AZKRlVIUkcXJRSqw
   h1am8ZNDG/YrjSkFYUveDh5RDFVb7vPACQUH5zvwbCF5JsfAnveg2ltYK
   oz+uyZHSWFIuZYR8IR8jeokw+VXz+joMxkmZWxl4URdsroW31S4+CoBUf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="312636199"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312636199"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 11:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="754825743"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754825743"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 11:20:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOO5m-0001Uq-0f;
	Sat, 04 Feb 2023 19:20:54 +0000
Date: Sun, 5 Feb 2023 03:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 23/25] ERROR: modpost:
 "walk_hmem_resources" [drivers/dax/hmem/dax_hmem.ko] undefined!
Message-ID: <202302050349.g4NppVCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   14acf2db2613dad48f315647c022b15e7dd7b7bd
commit: 1404bbe617dc40d32c8f7b772bb17f9309a33a26 [23/25] dax/hmem: Move hmem device registration to dax_hmem.ko
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230205/202302050349.g4NppVCy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=1404bbe617dc40d32c8f7b772bb17f9309a33a26
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout 1404bbe617dc40d32c8f7b772bb17f9309a33a26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "walk_hmem_resources" [drivers/dax/hmem/dax_hmem.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
