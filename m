Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EBD284665
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755413; cv=none; b=DwfveE2zUydvPcQeJBFGDyu+MgjWuUmFySpM6Lj6MwLMBE3ci6gXuGAjpwHAvjyvl4Q1B7bLrom7D4Cdbn4L6db7GU2I8H/TwXta0E+UKfE8UGejy/0IEh7p+R5rdr+DZymscbJC5/71qbVu1QflqnSG6glsickBEvZqQxz3FLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755413; c=relaxed/simple;
	bh=8+BwpUx/vvwbD29gnGZ+KY4hotu7urGUrPP0QUJ252s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CpiykMcUfBm5yU8SHVF4+VC/DUp5evPOo/YvVARwtVj39BsP51LPzXwStMwGiUmTOTiki7MtmRy8gl7TmvUmddd74NGmurj2hhSh0s43MeFlBSpuGLPI4EKyt6vvGVVVAJG8Gch6WulvgXw/gCUbX2inZ87mVUyhD2tRqubcY+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxA6L5YD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxA6L5YD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766755411; x=1798291411;
  h=date:from:to:cc:subject:message-id;
  bh=8+BwpUx/vvwbD29gnGZ+KY4hotu7urGUrPP0QUJ252s=;
  b=HxA6L5YD4GEpoWy8FNGgUa7OoRp0SeWsNoTE7IH3lAC3ldn2n5FHPTV9
   FhtW70EDzZ010scfPCI1id3N08ymY5Mk9W43lHM8aNTs9V9jjd8mXfCSI
   M0gbA/PegBb3QbEd8CxeN3a2qYLUtcJkDvnHio/Z6ghvpmPLvID90OvEc
   AgGH08tHNoc7vXUYX4o1Fohbr3R4OOIYwVYiGiLtrKNL6dJdkqCrTMi04
   KdTpaMnTyqc3mpZQIBIJYOlEJC1DbFi5+rtCGHmYzttAge7fyNqzhrjtd
   OCW1CpkUzu7e9KIRvlgRnPG+OOHYvpQ+rMTx4b4KKmpv4rceEL19h8tYA
   g==;
X-CSE-ConnectionGUID: 60oeeEAXQ2SO2UzTiFWMzA==
X-CSE-MsgGUID: H6SXdw3IQ92SfEN28TvT/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79874260"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="79874260"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 05:23:31 -0800
X-CSE-ConnectionGUID: WPvo6GK/RgWoe7WOElSe5w==
X-CSE-MsgGUID: 1TphBrskS1ivOpOOfIXokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="199623976"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Dec 2025 05:23:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ7mw-0000000053L-3m20;
	Fri, 26 Dec 2025 13:23:26 +0000
Date: Fri, 26 Dec 2025 21:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ub/ubfi/ubc.c:61:18:
 error: implicit declaration of function 'acpi_evaluate_integer'; did you mean
 'acpi_evaluate_object'?
Message-ID: <202512262133.NDd7lyEj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 028a4161a77d2e15d331a13599a6f06cdd7490b6 [13/13] ub:ubfi: register ubc usi domain
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512262133.NDd7lyEj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512262133.NDd7lyEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512262133.NDd7lyEj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/ub/ubfi/ubc.c: In function 'acpi_processor_ubc':
>> drivers/ub/ubfi/ubc.c:61:18: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
      61 |         status = acpi_evaluate_integer(handle, "_UID", NULL, &uid);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
>> drivers/ub/ubfi/ubc.c:69:16: error: implicit declaration of function 'acpi_get_acpi_dev'; did you mean 'acpi_get_timer'? [-Werror=implicit-function-declaration]
      69 |         adev = acpi_get_acpi_dev(handle);
         |                ^~~~~~~~~~~~~~~~~
         |                acpi_get_timer
>> drivers/ub/ubfi/ubc.c:69:14: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      69 |         adev = acpi_get_acpi_dev(handle);
         |              ^
>> drivers/ub/ubfi/ubc.c:87:9: error: implicit declaration of function 'acpi_put_acpi_dev'; did you mean 'acpi_match_acpi_device'? [-Werror=implicit-function-declaration]
      87 |         acpi_put_acpi_dev(adev);
         |         ^~~~~~~~~~~~~~~~~
         |         acpi_match_acpi_device
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +61 drivers/ub/ubfi/ubc.c

    50	
    51	static acpi_status acpi_processor_ubc(acpi_handle handle, u32 lvl,
    52					      void *context, void **rv)
    53	{
    54		struct ub_bus_controller *ubc = context;
    55		struct acpi_device *adev;
    56		unsigned long long uid;
    57		acpi_status status;
    58		struct device *dev;
    59		int ret;
    60	
  > 61		status = acpi_evaluate_integer(handle, "_UID", NULL, &uid);
    62		if (ACPI_FAILURE(status))
    63			return AE_CTRL_TERMINATE;
    64	
    65		pr_info("ubc acpi ubc->ctl_no %u, uid: %llu\n", ubc->ctl_no, uid);
    66		if (ubc->ctl_no != (u32)uid)
    67			return AE_OK;
    68	
  > 69		adev = acpi_get_acpi_dev(handle);
    70		if (!adev)
    71			return AE_CTRL_TERMINATE;
    72	
    73		dev = bus_find_device_by_acpi_dev(&platform_bus_type, adev);
    74		if (!dev) {
    75			status = AE_CTRL_TERMINATE;
    76			goto out;
    77		}
    78		ret = ub_update_msi_domain(dev, DOMAIN_BUS_UB_MSI);
    79		if (ret) {
    80			status = AE_CTRL_TERMINATE;
    81			goto out;
    82		}
    83		dev_set_msi_domain(&ubc->dev, dev->msi.domain);
    84		pr_debug("set ubc msi domain success by acpi\n");
    85	
    86	out:
  > 87		acpi_put_acpi_dev(adev);
    88		return status;
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
