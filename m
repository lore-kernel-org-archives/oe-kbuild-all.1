Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0817C5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 04:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It09BZay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698986662; x=1730522662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmLdSgfIk+rEpYfjRxEGmXJCcXYu5Ox8KvqdotWJdl4=;
  b=It09BZay54HIzkxCFrZgL/a2wnIPUQYqMWv9fafttI3U7bb1AEEpAjzL
   QwUxgBATmBE4SDpvmvyNarJLLIKQygDdbQ6V6oVjpyRw14yvG35fXCG8U
   95cM9W2vWDXnj2ev1ZuByrVizyytEkzKpV5H9QCCLGDL1d6E/V5/vmBav
   52hTT9w4Xgw6ultpbTQX9qcIlAYbWHbMvgTww5shILUY+EL06ix/it4qq
   SQ8iFqXahZCQ3/T53MlypRVncdFNbDFjnkuQx6LI6o+FPmX+WSo48mBuh
   vVk+8y+qjxc3qjCdV6Esp7x4F0gSrBqSpLfuLA5VVHj1IiIdOB20XUnon
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392757988"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392757988"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 21:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9624452"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2023 21:44:14 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qym2W-0002EA-1V;
	Fri, 03 Nov 2023 04:44:12 +0000
Date: Fri, 3 Nov 2023 12:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [arm:csi-v6 2/7] htmldocs: Warning: drivers/media/i2c/imx219-rmk.c
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/dev-subdev.rst
Message-ID: <202311031233.4E7rVnsq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   f4e814fca2978be96b83f4335d999fc1252303bc
commit: 40d76f1f655d728fd3c3c8b260e51099d4b6b525 [2/7] media: i2c: imx219 camera driver
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311031233.4E7rVnsq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031233.4E7rVnsq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/dev-subdev.rst
>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/vidioc-g-selection.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
