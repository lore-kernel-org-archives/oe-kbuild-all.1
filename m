Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143D3200AA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696284668; x=1727820668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jYohtFU8RES6+8ZDrhD4Nt//+Ysjkntuw6lqQGH9AXo=;
  b=WuCfTg87TFDNwIliyKs/Um4I9VFLG1AKbW0dvu+M0ElUJ5CRM5F98xCG
   SREybHpUsA/l8nuGGoKN+k62OFFOwBOOKrBjl/8Z8GBgjPR90Xetk4JLw
   qCE/DkowXaGRea3PuLdg9BVuYSTltX2FTK9uZOZd3vMSufwJqjS8LDSE8
   wMnGgv7rMp4VQIlUfi0ac9/JwEN/qTI3WIMtxLGeQ2VLMIOoX3MRHJ13A
   OhPRv6WJiS4lZaT6V4JS3Jy6D67+/UBrP0f1cHY7aooSPJWpr9GJ60A3V
   a2RllDipJfh0CONbIS3eGDajAsBqMnTqP7QJQLKZPqcKZtM2mQLfX7O6q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="446911140"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="446911140"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 15:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="785899065"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="785899065"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 02 Oct 2023 15:10:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnR7o-0006Pt-38;
	Mon, 02 Oct 2023 22:10:48 +0000
Date: Tue, 3 Oct 2023 06:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 609/1370] spdxcheck:
 Documentation/devicetree/bindings/phy/xlnx,v-hmdi-phy1.yaml: 1:58 Invalid
 token: %YAML 1.2
Message-ID: <202310030624.P3Upx2KM-lkp@intel.com>
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
commit: 814435980dbfe9ca5d9d7a2949f893ae2af26da1 [609/1370] dt: bindings: phy: Documentation for Xilinx HDMI PHY controller
reproduce: (https://download.01.org/0day-ci/archive/20231003/202310030624.P3Upx2KM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030624.P3Upx2KM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   drivers/cpufreq/amd-pstate-ut.c: 1:28 Invalid License ID: GPL-1.0-or-later
>> Documentation/devicetree/bindings/phy/xlnx,v-hmdi-phy1.yaml: 1:58 Invalid token: %YAML 1.2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
