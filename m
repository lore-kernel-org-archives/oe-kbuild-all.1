Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F90F64F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 02:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711850655; cv=none; b=XeJdraRvr95BVlzRAzJBCxUGwDzZnE7VzVO/sZrk2eSF6mwIuNVJzp4lxglJx5BzcSeZZB2RWqLj2wSzG0zztAQzfcjEZMFXPTOb/OfnrsNQAmn18svl7mq+QQBqTepGdUUHdJGrKlnd7rVliOz4dNSnDJyuh80MzpyW0BHEPLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711850655; c=relaxed/simple;
	bh=WXYqaP2ySnOoLYcaLi/6XttihdhjYbxiZEVcfE8PIO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWGRm3+K6lSRtQJf7Q7lUVD5Ynn8JrZR3VYizw92rKo+ZHwxf5Qd0CjOSt5yN+h/7H5fG8os/3T/LEpE4PskNP1tdmxSdWo0hCEp/clvzlJ8lOnf9TTHGvh2XvqYG4OWHv0YS7ip4rCQsmqY08Tnjsak8tGwDHOigk33AH6+m/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVhhK6TJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVhhK6TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711850653; x=1743386653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WXYqaP2ySnOoLYcaLi/6XttihdhjYbxiZEVcfE8PIO8=;
  b=GVhhK6TJmkOJPWFLyvWVTDbeKDjVvt5CSmKJX5Am6/azTFsh+uU7B+/R
   k5D6ZWsNMcAh5EWjOfwQ1oss9nM0VzEouOrfSD4es4uLDL1MOq0b9Yv0z
   Pe7MyQiDfIv5x47TETbxIbS6HNz/6dKjdSItSB50+CbyO0cEe+RG4dw43
   o0I1yvDugdu/AfROTyX67L59yUsCQO3RLYgJA3DlZk2P1ngGpVK613mjq
   8q87DXFjjsDJEdsDfpBq4mytzBkWc5rZ9IqPA21i/Qt9BmQLuvqUO7VQo
   wzUy5KvADAelQIagJ0M802OpEfzJ+vlyNAc3mW0qDd6b6gx+ZNlvkyGEl
   Q==;
X-CSE-ConnectionGUID: slkL2i9sRKmgV0xYq0k+zQ==
X-CSE-MsgGUID: jddB4vYaS9O6RpIexUfx4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="17559977"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17559977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 19:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="21852090"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2024 19:04:10 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqkYK-0000gj-1C;
	Sun, 31 Mar 2024 02:04:08 +0000
Date: Sun, 31 Mar 2024 10:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v5 2/3] xen/pvh: Setup gsi for passthrough
 device
Message-ID: <202403310932.nmHEif4W-lkp@intel.com>
References: <20240328065646.354782-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328065646.354782-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on pci/next pci/for-linus rafael-pm/linux-next linus/master v6.9-rc1 next-20240328]
[cannot apply to tip/x86/core rafael-pm/acpi-bus rafael-pm/devprop]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20240328-145956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240328065646.354782-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v5 2/3] xen/pvh: Setup gsi for passthrough device
config: arm64-randconfig-001-20240331 (https://download.01.org/0day-ci/archive/20240331/202403310932.nmHEif4W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403310932.nmHEif4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310932.nmHEif4W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h: In function 'xen_acpi_sleep_register':
>> include/xen/acpi.h:63:58: error: macro "acpi_os_set_prepare_sleep" requires 3 arguments, but only 1 given
      63 |                         &xen_acpi_notify_hypervisor_sleep);
         |                                                          ^
   In file included from include/xen/acpi.h:41:
   include/linux/acpi.h:1121: note: macro "acpi_os_set_prepare_sleep" defined here
    1121 | #define acpi_os_set_prepare_sleep(func, pm1a_ctrl, pm1b_ctrl) do { } while (0)
         | 
>> include/xen/acpi.h:62:17: error: 'acpi_os_set_prepare_sleep' undeclared (first use in this function); did you mean 'acpi_os_enter_sleep'?
      62 |                 acpi_os_set_prepare_sleep(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_os_enter_sleep
   include/xen/acpi.h:62:17: note: each undeclared identifier is reported only once for each function it appears in
>> include/xen/acpi.h:64:17: error: implicit declaration of function 'acpi_os_set_prepare_extended_sleep'; did you mean 'acpi_os_set_prepare_sleep'? [-Werror=implicit-function-declaration]
      64 |                 acpi_os_set_prepare_extended_sleep(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_os_set_prepare_sleep
   include/xen/acpi.h:67:17: error: 'acpi_suspend_lowlevel' undeclared (first use in this function); did you mean 'xen_acpi_suspend_lowlevel'?
      67 |                 acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 xen_acpi_suspend_lowlevel
   cc1: some warnings being treated as errors


vim +/acpi_os_set_prepare_sleep +63 include/xen/acpi.h

068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  58  
268a207563f933 Liu Jinsong           2013-02-14  59  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  60  {
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  61  	if (xen_initial_domain()) {
268a207563f933 Liu Jinsong           2013-02-14 @62  		acpi_os_set_prepare_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30 @63  			&xen_acpi_notify_hypervisor_sleep);
be6b25d15f5e67 Ben Guthro            2013-07-30 @64  		acpi_os_set_prepare_extended_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  65  			&xen_acpi_notify_hypervisor_extended_sleep);
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  66  
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  67  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  68  	}
268a207563f933 Liu Jinsong           2013-02-14  69  }
818bdd39dbd468 Jiqian Chen           2024-03-28  70  int xen_pvh_passthrough_gsi(struct pci_dev *dev);
268a207563f933 Liu Jinsong           2013-02-14  71  #else
268a207563f933 Liu Jinsong           2013-02-14  72  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  73  {
268a207563f933 Liu Jinsong           2013-02-14  74  }
818bdd39dbd468 Jiqian Chen           2024-03-28  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
