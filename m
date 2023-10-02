Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F51E521
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696290060; x=1727826060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsV9GtVBdDCEmOZhGtOho6NKO6Blp+2mG0jTENzL2ZI=;
  b=WtK75p20bDAayMmVLYNa4nEyWF8gdshJ/Vl0Xo9y4S9Bc+J/JrDH5Xfi
   pKlfNw583Y9hReIlKqN4cBiqCT/j6m/CV99vplNXIamay/JpPDD+odSHs
   JFe8EQmp3B3cuquSfLpRUhkZm2jNOOMCfOS2R+OUD2SaKIsFQQl0IhEtM
   z4jyujzI9bctIO8gnEzDQHRtpXlx4acxtoaG5595d2FV0abTGNkxzGaUN
   QzxPHPNUQY94NdC6/WMZAOipwRta53IepEHxOItNATZISoBmlSW1cggHr
   OE3iUS60JNdG6R4qPAn4hzJUQUMzO7EsRrWe+VG5Fb1r2jxA3YAPzpsKp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="469036464"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="469036464"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 16:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="1669129"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2023 16:40:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnSX0-0006WL-2z;
	Mon, 02 Oct 2023 23:40:54 +0000
Date: Tue, 3 Oct 2023 07:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 324/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-x412 (if the link has no caption the label must precede a
 section header)
Message-ID: <202310030701.UDDAgW9b-lkp@intel.com>
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
commit: ef3a83b17afa47841de0c22696a1da2c8def1ac3 [324/1370] media: v4l2-ioctl: Add YUV444 12bit and 16bit pixel formats
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030701.UDDAgW9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030701.UDDAgW9b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x412 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x416 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x412m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-x416m (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
