Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54E1FD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677928132; x=1709464132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpkKqLJoNfA5B27IlATfkYqM8EgOsjT9zPAy9mQzAE0=;
  b=cRBoh1iqpddUvBQ+O5uO5znAjFBY4vF4Tesm4+ox4zDPCgSQMHEBzlBr
   4Rbpo1OYIKlVaTf2Lkdsg3AdV0JEZghQV1CHGEGuCUKZMmF+66kZTekcu
   7qN5A1OMwUopxy5UtmVm1qhu8XI+ASFlGTPG1i64uABpE29nxf+fbCGbs
   HIfmP0RmlS8fayCFmMNwzpfdpRnfhygEx4z72cpBCDx44NLdU7iq8Jdvb
   G0xLfy3yhMcbdc2vVGvOXQywVfsqbaXlDAw3Btqlwpm3v1IVT+NsRv4HJ
   1deJeRXtMg4JmQMfSCARwOHgESF6L8X4Okww818tzV6R+Zr6otI/vAfP8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336768780"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="336768780"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 03:08:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799498180"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="799498180"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Mar 2023 03:08:51 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYPkw-00026W-1R;
	Sat, 04 Mar 2023 11:08:50 +0000
Date: Sat, 4 Mar 2023 19:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:c630-next-20230303 28/32]
 drivers/firmware/qcom_qseecom.c:18:10: fatal error: linux/qcom_scm.h: No
 such file or directory
Message-ID: <202303041849.TTJ0f25j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux c630-next-20230303
head:   d9306ea90cf14a6435578168f594e67096c623ff
commit: 34ed78949f2ce7a962ee1073caf2fa5b39852cda [28/32] firmware: Add support for Qualcomm Secure Execution Environment SCM interface
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230304/202303041849.TTJ0f25j-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/steev/linux/commit/34ed78949f2ce7a962ee1073caf2fa5b39852cda
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev c630-next-20230303
        git checkout 34ed78949f2ce7a962ee1073caf2fa5b39852cda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/firmware/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041849.TTJ0f25j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/qcom_qseecom.c:18:10: fatal error: linux/qcom_scm.h: No such file or directory
      18 | #include <linux/qcom_scm.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/firmware/qcom_qseecom.c

  > 18	#include <linux/qcom_scm.h>
    19	#include <linux/string.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
