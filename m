Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9D1C3F34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 17:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729619938; cv=none; b=mzdaUU9iHm+86bRlmZyr5egoWmq2rxZOOXB7gTFg4B9ZDSdGX6gUvsJXb2hvO03dqqL9VRG5bn0B+Lk0CSwm8i1bPYLCWOzeNEsoNT6Q5lB9cGUMQm6j81Pt1mYH0pLYh1kRGHsahgjnTnMsE17pBMbjdRLhIyWwhYNMt1UDS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729619938; c=relaxed/simple;
	bh=quw9IDU0L0rMtoOKma67ihbEXF87BKV/pqNVPpl0ebQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unn1+TRKrJqt0QbZCxLTSFE2yiIlSfMtiVn6YursqhamEvld0vc2ur4T3DIHy5gJyyuHbX8jPvKjgleEEL9lvTqlvtJn+V3JtQPk/GLmvJQaKBhXQ5B1MmIv9KhyaxdbanWWluPv9P3A+tQlwSsBkfEai2x2oegPOJNXNMo+h68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVcIR3kE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVcIR3kE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729619937; x=1761155937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quw9IDU0L0rMtoOKma67ihbEXF87BKV/pqNVPpl0ebQ=;
  b=FVcIR3kE6Sw91HTJPtoptDVAgRI2H7Dq2/tMfRy9+rSnpTglR8mXZzXb
   zhbd3RJCNQ93kXowm25vI6BeHxYK5UTT7ij7O5MJQ0FB1Cn4kFdxMLy4Q
   1+GermfUuUhek5ZOR1cEYJhKRV3KHwZ3Q/AcneAazH+B7jdmIqttxsq0+
   kCpw8WdHRhjTeBUpPoNsecH/OsBvNZxT+IVm05e+0zOva57T6TMDehuoV
   q8Cb2uSvQuGKK2ZZFF9v5W4Gu6UPKqiNzuOvukZabpA/eGou9SPuukmWy
   BlCaXBC3v4k1QPSs4d/2RfxVgsmhv65yz60NKKD3NgBOPnRDypBlxFXd9
   g==;
X-CSE-ConnectionGUID: 1rBH/hesQcybyds9xqvYTQ==
X-CSE-MsgGUID: ESEbvC2DTra2duWTrgdqag==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39754129"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39754129"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 10:58:56 -0700
X-CSE-ConnectionGUID: AI4wSxvfRwmLzlKijkkD8Q==
X-CSE-MsgGUID: 8EhcGiDnR8e1M38tNU7FFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79958475"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2024 10:58:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3J9e-000TuE-20;
	Tue, 22 Oct 2024 17:58:50 +0000
Date: Wed, 23 Oct 2024 01:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 353/2444]
 arch/x86/kernel/apic/x2apic_uv_x.c:654:10: error: 'struct apic' has no
 member named 'dest_logical'
Message-ID: <202410230101.aboXwQk2-lkp@intel.com>
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
commit: a1da309e870a12423d7e17373a738cdeb57fc4f9 [353/2444] x86/apic: Get rid of apic:: Dest_logical
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241023/202410230101.aboXwQk2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230101.aboXwQk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410230101.aboXwQk2-lkp@intel.com/

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
>> arch/x86/kernel/apic/x2apic_uv_x.c:654:10: error: 'struct apic' has no member named 'dest_logical'
     654 |         .dest_logical                   = APIC_DEST_LOGICAL,
         |          ^~~~~~~~~~~~


vim +654 arch/x86/kernel/apic/x2apic_uv_x.c

