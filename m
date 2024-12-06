Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946A2212FBA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733518942; cv=none; b=gMrBJE7k8RwgWgaAPzWy68anU3H/w8v0HDNoq0a+s3n0784JQrsmBfDmy1K5tTYbClXltSIccunrl7oD9ihqvetkFXSK+3qMNx8+Ue5mea4x6WQeGWYKB/sFLRdvUIJpZZZL5jJJgJQlTRWEA9R7O9fOXpo5huIu1itQaI1j5ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733518942; c=relaxed/simple;
	bh=WvjOGyjqFiDN39Xi7myydJ1g28Bx2v9EOj2PbuzboNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aANtHVWhq76jwRUR5/co3xsS9yBfEpDzd2hutVzCcM32lw/zzIAWjWDF+8Giq4CzD+pyRUNTH19TShg6u6aNhMAs7H1I2iBHWBRpdZY3zelDr7nZ66gQ9UBP+gLHducBbEu+mrTx5fbShxMeyPSHrM86VV3NEhmrDViCDSSUG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFNEYo9n; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFNEYo9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733518941; x=1765054941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WvjOGyjqFiDN39Xi7myydJ1g28Bx2v9EOj2PbuzboNo=;
  b=nFNEYo9nBOhRjg68lBvkXzLzcDFbkE/NLRsR7YR29KU0s47Tsi2MCXWy
   Ecih2yYz2DYGUM33p90lrBpwpzoDT2h0Org5NWjV19nLhe8Ogy+DpdrHe
   kunkWUpplcD4/1tyIogA3dpl0+WJK2GX5OtvL1aIxzhj9WlOjC1D1a+NS
   FIWi4h7/BFn7bG7vrphasPaiNUFxPGZpZd1pWs53tjNAWNdYm6t5MF60C
   qSUPQ+ZjdXVq7TOxlcuUzolYWSlz7m1MzWD1gC5F88tuElorss0BKG8xx
   E6GsyV+y71eLXBB27vU1c7u/fW8fvy2zOOxLjshmiK7to5YxgRPXsP+vW
   Q==;
X-CSE-ConnectionGUID: 8tsswQ/RRMCg0mVtZiYceA==
X-CSE-MsgGUID: 1yDsT+wqT+qZzIVrb9ZUFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44355656"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="44355656"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 13:02:20 -0800
X-CSE-ConnectionGUID: qVNIJJEFRhefZCiHP70ytg==
X-CSE-MsgGUID: vPbbCuYoS5C8XTjDooYqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="125415525"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2024 13:02:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJfSq-0002Fr-2H;
	Fri, 06 Dec 2024 21:02:16 +0000
Date: Sat, 7 Dec 2024 05:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <202412070418.34Bo5VZa-lkp@intel.com>
References: <20241128-z2-v2-2-76cc59bbf117@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-z2-v2-2-76cc59bbf117@gmail.com>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f16d5e6f220661f73b36a4be1b21575651d8833]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein-via-B4-Relay/dt-bindings-input-touchscreen-Add-Z2-controller/20241129-063212
base:   9f16d5e6f220661f73b36a4be1b21575651d8833
patch link:    https://lore.kernel.org/r/20241128-z2-v2-2-76cc59bbf117%40gmail.com
patch subject: [PATCH v2 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
config: um-randconfig-r123-20241206 (https://download.01.org/0day-ci/archive/20241207/202412070418.34Bo5VZa-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070418.34Bo5VZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070418.34Bo5VZa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/apple_z2.c:296:35: sparse: sparse: cast to restricted __le32
   drivers/input/touchscreen/apple_z2.c: note: in included file (through arch/um/include/linux/time-internal.h, arch/x86/um/asm/processor.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +296 drivers/input/touchscreen/apple_z2.c

   243	
   244	static int apple_z2_upload_firmware(struct apple_z2 *z2)
   245	{
   246		const struct firmware *fw __free(firmware) = NULL;
   247		struct apple_z2_fw_hdr *fw_hdr;
   248		size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
   249		int error;
   250		u32 load_cmd;
   251		u32 size;
   252		u32 address;
   253		char *data;
   254		u8 bits_per_word;
   255		size_t cal_size;
   256	
   257		error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
   258		if (error) {
   259			dev_err(&z2->spidev->dev, "unable to load firmware");
   260			return error;
   261		}
   262	
   263		fw_hdr = (struct apple_z2_fw_hdr *)fw->data;
   264		if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
   265			dev_err(&z2->spidev->dev, "invalid firmware header");
   266			return -EINVAL;
   267		}
   268	
   269		/*
   270		 * This will interrupt the upload half-way if the file is malformed
   271		 * As the device has no non-volatile storage to corrupt, and gets reset
   272		 * on boot anyway, this is fine.
   273		 */
   274		while (fw_idx < fw->size) {
   275			if (fw->size - fw_idx < 8) {
   276				dev_err(&z2->spidev->dev, "firmware malformed");
   277				return -EINVAL;
   278			}
   279	
   280			load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
   281			fw_idx += 4;
   282			if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
   283				size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
   284				fw_idx += 4;
   285				if (fw->size - fw_idx < size) {
   286					dev_err(&z2->spidev->dev, "firmware malformed");
   287					return -EINVAL;
   288				}
   289				bits_per_word = load_cmd == LOAD_COMMAND_SEND_BLOB ? 16 : 8;
   290				error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
   291								    size, bits_per_word);
   292				if (error)
   293					return error;
   294				fw_idx += size;
   295			} else if (load_cmd == 2) {
 > 296				address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
   297				fw_idx += 4;
   298				cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
   299				if (cal_size != 0) {
   300					size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
   301					data = kzalloc(size, GFP_KERNEL);
   302					error = apple_z2_build_cal_blob(z2, address, cal_size, data);
   303					if (!error)
   304						error = apple_z2_send_firmware_blob(z2, data, size, 16);
   305					kfree(data);
   306					if (error)
   307						return error;
   308				}
   309			} else {
   310				dev_err(&z2->spidev->dev, "firmware malformed");
   311				return -EINVAL;
   312			}
   313			if (fw_idx % 4 != 0)
   314				fw_idx += 4 - (fw_idx % 4);
   315		}
   316	
   317	
   318		z2->booted = 1;
   319		apple_z2_read_packet(z2);
   320		return 0;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
