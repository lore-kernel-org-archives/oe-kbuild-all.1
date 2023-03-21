Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2418B10780
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679434136; x=1710970136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OlMKGsReP3yBAxNCOgTXpoVcRq5z9syfFoXP9dOwEgM=;
  b=AykRE29t5rydarr+eUfMqrOLszOwOX9qt9IMXF88U7WUCa4EVdN9fCpM
   wJHCWRueCzRuEgui3HfIBw5OodnRP9z4gE3WWay2WCFseDdVLHUWUK7B2
   AlPMNk7oqExMQsFp0/hQx6LFSBg4zlIvZwM2ZlCR/2LXvBrQg1ht6dZWR
   sYN/PgK0qzj1w9Bp2oojeDXUBpn4AuOwVb9zZXIGAJHhhtghqa3EYoixL
   tgZpHd0Snya8WZ9lytjUpwXiVOkeqvw+pCHwSmkWTZ0+r3g9Vz+1hw9W3
   nhpwyVB+JvrHUSJ7UivzpDISidVZJNF3aNLn9LDHWTTUSiUKUW5JRNviP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340600048"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="340600048"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 14:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="711981303"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="711981303"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2023 14:28:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pejXK-000CRA-0c;
	Tue, 21 Mar 2023 21:28:54 +0000
Date: Wed, 22 Mar 2023 05:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yu-chen-surf:mpwr 2/3] drivers/acpi/pfmpwr.c:34:5: warning: no
 previous prototype for 'acpi_start_mpwr'
Message-ID: <202303220508.LTe2mlyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yu-chen-surf/linux.git mpwr
head:   80aa49b502f08ecb466234e78efef54cedd7d5f3
commit: 7059eafc78bc7a62f8242255e88ff7026cc96560 [2/3] ACPI: Introduce Platform Firmware Memory Preserve Warm Reset driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303220508.LTe2mlyA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/yu-chen-surf/linux/commit/7059eafc78bc7a62f8242255e88ff7026cc96560
        git remote add yu-chen-surf https://github.com/yu-chen-surf/linux.git
        git fetch --no-tags yu-chen-surf mpwr
        git checkout 7059eafc78bc7a62f8242255e88ff7026cc96560
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220508.LTe2mlyA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/pfmpwr.c:34:5: warning: no previous prototype for 'acpi_start_mpwr' [-Wmissing-prototypes]
      34 | int acpi_start_mpwr(void)
         |     ^~~~~~~~~~~~~~~
>> drivers/acpi/pfmpwr.c:43:5: warning: no previous prototype for 'acpi_mpwr_suspend' [-Wmissing-prototypes]
      43 | int acpi_mpwr_suspend(void *data)
         |     ^~~~~~~~~~~~~~~~~


vim +/acpi_start_mpwr +34 drivers/acpi/pfmpwr.c

    33	
  > 34	int acpi_start_mpwr(void)
    35	{
    36		efi.reset_system(EFI_RESET_PLATFORM_SPECIFIC, EFI_SUCCESS,
    37				sizeof(mpwr_data) + 1 + sizeof(guid_t),
    38				(efi_char16_t *)&mpwr_data);
    39	
    40		return 0;
    41	}
    42	
  > 43	int acpi_mpwr_suspend(void *data)
    44	{
    45		return acpi_suspend_lowlevel();
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
