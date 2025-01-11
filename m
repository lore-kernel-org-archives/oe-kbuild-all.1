Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4CA17C68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736625899; cv=none; b=uZRjIC5e6bHJt9zNmpvrQonuAm8dF8d8ZJpc/OHH9mIscNM81GjkKEt+d/iq8jkYrySYcKZbYGp7PcHYa6dDeep067C+iXGEkIiSJtwJTqtkC8bWuC61MwJUZSyGpaHp8MT+I1TFbnMWbN9BXu3eS5Fqi37NduI7B716Kc6J1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736625899; c=relaxed/simple;
	bh=4vYu4E+ttvGVIh9JWZ3ocuZHOJWZboTcTtdL9yBw1Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZqy67JcFVSuyUkVUxnruEs6lKvlbjrfYH/DGUNJy388Xl5GuCiw6UytvC0XZ7JVxk+G8RIN3keRqhrXFmbSABYiilKVSM2JI+BAmGPTFldCvN7y7chogQlB5ONwwjdiK+yg6xQDOL4Z5bKYmavEz7S3q0C7D12nLlCqFl+9esg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3AR7f+c; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3AR7f+c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736625898; x=1768161898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4vYu4E+ttvGVIh9JWZ3ocuZHOJWZboTcTtdL9yBw1Kk=;
  b=m3AR7f+cz+uvTfbtFwDZkXfe5rvJr1gK43CYol63K+iMpl7nu/lrpbNh
   uLUExpCU5jw/m9JOcWG0ySnOn+ZFYGlymCKM/EWkChIstdp+LQFxQuWwy
   A5ilECsg13lLFJLwThCzLnkle1dX/Zf+zpVEbltQJMTlHArmccg9hJBKm
   7YUGE0IT6i/M9TrNpgHMxs1POYo/HwHz5Zu6l1/xb2Ur5L/aMZmVsmTM6
   piaIgoz1v11E+Kgdc4KOsUej2DEhZeqL6gM8UjDgj4GQHDfDphWZXbuUb
   /5u6rgeV776odGTqAMHxCD4I74VBlQBJbIkMzmZbUaFfc4A1wy5IKUv5M
   Q==;
X-CSE-ConnectionGUID: gxJYmH/kR2CFKkjq2l/N/w==
X-CSE-MsgGUID: CHCI23LLS1urEGZ7nlN51w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47557220"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47557220"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 12:04:57 -0800
X-CSE-ConnectionGUID: 09vEO/N6QyCj2fUQGprmCw==
X-CSE-MsgGUID: U8DosWYYR9yUPbKNoJr+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134933611"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jan 2025 12:04:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWhj3-000LA3-2J;
	Sat, 11 Jan 2025 20:04:53 +0000
Date: Sun, 12 Jan 2025 04:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 7316/7860]
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:30: error:
 implicit declaration of function 'acpi_device_handle'; did you mean
 'acpi_fwnode_handle'?
Message-ID: <202501120441.YpejrHzj-lkp@intel.com>
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
commit: 7cb06f08ef13499105d6fe85706baf34467b43a8 [7316/7860] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250112/202501120441.YpejrHzj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120441.YpejrHzj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120441.YpejrHzj-lkp@intel.com/

Note: the linux-next/master HEAD 2b88851f583d3c4e40bcd40cfe1965241ec229dd builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c: In function 'thc_acpi_get_property':
>> drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:30: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Werror=implicit-function-declaration]
      63 |         acpi_handle handle = acpi_device_handle(adev);
         |                              ^~~~~~~~~~~~~~~~~~
         |                              acpi_fwnode_handle
   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:30: warning: initialization of 'acpi_handle' {aka 'void *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c: In function 'quickspi_irq_thread_handler':
   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:242:13: warning: variable 'int_mask' set but not used [-Wunused-but-set-variable]
     242 |         int int_mask;
         |             ^~~~~~~~
   cc1: some warnings being treated as errors


vim +63 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c

    29	
    30	/* THC QuickSPI ACPI method to get device properties */
    31	/* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */
    32	static guid_t hidspi_guid =
    33		GUID_INIT(0x6e2ac436, 0x0fcf, 0x41af, 0xa2, 0x65, 0xb3, 0x2a,
    34			  0x22, 0x0d, 0xcf, 0xab);
    35	
    36	/* QuickSpi Method: {300D35b7-ac20-413e-8e9c-92e4dafd0afe} */
    37	static guid_t thc_quickspi_guid =
    38		GUID_INIT(0x300d35b7, 0xac20, 0x413e, 0x8e, 0x9c, 0x92, 0xe4,
    39			  0xda, 0xfd, 0x0a, 0xfe);
    40	
    41	/* Platform Method: {84005682-5b71-41a4-0x8d668130f787a138} */
    42	static guid_t thc_platform_guid =
    43		GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30,
    44			  0xf7, 0x87, 0xa1, 0x38);
    45	
    46	/**
    47	 * thc_acpi_get_property - Query device ACPI parameter
    48	 *
    49	 * @adev: point to ACPI device
    50	 * @guid: ACPI method's guid
    51	 * @rev: ACPI method's revision
    52	 * @func: ACPI method's function number
    53	 * @type: ACPI parameter's data type
    54	 * @prop_buf: point to return buffer
    55	 *
    56	 * This is a helper function for device to query its ACPI parameters.
    57	 *
    58	 * Return: 0 if successful or ENODEV on failed.
    59	 */
    60	static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
    61					 u64 rev, u64 func, acpi_object_type type, void *prop_buf)
    62	{
  > 63		acpi_handle handle = acpi_device_handle(adev);
    64		union acpi_object *obj;
    65	
    66		obj = acpi_evaluate_dsm_typed(handle, guid, rev, func, NULL, type);
    67		if (!obj) {
    68			acpi_handle_err(handle,
    69					"Error _DSM call failed, rev: %llu, func: %llu, type: %u\n",
    70					rev, func, type);
    71			return -ENODEV;
    72		}
    73	
    74		if (type == ACPI_TYPE_INTEGER)
    75			*(u32 *)prop_buf = (u32)obj->integer.value;
    76		else if (type == ACPI_TYPE_BUFFER)
    77			memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
    78	
    79		ACPI_FREE(obj);
    80	
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
