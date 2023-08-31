Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A131848E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693486012; x=1725022012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UFqqQnRZWBBeOsXbtHWbMNezXxe9xAdueB3kQuAsM6E=;
  b=S0WdNSbQ0K9PK2eCtzwqnyOX9WyI3y0D2wnXosmK2M9fvRktT28vGXYA
   JyosAgs4jd94OP6CdvhrHyD58ZeTbr0mnOOfgyS9jNfw1ZpXyufqL72U3
   HTFNzm4NMCx6RM4IUZbPQMKunrBB5Bs9ONjNq+AFqEynpv3BurjkIbf7I
   aNGcueQVOgHcTX48rkvt2vYHMZLC6nAWg7a1OsK/nGagcCnUOnnmvG7gc
   37KkT0q6//oZ0LbrtcvS7kbbEQn/49oo+pA+iJZ/NOcgSQrbqsIu+Y6Lh
   Fkx5kBfV+Ygmg9fWBIrcqoLahF/wAi7reMQfuCxbdgvZ1edzHJzvY2X5C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373328823"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="373328823"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 05:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739505265"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="739505265"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Aug 2023 05:46:49 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbh4R-00009F-2J;
	Thu, 31 Aug 2023 12:46:47 +0000
Date: Thu, 31 Aug 2023 20:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 12689/24604]
 drivers/net/ethernet/freescale/fman/fman.c:3088:36: warning: unused variable
 'acpi_fman_match'
Message-ID: <202308312024.bQVxeIXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi AnjanaSuraj,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: 5f3e57ee3413982ad7e827756fdd4f59ef5ffe46 [12689/24604] fsl/fman: add FMan ACPI support
config: powerpc-randconfig-r023-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312024.bQVxeIXl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312024.bQVxeIXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312024.bQVxeIXl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fman/fman.c:2721:39: warning: variable 'fw_fmnode' set but not used [-Wunused-but-set-variable]
           struct fwnode_handle *fwnode_muram, *fw_fmnode;
                                                ^
>> drivers/net/ethernet/freescale/fman/fman.c:3088:36: warning: unused variable 'acpi_fman_match' [-Wunused-const-variable]
   static const struct acpi_device_id acpi_fman_match[] = {
                                      ^
   2 warnings generated.


vim +/acpi_fman_match +3088 drivers/net/ethernet/freescale/fman/fman.c

  3087	
> 3088	static const struct acpi_device_id acpi_fman_match[] = {
  3089		{"NXP0024", 0}
  3090	};
  3091	MODULE_DEVICE_TABLE(acpi, acpi_fman_match);
  3092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