c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  643  
ac23d4ee3f84de3 arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  644  	.name				= "UV large system",
9ebd680bd029a9f arch/x86/kernel/apic/x2apic_uv_x.c Suresh Siddha      2011-05-19  645  	.probe				= uv_probe,
1b9b89e7f163336 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2008-07-21  646  	.acpi_madt_oem_check		= uv_acpi_madt_oem_check,
b7157acf429e6ae arch/x86/kernel/apic/x2apic_uv_x.c Steffen Persvold   2012-03-16  647  	.apic_id_valid			= uv_apic_id_valid,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  648  	.apic_id_registered		= uv_apic_id_registered,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  649  
f8987a1093cc7a8 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  650  	.irq_delivery_mode		= dest_Fixed,
7243e10689fd17a arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar        2017-01-14  651  	.irq_dest_mode			= 0, /* Physical */
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  652  
08125d3edab9064 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  653  	.disable_esr			= 0,
bdb1a9b62fc182d arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28 @654  	.dest_logical			= APIC_DEST_LOGICAL,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  655  	.check_apicid_used		= NULL,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  656  
5c520a6724e912a arch/x86/kernel/genx2apic_uv_x.c   Suresh Siddha      2008-07-10  657  	.init_apic_ldr			= uv_init_apic_ldr,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  658  
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  659  	.ioapic_phys_id_map		= NULL,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  660  	.setup_apic_routing		= NULL,
a21769a44618014 arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  661  	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  662  	.apicid_to_cpu_present		= NULL,
a27a621001f4c3e arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  663  	.check_phys_apicid_present	= default_check_phys_apicid_present,
d4c9a9f3d416cfa arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  664  	.phys_pkg_id			= uv_phys_pkg_id,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  665  
ca6c8ed4646f8cc arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  666  	.get_apic_id			= x2apic_get_apic_id,
f910a9dc7c86589 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2008-07-12  667  	.set_apic_id			= set_apic_id,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  668  
9f9e3bb1cf2ecba arch/x86/kernel/apic/x2apic_uv_x.c Thomas Gleixner    2017-09-13  669  	.calc_dest_apicid		= apic_uv_calc_apicid,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  670  
8642ea953d99fc0 arch/x86/kernel/apic/x2apic_uv_x.c Thomas Gleixner    2015-11-04  671  	.send_IPI			= uv_send_IPI_one,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  672  	.send_IPI_mask			= uv_send_IPI_mask,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  673  	.send_IPI_mask_allbutself	= uv_send_IPI_mask_allbutself,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  674  	.send_IPI_allbutself		= uv_send_IPI_allbutself,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  675  	.send_IPI_all			= uv_send_IPI_all,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  676  	.send_IPI_self			= uv_send_IPI_self,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  677  
1f5bcabf1b997d6 arch/x86/kernel/apic/x2apic_uv_x.c Ingo Molnar        2009-02-26  678  	.wakeup_secondary_cpu		= uv_wakeup_secondary,
c7967329911013a arch/x86/kernel/genx2apic_uv_x.c   Ingo Molnar        2009-01-28  679  	.inquire_remote_apic		= NULL,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  680  
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  681  	.read				= native_apic_msr_read,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  682  	.write				= native_apic_msr_write,
0ab711ae6ab0db7 arch/x86/kernel/apic/x2apic_uv_x.c Michael S. Tsirkin 2012-05-16  683  	.eoi_write			= native_apic_msr_eoi_write,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  684  	.icr_read			= native_x2apic_icr_read,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  685  	.icr_write			= native_x2apic_icr_write,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  686  	.wait_icr_idle			= native_x2apic_wait_icr_idle,
c1eeb2de41d7015 arch/x86/kernel/genx2apic_uv_x.c   Yinghai Lu         2009-02-16  687  	.safe_wait_icr_idle		= native_safe_x2apic_wait_icr_idle,
ac23d4ee3f84de3 arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  688  };
ac23d4ee3f84de3 arch/x86/kernel/genx2apic_uv_x.c   Jack Steiner       2008-03-28  689  

:::::: The code at line 654 was first introduced by commit
:::::: bdb1a9b62fc182d4da3143e346f7a0925d243352 x86, apic: rename genapic::apic_destination_logical to genapic::dest_logical

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
