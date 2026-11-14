Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626244;
	b=i03ToQ2PH4lsoy9h71NByJIMIfoEFOH2ReEtSaSgsPjdYzeZXPZ4wmC5Nt2f0wvMYML8
	 FmGmv98ZpiFgwRKgsN1O7WOFy+xurXZgwGXjdjQ3IbKvUtUYqXwQU4+GT2sCNvGQBndqn
	 FFJAvxnoL7xse5tlmBtx2LOAIz9CPDsgwzwPhYBZISPgp0XppNhmp7Up6VUqOHQgdE0wh
	 2a7WlElNhycTPpESFDOb8sx1wdfKUqXx9pGd4d0oa96cqd3S7z3Lxw5Ml6GpAQ2ZPJozU
	 O6u7L/wXX/Ej6PewivBCyWlF8N7MwhDOfCEuUzO8uRW+5RdpCRNeVHQZWFnQD3uspcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626244;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=qdtLfsKSFo60u7nr/eoshyNQv8ZfLaE+VoCXUTew9z4=;
	b=wFdV7ZYCmrWDeIsDhI9fX/G8dJNaszqO+KcvuUriRqGW3rZ2C/VQz+VbxxqoqtYj7hTW
	 a+wiV0iuYpS8TMwAVRMJ/6dWXcZtClrK4ZvDglh1NKWQObwtCef9ms4TVzrJsD8caN4UY
	 yGlRDnobYDDCQx0TN61eo5KC5zaH8h2sPVjfQNHPNXJk4dIq2FTK0Ny4BQ9pMS790OBp7
	 hTAZrnr1vn/hECDMZwH6TUU678e5W/MpFBiEOav1O7GgRcFt7Ytr/v8bX3kta00eFxQJT
	 QTbtM6FiQT+PuMDj9p64sdqsMTZGNSK6NZMIDvmBgHRgF5navCudq5fFJbkZMvIvOJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QUZ5Yozg;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12FF606A32E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 03:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12FF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QUZ5Yozg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794626244; x=1826162244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiA4SWwxIP0vIp6LV5uu1tStDkv6j9eneVNzXugzlHY=;
  b=QUZ5YozgzETwe99Va3CsGWfmm2rrXkBY3JQh9hxNcQ6x78jE+WLwX8ah
   C9WbR7rDkXmYLKiKJhFQtvZpLelK0zPa6s9F/pvtQMsBSOaPBTkPbMOJ/
   yIAv6IGR62Wc+5q4eBGM/35XsUC0GbcufKQRjVy5WxpWPbEWRII+x2weC
   XnTJhOQQfdWjap1URhrhtvDHT/Qz9E21upEQeONWvxgw9PcVS8OHg6zNj
   Zbj2DfXfFFCrJ/1+plyKu5SSeafPJLhng2iH10ROmJsmBkQH6R44ubNtS
   1lEfDM8ykcU9BjiZZLcBoUK8lQUNKWCOI3NAlT7KgqcQE1nCIkGvipPJw
   Q==;
X-CSE-ConnectionGUID: EL30flf6RWGdSkPCjg0IkQ==
X-CSE-MsgGUID: 5Qwbg/1bR+qG+qZZ0g3cwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3455034"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3455034"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 19:17:24 -0800
X-CSE-ConnectionGUID: zg5w0hryQQ2kqm8OwKCs5w==
X-CSE-MsgGUID: jRXnWqpRQICmoj4DOw37Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9165406"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2026 19:17:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS4GV-000000001Tn-3Gaf;
	Sat, 14 Nov 2026 03:17:19 +0000
Date: Sat, 14 Nov 2026 04:16:33 +0100
From: kernel test robot <lkp@intel.com>
To: Chipang Kao <chipang_kao@asus.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Ilpo =?utf-8?Q?J=C3=A4rvinen"?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Subject: [linux-next:master 5449/7428]
 drivers/platform/asus/asus-wmi.c:2887:33: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202611140423.DcT56YPN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
commit: ef696e89f836c31825b754abe181b490b82fbee7 [5449/7428] platform/asus: Move ASUS platform drivers out of drivers/platform/x86
config: loongarch-randconfig-r2303-20261113 (https://download.01.org/0day-ci/archive/20261114/202611140423.DcT56YPN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140423.DcT56YPN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140423.DcT56YPN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/asus/asus-wmi.c:2887:33: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   drivers/platform/asus/asus-wmi.c:2887:33: sparse:     expected unsigned int [usertype] val
   drivers/platform/asus/asus-wmi.c:2887:33: sparse:     got restricted __le32 [usertype]

vim +2887 drivers/platform/asus/asus-wmi.c

54a3121f00dad32 drivers/platform/x86/asus-wmi.c Yurii Pavlovskyi 2019-05-14  2869  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2870  static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2871  {
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2872  	struct pci_dev *xhci_pdev;
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2873  	u32 orig_ports_available;
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2874  	u32 ports_available = asus->driver->quirks->xusb2pr;
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2875  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2876  	xhci_pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2877  			PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI,
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2878  			NULL);
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2879  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2880  	if (!xhci_pdev)
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2881  		return;
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2882  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2883  	pci_read_config_dword(xhci_pdev, USB_INTEL_XUSB2PR,
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2884  				&orig_ports_available);
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2885  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2886  	pci_write_config_dword(xhci_pdev, USB_INTEL_XUSB2PR,
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01 @2887  				cpu_to_le32(ports_available));
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2888  
d0cdd85046b1508 drivers/platform/x86/asus-wmi.c Xiongfeng Wang   2022-11-11  2889  	pci_dev_put(xhci_pdev);
d0cdd85046b1508 drivers/platform/x86/asus-wmi.c Xiongfeng Wang   2022-11-11  2890  
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2891  	pr_info("set USB_INTEL_XUSB2PR old: 0x%04x, new: 0x%04x\n",
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2892  			orig_ports_available, ports_available);
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2893  }
8023eff10e7b032 drivers/platform/x86/asus-wmi.c Kai-Chuan Hsieh  2016-09-01  2894  

:::::: The code at line 2887 was first introduced by commit
:::::: 8023eff10e7b0327898f17f0b553d2e45c71cef3 platform/x86: asus-wmi: Set specified XUSB2PR value for X550LB

:::::: TO: Kai-Chuan Hsieh <kai.chiuan@gmail.com>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
