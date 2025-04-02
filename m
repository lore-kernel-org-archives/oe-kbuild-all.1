Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57718B03
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743569447; cv=none; b=OKq57XP/n9IEUTtJW+Y+MrkBhf5mNmC5RlyAyxTosYdikqUuxAfIJLm8RGtLP3rlCGdrJ9IVAVsWvf4lb8jY/OP44rneczhofT66BcGfzWZDz5Oc68mnMpKFFK//l/NeQRzVgVXdopuaqTTS5AZU2beUXmOdo07m7H4XvOWNzR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743569447; c=relaxed/simple;
	bh=KtGragk6bvHE9qbCA+/O2Xm6YDIWxHAWnc7VZ3JgjG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1Bfgp7OxXVjj/FOQTmtLFBIw1XuFqlOtJ5xesV43CFV4kmNgkzlTI8kor/EGT9fN9nAfogYK2AUCHUitNunGPFiKOTZxFWP7QFjBIDUO6s/mIXuEjJX8XbREu7LXMXhhm6yw0swpIpE8Yq50f9t1bZ5LTo4+iBoMFhGuTpfpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVGUcfOs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVGUcfOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743569446; x=1775105446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtGragk6bvHE9qbCA+/O2Xm6YDIWxHAWnc7VZ3JgjG0=;
  b=hVGUcfOs6OY7w2jUoC7m8qIxU22iELwQ0LFdx4Zan5ErscrkrS/Xer2/
   G4Md2ZpRmiMUJoCGWPmqVPMoXfuiXyJF5etMAmhrwejGyUhwqthNbDN1l
   LpSEeErrichir6Hbk52Mu/lbNN6EjdqSzIR62irlr544e9tRZYQMiQUQv
   F0YPJsB+L4IuWX9vG5PEe/VMmHvN8Fb5uwwbyw2JZCp8Tc/2Ewt91Glqv
   //xG/P2oU2u/cpqyIyxdE/GN/iRPMvowOzzGKHOzrbq1qayMKFdNKsdKY
   ScOZR4MZa+FqE+2ndNpJaAZaTC2j9RJDVGMbJuY6XINN5FGFZ3sJXUU26
   w==;
X-CSE-ConnectionGUID: 0PmjSoHgSQe/N4mXNJz8sQ==
X-CSE-MsgGUID: zXfuM37AQsKmfmidKXs/Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44799434"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="44799434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 21:50:45 -0700
X-CSE-ConnectionGUID: btEDXewyT1aJ/ywuftFOWA==
X-CSE-MsgGUID: AcLCms3HT9q1U1HHHPQLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131306717"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 21:50:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzq3l-000ATm-3A;
	Wed, 02 Apr 2025 04:50:41 +0000
Date: Wed, 2 Apr 2025 12:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 39/39]
 drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: warning: no previous prototype for
 'init_i2c_hid_acpi_probe_quirks'
Message-ID: <202504021218.MbGDR1XA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6ba07e208acf329bb8c57e735eec5abf2c64f653
commit: 3a335beff4d27defe6b75e0895f7a5aa37f2acaf [39/39] HACK: CHROMIUM: HID: i2c-hid: acpi: add acpi quriks for HX83121 on meliks
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250402/202504021218.MbGDR1XA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021218.MbGDR1XA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021218.MbGDR1XA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: warning: no previous prototype for 'init_i2c_hid_acpi_probe_quirks' [-Wmissing-prototypes]
     104 | void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/init_i2c_hid_acpi_probe_quirks +104 drivers/hid/i2c-hid/i2c-hid-acpi.c

   103	
 > 104	void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
   105	{
   106		const struct dmi_system_id *system_id =
   107				dmi_first_match(i2c_hid_acpi_dmi_quirks);
   108		struct acpi_device *adev = ihid_acpi->adev;
   109		acpi_handle handle = acpi_device_handle(adev);
   110	
   111		if (system_id) {
   112			if (acpi_match_device_ids(adev, i2c_hid_acpi_extra_delay_devices) == 0) {
   113				acpi_handle_debug(handle, "Start Extra Power Up delay\n");
   114				msleep(1000);
   115				acpi_handle_debug(handle, "End Extra Power Up delay\n");
   116			}
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
