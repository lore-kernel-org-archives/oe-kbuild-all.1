Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F30833E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 21:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676582572; x=1708118572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/nw3uPigcxhLBOyEMnS8WEBM3lYbecYZHAben2gokw=;
  b=N9QblO/wAhtjGg7zQx3zrLH+/C01fGTY11y+XtoKi45UdHX3e1AbfQfc
   FTTLpwWre/IdyE/zbSkjviJJC5+QPyFUAT3+ckxKRGH+Rpc+3lXAtNbUG
   oJbkZL6XbnvUMj4X5RBKfodYbBmVzy6HczBRio16N3VDEk1vb4OvyJHTX
   gtRNUAGEEe327Ng+h1/jJvJd0OKb512fdNnp+PYTVTOxnJ5HHuv1PjrF6
   erOkimjQsSgs21GNXB71yMHRusbug7bFIt85F9/J2AqvQS+r6b6jTGKGT
   PJMz5tM1lVOg02+SOazVNhCvxsMyWfJh1fgni5sXEzqM8tm8mSG2y3JDp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="312206658"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="312206658"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 13:22:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734063456"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="734063456"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 13:22:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSliH-000AqV-2f;
	Thu, 16 Feb 2023 21:22:45 +0000
Date: Fri, 17 Feb 2023 05:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 282/568]
 ./usr/include/drm/asahi_drm.h:27:9: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202302170538.fVWYOfSw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   10a3aa7dd553f5978864da29eafeebcfcb165cb5
commit: be0fb803f5eb559f45b0cfc95f473c7644c99c8c [282/568] drm/asahi: UAPI: Move around ioctls & add parameters
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230217/202302170538.fVWYOfSw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/AsahiLinux/linux/commit/be0fb803f5eb559f45b0cfc95f473c7644c99c8c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/explicit-sync
        git checkout be0fb803f5eb559f45b0cfc95f473c7644c99c8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170538.fVWYOfSw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/asahi_drm.h:27:9: error: C++ style comments are not allowed in ISO C90
      27 |         // UAPI related
         |         ^
   ./usr/include/drm/asahi_drm.h:27:9: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
