Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C02AE90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 20:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729976010; cv=none; b=Zq/u7MP9Kft9mMw361rcod6zOAx29ugUvHeWE567+M4XOQsSJ/jbQ/7+yvmo9nDAMYPjXVocrsYlTp9FiUtGA1J7QvWrs6a3aTcU7ZGsoYw9WLkeaaOIkLt+3aS1gxtSPKi7g4YS4fGHjxIWP0IfO204xBoZ3eV4qFl30LMt3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729976010; c=relaxed/simple;
	bh=E1hFkzhzVRrHzEkIZxKIvrwuQ6goUdSoABNtwl4BIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o70wvPcDeaynO95ZDJH8Ro22T2LKUMWay75wYlUpX7ysfenHyH2pFhpePMAsNHcWV6fOSVf4H9KBfImBw5lkhzd8fqw+P0vDswPX4NodTMm+2Z7/HUTai6vxwiCkdZgusoRhkIiPXMJsqeVxf4rg8XC3jw1HYlN7lQ3clpKWIys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWTaadD5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWTaadD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729976008; x=1761512008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1hFkzhzVRrHzEkIZxKIvrwuQ6goUdSoABNtwl4BIDk=;
  b=YWTaadD59I5jeTY7MGSKk5c+EWvUsmB6kG/2vdENW53BMasYa8DEpZlN
   2Fv9MWXb2tfvlGRx7zxiNug1oSlhFONggf4RdojV6Nw9K1xtxrgFhKEDn
   1ssGsuFc5fljl34M3SmVYin+MF5S/6woTLPCVestwaE+TJLMzMfF67Fmz
   M/+ncSd6FWVAKlLuVS0wZMK/dnkyiDOrF8jXuoqXhmUlAYU8J0Z+2HxRm
   vnopczQ7QBsajhReUG3cvHgnBwns9v8Y/YrWWztIM66GrHVxMHO7y+Yv3
   x1I/XCXe3nGfhzvh9BkPfcNoxBuGtuHNGKsYX5KnN4sNBQv3ZxyjH9FuQ
   w==;
X-CSE-ConnectionGUID: tasWTMD/SI2HTi26VVk5jA==
X-CSE-MsgGUID: jK5FvR6DQ/W9rRmIWvI08g==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="40995278"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="40995278"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:53:24 -0700
X-CSE-ConnectionGUID: 9/tIG1viQSij+4JfQvi4Tg==
X-CSE-MsgGUID: AgoPEOYhQOeQzKlHnCem1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="82068839"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2024 13:53:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nmi-000a1y-1O;
	Sat, 26 Oct 2024 20:53:20 +0000
Date: Sun, 27 Oct 2024 04:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9757/15331]
 drivers/irqchip/irq-loongson-eiointc.c:378:58: error:
 'NODES_PER_FLATMODE_NODE' undeclared
Message-ID: <202410270410.DRsfwEJr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hongchen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 30affb08c584efdc07b3c68015b5902ea02ec86a [9757/15331] irqchip/loongson-eiointc: fix gsi register error
config: loongarch-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270410.DRsfwEJr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270410.DRsfwEJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270410.DRsfwEJr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-loongson-eiointc.c:357:12: warning: no previous prototype for 'pch_pic_parse_madt' [-Wmissing-prototypes]
     357 | int __init pch_pic_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c:370:12: warning: no previous prototype for 'pch_msi_parse_madt' [-Wmissing-prototypes]
     370 | int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
         |            ^~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c: In function 'pch_msi_parse_madt':
>> drivers/irqchip/irq-loongson-eiointc.c:378:58: error: 'NODES_PER_FLATMODE_NODE' undeclared (first use in this function)
     378 |                 node = eiointc_priv[nr_pics - 1]->node / NODES_PER_FLATMODE_NODE;
         |                                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-loongson-eiointc.c:378:58: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-loongson-eiointc.c: In function 'eiointc_acpi_init':
   drivers/irqchip/irq-loongson-eiointc.c:481:45: error: 'NODES_PER_FLATMODE_NODE' undeclared (first use in this function)
     481 |                 node = acpi_eiointc->node / NODES_PER_FLATMODE_NODE;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/NODES_PER_FLATMODE_NODE +378 drivers/irqchip/irq-loongson-eiointc.c

   369	
   370	int __init pch_msi_parse_madt(union acpi_subtable_headers *header,
   371						const unsigned long end)
   372	{
   373		struct irq_domain *parent;
   374		struct acpi_madt_msi_pic *pchmsi_entry = (struct acpi_madt_msi_pic *)header;
   375		int node;
   376	
   377		if (cpu_has_flatmode)
 > 378			node = eiointc_priv[nr_pics - 1]->node / NODES_PER_FLATMODE_NODE;
   379		else
   380			node = eiointc_priv[nr_pics - 1]->node;
   381	
   382		parent = acpi_get_vec_parent(node, msi_group);
   383	
   384		if (parent)
   385			return pch_msi_acpi_init(parent, pchmsi_entry);
   386	
   387		return 0;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
