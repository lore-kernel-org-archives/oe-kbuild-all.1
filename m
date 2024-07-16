Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2F4D8A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135892; cv=none; b=dLC8CwqAsJR6InskuBoW/4VZtSTagZ6Pf5wAE8wsTXn5ZuGCsI0OCbezmeBNoTHdimtcPxezP8vzBdaVTrhPoOsfTk928twbRn6x+P6QFxFcq4uuC4OHXqWLl/xyT9wrq8EnoV3EF8Sijpc5We0psf8yUis4aopWKpUc71Nq4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135892; c=relaxed/simple;
	bh=jIkJ7MrsEf5MjqF8Z9Hdq3d3eu/TuyP1oxH6tzY5kyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kRIXWfqL9XSvb+4xE5g5dfDZO4vEHGuV03CXmUufqfvTjj1b0JFV8+KYrPF0rTaaXc4A2fDFyKTLyQYNhOVZJh8xPYkWVCfWh25sTkvdCeaI65wct8/SHYvTxZAFxv1zfRxXr15EDY+7ds2olDbX3xwDdm/eLugaAboYu1lYn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E1ju+6iK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E1ju+6iK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721135890; x=1752671890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jIkJ7MrsEf5MjqF8Z9Hdq3d3eu/TuyP1oxH6tzY5kyM=;
  b=E1ju+6iK+Q/ZwrZXXPoE83SG8VhB4kUIdXN7aCtCVCRu3AOlABmwbx1n
   P8Wh7zzAXRbMc+dIeVdSpkuNWGDjXS7xMYOntLbtZEc5B9yWkVMNQN4dy
   nJ7HaEuhsbbzHUvshTK//uOaAHMB/3o+u+HisBsGtBMbTlXSmIwvhPhtz
   N9zxJ96nD8AMpYuD0o+MMcPd9IYURSXJ2mAEldBzOSM9n/dJlffKYdHg5
   pwWIybdLDW8giyIhxV2fE4dCEIRW4T3eqyE2KlvwPjNe02vDX9NajWljq
   ZQv+fLixmnUZQdzTZwGx7u4EmMHVsWF2lov1y2JJsPrLDUnG/nVkwvVrI
   g==;
X-CSE-ConnectionGUID: 1WQgTyL2Tf+KsrbZJbocCg==
X-CSE-MsgGUID: crEu9LqpSJGKpMwH9DQaJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="36114279"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="36114279"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 06:17:59 -0700
X-CSE-ConnectionGUID: SHnPfRAhSHOm0+8iW2b66A==
X-CSE-MsgGUID: fnBOhuukQlmnK/AQhw554Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54358676"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jul 2024 06:17:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTi41-000fG2-0o;
	Tue, 16 Jul 2024 13:17:53 +0000
Date: Tue, 16 Jul 2024 21:17:30 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 15/48] arch/loongarch/kernel/legacy_boot.c:106:48:
 error: implicit declaration of function 'nid_to_addrbase'
Message-ID: <202407162159.aFPdthdi-lkp@intel.com>
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
commit: 4fe09071dbc3f9f5088be6504aee65ba1be451c0 [15/48] LoongArch: Old BPI compatibility
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240716/202407162159.aFPdthdi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162159.aFPdthdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162159.aFPdthdi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kernel/legacy_boot.c:94:6: warning: no previous prototype for 'register_default_pic' [-Wmissing-prototypes]
      94 | void register_default_pic(int id, u32 address, u32 irq_base)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.c: In function 'register_default_pic':
>> arch/loongarch/kernel/legacy_boot.c:106:48: error: implicit declaration of function 'nid_to_addrbase' [-Wimplicit-function-declaration]
     106 |                 pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
         |                                                ^~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.c: At top level:
   arch/loongarch/kernel/legacy_boot.c:242:13: warning: no previous prototype for 'fw_init_cmdline' [-Wmissing-prototypes]
     242 | __init void fw_init_cmdline(unsigned long argc, unsigned long cmdp)
         |             ^~~~~~~~~~~~~~~
   arch/loongarch/kernel/legacy_boot.c:341:14: warning: no previous prototype for 'bpi_init' [-Wmissing-prototypes]
     341 | unsigned int bpi_init(void)
         |              ^~~~~~~~


vim +/nid_to_addrbase +106 arch/loongarch/kernel/legacy_boot.c

    93	
    94	void register_default_pic(int id, u32 address, u32 irq_base)
    95	{
    96		int idx, entries;
    97		unsigned long addr;
    98	
    99		if (bad_pch_pic(address))
   100			return;
   101	
   102		idx = nr_io_pics;
   103	
   104		pchpic_default[idx].address = address;
   105		if (idx)
 > 106			pchpic_default[idx].address |= nid_to_addrbase(id) | HT1LO_OFFSET;
   107		pchpic_default[idx].id = id;
   108		pchpic_default[idx].version = 0;
   109		pchpic_default[idx].size = 0x1000;
   110		pchpic_default[idx].gsi_base = irq_base;
   111	
   112		msi_group[nr_io_pics].pci_segment = nr_io_pics;
   113		pch_group[nr_io_pics].node = msi_group[nr_io_pics].node = id;
   114	
   115		addr = pchpic_default[idx].address;
   116		/* Read INT_ID.int_num */
   117		entries = (((unsigned long)ls7a_readq(addr) >> 48) & 0xff) + 1;
   118		pchmsi_default[idx].msg_address = MSI_MSG_ADDRESS;
   119		pchmsi_default[idx].start = entries;
   120		pchmsi_default[idx].count = MSI_MSG_DEFAULT_COUNT;
   121	
   122		eiointc_default[idx].cascade = 3;
   123		eiointc_default[idx].node = id;
   124		eiointc_default[idx].node_map = 1;
   125	
   126		if (idx) {
   127			eiointc_default[idx].cascade = 0x4;
   128			eiointc_default[0].node_map = 0x1DF;
   129			eiointc_default[idx].node_map = 0xFE20;
   130		}
   131	
   132		acpi_pchpic[idx] = &pchpic_default[idx];
   133		acpi_pchmsi[idx] = &pchmsi_default[idx];
   134		acpi_eiointc[idx] = &eiointc_default[idx];
   135	
   136		nr_io_pics++;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
