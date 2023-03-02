Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B684C7B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677755054; x=1709291054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2kL8+KhINanVa4t3pcBMxEgNLGgbwW/HBPDz5WP+0Y=;
  b=V2J6TAeV1b5TXn/qKIth83GkV78nnfyfYmWyc84vImN9gBjFaMAvJaAQ
   dVbSAgQjuZZLM6h0EHdX1x6ZOEswYDryZbs9leD7/vqmVS7nKULKuLDcd
   WsEVUaP95RGMoF0PLd5oPFHU314YMb1oYrRGPvei3d/R1d0p1Y04MfM7w
   5FYSQGXtOZr5uKcZVYQdB/cJ3pP6z6GAkndpTxMv7dL7cbarOTDRMupZC
   /wKDcjKcnXg7f1xAZFl439Ro+ZrrL2NCD0lvPuT2tWOpRipjVPY1+ya5r
   j/rV8N+6IIrv2XSDMnpvqBU4CzYfAcR0PGUavJWQHi7of3k0b0GiAdIY5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332173187"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="332173187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 03:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674916873"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="674916873"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Mar 2023 03:04:12 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXgjL-0000QO-0h;
	Thu, 02 Mar 2023 11:04:11 +0000
Date: Thu, 2 Mar 2023 19:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/explicit-sync 282/579]
 ./usr/include/drm/asahi_drm.h:27:9: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202303021856.VFpCTw3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux gpu/explicit-sync
head:   d6b54e1f78dfc00fb1ff8744a27a007327175b99
commit: be0fb803f5eb559f45b0cfc95f473c7644c99c8c [282/579] drm/asahi: UAPI: Move around ioctls & add parameters
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021856.VFpCTw3m-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303021856.VFpCTw3m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/asahi_drm.h:27:9: error: C++ style comments are not allowed in ISO C90
      27 |         // UAPI related
         |         ^
   ./usr/include/drm/asahi_drm.h:27:9: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
