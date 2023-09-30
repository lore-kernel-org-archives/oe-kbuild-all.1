Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57741388
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 03:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696044276; x=1727580276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W8HHYvT332j4l89t1ZkSX8h5kBDnzMGsRynZ+NRII9s=;
  b=FPmzkGl8DZaG73QLKRfPPtP6JEIDmfP0kFgT7OZv6DWdueyFbP2A3ULE
   82clUUCzRyJCPsiKk9yQ5Eq3GcQqlovujI7CjDSywcNWI1r0kV0PwZ0/H
   qireHXhIHqPAoIsZayTfkJhpv+UEK2PNzQnS4sCCCYl7M3oUTYm1nU+Wh
   d59ag6VALndh94gnC/f6DjfSRG3DoQg4/KT4BO7y1+6iaDLk+JYcEBwSc
   O07/AMg4Vd26dkqUinp48gHii8lt5Rx+NRdlh4p6EimJ50wzrAAhwoCVg
   lsKsTAKKrWux7xh6gABTOKZfMM+phf7NSeTLl9Q8/mePD1EJxoiFgMrIQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362676626"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="362676626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 20:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815778210"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="815778210"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 20:24:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmQag-0003e4-0z;
	Sat, 30 Sep 2023 03:24:26 +0000
Date: Sat, 30 Sep 2023 11:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Satish Kumar Nagireddy <satish.nagireddy.nagireddy@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 321/1370] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-pix-fmt-xbgr40 (if the link has no caption the label must precede a
 section header)
Message-ID: <202309301129.rHZssS56-lkp@intel.com>
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
commit: fb23910633505804236adb15bdcc2eecbca8d08a [321/1370] media: v4l2-ioctl: Add 12 and 16 bpc RGB pixel formats
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301129.rHZssS56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301129.rHZssS56-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-xbgr40 (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-pix-fmt-bgr48 (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
