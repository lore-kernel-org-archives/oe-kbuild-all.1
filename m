Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCE4C85
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 00:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728433162; cv=none; b=Z5ljVjDlMHAJ1o4/RFAIUEx5dQMFg+NkvR+eqUDyj3q6oUhlKtKqvm9N2hexVK9Hh7H/0sOwZmx1rYGSG6JL/O678FlrjCOr37qTVQkS7Lzt52qE6lwymf/fhZp0KKgV3AzH/2P5of1ihVlc6EXS1zJNvSy3XzcLflNnDXsJIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728433162; c=relaxed/simple;
	bh=I/sRKqg2kXPlj//bbxvEf5bSQPkKs6gtNEF+ku5AIh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uolA75ppECiu+wt0Zz0JsQuXVwkYWLAznbOeUypK32AMV/oteNh3/Q5n1fQHf1KSqgb2Ku4Ot2/ZOo0s246033c+6xa+pL610SwV+1qN216fxC6fTWDv94i0EVDSLTi+QxbIo5+ppHeCQDC/85Ia6AeDdQBKrTvyRUx59r4eOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWALf3qA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWALf3qA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728433161; x=1759969161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/sRKqg2kXPlj//bbxvEf5bSQPkKs6gtNEF+ku5AIh8=;
  b=XWALf3qAJK9oQeun/zq0cDa9uYXbRwdVuG66FUXTtCIN11CGQp5lv7nY
   rZHs+/V34x2BTlDq9WJM25f8zrvQAlOiiBUdMZJfGaBwOH5Yh5uR1688z
   VIKWj3dzL8eqAk7iBTsA+PzdHkdX48e+rHuhRCYCAkA573z+GsPzKOR+N
   LjOXK/wK2rvKiQEmFEBLvLt9dkcH3ZCOMfzxJRQQsoI3AspurCOyryqw7
   Fjc7nf8iUHY/fk6/eoM+KgqWhMbIBvBTEqWAzfmstUY4/5W6WgbJ2dEyj
   XTqeBEp8CocuD6ggYH9kD4n8m+5ZdKYYrzh8/yKa+lKze3zPpYDFl8FEO
   A==;
X-CSE-ConnectionGUID: rw9iWzlEQaGoSdaSaettaw==
X-CSE-MsgGUID: dpkw6b1eQA6S3p0pHOv+/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15316625"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="15316625"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 17:19:18 -0700
X-CSE-ConnectionGUID: WCokNJvbTBG6qZvZ6obJdw==
X-CSE-MsgGUID: 3PTn/u17SEOChYg6+LsKww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="75924862"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2024 17:19:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syKQ6-0008WO-1e;
	Wed, 09 Oct 2024 00:19:14 +0000
Date: Wed, 9 Oct 2024 08:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9756/14286]
 drivers/irqchip/irq-loongson-eiointc.c:378:58: error:
 'NODES_PER_FLATMODE_NODE' undeclared
Message-ID: <202410090854.U809Omnk-lkp@intel.com>
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
head:   fb512ada4da1a8aefba17392d87452a37796a0f2
commit: 30affb08c584efdc07b3c68015b5902ea02ec86a [9756/14286] irqchip/loongson-eiointc: fix gsi register error
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20241009/202410090854.U809Omnk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090854.U809Omnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090854.U809Omnk-lkp@intel.com/

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
