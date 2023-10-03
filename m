Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE5CA7D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316210; x=1727852210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HN4xSqNS0cx+dE5Q1u8rBM3waf4jA83+rCeWiG8Javs=;
  b=lrLB0nyI0g7hJYd4BxPSlN+EqCKkhABqEc0/NK2CALN3C1FNVC7LgZxO
   6rX89a/K20p+fcdlX62OKoV9Pct2cPWghTL92FgRLBs/0PaTXaRwoIUzJ
   BtAoxZhfI7zPaT+oE84LtDI6TS7EMMUgJ2A9+BhZmpCXyYyo0oISk7taU
   B4Pi3/VHs5/LlJZQXoA+Q4oBPM0e9WdWd77GM+kNR9zsChTf+uMW/7zCN
   OKGIz+ogpzjtVBlbck7d9ZQpqmDOeeGJ31tr2QNVQCnkxmwmf4kX39gxo
   /Ebz3ZThvZIvot+/sdcqp6JXd8+SuspuFZGvhDmsSZIf1RehVgXRelZRq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858742"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858742"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 23:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841231870"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="841231870"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2023 23:56:47 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnZKm-0006rB-1i;
	Tue, 03 Oct 2023 06:56:44 +0000
Date: Tue, 3 Oct 2023 14:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dylan Yip <dylan.yip@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 327/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-ctrl-type-hdr (if the link has no caption the label must precede a
 section header)
Message-ID: <202310031449.v2qCCrkV-lkp@intel.com>
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
commit: 069efbe2c5d8a75c562c2704167eb09ffe785d32 [327/1370] media: videodev2.h: Add control type for HDR
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310031449.v2qCCrkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031449.v2qCCrkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ctrl-type-hdr (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
