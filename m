Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BBC5380E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 20:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsbIRl4F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703537826; x=1735073826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hXFBrmZbupmshoa1yQIfLxtOCLJYQ8TUG7YJUlkHgeQ=;
  b=BsbIRl4F8to6iYISd875z4DG8aWSoN+/eiwU3TJYqkwKnw0iVtmi8Sjz
   1BQeEVkYIxemvc5vPw+PEbdPoXGW6sVvCSL+4rELcU4juIWsK+ANZjr48
   ov0bE6am2CO9jtfEKOOtQQXRBkAajhLhODp/8OimED+fR5RlE3QdpWzni
   QeQ+w0bQ4hYfm5S45waS4TpP0jaYo8CuWZHlvZQNG3Sih+BRVBBJ/1EKy
   Nkl0FO+mrpkJAR9MhhNF2h9n8fCHbaH1oGk+RKG/avG7ucgGNuwlPaF5v
   Z1biFoS5SksrS+/+JKmaxxV0NmAFqkuGaDjdgJ+f1DW1sTQCyupmIMX7x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="427468574"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="427468574"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 12:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="812094847"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="812094847"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Dec 2023 12:57:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHs0O-000Dg5-0u;
	Mon, 25 Dec 2023 20:56:58 +0000
Date: Tue, 26 Dec 2023 04:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:master 1075/1123] core.c:undefined reference to
 `ulpi_write'
Message-ID: <202312260447.PoEgBgQs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   c8b3583bc86352009c6ac61e2ced0e12118f8ebb
commit: 9e004927e608d30e05d67689ad398e05be969dc6 [1075/1123] usb: dwc3: core: Add support for disabling vbus when suspended
config: arc-randconfig-001-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260447.PoEgBgQs-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260447.PoEgBgQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260447.PoEgBgQs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_suspend':
>> core.c:(.text+0x1b72): undefined reference to `ulpi_write'
>> arc-elf-ld: core.c:(.text+0x1b72): undefined reference to `ulpi_write'
   arc-elf-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
   core.c:(.text+0x26de): undefined reference to `ulpi_write'
   arc-elf-ld: core.c:(.text+0x26de): undefined reference to `ulpi_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
