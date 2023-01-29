Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6717CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 08:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674981419; x=1706517419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5ovtxToXcgjb2ju9os0p6kzoxJ46U7N3yi5F7kZBtA=;
  b=nvv8QXSa5aMPueONTJobnn40MOPRTaBsFZVGs4gNqXpw0Fa/EWIvYckJ
   1NMcqgmYN531/0VnmdSxg7I6GtYQ2uQz4ltWKqMK72n5mvboC3SPy/j8n
   m6ccMOss7eLXwEryGG1hTQ0qtES/a331/+oZENvXwmUt4YqYdYkcKCRZT
   N1iezbQb0Ym+ZDnYlQL5K5A4o/L4KMUzJJSnrOx4MSkaUyCIHiJFJtHbD
   pLap4TMphmXng+0woFAiFFTYXzjEJTqRQah/QCm6+omSHcliaq9USyHB8
   Gy7b9VUb+7C3sJLDcxJH3fO6Ec5jRKFgmYZBz98HWCXUaeABbKizaA3SH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354690088"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="354690088"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 00:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837635969"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="837635969"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Jan 2023 00:36:56 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM3BH-0002ce-1R;
	Sun, 29 Jan 2023 08:36:55 +0000
Date: Sun, 29 Jan 2023 16:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 379/525]
 ./usr/include/drm/asahi_drm.h:284:39: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202301291620.qGlhpyxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   701c4f23dc9e2b60776fca4f17d9c149a8d31989
commit: de76c82a4aa0c44d537b4f77ac09e36c0524c37f [379/525] drm/asahi: Add initial compute UAPI
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291620.qGlhpyxf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout de76c82a4aa0c44d537b4f77ac09e36c0524c37f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/asahi_drm.h:284:39: error: C++ style comments are not allowed in ISO C90
     284 |         __u32 buffer_descriptor_size; // ?
         |                                       ^
   ./usr/include/drm/asahi_drm.h:284:39: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
