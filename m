Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B27F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 00:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693613521; x=1725149521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n41Yo4MYx69KnM/xGCkKTr83Qqpq76sQt3nbe/UF3oc=;
  b=lIRB2MFafigLJGV0YP4m0v1UIjj5N4DTycxTRoFIxp2z9TrepPM3tXYb
   P2HVZMjuOuQGXWUNdbOGCYYamH4XGHy/QaGKXhGiePdTghLSnuIetzJsh
   RnXYLdfNWG5Q7fKU14qp4voqORyarsGLZUMb/C0SiDmJxtsU9yaWSyRag
   Zrmuo33zm1FvSbPR1ky32nHiHI5Uk/nP5caRP9laULlSYuPp92IRAQQ0+
   vebB+F6w9UJqWZS6pyF0/TRQTiDS+iFxWVpb57H8KB2C0oV0aedY+5xih
   7ESuefiuHrvkzCdJ+9oZ1/cw4kjLyPLPIGHH+is1DCUmne7oKgdXdOOAw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361354477"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="361354477"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 17:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913867056"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="913867056"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 17:12:01 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcEF3-0001ln-29;
	Sat, 02 Sep 2023 00:11:57 +0000
Date: Sat, 2 Sep 2023 08:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 19/68] htmldocs:
 Documentation/firmware-guide/acpi/chromeos-acpi-device.rst:134: WARNING:
 Error in "code-block" directive:
Message-ID: <202309020831.eFrJqpRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   cc41bfc48073553c102f0d6fd950190af1e79fe7
commit: 769e0664ecc37eb6234b03730c645b2bfd522d4a [19/68] BACKPORT: platform/chrome: Add ChromeOS ACPI device driver
reproduce: (https://download.01.org/0day-ci/archive/20230902/202309020831.eFrJqpRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020831.eFrJqpRs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/firmware-guide/acpi/chromeos-acpi-device.rst:134: WARNING: Error in "code-block" directive:

vim +134 Documentation/firmware-guide/acpi/chromeos-acpi-device.rst

   133	
 > 134	.. code-block::
   135	
   136	   Package {
   137	           Reserved1
   138	           Reserved2
   139	           Active EC Firmware
   140	           Active Main Firmware Type
   141	           Reserved5
   142	   }
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
