Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178404C75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692787381; x=1724323381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rc95xX+GDnJdeSJsZ3g3e1zHTT1BjiR4vbecv6k+Kko=;
  b=A5e3+2U0EtlbGCqouM0UxatqoDcuuAVRknRzvNx9WdVcZcr9aaOPOYGG
   VASqarndz7rVXau7P+fYszZsPjGaInzlEypwhR79uFbH0UsoP1R6gT95F
   UbWmpCAiDnDLVGJj9vAoRbXf8Sf9DShnb0/fwO2DOYyaSH73fXXYmp+id
   JAINU6Adf3Ti1fvX0pz3FOpmXtqg97/UU1IbH2gxcels47BZ0/nVm4HKM
   JCgOelrp8cep0c7B9f/kNBdzu3jj6IB20veaQBQzeqKkKNhfeJp4MHceE
   u4WGvUrwWH6VWPqFiuZUYQPzpgYG5jCRFnZUvZtZXbk7jt/wrhoCl4kAb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460496307"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460496307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 03:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="771683536"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="771683536"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Aug 2023 03:42:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYlKD-000170-2U;
	Wed, 23 Aug 2023 10:42:57 +0000
Date: Wed, 23 Aug 2023 18:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 1/8] arch/x86/kernel/acpi/boot.c:1186:9:
 error: implicit declaration of function 'cpu_hotplug_not_supported'
Message-ID: <202308231852.HjDhISBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   7d7a8fcef30fe2515b3cce811bd7b96a14e2a75f
commit: 602cc233a076ee5e78eb0bf5bc5e0519ecc15676 [1/8] cpu/hotplug, x86/acpi: Disable CPU hotplug for ACPI MADT wakeup
config: x86_64-randconfig-002-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231852.HjDhISBA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231852.HjDhISBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231852.HjDhISBA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/acpi/boot.c: In function 'acpi_parse_mp_wake':
>> arch/x86/kernel/acpi/boot.c:1186:9: error: implicit declaration of function 'cpu_hotplug_not_supported' [-Werror=implicit-function-declaration]
    1186 |         cpu_hotplug_not_supported();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_hotplug_not_supported +1186 arch/x86/kernel/acpi/boot.c

  1167	
  1168	#ifdef CONFIG_X86_64
  1169	static int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
  1170					     const unsigned long end)
  1171	{
  1172		struct acpi_madt_multiproc_wakeup *mp_wake;
  1173	
  1174		if (!IS_ENABLED(CONFIG_SMP))
  1175			return -ENODEV;
  1176	
  1177		mp_wake = (struct acpi_madt_multiproc_wakeup *)header;
  1178		if (BAD_MADT_ENTRY(mp_wake, end))
  1179			return -EINVAL;
  1180	
  1181		acpi_table_print_madt_entry(&header->common);
  1182	
  1183		acpi_mp_wake_mailbox_paddr = mp_wake->base_address;
  1184	
  1185		/* Disable CPU onlining/offlining */
> 1186		cpu_hotplug_not_supported();
  1187	
  1188		acpi_wake_cpu_handler_update(acpi_wakeup_cpu);
  1189	
  1190		return 0;
  1191	}
  1192	#endif				/* CONFIG_X86_64 */
  1193	#endif				/* CONFIG_X86_LOCAL_APIC */
  1194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
