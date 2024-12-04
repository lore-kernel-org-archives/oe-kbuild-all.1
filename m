Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552D10F9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 04:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733285128; cv=none; b=cC/QUXwVgj74HuXwJG3xtGzMYgTwbT6rvU8abM9NuZcPiytw8QsfLLIUCLG6+aQi+N+3lT+jhC2MY/RSDPz0EEE9KCNukAF6YU0wkhEPWYXkvrJl0K0Ui/6BVvJyI5VSmepu3MRG9iqT9f3PB3cZdeMs+E2eDAhQQfsJavj4D+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733285128; c=relaxed/simple;
	bh=HImLzu4XmWKMbi8tMJ9DiVOx0SwzDMXdlD+QwAZiLHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9djCcUcEOZysHdKni1aKICZjdgQh2hiQVruJ6a5oFClMfmKEV7sZcv9XZalaKvK3kyHPz3eMk7FcCs0eeZYG9RWcH8qeYaJcl28m0rPpmJmbnMvGp4kzsZsU6g2mlXqjB6KKo5auvSDbWZJvgPEoSTvczPwwIVNFRKFo52S3sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OECNeDqa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OECNeDqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733285126; x=1764821126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HImLzu4XmWKMbi8tMJ9DiVOx0SwzDMXdlD+QwAZiLHw=;
  b=OECNeDqaQKkx+AWvnE0BXICsZXrs/9r9Fh1Zmla9TUaHQku7o3R23F1C
   /Fy2ImXIG/O7HXePE17S6sXHIFmpOwaO4Fg/C5rnyoOpwN/6uZz9igGGA
   iYGTkwsrg6odVwn4e2ONjLHRJB4FXaj6ZZA9cPK8wJdJH0assUQGtEyrH
   E4lK9hF/IlvjpEOctYPGDU7hd/QamImyaLOgS1ZhMjc8Ut6dTBSTuO4Gl
   p50Ri59QOyS/R4XL6jEc2QCfngzwdMK2Wd0/15XpQMBzWD6NYvWridkf7
   3Vf99XWucMpCUwWkPLbrZbLeHEEv8m/8RD+mXqy7DsWhOQOX66OT8FEWI
   Q==;
X-CSE-ConnectionGUID: NoqVxxugQYyrV3PWfcY1HA==
X-CSE-MsgGUID: 57m5BDMrSM2PEKvTw7An7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="58938457"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="58938457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:05:25 -0800
X-CSE-ConnectionGUID: eNUNpC6nQ6aVaG848z4EOg==
X-CSE-MsgGUID: Ycz0CSiNR42dhP1n34Di6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93732925"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Dec 2024 20:05:25 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIgde-0002Uc-0c;
	Wed, 04 Dec 2024 04:05:22 +0000
Date: Wed, 4 Dec 2024 12:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1582/1582]
 drivers/irqchip/irq-loongson-eiointc.c:378:58: error:
 'NODES_PER_FLATMODE_NODE' undeclared
Message-ID: <202412041220.VRxlk3d1-lkp@intel.com>
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
head:   7881f070137e71175735e75416f5c5adb5990a0e
commit: 30affb08c584efdc07b3c68015b5902ea02ec86a [1582/1582] irqchip/loongson-eiointc: fix gsi register error
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241204/202412041220.VRxlk3d1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041220.VRxlk3d1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041220.VRxlk3d1-lkp@intel.com/

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
