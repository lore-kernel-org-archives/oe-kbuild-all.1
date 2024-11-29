Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCCF13AA35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732912496; cv=none; b=ahRSzsX67YdtGt0+BcatXN65DEnseRTj4V8Uwj0xfID0GrzQOYf9P+VBbSEo6b4QSrrDW18TCJEaOBzCZSfH5viuoBAPjjnUq+ydlVCKM6EQjrOyLULZKAUEVw/WDbJEQNli6RUlrXos7Jmg6fZcE5qvViM/f7HqTbhgbptrps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732912496; c=relaxed/simple;
	bh=vF8Z8obVyc8pwH+rZ+v9XZfsB/ZLFtunmRfDAD9ZQ3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMOnyH8bXYrIQa3fQZgZF/NwgG5m2xGSLGTDFqzrU4Bt3/rh7nI8PirO7OSLE8v94pQFWMi0GS8CSGFLFJceFbJXb/F88DKgpUf/SjTQtsyXxcZKBo/2eT6PaOL0Xe2CXqA5yq3m4b9UKTBVHa/TO4q6UubRUHZZuvX8DYwJvhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+sVLCcQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+sVLCcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732912493; x=1764448493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF8Z8obVyc8pwH+rZ+v9XZfsB/ZLFtunmRfDAD9ZQ3c=;
  b=C+sVLCcQJCJ8imARnq5zvb4Wx5A7lQPY2Xv6YF0alX0/q4ImTdsGAudM
   2H0zLzNvXBNo0XKt2hyZwij0N+i0CjUyUCyg2i5ZS174xbNluSkRKfESt
   xxNCqT3XrqvCZearOsReXouhTZr2wjMAT2ufL+7kdYpFChWRbuNcRlHDr
   ZKC9H/qyYXBAB/VFjsbjGUrQCtHivvMGcrrKwY1ojqiSrm8tKgqbvJCF/
   pxA64EoeHz9tGnl1wj58K7DPoB5A2mlnA2/MeLNHWOP3MEUCz3v6DNR+q
   4+vL9ZPww9hicPAcJKOR1IdU95nIDeaBUVh1KDfKmZllvqiDIMvT6TXms
   A==;
X-CSE-ConnectionGUID: eVoWLUhtT62l+aHrXpkUQA==
X-CSE-MsgGUID: sfN4JvW/TeK3Hp6OC7FFOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36933360"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36933360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 12:34:53 -0800
X-CSE-ConnectionGUID: uiqv72S9RNi36CJ+mOFMew==
X-CSE-MsgGUID: d+K/47y+SCWwfkenMlMkIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92881165"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 12:34:51 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH7hQ-0000gP-2v;
	Fri, 29 Nov 2024 20:34:48 +0000
Date: Sat, 30 Nov 2024 04:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1562/1562]
 arch/loongarch/kernel/legacy_boot.c:106:48: error: implicit declaration of
 function 'nid_to_addrbase'
Message-ID: <202411300409.9tXI7K0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   429a19874eb589d27346ba7363fa091d7e4ff99a
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [1562/1562] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r064-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300409.9tXI7K0F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300409.9tXI7K0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300409.9tXI7K0F-lkp@intel.com/

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
