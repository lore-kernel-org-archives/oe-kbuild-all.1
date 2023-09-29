Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07238F62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696020687; x=1727556687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1Ct4rs5knPfD4LHPtaa58RjcEhTuopD4ohlNlps+94=;
  b=AvLhRPsnm+ubb0Y4duAeg4ZvHhA+R/yDpDx6JxoJverj+dyqbHxDm1Qn
   PGFD9DdDrGbNSdR46giQy4yEpuYBV84tuk4WG93QooBMsLqcz8ElMjTtk
   XHDleTcYKmBu+Ad3irG1didwCD86d7D2Bh8ExUhBcPATBopGyM3jM6S0k
   gX4cbpyyZtk7wvGMNsyFNg8AVxUb6d1sHuDKCOH8M6V/ZrxRF07itqWM3
   wbggdxOZUzXKkrW0+hR+/901sc3bf9WHcHU3EWlAPtz4fGuRLiklYB5gO
   7GW4lEg+w11yE8f4CcknFk30/fBKoA4b7+gmWwxYN7Kah3OefjDnpdwXr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="386241294"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="386241294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 13:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779374251"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="779374251"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Sep 2023 13:28:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmK6M-0003FN-2H;
	Fri, 29 Sep 2023 20:28:42 +0000
Date: Sat, 30 Sep 2023 04:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rohit Visavalia <rohit.visavalia@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
	Vishal Sagar <vishal.sagar@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 307/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a
 section header)
Message-ID: <202309300457.ZoVGeCJY-lkp@intel.com>
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
commit: 19837eedfc69d8bbd822ad14d6aa6f6b154b0198 [307/1370] media: v4l: Support 3 planar YUV444P 8bpc pixel format in contiguous memory
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309300457.ZoVGeCJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300457.ZoVGeCJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-yuv444p (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
