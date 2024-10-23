Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524481A08C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678611; cv=none; b=QrtOymfmQNy37oP7db6tyUOcqbNclmvdbdeDFcMX882nTm5h7buW4hNPa4sdxIenUy6Z+9CmvraYLKEyOHThsqlXHVyilku/oRVg+s5GIDqaD/oFL4JPCP/4sdFUmMWJqruZdL2KlXg7LXTO7asRLpmAGNzcQKcbnh4zCfvc558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678611; c=relaxed/simple;
	bh=+8cgeWq+e9LOnjCl3UrpAcro7AO0AxMhoGFn+WJspNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grtJcQZm3yxkaSsk13zKggYm3PtAUEebJwcbVoPfNVLwc1lcGAwampx2zjX/uGYOQaTM9yHqcMSVToTdfm2La8yubHxT2cIHdgdRB6WE62TVxTxKVGB3mC/x7jIaukhf6zigL+hRWZT8zV+UI7KCQYE04uWOOr3G+9jRi8geAY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iV5SxxJt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iV5SxxJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678609; x=1761214609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8cgeWq+e9LOnjCl3UrpAcro7AO0AxMhoGFn+WJspNU=;
  b=iV5SxxJtmsUbs74Il4tsDdCDnS2vnJrOl5c16mqBPa84YhKvdt1wkfI5
   /If8ntcxWzsK4uBNACmYX4OT+3QsBOGTutvKUO/p0r5T0Wm3eVeuYVgQz
   cKPWIBepDwuE8yOOReEvwTz5cWEyMP2JfwQ8S5Ku4rYin49B5ew9n8eZx
   lF7TUqqRYRTosstH+XAmInbeKBpOPA5ps0h+dnt8AJ1wS4eacjcqBIcnZ
   yw2gR9tPNsrn326sK8tI8zb1R315soq36X/2amYRS/OevCFZhDfU0cR/9
   oIhnXAR/AgllRGkHGBrzPycC6tXnlRECOnKoxHC4NEyIbx2HeeSAcI3nd
   A==;
X-CSE-ConnectionGUID: mDPDY3cGQkaDgEHcKO6Ekw==
X-CSE-MsgGUID: gZNADbrpQ52ZdMJbJ8HA1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29418155"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29418155"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:16:48 -0700
X-CSE-ConnectionGUID: XVS8YDZ7QrSxoq4ahi60pg==
X-CSE-MsgGUID: +vLlpwIdQGKqsP6B4/udxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80229418"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2024 03:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3YPy-000Uma-1m;
	Wed, 23 Oct 2024 10:16:42 +0000
Date: Wed, 23 Oct 2024 18:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 356/2444]
 arch/x86/kernel/apic/x2apic_uv_x.c:651:10: error: 'struct apic' has no
 member named 'irq_dest_mode'
Message-ID: <202410231800.fKBMowtp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 087c745a1bb9eb1b336a8414b89858cb1949a72c [356/2444] x86/apic: Cleanup destination mode
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241023/202410231800.fKBMowtp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231800.fKBMowtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231800.fKBMowtp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/apic/x2apic_uv_x.c:20:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
   arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/kernel/apic/x2apic_uv_x.c: At top level:
   arch/x86/kernel/apic/x2apic_uv_x.c:650:10: error: 'struct apic' has no member named 'irq_delivery_mode'; did you mean 'delivery_mode'?
     650 |         .irq_delivery_mode              = dest_Fixed,
         |          ^~~~~~~~~~~~~~~~~
         |          delivery_mode
   arch/x86/kernel/apic/x2apic_uv_x.c:650:43: error: 'dest_Fixed' undeclared here (not in a function)
     650 |         .irq_delivery_mode              = dest_Fixed,
         |                                           ^~~~~~~~~~
>> arch/x86/kernel/apic/x2apic_uv_x.c:651:10: error: 'struct apic' has no member named 'irq_dest_mode'
     651 |         .irq_dest_mode                  = 0, /* Physical */
         |          ^~~~~~~~~~~~~
   arch/x86/kernel/apic/x2apic_uv_x.c:654:10: error: 'struct apic' has no member named 'dest_logical'; did you mean 'dest_mode_logical'?
     654 |         .dest_logical                   = APIC_DEST_PHYSICAL,
         |          ^~~~~~~~~~~~
         |          dest_mode_logical
   arch/x86/kernel/apic/x2apic_uv_x.c:657:43: warning: initialized field overwritten [-Woverride-init]
     657 |         .init_apic_ldr                  = uv_init_apic_ldr,
         |                                           ^~~~~~~~~~~~~~~~
   arch/x86/kernel/apic/x2apic_uv_x.c:657:43: note: (near initialization for 'apic_x2apic_uv_x.init_apic_ldr')
