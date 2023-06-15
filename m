Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C4375
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 07:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686812721; x=1718348721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfpb4SfqhaZT/gwogAeIkihFdO+B/oAWWh9hD17gkLs=;
  b=BS7SMJ+1AWtZMROEhlnkWNSwBYusRICUCQLR2kislUFdsyAiZUm+uCpk
   S5H+Juua/B6KNTNd6ya+t0QhM33jee/9YyyJhpfV56cCF4g/UdcuF+BEo
   tSnt/Bv2U9hEmqDbldKH7JMjEYbcg/aDYtjx+upOlG4aUk6Zvo5sxG1qu
   Y3Nvf7HngL/fGDJTWaoCfqOGv/g+Yp/rKvW/wojmMxIahXp5U8VZozycg
   TRqOxlPfnj4MBp2mvTNpH3qP/1ErGe9ULPTApH3Bjnd/3kWg8x9iAGFJ9
   +XpVBZ1yVAdHTwQZkcav5EpHyFsHNNod2GALhxL9+tbDMqQQpV3aP7Xy7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356323556"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="356323556"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="782400957"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="782400957"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 00:04:17 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9h1i-0001Zl-05;
	Thu, 15 Jun 2023 07:04:14 +0000
Date: Thu, 15 Jun 2023 15:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9947/27777] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-area (if the link has no caption the label must precede a
 section header)
Message-ID: <202306151533.cOfaLn2a-lkp@intel.com>
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
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: 7875a06b12b6e9978bb9cd25493b3f32d1891491 [9947/27777] UPSTREAM: media: add V4L2_CTRL_TYPE_AREA control type
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7875a06b12b6e9978bb9cd25493b3f32d1891491
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151533.cOfaLn2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-area (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
