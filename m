Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD20AD5A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721289635; cv=none; b=BrXz5f680xHYJ3cnKql21oidOtYrFGKyhwOC98IcvBhWlegEVtuYAoRggXSSIfoz60HSVthv3Wo1hcV1rufmn82oRSTN4gXxC9pquH/qnf473Av1m5Qw3rYMgDvB1nlFNwTnF8CsrGRfFo1+BkcvmjYfr5YZOBbcaIu9bN3qWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721289635; c=relaxed/simple;
	bh=TKGRJbOU3tO+rJ/GvasSMDpxL1Dns4wN9iuXHleuQCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3wVF21AFhFYJb2kp01WYAaeEXy5q1naD6EvOZpkoPl/4qXX5sxg6N7QdOqJFhFV4pP2MGlvfQTkG+hQoJtb86svXPsnF3jPJpqmPDOx3LdxvrFTSUr6x3cXgF07klx9zd7tn29w+50e511bnfxjinMFujVZoFl/75vVhLQSkic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJzlZjsE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJzlZjsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721289633; x=1752825633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKGRJbOU3tO+rJ/GvasSMDpxL1Dns4wN9iuXHleuQCc=;
  b=aJzlZjsE7jLZ3KD2t9YT6Ji8IGEBFz+/D/7psQzrQBSqs/fTD+EYl7OM
   rhxm0nC9KrjIwOor2N+jO7nPnaisY/giGWb/82xrKZxpEZgIBs2BvAjRu
   46yxI8dTfsBXpi5RD1m90OUhQJRQ3w7OKRkM0I7erZW/wETVtnfPATZV2
   j2yvlT/wOhL1ngxdaRFypNL2Yj0j5olmjsaG5lQsDbZBx3mp79fKqOyNn
   MjtrIZsDHyTYAErUthqF0o32D8zq8qW4ug0TpKs6WOJh2IOpIOAXRox9N
   nSRgj7fGnDbuZMmTrnppmDy6+uTo8w2eiSsmhP+ZJthdViVUA6a0+svOm
   g==;
X-CSE-ConnectionGUID: b94C02xVSFKXnO9jO7xWKQ==
X-CSE-MsgGUID: Qlwjb1qUR6u+nsqCmMNcZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29506793"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="29506793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 01:00:31 -0700
X-CSE-ConnectionGUID: nqVrSKPxQVCc99ZV8TjOsA==
X-CSE-MsgGUID: Jj6pS1KoT1GQFgn6vi1UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="73914009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2024 01:00:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUM3v-000h4o-31;
	Thu, 18 Jul 2024 08:00:27 +0000
Date: Thu, 18 Jul 2024 16:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 84/86]
 drivers/media/platform/qcom/venus/pm_helpers.c:875:8: error: call to
 undeclared function 'devm_pm_domain_attach_list'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202407181507.0pT9t5se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   22e716620cdb9912603edf51c8bee9f4fa5bb4a4
commit: 91ac04979220e4668960ebd896ab55b8b6f68633 [84/86] media: venus: use device managed APIs for power domains
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240718/202407181507.0pT9t5se-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181507.0pT9t5se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181507.0pT9t5se-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/qcom/venus/pm_helpers.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/media/platform/qcom/venus/pm_helpers.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/platform/qcom/venus/pm_helpers.c:9:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/media/platform/qcom/venus/pm_helpers.c:11:
   In file included from include/linux/pm_domain.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/venus/pm_helpers.c:875:8: error: call to undeclared function 'devm_pm_domain_attach_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     875 |         ret = devm_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
         |               ^
   drivers/media/platform/qcom/venus/pm_helpers.c:875:8: note: did you mean 'dev_pm_domain_attach_list'?
   include/linux/pm_domain.h:483:19: note: 'dev_pm_domain_attach_list' declared here
     483 | static inline int dev_pm_domain_attach_list(struct device *dev,
         |                   ^
   17 warnings and 1 error generated.


vim +/devm_pm_domain_attach_list +875 drivers/media/platform/qcom/venus/pm_helpers.c

   859	
   860	static int vcodec_domains_get(struct venus_core *core)
   861	{
   862		int ret;
   863		struct device **opp_virt_dev;
   864		struct device *dev = core->dev;
   865		const struct venus_resources *res = core->res;
   866		struct dev_pm_domain_attach_data vcodec_data = {
   867			.pd_names = res->vcodec_pmdomains,
   868			.num_pd_names = res->vcodec_pmdomains_num,
   869			.pd_flags = PD_FLAG_NO_DEV_LINK,
   870		};
   871	
   872		if (!res->vcodec_pmdomains_num)
   873			goto skip_pmdomains;
   874	
 > 875		ret = devm_pm_domain_attach_list(dev, &vcodec_data, &core->pmdomains);
   876		if (ret < 0)
   877			return ret;
   878	
   879	skip_pmdomains:
   880		if (!core->res->opp_pmdomain)
   881			return 0;
   882	
   883		/* Attach the power domain for setting performance state */
   884		ret = devm_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
   885		if (ret)
   886			goto opp_attach_err;
   887	
   888		core->opp_pmdomain = *opp_virt_dev;
   889		core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
   890						     DL_FLAG_RPM_ACTIVE |
   891						     DL_FLAG_PM_RUNTIME |
   892						     DL_FLAG_STATELESS);
   893		if (!core->opp_dl_venus) {
   894			ret = -ENODEV;
   895			goto opp_attach_err;
   896		}
   897	
   898		return 0;
   899	
   900	opp_attach_err:
   901		return ret;
   902	}
   903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
