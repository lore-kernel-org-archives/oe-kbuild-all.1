Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CEF20B42
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683723750; x=1715259750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90kq/cIbU+pJu67FzgQIR0hL/LPFhqMpXuCALzU2fVE=;
  b=MprSjAKedFYw+rG2nrBJ0+nxv5wlI0LNu2xG9VYrQakNVTyqgfV2eftE
   AOMmcgyPu5ETB0CvYdGuGGFjrV16ZEt99lJ496AOSz5WVmblfC4GidFyB
   8LMLpCFtdpBeWjbRxcH/icv2Ut14995AeB5atl4MMlTmnQXVPP6gGn7z3
   bMH7hqjSRxTldEmVLcU0TNv4WiE8ujcC1uTF1ZdaIkJIWe3vuvHEsKLs5
   wV4sbNaWY6Mwg9ukKNN9cJmWALdBnpsDIVV5hOKUar+I9LxQ6/vN0nhe1
   p7iWDPHPidZkXEFUSqrWM4sXalxKdYj8MuJPouEKKl1zsMVPbS9ZuuV39
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329825870"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="329825870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945687573"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="945687573"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 06:01:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwjRj-0003Iu-08;
	Wed, 10 May 2023 13:01:31 +0000
Date: Wed, 10 May 2023 21:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [arm:csi-v6 2/7] htmldocs: Warning: drivers/media/i2c/imx219-rmk.c
 references a file that doesn't exist:
 Documentation/media/uapi/v4l/dev-subdev.rst
Message-ID: <202305102002.PAxDivwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git csi-v6
head:   bddf95ecbbc88a20d81a76a2b01a809c36020679
commit: b563a36455a1b3fa9af3ac8e0ccaed687731e485 [2/7] media: i2c: imx219 camera driver
reproduce:
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm csi-v6
        git checkout b563a36455a1b3fa9af3ac8e0ccaed687731e485
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102002.PAxDivwy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/dev-subdev.rst
>> Warning: drivers/media/i2c/imx219-rmk.c references a file that doesn't exist: Documentation/media/uapi/v4l/vidioc-g-selection.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
