Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164CC30F931
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771021732; cv=none; b=ds0cIhT23f1g4QLk1LGCpn5AgQyjw00DCbnDBnhhLc7Bp3svuU7lHyqDdSM0IAdyEFKA6svAQceCya2BJq1ANyM7JvVmb6rBSog/E03baFtNFJK4CBmremEl+FgzPD95NhP3nzfaJmDkdJZSakHECpwv1+Vc0BmGLBh5Q045+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771021732; c=relaxed/simple;
	bh=w8dNCrfW9PbAoGbJ6ta25tLFgqmtAJkQepcftjz1t6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kq8glXj99Pp7Q0N9uDw13WjYX91vL/jJodnexln681c2rpDUiWGDOVgIG1tcXm4capQVNe4LHlwJwBX3rN86cDbXt1vnUFM+2olNjY+YISdbt/aE2BLIOG5bw6qhutb55MwRAy698JqhLdn33EJv5G/NPlaydtTvJBXzjfkiXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9XyiLs5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9XyiLs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771021731; x=1802557731;
  h=date:from:to:cc:subject:message-id;
  bh=w8dNCrfW9PbAoGbJ6ta25tLFgqmtAJkQepcftjz1t6A=;
  b=f9XyiLs52LG65ccGIp/plEBBzrhbcsgKgfzyHHO1kjhyoCRQ6twhmT5j
   OOFEeVJQ2/PxYDwubD5MX/uCZCYeXuDKIHKrVph+Zp8lw36tqqBcidVPo
   IynYtyOHe6Igg4d0mz0GBCerl5FxjjWWfyu7rI9XXkAuabChnL8eCe5zA
   MWlBk9VzrWZjda19gP0du+fbHR5ushGeFGALaLJDx3v1DkZtgMiAIVVFW
   SUO5aJtm44Vy59CDeMFQ0HrVGpNIiyZB9E0CPx+sBk+igvhbJybQ5xUjP
   RFbEFwCq0mcg+Q1l1Z5JV/VpMAKOIHZUN+Y0418DFTea1vULMYRLXkBi+
   A==;
X-CSE-ConnectionGUID: HJcrSWFoSp2dje40u0deAg==
X-CSE-MsgGUID: SnUDN6YDTZ6amH0VijjbVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72115204"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72115204"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 14:28:50 -0800
X-CSE-ConnectionGUID: Wq5TNGevQGOoy1IFlg9sDg==
X-CSE-MsgGUID: LXPFFafpThmphsVq9+DzHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212136387"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Feb 2026 14:28:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr1eY-00000000vro-17WE;
	Fri, 13 Feb 2026 22:28:46 +0000
Date: Sat, 14 Feb 2026 06:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 355/590]
 drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: warning: data definition has
 no type or storage class
Message-ID: <202602140633.9305WyIR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lakshmi,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: fb5332df332457e6c7e2da3eba875beff2ab711d [355/590] drm: xlnx: Add HDCP2X TX support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602140633.9305WyIR-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140633.9305WyIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140633.9305WyIR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: warning: data definition has no type or storage class
      63 | EXPORT_SYMBOL_GPL(xlnx_hdcp_tmrcntr_set_handler);
         | ^~~~~~~~~~~~~~~~~
   drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Werror=implicit-int]
>> drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: warning: parameter names (without types) in function declaration
   drivers/staging/xilinx_hdcp/xlnx_timer.c:250:1: warning: data definition has no type or storage class
     250 | EXPORT_SYMBOL_GPL(xlnx_hdcp_tmrcntr_interrupt_handler);
         | ^~~~~~~~~~~~~~~~~
   drivers/staging/xilinx_hdcp/xlnx_timer.c:250:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Werror=implicit-int]
   drivers/staging/xilinx_hdcp/xlnx_timer.c:250:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +63 drivers/staging/xilinx_hdcp/xlnx_timer.c

a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  55  
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  56  void xlnx_hdcp_tmrcntr_set_handler(struct xlnx_hdcp_timer_config *xtimercntr,
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  57  				   xlnx_timer_cntr_handler funcptr,
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  58  				   void *callbackref)
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  59  {
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  60  	xtimercntr->handler = funcptr;
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  61  	xtimercntr->callbackref = callbackref;
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  62  }
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03 @63  EXPORT_SYMBOL_GPL(xlnx_hdcp_tmrcntr_set_handler);
a4b0dd5166b523 Lakshmi Prasanna Eachuri 2023-02-03  64  

:::::: The code at line 63 was first introduced by commit
:::::: a4b0dd5166b5234f636172176a3b233f6b3458a1 staging: xilinx_hdcp: Add HDCP common functionality for Xilinx devices

:::::: TO: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
