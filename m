Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA77F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 04:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687753633; x=1719289633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xJVJ+lHtTDcojfDrwhr9kuMuLrjHDhlw3ERDDpH4pvg=;
  b=RlLqH+Ib2Z6Eay3b1SUM+TqLeFw3oPxaqxKqHA3j+9qsK9lI4RyXLCCS
   9WaAPpfLk+Bs9bY3yl1+0SzkjkGB5aBCT7dM3GIKpcE/4WF2of0+1d7mh
   Qh56P9tVoSn96gJneoW/FbhTW/R9U5NdpqcBR66VZxt7qm9uIBfifh2vT
   W6ymBwUw3l+d0+CjvcG0A42JWK5wAQVu1P4e4Uk8/Lh28h1iE+O3Zepk2
   neXxNRzPsW5o0H61Nk078bA/2qYla8eRlhBwPvwcoqi5F8BB9qUGJtQIQ
   bB2o6SXe+qf/1jwIC8hs+mZW1CU8/s+l2xZDSlZE9B/eiHta8pAXwm8AR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="350944851"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="350944851"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 21:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="860529392"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="860529392"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2023 21:27:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDdok-000ATZ-2n;
	Mon, 26 Jun 2023 04:27:10 +0000
Date: Mon, 26 Jun 2023 12:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 213/221] htmldocs:
 Documentation/hid/hidraw.rst:133: WARNING: Definition list ends without a
 blank line; unexpected unindent.
Message-ID: <202306261233.Xs0Jg53u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   1fa783ee2b7a45e571a18af62b4ad3f129c90792
commit: 6ccfae3f6f07b27640024933be2891a2538d8a53 [213/221] BACKPORT: HID: hidraw: Add additional hidraw input/output report ioctls.
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261233.Xs0Jg53u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306261233.Xs0Jg53u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hid/hidraw.rst:133: WARNING: Definition list ends without a blank line; unexpected unindent.

vim +133 Documentation/hid/hidraw.rst

   130	
   131	HIDIOCSINPUT(len):
   132		Send an Input Report
 > 133	This ioctl will send an input report to the device, using the control endpoint.
   134	In most cases, setting an input HID report on a device is meaningless and has
   135	no effect, but some devices may choose to use this to set or reset an initial
   136	state of a report.  The format of the buffer issued with this report is identical
   137	to that of HIDIOCSFEATURE.
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
