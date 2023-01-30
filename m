Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FD29AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675112243; x=1706648243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fIJAgGPFXFoNGpkrfCLPggr3QFo8ddUubT3nKR527M=;
  b=VqRlxZ+kN1ZKFn/g+QuvyOK/+orRWLbo7vEFLaWSPxdsdZ+bi1d9CuG1
   sa3EYSUvjlZTaqFIuB6HJVNvj3IlMG4zhW19xQW2D1uLXZz7kiPPtJMqC
   lZJ5cy/fnJkjuRkUmGxAqHcxZfDdjJDCdGP+HLqwYaBRxtX6lh1i5vzIC
   pb969aOvzjW8Hfd6D2qng0qeDYTvN7ZiqC2JD60EiU/mcEVr5x0psMx/W
   RhsmpmBQ1AKHCGR/LgT4qc2dPyKdo8qz9LgXL+Nj4hKl3SQ2sV4TKaBxR
   R251NkJ/xi9wzhJkk+6rmi5AJRyVMWMk/ecvBg8NC6n40do0RqTd54pTw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327690356"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="327690356"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 12:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664232208"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664232208"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 12:55:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbBP-0003tv-1y;
	Mon, 30 Jan 2023 20:55:19 +0000
Date: Tue, 31 Jan 2023 04:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-stable-rc:linux-4.14.y 4085/4087] WARNING:
 vmlinux.o(.text+0x21b0b): Section mismatch in reference from the function
 xen_setup_shared_info() to the function .init.text:xen_init_time_ops()
Message-ID: <202301310435.GFtyU9Cr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.14.y
head:   b582e728558ff1ca3143916fa0fc99ed3bbad88b
commit: 9e3a6d929e9e24d7c026e6fc7a329e1accbd9185 [4085/4087] xen: Fix up build warning with xen_init_time_ops() reference
config: i386-randconfig-a002-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310435.GFtyU9Cr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=9e3a6d929e9e24d7c026e6fc7a329e1accbd9185
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-4.14.y
        git checkout 9e3a6d929e9e24d7c026e6fc7a329e1accbd9185
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> WARNING: vmlinux.o(.text+0x21b0b): Section mismatch in reference from the function xen_setup_shared_info() to the function .init.text:xen_init_time_ops()
   The function xen_setup_shared_info() references
   the function __init xen_init_time_ops().
   This is often because xen_setup_shared_info lacks a __init
   annotation or the annotation of xen_init_time_ops is wrong.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
