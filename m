Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8595C3C6AA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696363119; x=1727899119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRC/5rq8/zj+sKstARXJNaD/aKan099FJ5iKvqARQjc=;
  b=V9WLfRGN4+xVCrgkLwUbKVXDNDlrOAoDKZ3M7OAPhGut3OqoDeBScPZx
   tMARagpR2/V7pkTukI6RGoe3fYuUJtRPAYPlC84jxwksw8HRF00E37LEL
   FPOKxpTgIp7YptwaHMr3tlp4OuiF4dA5iQTpY3VahhoJKLR9zcEt9/psH
   mJrSZl2JwQZcLsh9OEfpOM9z75ylNE4Fvm4sEHcnIBmDXys9cbz91p5CT
   Px9zSCiyfOgjXtQV+WGHB9tJnoFfe916YO5aGVAIaj3TF9uO2WiwIaPwY
   2FG4/sNZM8wvviy22I7Wb8u2NYB0glH+MpFx0tSSCLp18iA5LVyURSUf6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413881731"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="413881731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 12:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082142223"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1082142223"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Oct 2023 12:58:37 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnlXO-0008on-0U;
	Tue, 03 Oct 2023 19:58:34 +0000
Date: Wed, 4 Oct 2023 03:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 762/1370] htmldocs: Warning:
 Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt
Message-ID: <202310040315.ammtzHVV-lkp@intel.com>
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
commit: 7da30758791321c76827c0291adf3689e608dd2c [762/1370] dt-bindings: net: axienet: Add binding for 2.5G, 10G and usxgmii mac variants
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310040315.ammtzHVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040315.ammtzHVV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/net/xilinx_axienet.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/xilinx_tsn.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
