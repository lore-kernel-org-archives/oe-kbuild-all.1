Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0A4F15D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695924784; x=1727460784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1tWAxgFFiMGcAesTfnzGfoWFY+0bGYF/ryx7d9One0Y=;
  b=N48RF9G29Mk8oKRs5MkNxHGN++t8dCzPVZCv158ovdeulu0Ai3CYpLkF
   0Ujo4q0QjHhTQEhftC5gOmeZl/0YeWEtnoprfwq0ULK4xifWYlm77Hb2a
   VuozXfycKgbhw8DDcGVOm9utADJCZtSvUQ3Xew85mwN9PoS18aoE3BTsc
   Brd7hC71C1a2U3I7pMesUXaRcpvWdG/2Clh12cGUEcQGCd5gZ/2RyFJzS
   kuUx+2xaTZUUgtm+YR2P4x9EJIdmzqywBQ6sD3Nh9vup+Iorsp1KGrbUg
   OnEUocT6lxHBVbOUzwGKpBkkcr/sUqz5SHhK8mDFiklwcFiFsJNyV21e+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="384950871"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="384950871"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 11:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784801674"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="784801674"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2023 11:12:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlvUo-0001n5-14;
	Thu, 28 Sep 2023 18:12:18 +0000
Date: Fri, 29 Sep 2023 02:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Mouroux <jmouroux@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Satish Kumar Nagireddy <satishna@xilinx.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 278/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-xbgr30 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309290251.y5eh9ClL-lkp@intel.com>
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
commit: a7ba2f9bd3a85fe70c52c0bb4b0e791a540012e7 [278/1370] uapi: media: New fourcc codes needed by Xilinx Video IP
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309290251.y5eh9ClL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290251.y5eh9ClL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xbgr30 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xvuy32 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-avuy32 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-vuy24 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xvuy10 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv20 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv15 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv20m (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xv15m (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
