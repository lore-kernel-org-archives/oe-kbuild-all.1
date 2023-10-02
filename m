Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3561B263
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696263174; x=1727799174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYuJs1gYkKcrwM0wELXfJkO3MeL0WTXUO8h7dbadLuY=;
  b=W91SQFRVsSZziSCBv2dkMlzvGhbzUCqTQu6nnll174UWRVEdWj38Hb8c
   sXuNn2iuppkQ5H/cJw8yDNeR/Za0g68vCyFM2hmEYSbDJk3Oz8u8dVYrA
   DHeL9dAcTk6KFjLpujb9tozcfXRMSpPIZrXx2oQfXEW+30ElddiMzTvYn
   udRkHjQg4CeN0UrXllEjh95q1j089kDKAbAb2HAcLzYR/DrQgp2GLYweM
   vOrLA2Mis0nRTWh3FyH+EGXRLptCYz5kmiUsmMUsDzr6OKAzlb7xOFgnG
   tEh5exiDwl0rS9ZlfYFMV/lq2N9esTxdrXv/cabsXc5VyoI6YzZpNCUo0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="381561967"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="381561967"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="750641991"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="750641991"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Oct 2023 09:11:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnLVg-0006BJ-2S;
	Mon, 02 Oct 2023 16:11:04 +0000
Date: Tue, 3 Oct 2023 00:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 1/13] arch/x86/kernel/acpi/boot.c:1302:
 undefined reference to `acpi_parse_mp_wake'
Message-ID: <202310030025.Kn90vDBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/tdx.git guest-kexec
head:   0f78bb55eb1bd3a27fafb5c404767c402a1cc37f
commit: f931c67d1bfd1f30fa3491c7387d82dd1235ab73 [1/13] x86/acpi: Extract ACPI MADT wakeup code into a separate file
config: x86_64-randconfig-005-20231002 (https://download.01.org/0day-ci/archive/20231003/202310030025.Kn90vDBg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310030025.Kn90vDBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310030025.Kn90vDBg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `acpi_process_madt':
>> arch/x86/kernel/acpi/boot.c:1302: undefined reference to `acpi_parse_mp_wake'
>> ld: arch/x86/kernel/acpi/boot.c:1302: undefined reference to `acpi_parse_mp_wake'


vim +1302 arch/x86/kernel/acpi/boot.c

cbf9bd603ab1fc4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-02-19  1271  
4be44fcd3bf648b arch/i386/kernel/acpi/boot.c Len Brown                  2005-08-05  1272  static void __init acpi_process_madt(void)
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1273  {
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1274  #ifdef CONFIG_X86_LOCAL_APIC
7f8f97c3cc75d57 arch/i386/kernel/acpi/boot.c Len Brown                  2007-02-10  1275  	int error;
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1276  
7f8f97c3cc75d57 arch/i386/kernel/acpi/boot.c Len Brown                  2007-02-10  1277  	if (!acpi_table_parse(ACPI_SIG_MADT, acpi_parse_madt)) {
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1278  
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1279  		/*
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1280  		 * Parse MADT LAPIC entries
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1281  		 */
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1282  		error = acpi_parse_madt_lapic_entries();
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1283  		if (!error) {
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1284  			acpi_lapic = 1;
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1285  
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1286  			/*
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1287  			 * Parse MADT IO-APIC entries
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1288  			 */
5da2fd261934330 arch/x86/kernel/acpi/boot.c  Jiang Liu                  2014-11-02  1289  			mutex_lock(&acpi_ioapic_lock);
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1290  			error = acpi_parse_madt_ioapic_entries();
5da2fd261934330 arch/x86/kernel/acpi/boot.c  Jiang Liu                  2014-11-02  1291  			mutex_unlock(&acpi_ioapic_lock);
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1292  			if (!error) {
2f065aef17b8d50 arch/x86/kernel/acpi/boot.c  Jeremy Fitzhardinge        2010-06-24  1293  				acpi_set_irq_model_ioapic();
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1294  
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1295  				smp_found_config = 1;
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1296  			}
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1297  
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1298  #ifdef CONFIG_X86_64
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1299  			/*
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1300  			 * Parse MADT MP Wake entry.
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1301  			 */
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06 @1302  			acpi_table_parse_madt(ACPI_MADT_TYPE_MULTIPROC_WAKEUP,
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1303  					      acpi_parse_mp_wake, 1);
f39642d0dbacded arch/x86/kernel/acpi/boot.c  Kuppuswamy Sathyanarayanan 2022-04-06  1304  #endif
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1305  		}
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1306  		if (error == -EINVAL) {
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1307  			/*
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1308  			 * Dell Precision Workstation 410, 610 come here.
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1309  			 */
14fad24d0520c65 arch/x86/kernel/acpi/boot.c  Heiner Kallweit            2021-05-13  1310  			pr_err("Invalid BIOS MADT, disabling ACPI\n");
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1311  			disable_acpi();
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1312  		}
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1313  	} else {
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1314  		/*
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1315   		 * ACPI found no MADT, and so ACPI wants UP PIC mode.
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1316   		 * In the event an MPS table was found, forget it.
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1317   		 * Boot with "acpi=off" to use MPS on such a system.
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1318   		 */
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1319  		if (smp_found_config) {
14fad24d0520c65 arch/x86/kernel/acpi/boot.c  Heiner Kallweit            2021-05-13  1320  			pr_warn("No APIC-table, disabling MPS\n");
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1321  			smp_found_config = 0;
7b37b5fd9ba32c0 arch/x86/kernel/acpi/boot.c  Len Brown                  2008-12-23  1322  		}
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1323  	}
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1324  
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1325  	/*
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1326  	 * ACPI supports both logical (e.g. Hyper-Threading) and physical
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1327  	 * processors, where MPS only supports physical.
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1328  	 */
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1329  	if (acpi_lapic && acpi_ioapic)
14fad24d0520c65 arch/x86/kernel/acpi/boot.c  Heiner Kallweit            2021-05-13  1330  		pr_info("Using ACPI (MADT) for SMP configuration information\n");
69b88afa8d114a4 arch/x86/kernel/acpi/boot.c  Yinghai Lu                 2008-12-05  1331  	else if (acpi_lapic)
14fad24d0520c65 arch/x86/kernel/acpi/boot.c  Heiner Kallweit            2021-05-13  1332  		pr_info("Using ACPI for processor (LAPIC) configuration information\n");
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1333  #endif
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1334  	return;
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1335  }
^1da177e4c3f415 arch/i386/kernel/acpi/boot.c Linus Torvalds             2005-04-16  1336  

:::::: The code at line 1302 was first introduced by commit
:::::: f39642d0dbacded8b4a816a9197a73efb74e5702 x86/acpi/x86/boot: Add multiprocessor wake-up support

:::::: TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
