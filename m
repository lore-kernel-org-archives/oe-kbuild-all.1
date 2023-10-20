Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDA4A41
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGGKdf0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697777630; x=1729313630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcD9AnNI6WM6yr24LMvt0S7DSk9iPbhwrpL34CFng6Y=;
  b=PGGKdf0QHER485VrOiipDAtR1ny4du2jYxJOQQ/hADsGi/bQ1ldfNS/f
   7UPXeNYde+Bp1AeDxqah4syREa1rM0heEKtqTLPEEa9yXL2aYcFO8rwC5
   3f10jYghdj8buVUlvvR18oNYbdhuy2QHxwYHEcgFCMJ2Z0AJqkgrc252N
   j5vwKDLDRBWzyn8QhZqopqiGsJx3sgvHKWfYdh4796m79xwXpmRAdVYBj
   0os1Q6oMgKhUQJPH5/auWIg+tKCZV3YEO3YdsB6WppHXAvp6wSlyLSWO0
   hqTno0V+3l47+BugambmkjsX9cZPbM7fH1ExbaCQunZPN+/lYzAiSJsE8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383642511"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="383642511"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 21:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5266726"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 21:53:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qthW6-000326-0s;
	Fri, 20 Oct 2023 04:53:46 +0000
Date: Fri, 20 Oct 2023 12:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl-media:muxed/2022.2/base 221/740] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202310201204.1b62tXGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 2393692b42120111977addd8b52d26136b0b96ac [221/740] firmware: xilinx: Mark zynqmp_pm_get_meta_header as static inline
config: arm64-randconfig-004-20231020 (https://download.01.org/0day-ci/archive/20231020/202310201204.1b62tXGH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201204.1b62tXGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201204.1b62tXGH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend':
>> core.c:(.text+0x3914): undefined reference to `dwc3_gadget_exit_hibernation'
   aarch64-linux-ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
   core.c:(.text+0x3b8c): undefined reference to `dwc3_gadget_exit_hibernation'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
