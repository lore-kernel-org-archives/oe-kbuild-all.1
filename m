Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0E20F5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678081073; x=1709617073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwdcvOuOFap8/xAF5wORSecJ1mwGfcmKYi6yiLkynSg=;
  b=cmNDDiQ3iJ0SYPxubMkBTXMMouqiWvZaefHoTlUGZ//vydU5DaDcsBke
   ijaOr+Nd5Qgt70dBO2b0i1AuVor2+LkAWbO9kt1ph0ffhf2Ee4UHkLo/R
   aVPGTVbKreotU0w5WT/vS8yG+y7IXM4Cj+U1OSpevP1S7aHxo2gtj1FlG
   qnz9/KNinmcEWcLR29Mq5H6smgyBAHgemJxU5LUDkrSHKi/VSRuiZcuCt
   Fw9uAAFNXm/OsKUctzI/QUbfVKd//1dZoWsh0dDiRPkDEFfZ8UVCNpQxI
   kEwhe0BlH2gGxRza1qCa71lXUmhWExHo794gExc9glJvgbQJvk24VYWfP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398058540"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398058540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850177336"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="850177336"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Mar 2023 21:37:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ3Xg-00003n-1W;
	Mon, 06 Mar 2023 05:37:48 +0000
Date: Mon, 6 Mar 2023 13:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: drivers/acpi/acpica/tbfind.c:60:9: warning: 'strncpy' specified
 bound 6 equals destination size
Message-ID: <202303061307.1SmLWTQp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f ACPI: Don't build ACPICA with '-Os'
date:   6 weeks ago
config: arm64-randconfig-r036-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061307.1SmLWTQp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/acpi/acpica/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061307.1SmLWTQp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> drivers/acpi/acpica/tbfind.c:60:9: warning: 'strncpy' specified bound 6 equals destination size [-Wstringop-truncation]
      60 |         strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:61:9: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
      61 |         strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +60 drivers/acpi/acpica/tbfind.c

f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  16  
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  17  /*******************************************************************************
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  18   *
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  19   * FUNCTION:    acpi_tb_find_table
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  20   *
ba494beeaa69bc drivers/acpi/acpica/tbfind.c Bob Moore 2012-07-12  21   * PARAMETERS:  signature           - String with ACPI table signature
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  22   *              oem_id              - String with the table OEM ID
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  23   *              oem_table_id        - String with the OEM Table ID
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  24   *              table_index         - Where the table index is returned
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  25   *
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  26   * RETURN:      Status and table index
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  27   *
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  28   * DESCRIPTION: Find an ACPI table (in the RSDT/XSDT) that matches the
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  29   *              Signature, OEM ID and OEM Table ID. Returns an index that can
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  30   *              be used to get the table header or entire table.
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  31   *
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  32   ******************************************************************************/
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  33  acpi_status
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  34  acpi_tb_find_table(char *signature,
67a119f990063f drivers/acpi/tables/tbfind.c Bob Moore 2008-06-10  35  		   char *oem_id, char *oem_table_id, u32 *table_index)
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  36  {
ac0f06ebb815da drivers/acpi/acpica/tbfind.c Lv Zheng  2016-09-07  37  	acpi_status status = AE_OK;
47c08729bf1c60 drivers/acpi/tables/tbfind.c Lin Ming  2008-04-10  38  	struct acpi_table_header header;
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  39  	u32 i;
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  40  
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  41  	ACPI_FUNCTION_TRACE(tb_find_table);
f3d2e7865c8162 drivers/acpi/tables/tbfind.c Bob Moore 2007-02-02  42  
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  43  	/* Validate the input table signature */
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  44  
6a0df32c22fdfc drivers/acpi/acpica/tbfind.c Bob Moore 2016-05-05  45  	if (!acpi_ut_valid_nameseg(signature)) {
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  46  		return_ACPI_STATUS(AE_BAD_SIGNATURE);
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  47  	}
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  48  
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  49  	/* Don't allow the OEM strings to be too long */
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  50  
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  51  	if ((strlen(oem_id) > ACPI_OEM_ID_SIZE) ||
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  52  	    (strlen(oem_table_id) > ACPI_OEM_TABLE_ID_SIZE)) {
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  53  		return_ACPI_STATUS(AE_AML_STRING_LIMIT);
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  54  	}
9f41fd8a175ff8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-08-25  55  
47c08729bf1c60 drivers/acpi/tables/tbfind.c Lin Ming  2008-04-10  56  	/* Normalize the input strings */
47c08729bf1c60 drivers/acpi/tables/tbfind.c Lin Ming  2008-04-10  57  
4fa4616e279df8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-07-01  58  	memset(&header, 0, sizeof(struct acpi_table_header));
a3ce7a8e0dd9ba drivers/acpi/acpica/tbfind.c Bob Moore 2019-04-08  59  	ACPI_COPY_NAMESEG(header.signature, signature);
4fa4616e279df8 drivers/acpi/acpica/tbfind.c Bob Moore 2015-07-01 @60  	strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);

:::::: The code at line 60 was first introduced by commit
:::::: 4fa4616e279df89baeb36287bbee83ab272edaed ACPICA: De-macroize calls to standard C library functions

:::::: TO: Bob Moore <robert.moore@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
