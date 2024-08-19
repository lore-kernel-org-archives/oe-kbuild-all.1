Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1416B3A6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072088; cv=none; b=j1YeAP+v1SJ5NrA9hr8CZQ6FAd+ulkFEfxj4zRTsN8g2yj3cLiiLOyTW3JzbS4Aa8Ej1MZ6i/4seYIcwU6+hj8+zSen3TQKuqBHvLetJ2GtOh3OUS8lEPXO5Lb7a0lN/2Ue32Y5sveKaDBbbFQzcvsmPlE/cOWfx5pjyvU6AWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072088; c=relaxed/simple;
	bh=E9Sp7/tYX0W6K95tCuP+y6eJROsKCI9i3yGZpkpRJek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rD4joW+ZDMKwnyJCHL5vAt6FXb1JhR8oyr3a4iSEZKH5j6W8t5V7cK4XasQTJ01oONhP3uxaY1g0rR+kpRXsjRK4wqm6IODezN1Vv7nmUHY54YGfPVZplusRYP8Oj/bq/Z/3c0TOB2TbAUVOw7AW9AX9KAeW3o1Lo5uIB3VEqGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dz6pmmsv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dz6pmmsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724072086; x=1755608086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E9Sp7/tYX0W6K95tCuP+y6eJROsKCI9i3yGZpkpRJek=;
  b=dz6pmmsvUKdkCk0SXu3u+L87pjlKtEc9ASXgnNtfE2jWwUmR7xhGBqii
   TIuvjhfelnjsi/pVITd6aBm+9PVZOYxXxAL8KUeXjZEZ7VZSQOwNkIwr0
   uWdAZ+ALQuHM3wIZU0HPSjS7spsCyCgxQHojQzMrG3BWNkYmayJdP8VEU
   r9/sK3bxsLpQyOBbcxQzAb6LhWVVdxBokfsdBae9vOn0uDRTj2Yf3z72s
   OD/eBnxd8Iuj8WBi8pPtUwOgDCGvzFhekc69zCc5Ln81pgHKvXLY6ZvYb
   G98wdbAofbtmu4ioq0JcyEXquLswZxNBKwa8N/a36M/oxF0kHL1IBTdq/
   g==;
X-CSE-ConnectionGUID: XUGjVcoYSymp5eaRZIK2+w==
X-CSE-MsgGUID: g0f0os9RQNq7hKDybu060g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22284687"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22284687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 05:54:45 -0700
X-CSE-ConnectionGUID: WTKXwcEjTliPj2YPLqqr8w==
X-CSE-MsgGUID: 1tRKaCPcR7SKTDnBpUs77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60066619"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Aug 2024 05:54:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg1uB-0008zC-27;
	Mon, 19 Aug 2024 12:54:39 +0000
Date: Mon, 19 Aug 2024 20:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9908/9920] drivers/ata/libahci.c:210:5: warning:
 no previous prototype for function 'get_ahci_em_messages'
Message-ID: <202408192027.hjfTTELy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ded8f0c62cf3929b2366c3747012f1e23effd709
commit: 7163102e0aaa3f66d264a6076436c717a13762a1 [9908/9920] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240819/202408192027.hjfTTELy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408192027.hjfTTELy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408192027.hjfTTELy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/libahci.c:210:5: warning: no previous prototype for function 'get_ahci_em_messages' [-Wmissing-prototypes]
     210 | int get_ahci_em_messages(void)
         |     ^
   drivers/ata/libahci.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | int get_ahci_em_messages(void)
         | ^
         | static 
   1 warning generated.
--
>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for function 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for function 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for function 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | int add_sgpio_zhaoxin(void)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for function 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:673:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     673 | void remove_sgpio_zhaoxin(void)
         | ^
         | static 
   6 warnings generated.


vim +/get_ahci_em_messages +210 drivers/ata/libahci.c

   209	
 > 210	int get_ahci_em_messages(void)
   211	{
   212		return ahci_em_messages;
   213	}
   214	EXPORT_SYMBOL_GPL(get_ahci_em_messages);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
