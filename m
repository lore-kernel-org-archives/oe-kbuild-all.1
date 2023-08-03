Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA623D3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 05:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691039098; x=1722575098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSscHVZrYzS7Yadu/+CuaT/mEgWDWGRaO+6C61H7Cfw=;
  b=M0bejjk6TgxL47Oq9iQfv0MEMKdYGE+pczYD2zv0e4t25bEsSDTDvLqc
   y4R51FPQ4vFvfrAmq/ximquRnE5f8mVZzFjq9MSucWH5vW/ZY1jqAw1gF
   sDozsZRBZ2zUCqiTZQWvolaxDfgfGta6cMY4YOHfaUwZbHBoKzlFnh+/f
   XpNe3FuNX9vuzNZqFIzK/uhrmhQ1Zuh/AfrWEwtry6MF0mZB5UbsH1y9o
   lkAsIB3NMB5mu0+NESjsuIQAc0hX7nmgQnKIRsdCYdD9yRQbZvFxwq/xT
   Ea0b3g6NoX/fndAE042jqGjFs1AH1oY6gmStO8QQQ5qV0e4SO0SI/QA6J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349367538"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="349367538"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 22:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="679347872"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="679347872"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Aug 2023 22:04:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRQW5-0001lD-2D;
	Thu, 03 Aug 2023 05:04:53 +0000
Date: Thu, 3 Aug 2023 13:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	Iain Lane <iain@orangesquash.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v8 2/2] PCI/ACPI: Use device constraints instead of dates
 to opt devices into D3
Message-ID: <202308031243.Mmwm1IHI-lkp@intel.com>
References: <20230802201013.910-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802201013.910-3-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on pci/next pci/for-linus westeri-thunderbolt/next linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-comments-to-clarify-some-ifdef-statements/20230803-041214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230802201013.910-3-mario.limonciello%40amd.com
patch subject: [PATCH v8 2/2] PCI/ACPI: Use device constraints instead of dates to opt devices into D3
config: i386-randconfig-i005-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031243.Mmwm1IHI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031243.Mmwm1IHI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031243.Mmwm1IHI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/pci-acpi.o: in function `acpi_pci_device_constraint_d3':
>> drivers/pci/pci-acpi.c:1055: undefined reference to `acpi_get_lps0_constraint'


vim +1055 drivers/pci/pci-acpi.c

  1045	
  1046	/*
  1047	 * acpi_pci_device_constraint_d3 - determine if device constraints require D3
  1048	 * @dev: PCI device to check
  1049	 *
  1050	 * Returns true if the PEP constraints for the device is enabled and
  1051	 * requires D3.
  1052	 */
  1053	bool acpi_pci_device_constraint_d3(struct pci_dev *dev)
  1054	{
> 1055		int constraint = acpi_get_lps0_constraint(&dev->dev);
  1056	
  1057		if (constraint < 0) {
  1058			pci_dbg(dev, "ACPI device constraint not present\n");
  1059			return false;
  1060		}
  1061	
  1062		return constraint >= 3;
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
