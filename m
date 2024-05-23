Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C713A88D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 05:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716442981; cv=none; b=aCUi7XUaUATMwnc1tDFBfjOpEP/+zh/F2NKUcmog0wDuNOx1a7l6KVBGrTWw3PVScG8uliWa2o8WRQrQhFaXq7mF8YBDPb12dsiXoecWNTqarRNnTmm8a/M0gF1iztty8XBdulcMDlJtWimyUx+mXfWc4zlJYaZct+QKDePzPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716442981; c=relaxed/simple;
	bh=fTEJUXXFUgUvi6P15qkHSyb2pJiX25SDxXYekFIb2+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXeNTu2lBsRp0opKNhaKevXMfwXx+Nm+05h3f0mybEqU8Wzlan01OmrNakhYIdsk1awawSRd0u5KM/t1riFUqhOBLZU54mkASPCzswiWF8DJ4K7fvEbXiuyFooU5XOqwGpa91pKIzr4BoeEqyWXOr8WmzJ68q3m7eqVAehzjrBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awnn/6pl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awnn/6pl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716442979; x=1747978979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fTEJUXXFUgUvi6P15qkHSyb2pJiX25SDxXYekFIb2+s=;
  b=awnn/6plAOC/lhh+66FJ4NYRNAGwmfH/MGZ6Emw/uj2RyIoLN/mbxzu5
   91B+dHs24fo/cmaaLyRj+0bAYX/jXlePYnPShTNJoMfXoep0fQx2Lse+a
   6QHM/v95Y5/yN49kG0OG7i7UArKrHPQScK6qPwgWWsELDGKT7z9iH/JHt
   4/GEBDoDSJe0jAvKqJgyLmQQZzRiIhrWlpAYWI5ckcRf4OD9MxjUwxh3R
   PvQulz6kZxqCyIEgfqZYv9g3C/MKtLTOy90WHrzEi3xKH4dAN7mLFaPKq
   UuZSd27t3MQemmLcEH2kBAkdGhMcqMFj1vkt6zLiEZHQ0Ds0qpgpCo7Hr
   A==;
X-CSE-ConnectionGUID: mLxzXgtSRxOph484fMEObw==
X-CSE-MsgGUID: PS0y0kAURJSd9KX6/lOwMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23400263"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="23400263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 22:42:58 -0700
X-CSE-ConnectionGUID: mCPUr8uoT+6iiQGM88utTg==
X-CSE-MsgGUID: 4p1kpkS8QHW3aORIWI49Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="38126758"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2024 22:42:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA1E7-0002Uv-0j;
	Thu, 23 May 2024 05:42:55 +0000
Date: Thu, 23 May 2024 13:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9705/9710]
 drivers/irqchip/irq-loongson-eiointc.c:378:58: error:
 'NODES_PER_FLATMODE_NODE' undeclared
Message-ID: <202405231321.wKWdnTl4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c542a3e5830d4d587bcc2b51a185b671a6c64853
commit: 30affb08c584efdc07b3c68015b5902ea02ec86a [9705/9710] irqchip/loongson-eiointc: fix gsi register error
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240523/202405231321.wKWdnTl4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231321.wKWdnTl4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231321.wKWdnTl4-lkp@intel.com/

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
