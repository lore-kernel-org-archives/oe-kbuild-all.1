Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CF623
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 01:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693703739; x=1725239739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4B8uTIIMSCbxSSPi9qXx3/mmZMOVvPL+JwbiCI0j29s=;
  b=P8dXxg2df2nBPxL7tIg50sZAhU19DEPd1dqojambzURRZz8eOLm7aoN0
   +C1muxE3cyJ/7IEzTg8UUGgQgTpr0We+1pkRsfXCi6a35RaxLsgivdf8q
   HkaCBkCuv+4MbkRVVloGErd7CqA+ajiJ0UYLQtDC8N2+Y0swc+I9q4jZ8
   rOouq4zL5xxWyPrteY/A6wCgwPefgoqO+HJyosEFOV4bFIQ2NDowysF7x
   Nqgb8zV5Vxo3MYvFB3118V9JVkGLuPoSuX2/kD+D22GuCM3uTpWFneJfe
   qOCOtGF6XD7MafavDspr8TyoV9BNzavfa5JBMQRSPJZmSrI45mfK8K1ai
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366640013"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="366640013"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 18:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="863958360"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="863958360"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Sep 2023 18:15:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcbiB-0002lz-21;
	Sun, 03 Sep 2023 01:15:35 +0000
Date: Sun, 3 Sep 2023 09:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1264/6555] spdxcheck:
 Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid
 License ID: GFDL-1.1-or-later
Message-ID: <202309030939.P7Br0ZL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: fafd43c288ef4de7f385fde1dd59e45aec303d45 [1264/6555] UPSTREAM: media: Documentation: v4l: document request API
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309030939.P7Br0ZL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030939.P7Br0ZL7-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
   include/dt-bindings/reset/amlogic,meson-axg-reset.h: 9:41 Invalid License ID: BSD
>> Documentation/media/uapi/mediactl/media-ioc-request-alloc.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-queue.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/media-request-ioc-reinit.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-api.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-close.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-ioctl.rst: 1:39 Invalid License ID: GFDL-1.1-or-later
>> Documentation/media/uapi/mediactl/request-func-poll.rst: 1:39 Invalid License ID: GFDL-1.1-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
