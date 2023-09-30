Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B6A5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696070009; x=1727606009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8kT7vAIQ02894rMai3kBLW+96DMbjoBs7oeNOxjXd8=;
  b=a1hxHeq3fZm2PhvBSHuGUVFl9jKdOAM5CRNDcN5Fw3b2VlcdnxFdO6Wf
   Wq357N8MN/WS/prf0iWFoWA0yRJCDcWQLC4d0PMvHQ44hF2jfkJ3dBWa3
   6Uil0q+ov8Lm72IL46VR2kTACTRwZ8EUb33OGii7e6PqDK6TtU5vMTD/0
   DvtPI2RzdKUZGButwE5VC84+UgpD+PA9qqWfqhMR1aZ3Y2NSmFMCIg7x4
   bcO/4DcT9eUQsFEpCL7Pv+K65eUfnmp9M498HI9w+VgkFoYvm5wbHE+Fm
   uKb6JF2JDvKMXG2OXsVOI5cLltvU7foPPRaYFwxZCcThigWxTrTL3NJ5x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="367498282"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="367498282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 03:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1081243"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2023 03:32:51 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmXHo-00042D-35;
	Sat, 30 Sep 2023 10:33:24 +0000
Date: Sat, 30 Sep 2023 18:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 322/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-xy10 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309301849.aZJfSf4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 4a53401bc0fadd5d8a27a7ce2af19559f7497ac0 [322/1370] media: v4l2-ioctl: Add YUV 12bit and 16bit pixel formats
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301849.aZJfSf4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301849.aZJfSf4X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xy10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xy12 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x012 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x212 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x016 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x216 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x012m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x212m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x016m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x216m (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
