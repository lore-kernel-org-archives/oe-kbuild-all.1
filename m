Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F109F9E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721144470; cv=none; b=QSHFu5ZaKMqLiT4IWCKdpO+3/D1wSDaFdY8LpkT0Xi5XkhJc1454g4X1HzwaoamDalqEVKWUA/b27G1+WrgVgsZ3CPbne6lV+p+tB4LfIO1WanPxY1XbqEyP1EJa7mHNlPEUo7mkya99DkCvtCiKOEqus1KO8bGoo46nyaOmmQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721144470; c=relaxed/simple;
	bh=N8iUQBWAZwLLT4XXyX9/2tkleZYAcA5uG3HFAVS73S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lQZ+s87wSnPp0fsVIqyZ+DLD08J3y56y82r2VHBEj9yD8xKxOFIvcYEAr5B2p5++D9xQXvSxpiBjlCKrgmmen52ZvKc3rTZqeNmfKoJJlQkmIHi/2jnveuj4ZeSt9ZfdKMkR4YK0BDyxY1LL3V/hwvY1oVgD99II8hRhrrErZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8bEWG82; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8bEWG82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721144468; x=1752680468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N8iUQBWAZwLLT4XXyX9/2tkleZYAcA5uG3HFAVS73S8=;
  b=k8bEWG82PDjOl/3bFEhemZm4G4jvYtyjbi8vknH5UB2u5LMGnj+sD7Nu
   ilcNDbpzg8LOX2RAfQiH4fOvtRmRn1iySakqmXOp/WzwN6X+hPYCrPh0M
   F6LrzNUbKyNuoVi0Mtv+e+dJRaD2U6OTufBhs52ufWAlhCmcgQbTUWwQu
   IamkWx45a+Oyg5iUyL1kcCQVUJEMBgVBlKdhVAJHbDCPeYEgfSyDJwXUP
   5/tm5TSJqE9Bd0cHBOqqZ+VDLmECT8zktYkV0Qn1dnyhTDQB+lsDIccqo
   +xgT5wd4GglMa4ZpP3QVXIeuB1MGw+xN6vnpCRPj50nPxuSo1fgrrcT4g
   Q==;
X-CSE-ConnectionGUID: 0QhXO0qzQVyvOt425h7/5Q==
X-CSE-MsgGUID: O6R5ui+uQdu9i5dkt4qLfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18462432"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18462432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 08:41:07 -0700
X-CSE-ConnectionGUID: 4QCznEUJS++kxFx62yxLnw==
X-CSE-MsgGUID: gl7IU46XRfK4TTGyRHfE8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="81106732"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2024 08:41:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTkIX-000fOk-1n;
	Tue, 16 Jul 2024 15:41:01 +0000
Date: Tue, 16 Jul 2024 23:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7870/7893]
 drivers/irqchip/irq-loongson-eiointc.c:378:58: error:
 'NODES_PER_FLATMODE_NODE' undeclared
Message-ID: <202407162343.iqWRCEtE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   11cf99a210e4916f7a066658c851c08ab6b123ce
commit: a522e3024ad0e7e2a552bde0ab94655724684117 [7870/7893] irqchip/loongson-eiointc: fix gsi register error
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240716/202407162343.iqWRCEtE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162343.iqWRCEtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162343.iqWRCEtE-lkp@intel.com/

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
