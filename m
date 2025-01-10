Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F6210F65
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520804; cv=none; b=BmvmvNxej3fAe1+b80b6xztEpP0zDjz32x45/Bzu8oCyfrY4LuEHRsXYt0h0LzOj33zFSqUzn/EfDcloJyzrRJN70WpHuu1cZIUPbsAWYDAa9RMBtVb4BSOHj/ZivZdRw5tkpfdecT795BRZL42lfPZ4MWFK5rv7E3pPDpvIUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520804; c=relaxed/simple;
	bh=0Q5iEd6D1HiWJmWkGJAIIOaLU7nDmQo5lIgi6t8nBfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLut7XRqgizRwY/DvdQHqaJdSj6jEyGRKj4sPjVBpOj6S0GKsFzoky/QH4/EkXipzfuYTxf+nxp9+w7ndHD0JrV78agsunAVaQjsUF4TtdOfuX0OTW4G4psew0JMUT/78Q2fbFZK2blnGtO1A+HbAElqiiwNbKpCH2nBFkP3GVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSk8HTXg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSk8HTXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736520802; x=1768056802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Q5iEd6D1HiWJmWkGJAIIOaLU7nDmQo5lIgi6t8nBfE=;
  b=hSk8HTXg6B8FcVpKa6STqMawIzXea4B0SBu+j5fQPPX8XpYC387c92Cy
   4BSIMvNxB2cayJWBsQOan9j69fy3j0DJ3rL8q8BujJ+6p9VSO/o2IBPkM
   CLwYjcb2GbYcN5FrY33XmvNLlOT+zRxQVrBWcLMIE3iPkihE3hRrpdU0F
   MR0jXUYZtJBhbDwoX1TwayKebTeG3bxrzoTXmuhtbrC4uvMMvb9UAvLuC
   fgBN5wWkKYo7A2nHWWCT27lYUL60A1rrCsr49MTNG33y/SYyLAxUHY1FW
   yy7m2g9zAU9jog/Y4e+gXo2C/26fLzy+19HVhjLMDfoXQHqqJr2v5UjVx
   A==;
X-CSE-ConnectionGUID: tANGZaXPQ9Okq0Q0bLX1AA==
X-CSE-MsgGUID: 6lKjTiPKRZOayyKH6+/qgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36102422"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36102422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 06:53:22 -0800
X-CSE-ConnectionGUID: 04tD1MJ2R2OGAir5izGRWg==
X-CSE-MsgGUID: Ignl9/afTV2ClQz2ATdijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104260211"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jan 2025 06:53:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWGNx-000JNf-2i;
	Fri, 10 Jan 2025 14:53:17 +0000
Date: Fri, 10 Jan 2025 22:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 7317/7860]
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:259:18: error:
 implicit declaration of function 'acpi_execute_simple_method'; did you mean
 'acpi_execute_reg_methods'?
Message-ID: <202501102208.3QGSCARD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 9d8d51735a3af40b722346931a6a1e50227df4b5 [7317/7860] HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250110/202501102208.3QGSCARD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102208.3QGSCARD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102208.3QGSCARD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c: In function 'acpi_tic_reset':
   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:258:18: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
     258 |         handle = acpi_device_handle(qsdev->acpi_dev);
         |                  ^~~~~~~~~~~~~~~~~~
         |                  acpi_fwnode_handle
   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:258:16: warning: assignment to 'acpi_handle' {aka 'void *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     258 |         handle = acpi_device_handle(qsdev->acpi_dev);
         |                ^
>> drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:259:18: error: implicit declaration of function 'acpi_execute_simple_method'; did you mean 'acpi_execute_reg_methods'? [-Werror=implicit-function-declaration]
     259 |         status = acpi_execute_simple_method(handle, "_RST", 0);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  acpi_execute_reg_methods
   cc1: some warnings being treated as errors


vim +259 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c

   249	
   250	static int acpi_tic_reset(struct quickspi_device *qsdev)
   251	{
   252		acpi_status status = 0;
   253		acpi_handle handle;
   254	
   255		if (!qsdev->acpi_dev)
   256			return -ENODEV;
   257	
   258		handle = acpi_device_handle(qsdev->acpi_dev);
 > 259		status = acpi_execute_simple_method(handle, "_RST", 0);
   260		if (ACPI_FAILURE(status)) {
   261			dev_err_once(qsdev->dev,
   262				     "Failed to reset device through ACPI method, ret = %d\n", status);
   263			return -EIO;
   264		}
   265	
   266		return 0;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
