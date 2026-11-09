Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236598;
	b=znE2VUAEPTAmmZOuckj2xiDwRmsnoN9tMx0SnqijS5jdL1BO13iNxqSOrqlw3ohnVbj1
	 izxhMaR/qsbnoOEdT/fngKMgyaFuIup3EPCbT9LGO8GEVy96iYJgUHHG2EhKMMtNYEDJ/
	 HFaEHozeinVzdeXeqnQsCoVKPL1bWckGN2zPnV73QLW6gTI2Z4MprrZUGxT8AFPzu7AAu
	 kwSMB/oG3eLqhtFwUA/MXFUOHEIigebRIAw3QfsT7BnFsYgR+JXYF5y2CXljbGsdWm49R
	 hycqyhAgAlYqAnJl61hiTRI+7WK2/vyIfvDmOvZXRRdaBdAVy6WZDel1xTE5BQ+pnWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236598;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2y9iUPMX5DUNBHg5kplQjjX95glHp9aoHE7rO6RdwEc=;
	b=Va/OZrZdtf6oPz8A1pKFvqwnBACeRUW6K949Qns9q3pKOzbZIQLli+UixFLidesi/L9L
	 I4auFY8JUGLotaXXLnNCi74KO9jzh5gtxmzUAUnhlc70+AB0EOfYazXf/nfRDFf7tJhLp
	 EA1X3U3+odg1e3yPplCtsjAJkfM0YWGUo+R4/NJP+F5SIRt++g+L6plHnkMWdLpXCJxal
	 OMCICcfOnDujblutx3rNaEGdmAb4D9ZcLwooVUpSn70aGXn+SwSVc8Kgi9s7+6nF7uc09
	 yqzG2Jr5UlfwjVOeA5uk0MnSeJJ5gSSNFjj+ztRlfdQc+uTALWmFMWJJ7GwFtHzrfow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXtrtN6f;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB235606A331
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 15:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB235606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXtrtN6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794236597; x=1825772597;
  h=date:from:to:cc:subject:message-id;
  bh=gfXIcrZ7LuRtn96TLhAO+y4fZ4wQceaogv4pDFed1RM=;
  b=BXtrtN6fdQBczI9ladkaIv9meTq9vEBuNTPNbHoeRfYLHvMalGXhhnGA
   yUMOkgDemRh7b07EZYMEhPt17X6DsRwlnxKQ1tLp4hjecmXghEYcZ2r2v
   rzBKKRh1YtMJS8nCmMzOQgV+N9hvpt1l0xE3QW4vm7uAQd3qyb+2DEdtY
   wj7Jx0eZfc7fuNuTbRlUym8S8Ebe14QQ9zYzpwVuQ1zCm+mpKpdxwuULt
   TqjKPV8e4YzAa0YxCt0ReGaX2VZZ9hDty83lIDep+REmT8jfHuu0SmXLA
   66/FLG0VVZcQ8+3gn5loNcpBma36Lo6DGxj+Ha9XlEAnGiA8eTSjorQ/3
   w==;
X-CSE-ConnectionGUID: saiUZ+BCRNKj9pPIvU+7Xw==
X-CSE-MsgGUID: 69sbiRAETkSJyNRJBjVwMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2828150"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2828150"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 07:03:13 -0800
X-CSE-ConnectionGUID: ZUtuzSoHTBGe6wB9erPzrQ==
X-CSE-MsgGUID: o/EPVJXxSz6v4l/D9uZCvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8210724"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Nov 2026 07:03:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQto-00000000uhz-38oR;
	Mon, 09 Nov 2026 15:03:08 +0000
Date: Mon, 09 Nov 2026 23:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V15 13/35]
 drivers/firmware/arm_scmi/telemetry.c:1037:26: warning: format '%llX' expects
 argument of type 'long long unsigned int', but argument 4 has type
 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202611092306.36wJrIAE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V15
head:   d51f22cab86f4ad2f08b4e88803f85fdffd81a62
commit: be715d5b6657e41ce80f4b150a138ee4c5924d97 [13/35] firmware: arm_scmi: Add Telemetry SHMTI areas enumeration
config: sh-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092306.36wJrIAE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092306.36wJrIAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092306.36wJrIAE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/firmware/arm_scmi/telemetry.c:13:
   drivers/firmware/arm_scmi/telemetry.c: In function 'scmi_telemetry_area_check':
   include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:452:17: note: in expansion of macro 'dev_err'
     452 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:452:30: note: in expansion of macro 'FW_BUG'
     452 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                              ^~~~~~
   include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:458:17: note: in expansion of macro 'dev_err'
     458 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:458:30: note: in expansion of macro 'FW_BUG'
     458 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                              ^~~~~~
   include/linux/printk.h:109:25: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
     109 | #define FW_BUG          "[Firmware Bug]: "
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:470:17: note: in expansion of macro 'dev_err'
     470 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                 ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:470:30: note: in expansion of macro 'FW_BUG'
     470 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                              ^~~~~~
   drivers/firmware/arm_scmi/telemetry.c: In function 'iter_shmti_process_response':
>> drivers/firmware/arm_scmi/telemetry.c:1037:26: warning: format '%llX' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1037 |                          "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:1036:17: note: in expansion of macro 'dev_warn'
    1036 |                 dev_warn(ph->dev,
         |                 ^~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:1037:72: note: format string is defined here
    1037 |                          "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
         |                                                                     ~~~^
         |                                                                        |
         |                                                                        long long unsigned int
         |                                                                     %X


vim +1037 drivers/firmware/arm_scmi/telemetry.c

   995	
   996	static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
   997					       const void *response,
   998					       struct scmi_iterator_state *st,
   999					       void *priv)
  1000	{
  1001		const struct scmi_msg_resp_telemetry_shmti_list *r = response;
  1002		struct telemetry_info *ti = priv;
  1003		struct telemetry_shmti *shmti;
  1004		const struct scmi_shmti_desc *desc;
  1005		void __iomem *addr;
  1006		phys_addr_t phys_addr;
  1007		size_t len;
  1008		int ret;
  1009	
  1010		desc = &r->desc[st->loop_idx];
  1011		shmti = &ti->shmti[st->desc_index + st->loop_idx];
  1012	
  1013		shmti->info.sid = le32_to_cpu(desc->id);
  1014		shmti->flags = le32_to_cpu(desc->flags);
  1015	
  1016		ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
  1017						le32_to_cpu(desc->addr_low),
  1018						le32_to_cpu(desc->addr_high),
  1019						le32_to_cpu(desc->length),
  1020						&phys_addr, &len);
  1021		if (ret) {
  1022			dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
  1023				shmti->info.sid);
  1024			return ret;
  1025		}
  1026	
  1027		if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
  1028			dev_err(ph->dev,
  1029				FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
  1030				shmti->info.sid, len);
  1031			return -EINVAL;
  1032		}
  1033	
  1034		/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
  1035		if (!IS_ALIGNED(phys_addr, 8))
  1036			dev_warn(ph->dev,
> 1037				 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
  1038				 shmti->info.sid, phys_addr);
  1039	
  1040		addr = devm_ioremap(ph->dev, phys_addr, len);
  1041		if (!addr)
  1042			return -EADDRNOTAVAIL;
  1043	
  1044		shmti->base = addr;
  1045		shmti->info.len = len;
  1046		shmti->info.phys = phys_addr;
  1047		shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
  1048	
  1049		ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
  1050		if (ret)
  1051			return ret;
  1052	
  1053		ti->num_shmti++;
  1054	
  1055		return 0;
  1056	}
  1057	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
