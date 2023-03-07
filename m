Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F2133D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678186878; x=1709722878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SrbpWXVM2r/u7fHh6RcP5d15rKfcDUgXruGXl0ik5U=;
  b=Wseq2hsp06mT10S1DUmCOYDzhQ2lTVVTm97UyOESKQ8EN5zecwDsz+GZ
   gHXr9A0mzqUJHoAQGHxWGuPCwqp8pMnR7xdJI0NT+EyJe1lYXB829Dodo
   69/oxVWizRgcMWq7cqZ3tn0LyfZXMW3vi7q2SoawdhOSqWwFX8Jvdifyr
   JSCVRCsEEQMzzJ/osbtbDhGZNcxUO2tY9aBrD2YxQGWMrSRNnO2joVqec
   +7J6UEYoAVXa6YbdJEy3FcUzCLoA34xqtAl/Uwd3IOq4vdYcxyCquoUXg
   CrkHSg8WxflyhEPslBQpI+gyoBEzXkF0vAWFX9Ar0Ghof5L0XwfWqNq0/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="319652513"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="319652513"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 03:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005822095"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="1005822095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 03:01:02 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZV41-0001F3-1B;
	Tue, 07 Mar 2023 11:01:01 +0000
Date: Tue, 7 Mar 2023 19:00:52 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.14.y 7741/9999] warning: (KCOV) selects GCC_PLUGINS
 which has unmet direct dependencies (HAVE_GCC_PLUGINS && ..)
Message-ID: <202303071853.XkNBakdf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiko,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   7878a41b6cc1ada4bb804eee96beb2c54322806c
commit: fa4261496d3265009449723859f50f68a27881c1 [7741/9999] init/Kconfig: make COMPILE_TEST depend on !S390
config: s390-randconfig-r044-20230306 (https://download.01.org/0day-ci/archive/20230307/202303071853.XkNBakdf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=fa4261496d3265009449723859f50f68a27881c1
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout fa4261496d3265009449723859f50f68a27881c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 distclean

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303071853.XkNBakdf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: (KCOV) selects GCC_PLUGINS which has unmet direct dependencies (HAVE_GCC_PLUGINS && !COMPILE_TEST)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
