Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F2196
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 00:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692835953; x=1724371953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7It9K5yTHjWk/rqx5yaD8G3i0LXkL6vgXKKzBJKYxc=;
  b=ip3ejCCfar8vzd50gQf4S17Tnq4aS+U6TvK1tDINLvh+NsWcrS2ezNtP
   BixTrVMd86pRegEz86sO/FMSvUqUl6ZOENTo7mWdWCIfDscji0isFMmBo
   dqjsM/OPgAmHFZ+E837TU2j58DIEclmHZXP+dB7vXo2/AUafat2zMHQxL
   FWK/jSvDKvaR7ko+eQTDBoaqTURWgCdVEWJQeRoF63AZ2nxXizc3I7XHt
   UVHrjG+y2YhmS9nfdM2Akr6gQR2M/A+GIrTkMPwVoqvgCfUNrnDCsJW7f
   KmEHBv2i59a+UszpFld/2nQmXLH/cJ7xdEAwY96ZthzyPalIK1QZmvAt+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378058712"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="378058712"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 17:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713770845"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="713770845"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 17:12:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYxxe-0001bs-0k;
	Thu, 24 Aug 2023 00:12:30 +0000
Date: Thu, 24 Aug 2023 08:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 938/29778] ld:
 isp1704_charger.c:undefined reference to `devm_usb_get_phy'
Message-ID: <202308240812.56hhvO1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   096e6c86b6160c7f99a75da296e6147b47bc8a43
commit: adb016dd5328f53cccfabd3af74fd1be9ca02fad [938/29778] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-005-20230824 (https://download.01.org/0day-ci/archive/20230824/202308240812.56hhvO1I-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240812.56hhvO1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240812.56hhvO1I-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: arch/x86/mm/ioremap.o: in function `__ioremap_caller':
   ioremap.c:(.text+0x695): undefined reference to `efi_mem_type'
   ld: drivers/power/supply/isp1704_charger.o: in function `isp1704_charger_probe':
   isp1704_charger.c:(.text+0x1b0): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: isp1704_charger.c:(.text+0x2ae): undefined reference to `devm_usb_get_phy'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
