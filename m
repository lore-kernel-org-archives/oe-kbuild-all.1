Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613651C37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duGCr7bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702322795; x=1733858795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eX9h28K7K0YjRE6mX8C+fTTmD7rY0KmCFJlQZxSJAAk=;
  b=duGCr7bIof3SVaLB6oHW1Uw2lyf0QxaiTvW/njJNcOpZi+Pb/477uJb5
   Q6iRRV/PhyrE4WOnMNKNNSllJtJSBZadsotwrLWuVzuKmCQkMq5hRxbPM
   xhwWy2RtF4J2NTG1Y2bPMGsDQnursGcDiUPXYJv+wtcNWiGnifO4N0Q/v
   ab482Seh0jc91yJYiBEAqmfQckYORarbLVNiwJ59XY/2CnNDFVsFj/YJa
   vcadQ08xSO0DfQ4v0vokFStzZulHIWotAezjcPtClDu9c9ozl3VVeFvAh
   DFZp+kOREI8bzvA/Rbz4WJVvUIyrNh54ZuJsjkZ1RxCBfCVnsdy0G4T/q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="394449416"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="394449416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="749412815"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="749412815"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Dec 2023 11:26:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rClvC-000IPU-35;
	Mon, 11 Dec 2023 19:26:30 +0000
Date: Tue, 12 Dec 2023 03:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 5104/29950] hisi_hikey_usb.c:undefined
 reference to `usb_role_switch_unregister'
Message-ID: <202312120342.ZrhlMCPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   1303f659c2b14b2e1b45dca5e98b79a2b818d4f6
commit: df2bbf3f35122d1d879aef65254ac09ede18e6f9 [5104/29950] ANDROID: misc: hisi_hikey_usb: Driver to support usb functionality of Hikey960
config: arm64-randconfig-003-20231205 (https://download.01.org/0day-ci/archive/20231212/202312120342.ZrhlMCPr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120342.ZrhlMCPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120342.ZrhlMCPr-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_remove':
>> hisi_hikey_usb.c:(.text+0x3c): undefined reference to `usb_role_switch_unregister'
   hisi_hikey_usb.c:(.text+0x3c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_unregister'
>> aarch64-linux-ld: hisi_hikey_usb.c:(.text+0x50): undefined reference to `usb_role_switch_put'
   hisi_hikey_usb.c:(.text+0x50): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_put'
   aarch64-linux-ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_get':
>> hisi_hikey_usb.c:(.text+0xb8): undefined reference to `usb_role_switch_get_role'
   hisi_hikey_usb.c:(.text+0xb8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_get_role'
   aarch64-linux-ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_set':
>> hisi_hikey_usb.c:(.text+0x228): undefined reference to `usb_role_switch_set_role'
   hisi_hikey_usb.c:(.text+0x228): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_set_role'
   aarch64-linux-ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_probe':
>> hisi_hikey_usb.c:(.text+0x370): undefined reference to `usb_role_switch_get'
   hisi_hikey_usb.c:(.text+0x370): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_get'
>> aarch64-linux-ld: hisi_hikey_usb.c:(.text+0x3cc): undefined reference to `usb_role_switch_register'
   hisi_hikey_usb.c:(.text+0x3cc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_register'
   aarch64-linux-ld: hisi_hikey_usb.c:(.text+0x3f4): undefined reference to `usb_role_switch_put'
   hisi_hikey_usb.c:(.text+0x3f4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `usb_role_switch_put'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
