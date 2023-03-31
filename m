Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE02F37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680271063; x=1711807063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3b7TFpPlZctUMlCM15YHGK46z2DxK0B5pdRsgaBaD1I=;
  b=VbdcaYlDPFIiAcmui8t1QSxMnlE7XapwNgKzeMv3v/uwb/xrd3W9Xv4n
   G5jx4kr60NFVZOptE04qZjpxHw/cQSshJgawPiVb5RDIAlXAfRrqjt1HK
   0ZLNzOqJhHmLlFUSmvv/8ssp/Zt/XYUueAwIfvt18UUdyv7Pwa9gavN2O
   sh+ry5VLnG05XNeoW5V0C4o52ZUS2m+EjgLBbK9kDpXCIqmY2PjCQvZBl
   EoJry7W4E14LA6E0MTItK65xVbYY6hUGFyMPf2cJXa0XWuqmkOjiWxKsH
   u6hle9TQVSxUFXDS+OVGw3dTbB4I5MNfHn7se6PHyedVnMNA/kHjV+QT8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406467540"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="406467540"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 06:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="749655208"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="749655208"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Mar 2023 06:57:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piFG8-000Lqh-2o;
	Fri, 31 Mar 2023 13:57:40 +0000
Date: Fri, 31 Mar 2023 21:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/3] kunit: Add kunit_add_action() to defer a call
 until test exit
Message-ID: <202303312141.DHGQBfVZ-lkp@intel.com>
References: <20230331080411.981038-2-davidgow@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331080411.981038-2-davidgow@google.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
patch link:    https://lore.kernel.org/r/20230331080411.981038-2-davidgow%40google.com
patch subject: [RFC PATCH v2 1/3] kunit: Add kunit_add_action() to defer a call until test exit
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230331/202303312141.DHGQBfVZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3fe86a97881f9c663c66869d448b2dacf9363b53
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Gow/kunit-Add-kunit_add_action-to-defer-a-call-until-test-exit/20230331-160604
        git checkout 3fe86a97881f9c663c66869d448b2dacf9363b53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303312141.DHGQBfVZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kunit_add_action" [lib/kunit/kunit-test.ko] undefined!
>> ERROR: modpost: "kunit_remove_action" [lib/kunit/kunit-test.ko] undefined!
>> ERROR: modpost: "kunit_release_action_token" [lib/kunit/kunit-test.ko] undefined!
>> ERROR: modpost: "kunit_release_action" [lib/kunit/kunit-test.ko] undefined!
>> ERROR: modpost: "kunit_remove_action_token" [lib/kunit/kunit-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
