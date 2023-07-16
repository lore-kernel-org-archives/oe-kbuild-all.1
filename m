Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7F161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 00:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689468910; x=1721004910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7gXkFxatZ9phKpqLCDcickLxQw/HJIKXj8f5diH6VM=;
  b=ewtmUJEtds5nvBif/WRgfk797Z9SdCcUIspST7t9PfzbgS8gJaxTZ+Ps
   RCdQFGzMmiIXv4ADVj6UL9FIYiMC9rHe7w9t+Ohj9Xf7HeyVEnDkA/bTs
   Jo/QdBGc6LwskwIVB6vv6UShjnfstsQXzzfajHBEmramS9kYqu+ZfIT0D
   aHtRF1khJR7TShM5PA1ykaWHVkM6ZRFBtPdaC/gahxtnlSxzzBNxbsyMu
   dZqdZCQuQ/eP2A8jNFsJX3aMhwHnDo981eZJTnDDpUHArQ63TefxkcgFw
   swnHk4NDfqqDGHs8bfZz3oaceUrgmpoVqLvOG853ymDrhmgtNhushCliv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="431889659"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="431889659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 17:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="812845924"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="812845924"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2023 17:55:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKq2V-0008R3-36;
	Sun, 16 Jul 2023 00:55:07 +0000
Date: Sun, 16 Jul 2023 08:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 35/38]
 arch/x86/kernel/apic/x2apic_uv_x.c:832:43: error: 'x2apic_send_IPI_self'
 undeclared here (not in a function); did you mean
 'apic_send_IPI_allbutself'?
Message-ID: <202307160818.03lcK3mZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   59df0262d2da163a8281c806688cc62e4d919908
commit: 5d748a4117e8c1f79e30d6c823589ebe5d1cf7a5 [35/38] x86/apic/x2apic: Share all common IPI functions
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230716/202307160818.03lcK3mZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160818.03lcK3mZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160818.03lcK3mZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/apic/x2apic_uv_x.c:832:43: error: 'x2apic_send_IPI_self' undeclared here (not in a function); did you mean 'apic_send_IPI_allbutself'?
     832 |         .send_IPI_self                  = x2apic_send_IPI_self,
         |                                           ^~~~~~~~~~~~~~~~~~~~
         |                                           apic_send_IPI_allbutself


vim +832 arch/x86/kernel/apic/x2apic_uv_x.c

   807	
   808		.name				= "UV large system",
   809		.probe				= uv_probe,
   810		.acpi_madt_oem_check		= uv_acpi_madt_oem_check,
   811	
   812		.delivery_mode			= APIC_DELIVERY_MODE_FIXED,
   813		.dest_mode_logical		= false,
   814	
   815		.disable_esr			= 0,
   816	
   817		.check_apicid_used		= NULL,
   818		.ioapic_phys_id_map		= NULL,
   819		.cpu_present_to_apicid		= default_cpu_present_to_apicid,
   820		.phys_pkg_id			= uv_phys_pkg_id,
   821	
   822		.get_apic_id			= x2apic_get_apic_id,
   823		.set_apic_id			= set_apic_id,
   824	
   825		.calc_dest_apicid		= apic_default_calc_apicid,
   826	
   827		.send_IPI			= uv_send_IPI_one,
   828		.send_IPI_mask			= uv_send_IPI_mask,
   829		.send_IPI_mask_allbutself	= uv_send_IPI_mask_allbutself,
   830		.send_IPI_allbutself		= uv_send_IPI_allbutself,
   831		.send_IPI_all			= uv_send_IPI_all,
 > 832		.send_IPI_self			= x2apic_send_IPI_self,
   833	
   834		.wakeup_secondary_cpu		= uv_wakeup_secondary,
   835	
   836		.read				= native_apic_msr_read,
   837		.write				= native_apic_msr_write,
   838		.eoi_write			= native_apic_msr_eoi_write,
   839		.icr_read			= native_x2apic_icr_read,
   840		.icr_write			= native_x2apic_icr_write,
   841	};
   842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
