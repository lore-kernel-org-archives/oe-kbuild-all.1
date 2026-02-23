Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F143EBF3C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828711; cv=none; b=Y4x2jdLzl8fQXoYD/xvRbMH4UkYwhnHgJLxlj48OWKpp7JkpFwSn8hRHH8ja/A3iDtt9w9KJYkbOPvMAVt5bZysiEi8MlHzPj3hHzrxj+xisKaKm9i+ZBi8vKReairXPzjKPht4MA9Cuv7xgU3I4Rjs9Vse3sBCP7K3sEDiIaJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828711; c=relaxed/simple;
	bh=+HPyHpNqMZddLtxzi2l9CXnFZ6d8OEacWrITX4jcpq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lW0KCbZhPJsNanGNLEGG3N/RGkTC90sfFpZsRwH9daRH262TwmsJRTiLfVcPHwBnAVAJ1UBQIJ9Dqt8j6m9pPgMcOfw73awgGc2JwO0tv2+reCqgzyvcULy4mnR/QAAkSATCu16fuj4R95eZs/7yN1mC/P+5I7TiwmNVdCoPUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGwMCb3I; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGwMCb3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771828708; x=1803364708;
  h=date:from:to:cc:subject:message-id;
  bh=+HPyHpNqMZddLtxzi2l9CXnFZ6d8OEacWrITX4jcpq0=;
  b=KGwMCb3Igh6xI0kYMjIVaXR0WL6h7c0nF2kMAH3u+/gOjzJpzcckWspb
   3GgLwnee+MKTEnQG2sjth5O6IUxaMoM7Gj4S+QzNE2RLesmXZJ6ZnhxUW
   z9OzsUFKlQBhcanrXrDI61BzmO7aaF1jdkM7VVNsLi1s+VJBsvYLLnT78
   BvKBws8QkZkGk8wUJbpBaf+72JMoRZ/wra0YxyJUFEp3VQDRMa6tEnz+s
   c2qZ+T7z8i3RdzC7ePaaZjDqAoKO6IPNKVhbJd9QioiHXqgTqHyz9PxNM
   C3pPCTzmzyFAwdqQwwOVqiRoCpi7cK3piKQy+TwE9N9TgvUeQoQOKns6u
   Q==;
X-CSE-ConnectionGUID: 1f35AcmkTSma0AJuLzCRMw==
X-CSE-MsgGUID: 8PLr6qR5SKOTIJqWzQvrCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83134560"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="83134560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 22:38:28 -0800
X-CSE-ConnectionGUID: rHVXDiYTSC+YzcM39BlHfA==
X-CSE-MsgGUID: kR+UUtaZQ1upSxJSe6i3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="213444477"
Received: from lkp-server01.sh.intel.com (HELO f9d61316528f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2026 22:38:26 -0800
Received: from kbuild by f9d61316528f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuPaK-000000000GT-1Fzt;
	Mon, 23 Feb 2026 06:38:24 +0000
Date: Mon, 23 Feb 2026 14:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 355/590]
 drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: error: type defaults to 'int'
 in declaration of 'EXPORT_SYMBOL_GPL'
Message-ID: <202602231452.5C1DanN0-lkp@intel.com>
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
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260223/202602231452.5C1DanN0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602231452.5C1DanN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602231452.5C1DanN0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: warning: data definition has no type or storage class
      63 | EXPORT_SYMBOL_GPL(xlnx_hdcp_tmrcntr_set_handler);
         | ^~~~~~~~~~~~~~~~~
>> drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Werror=implicit-int]
   drivers/staging/xilinx_hdcp/xlnx_timer.c:63:1: warning: parameter names (without types) in function declaration
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
