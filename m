Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EF180
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O16FvLsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700525000; x=1732061000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lddF/OI0/Y8y8Q++HK52CXKXAHqrpG6VUE1f+V8L0g8=;
  b=O16FvLsh6U8hWK9ZE6YJW9xNdMIpYbnJKyrLy/ih4BE+Wi5ExaIFbMsH
   zzoaE9FEg60pokp41LlkgT/OfbRFP/d/agOY5hkxXigT2eumGr+li1AfF
   5rjPC5uriN/h5WQMc3xEeLmk98S/EW4a4bWrLA/6GsXQCJWKeNcENpbRm
   EYH+widYK9D25x+JxnDpRrF3ddKolGPqOjT5ckfGiLXLX0OHn+EVRFBTS
   v/Ab8WrhT8Fx1YglQ80hB0ALdZS+XcPGrLzrcPg2HmVTHT6e/X+ihYNmO
   MlzfrzDkyvsU6NYxp77x2tqBDY0o6JG1EhcHIptO8aRulH7xvj66V+NJD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458222983"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="458222983"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 16:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7886119"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2023 16:03:16 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5EEU-00075C-1Q;
	Tue, 21 Nov 2023 00:03:14 +0000
Date: Tue, 21 Nov 2023 08:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:bleeding-edge 12/27] drivers/acpi/thermal_lib.c:46:5:
 warning: no previous prototype for 'acpi_active_trip_temp'
Message-ID: <202311210725.tPlWJipc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   f437a8d1debff5412e36a1c9454adee193b31950
commit: 932d2c2fd0b1e8242ba7bcb7b8c2553e663e174f [12/27] ACPI: thermal_lib: Add functions returning temperature in deci-Kelvin
config: x86_64-buildonly-randconfig-003-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210725.tPlWJipc-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210725.tPlWJipc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210725.tPlWJipc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/thermal_lib.c:46:5: warning: no previous prototype for 'acpi_active_trip_temp' [-Wmissing-prototypes]
      46 | int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/thermal_lib.c:56:5: warning: no previous prototype for 'acpi_passive_trip_temp' [-Wmissing-prototypes]
      56 | int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/thermal_lib.c:61:5: warning: no previous prototype for 'acpi_hot_trip_temp' [-Wmissing-prototypes]
      61 | int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/acpi/thermal_lib.c:66:5: warning: no previous prototype for 'acpi_critical_trip_temp' [-Wmissing-prototypes]
      66 | int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/acpi_active_trip_temp +46 drivers/acpi/thermal_lib.c

    45	
  > 46	int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
    47	{
    48		char obj_name[] = {'_', 'A', 'C', '0' + id, '\0'};
    49	
    50		if (id < 0 || id > 9)
    51			return -EINVAL;
    52	
    53		return acpi_trip_temp(adev, obj_name, ret_temp);
    54	}
    55	
  > 56	int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
    57	{
    58		return acpi_trip_temp(adev, "_PSV", ret_temp);
    59	}
    60	
  > 61	int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
    62	{
    63		return acpi_trip_temp(adev, "_HOT", ret_temp);
    64	}
    65	
  > 66	int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
    67	{
    68		return acpi_trip_temp(adev, "_CRT", ret_temp);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
