Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE7B15BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 01:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679534783; x=1711070783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IU2WmXgC/7JP8q7+cH5YagdszJXHAsq9qVtFDzDLQi8=;
  b=EbD+BfwTGyj3UO04D6ykZIkHJb+YQscyrOcfRTGvcsLb+wzfcAPhUHnU
   e0F10mGtFo+hde4TQWVbCcKhEmiPgm/r8fbkYtPybcILdDhDP4AWU++Y3
   Wv3hUeeaqZ0kB0U44Ytk+w8nPYcRITZMKH4LbI9KKvzezMt3CAX4La1b/
   fJObV9O89/X919t+NAWDVpU48buWvQasTGLlogan6fJ3KMqBymifWJPJM
   +vTmoy8jqCI+FzhPOGgzUxlz8NblHywbjSO5k+crwcgQ3KCFlJWi4T8Y/
   7EOq5khHkQdy0WVI6DHXVJvxvDIa/quPWfD128uouKZp8FoNUOjhJv5vK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338090478"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="338090478"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 18:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659390572"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="659390572"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 18:26:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf9iN-000DoM-07;
	Thu, 23 Mar 2023 01:26:03 +0000
Date: Thu, 23 Mar 2023 09:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: drivers/acpi/acpica/tbfind.c:60:9: error: 'strncpy' specified bound
 6 equals destination size
Message-ID: <202303230903.Wi6Knuqq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: 8f9e0a52810dd83406c768972d022c37e7a18f1f ACPI: Don't build ACPICA with '-Os'
date:   8 weeks ago
config: x86_64-sof-customedconfig-fuzz-defconfig (https://download.01.org/0day-ci/archive/20230323/202303230903.Wi6Knuqq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f9e0a52810dd83406c768972d022c37e7a18f1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f9e0a52810dd83406c768972d022c37e7a18f1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230903.Wi6Knuqq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/acpica/tbfind.c: In function 'acpi_tb_find_table':
>> drivers/acpi/acpica/tbfind.c:60:9: error: 'strncpy' specified bound 6 equals destination size [-Werror=stringop-truncation]
      60 |         strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/acpica/tbfind.c:61:9: error: 'strncpy' specified bound 8 equals destination size [-Werror=stringop-truncation]
      61 |         strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
