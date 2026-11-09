Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234293;
	b=PHP8sLZD7gCQE4cwmVn3EcRDi0jKoMkPUqfnMPkMMYPXtegkmydfqWzT9qsErRX7argc
	 3+ISw7/a83uG8UP+v3fcoaKkH2rlHfMxgYVCB83ja/R+aTvL3q5cDpyAjLLWObDZJU4Fw
	 iykOXfd4qJq1qsrIwXKmdMCrn9e4KiKYu9Jo0XYkQZjvImLkRSKptySzudMjItctJMeN5
	 KGZb/brkGwLvSzkYwbgdF6I479Bl4YgyJlHgJMqiHY019S3Q7qjYQpeaaLk4k6/mDW8Gq
	 Lt3Ih7if3oW1CFEMDJEmnBPab5DBTsWbJga5CFWbS/djCr0kTLGhIeYsrraXjDmQnxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234293;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=v6HSjFXSJLHa1/riNv5ClmnINkeHVAwR2RQ2gzA+Q7Q=;
	b=c2O/8q5bc1RZiFVUDTeH2PCE3ZUohIYQqLjPgFY7ug1AqqB1qqY2HDSkufwNcpy+kqmT
	 WngFgOAhIM9YKIDSAMZCsxj6GB0Xc6fzRJOUX4InMnTAJA8XEJ/UPJs3mwSWWdQKzSjj+
	 IyiaPMKYKzb5Eekwhrpxf5FGH4HVtOjMV5OchBUNx/vAl7fTSnXaIVo+iYpVLXC6w2/1U
	 +7TAtUeZ5e1M+ZlkzGrM1tyhg406kXK9GJkgE6R0n/tnCReD8IPfYTJbbJ1GKLd9OfOUp
	 VuHvF2ymZ9N8PmyEjwmKWuyaDdAUEnuqTTvkMTby1noqjH3GheUwejO6bOHdHY0AuoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aYbUyxnU;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F7606A32A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 14:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aYbUyxnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794234292; x=1825770292;
  h=date:from:to:cc:subject:message-id;
  bh=BQwpSkk921dZoTyoo3inhENgc0jveGo/dyi2EjzYUdo=;
  b=aYbUyxnUwJFsNEWzdNpVlIjn9wdyazqn9s2580VQJc6GIOsXHp6hc7OX
   M/MHMoZgaG3fzHAOERGHHwOoPExmjBGhvCUl6M+r25rgIff/UsvjEQXvJ
   kTfcgHIE9hRQstuH91IPfJCcAsMrN3g7YVFXGH3ldnEm6pTP4nwiABMC5
   Yr45+4K4ARgScngfs7xibW5AOdto2AeeUGNa8xWWDPHeLSsPxsa4BJYsM
   ETPRCjLtw835jmg/i7NAv88dWNw8T8AggPIWGkRqgK1gFX0oREU85nQcV
   PxcS8P/3Xbe7v+I3PNNfu8xFDg6n7b4+nD/bzxtXJiURyZ7Tz1BFgAGob
   Q==;
X-CSE-ConnectionGUID: bu3B4o8iTW+4C2Apol3yLA==
X-CSE-MsgGUID: 9up1RoDcRLG4gqjQXv6rww==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2981952"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2981952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:24:51 -0800
X-CSE-ConnectionGUID: XhgWiqvtTKK7OkVUJmM5qQ==
X-CSE-MsgGUID: buUOt80yQZKnLkR/1F456w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7764474"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Nov 2026 06:24:50 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQIe-000000000L1-3YBZ;
	Mon, 09 Nov 2026 14:24:44 +0000
Date: Mon, 09 Nov 2026 15:24:23 +0100
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V15 13/35]
 drivers/firmware/arm_scmi/telemetry.c:1037:26: warning: format '%llX' expects
 argument of type 'long long unsigned int', but argument 4 has type
 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202611091504.ef4O1O8S-lkp@intel.com>
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
config: csky-randconfig-2200-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091504.ef4O1O8S-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091504.ef4O1O8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091504.ef4O1O8S-lkp@intel.com/

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
