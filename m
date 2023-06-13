Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17C3C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686659218; x=1718195218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QSrCVsg4BBlu70n2brTRpiGRcdAiKW5npgPZktwC8+g=;
  b=dS6y3xkE9athuhx2MNcCncc2BKvEkRzXLXAr9XS6EZvB2PjNEKPe0cLT
   hwpHgxk7IKlg+nmktwDEzvrWaQt+UE6+sU0pXnj+Urq0kVL1kIMJpq1lr
   Eyaa9pO10WrQPQ/ZbYpPDTmZBsxsD5JzxTAtPFZIuKkhjlv53DZrZROB0
   Xa1ToK7FSy2/6XMKk0PnlVSgoC99wldF94PUpcHyEvSbNVHo7lNiL+KR2
   FOnryKmsTOXM+0xJhyg0x+0Gc/Od0ydq2m3hbmFRaMgZNgVra+tAQBFSn
   BgLmbtNC/4VTvXo8OEaHB4x1i/yus4xEGJKrmAzPSvvyGqsqse1i9aFiZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="357192656"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="357192656"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 05:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711625859"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="711625859"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 05:26:55 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q936s-0001L2-1B;
	Tue, 13 Jun 2023 12:26:54 +0000
Date: Tue, 13 Jun 2023 20:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Avadhut Naik <Avadhut.Naik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/3] ACPI: APEI: EINJ: Add support for vendor
 defined error types
Message-ID: <202306132042.TcLMMRQd-lkp@intel.com>
References: <20230612215139.5132-4-Avadhut.Naik@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612215139.5132-4-Avadhut.Naik@amd.com>

Hi Avadhut,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.4-rc6 next-20230613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avadhut-Naik/ACPI-APEI-EINJ-Refactor-available_error_type_show/20230613-055420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230612215139.5132-4-Avadhut.Naik%40amd.com
patch subject: [RFC PATCH v3 3/3] ACPI: APEI: EINJ: Add support for vendor defined error types
config: x86_64-randconfig-s022-20230611 (https://download.01.org/0day-ci/archive/20230613/202306132042.TcLMMRQd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/9c7102f9dd11f4a4dde71e443eb91bf2cf9f4674
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Avadhut-Naik/ACPI-APEI-EINJ-Refactor-available_error_type_show/20230613-055420
        git checkout 9c7102f9dd11f4a4dde71e443eb91bf2cf9f4674
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/apei/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132042.TcLMMRQd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/apei/einj.c:195:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [toplevel] data @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:195:36: sparse:     expected void *static [toplevel] data
   drivers/acpi/apei/einj.c:195:36: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:210:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct vendor_error_type_extension *v @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:210:11: sparse:     expected struct vendor_error_type_extension *v
   drivers/acpi/apei/einj.c:210:11: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:219:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got struct vendor_error_type_extension *v @@
   drivers/acpi/apei/einj.c:219:29: sparse:     expected void [noderef] __iomem *virt
   drivers/acpi/apei/einj.c:219:29: sparse:     got struct vendor_error_type_extension *v
   drivers/acpi/apei/einj.c:245:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct set_error_type_with_address *v5param @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:245:25: sparse:     expected struct set_error_type_with_address *v5param
   drivers/acpi/apei/einj.c:245:25: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:255:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct einj_parameter *v4param @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:255:25: sparse:     expected struct einj_parameter *v4param
   drivers/acpi/apei/einj.c:255:25: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:259:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got struct einj_parameter *v4param @@
   drivers/acpi/apei/einj.c:259:45: sparse:     expected void [noderef] __iomem *virt
   drivers/acpi/apei/einj.c:259:45: sparse:     got struct einj_parameter *v4param
   drivers/acpi/apei/einj.c:326:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct acpi_einj_trigger *trigger_tab @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:326:21: sparse:     expected struct acpi_einj_trigger *trigger_tab
   drivers/acpi/apei/einj.c:326:21: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:352:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct acpi_einj_trigger *trigger_tab @@
   drivers/acpi/apei/einj.c:352:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/einj.c:352:17: sparse:     got struct acpi_einj_trigger *trigger_tab
   drivers/acpi/apei/einj.c:353:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct acpi_einj_trigger *trigger_tab @@     got void [noderef] __iomem * @@
   drivers/acpi/apei/einj.c:353:21: sparse:     expected struct acpi_einj_trigger *trigger_tab
   drivers/acpi/apei/einj.c:353:21: sparse:     got void [noderef] __iomem *
   drivers/acpi/apei/einj.c:416:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct acpi_einj_trigger *trigger_tab @@
   drivers/acpi/apei/einj.c:416:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/acpi/apei/einj.c:416:25: sparse:     got struct acpi_einj_trigger *trigger_tab
   drivers/acpi/apei/einj.c:817:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *static [assigned] [toplevel] einj_param @@
   drivers/acpi/apei/einj.c:817:37: sparse:     expected void [noderef] __iomem *virt
   drivers/acpi/apei/einj.c:817:37: sparse:     got void *static [assigned] [toplevel] einj_param
   drivers/acpi/apei/einj.c:819:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *virt @@     got void *static [addressable] [assigned] [toplevel] data @@
   drivers/acpi/apei/einj.c:819:58: sparse:     expected void [noderef] __iomem *virt
   drivers/acpi/apei/einj.c:819:58: sparse:     got void *static [addressable] [assigned] [toplevel] data

vim +195 drivers/acpi/apei/einj.c

   185	
   186	static void get_oem_vendor_struct(u64 paddr, int offset,
   187					  struct vendor_error_type_extension *v)
   188	{
   189		unsigned long vendor_size;
   190		u64 target_pa = paddr + offset + sizeof(struct vendor_error_type_extension);
   191	
   192		vendor_size = v->length - sizeof(struct vendor_error_type_extension);
   193	
   194		if (vendor_size)
 > 195			vendor_errors.data = acpi_os_map_iomem(target_pa, vendor_size);
   196	
   197		if (vendor_errors.data)
   198			vendor_errors.size = vendor_size;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
