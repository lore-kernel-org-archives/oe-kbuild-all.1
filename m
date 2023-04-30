Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF314364
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 00:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682815877; x=1714351877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CT/ngCwskVGXooxOifv7vWjektrzmn9DJ0mjElZzY8=;
  b=J/3xk8fqIlDxnVM1yzJQEeQt/GlUcXRruljzkiYedu5BmZcECDbM4t6v
   4P0f7Hk0GM6u3XYrR3DqGC0QUFur9lk2/vjKyIgq1tLmkMeF/Y4ogULTR
   nTwVO0qrsARe+IWXl7tCZtYOXS3IM5w3+WAFBgNZDkFqAcIBhfWWM0+B1
   O0lVMJvtIRzv8ZU5qAOvoZF8/HDCplmHkn85cdD/bVivINylLpcxq+9M1
   WxJbFMQwVf58XKwHXEm2aBo07Z4b4YxG+Ox9w7t+5RKfInLMePOyWfPzd
   1t9A4bw6JRgbjRaiSPP9Gh/MUWcjiwvjLZNqbW/JH6UCwmoZmWm6zYr+h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="350022612"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="350022612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 17:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="689407068"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="689407068"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Apr 2023 17:51:16 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psvHX-0001Qp-2b;
	Sun, 30 Apr 2023 00:51:15 +0000
Date: Sun, 30 Apr 2023 08:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/27008] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202304300832.mbqTh485-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ricardo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d5ed2ca98e482beb70819315665172025f8a3bc6
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/27008] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7875a06b12b6e9978bb9cd25493b3f32d1891491
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300832.mbqTh485-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