--
   In file included from arch/x86/platform/uv/uv_irq.c:19:
   arch/x86/include/asm/uv/uv_hub.h: In function 'uv_hub_send_ipi':
   arch/x86/include/asm/uv/uv_hub.h:892:31: error: 'dest_Fixed' undeclared (first use in this function)
     892 |         unsigned long dmode = dest_Fixed;
         |                               ^~~~~~~~~~
   arch/x86/include/asm/uv/uv_hub.h:892:31: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/include/asm/uv/uv_hub.h:895:25: error: 'dest_NMI' undeclared (first use in this function)
     895 |                 dmode = dest_NMI;
         |                         ^~~~~~~~
   arch/x86/platform/uv/uv_irq.c: In function 'uv_program_mmr':
   arch/x86/platform/uv/uv_irq.c:38:41: error: 'struct apic' has no member named 'irq_delivery_mode'; did you mean 'delivery_mode'?
      38 |         entry->delivery_mode    = apic->irq_delivery_mode;
         |                                         ^~~~~~~~~~~~~~~~~
         |                                         delivery_mode
>> arch/x86/platform/uv/uv_irq.c:39:39: error: 'struct apic' has no member named 'irq_dest_mode'
      39 |         entry->dest_mode        = apic->irq_dest_mode;
         |                                       ^~


vim +651 arch/x86/kernel/apic/x2apic_uv_x.c

c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  643  
ac23d4ee3f84de arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  644  	.name				= "UV large system",
9ebd680bd029a9 arch/x86/kernel/apic/x2apic_uv_x.c Suresh Siddha      2011-05-19  645  	.probe				= uv_probe,
1b9b89e7f16333 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2008-07-21  646  	.acpi_madt_oem_check		= uv_acpi_madt_oem_check,
b7157acf429e6a arch/x86/kernel/apic/x2apic_uv_x.c Steffen Persvold   2012-03-16  647  	.apic_id_valid			= uv_apic_id_valid,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  648  	.apic_id_registered		= uv_apic_id_registered,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  649  
f8987a1093cc7a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  650  	.irq_delivery_mode		= dest_Fixed,
7243e10689fd17 arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar        2017-01-14 @651  	.irq_dest_mode			= 0, /* Physical */
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  652  
08125d3edab906 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  653  	.disable_esr			= 0,
beb4ec1386ed5b arch/x86/kernel/apic/x2apic_uv_x.c Thomas Gleixner    2020-10-24  654  	.dest_logical			= APIC_DEST_PHYSICAL,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  655  	.check_apicid_used		= NULL,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  656  
5c520a6724e912 arch/x86/kernel/genx2apic_uv_x.c   Suresh Siddha      2008-07-10  657  	.init_apic_ldr			= uv_init_apic_ldr,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  658  
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  659  	.ioapic_phys_id_map		= NULL,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  660  	.setup_apic_routing		= NULL,
a21769a4461801 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  661  	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  662  	.apicid_to_cpu_present		= NULL,
a27a621001f4c3 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  663  	.check_phys_apicid_present	= default_check_phys_apicid_present,
d4c9a9f3d416cf arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  664  	.phys_pkg_id			= uv_phys_pkg_id,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  665  
ca6c8ed4646f8c arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  666  	.get_apic_id			= x2apic_get_apic_id,
f910a9dc7c8658 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2008-07-12  667  	.set_apic_id			= set_apic_id,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  668  
9f9e3bb1cf2ecb arch/x86/kernel/apic/x2apic_uv_x.c Thomas Gleixner    2017-09-13  669  	.calc_dest_apicid		= apic_uv_calc_apicid,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  670  
8642ea953d99fc arch/x86/kernel/apic/x2apic_uv_x.c Thomas Gleixner    2015-11-04  671  	.send_IPI			= uv_send_IPI_one,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  672  	.send_IPI_mask			= uv_send_IPI_mask,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  673  	.send_IPI_mask_allbutself	= uv_send_IPI_mask_allbutself,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  674  	.send_IPI_allbutself		= uv_send_IPI_allbutself,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  675  	.send_IPI_all			= uv_send_IPI_all,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  676  	.send_IPI_self			= uv_send_IPI_self,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  677  
1f5bcabf1b997d arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar        2009-02-26  678  	.wakeup_secondary_cpu		= uv_wakeup_secondary,
c7967329911013 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  679  	.inquire_remote_apic		= NULL,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  680  
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  681  	.read				= native_apic_msr_read,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  682  	.write				= native_apic_msr_write,
0ab711ae6ab0db arch/x86/kernel/apic/x2apic_uv_x.c Michael S. Tsirkin 2012-05-16  683  	.eoi_write			= native_apic_msr_eoi_write,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  684  	.icr_read			= native_x2apic_icr_read,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  685  	.icr_write			= native_x2apic_icr_write,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  686  	.wait_icr_idle			= native_x2apic_wait_icr_idle,
c1eeb2de41d701 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  687  	.safe_wait_icr_idle		= native_safe_x2apic_wait_icr_idle,
ac23d4ee3f84de arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  688  };
ac23d4ee3f84de arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  689  

:::::: The code at line 651 was first introduced by commit
:::::: 7243e10689fd17a3e151f41216569295cefa2958 x86/platform/UV: Clean up the UV APIC code

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
