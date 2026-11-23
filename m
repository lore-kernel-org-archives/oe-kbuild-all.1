Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428140;
	b=UHBTTCffEO7A2PF5ab0PwuIwErApFYHnx3UV8XbX0tnhtXYCNFgusL57KtZaxzGNCWbj
	 sYNfFZ1SW9KvGQTKCH5/apY1w0jUaIPkBAvnSIXEpy149/crvEUpqmQ2H1yM/+CP7Tnt7
	 PGQXmWaixqhAZAgUa02NhabeYJOnA1yc3sgWYJwWk8dhufpg1V9I23AoWzfC4XD9GrzGR
	 tcPQ4f43+VIIJKlFNGtK1Icqb8zrfkMjoS3C0qINf4YYPRefiR6LtHoh16IGx3cib448Q
	 VTGjNNVfGifE0C2r60AeRcAVNqvx8uagcddYdqaGmdF1urR4qYmCpYJzhVRWsssjsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428140;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=15Mj0BrGC2NAYztbkaE5WpzFaLQ2BzWJq4bvVV7LUFI=;
	b=TcMRqyyAYUMzscPt2cUvahZI7ULHPL6HuFRJk5qNQGpKJ+NbNBobSq2/iSBY/efIhgg2
	 ue29+sQjcJ6qYuNrdEMWU8LE5FzTgbmzIp5E2A2/7Ctj1uEsGtftDdOGKpMQyoGKpKfQo
	 XqVfqcJn3mtsWWHXyMhTYpDi9YP+MPWVjI4PISCKYfq2ZhM8sZa2gNuZ3hJ8Za+RxnMhr
	 dY3w/auIv38Pc3+XufCrDIZWmlccAb/vwri5UjAcTynl3blxNnWZ+fppXMpy0FP663FkS
	 w3+JOUVsb0U7EWxHNljut+9fau0RJkdedGP9qYEgABJNw769VS9ehL1bKRNCExwnQUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6p2MWah;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BFE606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 10:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h6p2MWah
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795428138; x=1826964138;
  h=date:from:to:cc:subject:message-id;
  bh=K3SLx6wnuXTnUXYpJEvL77YY340ebqZNdOLZHpT0tds=;
  b=h6p2MWahxU7i8SJHRUbK8Rkt0+nKcUw2TiisgjSYmMMtw/TeBpk3iol4
   2wjE+ovCpW7GwHl2b6gGLtts8z0IcXlNpw8vXyDXyQrbWrqDB4SNrNS8Q
   S9zEDmQHgrR4SUBMiSCdL9XiOLyEVWpDSPrh6QwkLEeni1OsBeRki07Wo
   QLdbbTig8OF1A5q+xliqeodXUPZ9aym1FSDfpxA7h4v9FA3nAUMoDCrYl
   dDtOhgtzMlHYOhSCG9YFi9YWnj5LopzG0jkB0MpCqlR/ecT4GZdZ2yOwq
   0Zd2t3WfuJE6jw4xzsCZLvO7Jmr5rZgTJRFAiOPXwxtm1UZiqEItIU7Rh
   A==;
X-CSE-ConnectionGUID: mMcpgQ+jQmuFtbdX4Hm0+w==
X-CSE-MsgGUID: msR5kkSPQAiCOMWh0UVeRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4210165"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4210165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:02:18 -0800
X-CSE-ConnectionGUID: mZC79lUKTqqosrXt+aLPow==
X-CSE-MsgGUID: 8bw9PMPrSf2XAcMrJc23Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11143384"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Nov 2026 02:02:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVQsH-000000004oz-0m2b;
	Mon, 23 Nov 2026 10:02:13 +0000
Date: Mon, 23 Nov 2026 11:01:21 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Alexander Mikhalitsyn <alex@amutable.com>
Subject: [brauner-vfs:vfs.fixes 73/76] WARNING: modpost: vmlinux:
 section mismatch in reference: csot_init_sequence+0x6f8 (section: .text) ->
 slab_late_init (section: .init.text)
Message-ID: <20261123110016.hg6iGZdN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   d5b84d3d7e902c44b05b106718c579f3d3834812
commit: a23a784fac2aab55497886626292670bc4972ef9 [73/76] ns: don't call the namespace LSM hooks for kernel-internal namespaces
config: loongarch-randconfig-r2106-20261122 (https://download.01.org/0day-ci/archive/20261123/20261123110016.hg6iGZdN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123110016.hg6iGZdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261123110016.hg6iGZdN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: setup_trace_scratch+0x178 (section: .text) -> .LVL613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btf_parse_fields+0x718 (section: .text) -> .LVL613 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: an30259a_probe+0x12c (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: bcm6328_leds_probe+0x2c0 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: bcm6358_leds_probe+0x208 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: gpio_leds_create+0xf8 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: pca955x_probe+0x190 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: syscon_led_probe+0xd4 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rv770_init+0x2b4 (section: .text) -> __TRACE_SYSTEM_WB_REASON_PERIODIC (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: evergreen_init+0x224 (section: .text) -> __TRACE_SYSTEM_WB_REASON_PERIODIC (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: cayman_init+0x224 (section: .text) -> __TRACE_SYSTEM_WB_REASON_PERIODIC (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: si_init+0x3ec (section: .text) -> __TRACE_SYSTEM_WB_REASON_PERIODIC (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: cik_init+0x474 (section: .text) -> __TRACE_SYSTEM_WB_REASON_PERIODIC (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: mxm_shadow_dsm+0x4c (section: .text) -> .LBI1437 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxm_shadow_dsm+0xa8 (section: .text) -> .LBB1437 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxm_shadow_dsm+0xac (section: .text) -> .LBI1439 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wmi_wmmx_mxmi.isra.0+0x40 (section: .text) -> .LBI1443 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxm_shadow_wmi+0x7c (section: .text) -> .LVL435 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mxm_shadow_wmi+0xe4 (section: .text) -> .LBB1463 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvkm_mxm_new_+0x94 (section: .text) -> .LBI1465 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvkm_mxm_new_+0x9c (section: .text) -> .LBB1465 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvkm_mxm_new_+0xa0 (section: .text) -> .LBI1467 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvkm_mxm_new_+0x150 (section: .text) -> .LBB1437 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nvkm_mxm_new_+0x154 (section: .text) -> .LBB1472 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gf117_volt_new+0x40 (section: .text) -> param_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gf117_volt_new+0x44 (section: .text) -> .LVL209 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nv10_sw_chan_new+0x24 (section: .text) -> .Lpcadd_hi76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nv10_sw_chan_new+0x7c (section: .text) -> .Lpcadd_hi106 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nv10_sw_chan_new+0x80 (section: .text) -> .Lpcadd_hi107 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nv10_sw_new+0x18 (section: .text) -> .Lpcadd_hi106 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nouveau_read_string+0x1c (section: .text) -> .LVL141 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nouveau_hwmon_set_pwm1_max+0x40 (section: .text) -> .LVL143 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nouveau_hwmon_set_pwm1_max+0x8c (section: .text) -> .LVL145 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ota7290b_get_modes+0xc (section: .text) -> mmap_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ota7290b_probe+0x18 (section: .text) -> .LVL84 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x6bc (section: .text) -> .LVL4077 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x6d0 (section: .text) -> .LVL4078 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x6e4 (section: .text) -> .LVL4086 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x6f8 (section: .text) -> slab_late_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x70c (section: .text) -> slab_late_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x720 (section: .text) -> slab_late_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x734 (section: .text) -> .LVL4093 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x748 (section: .text) -> .LVL4094 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x75c (section: .text) -> .LVL4104 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x770 (section: .text) -> .LVL4098 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x784 (section: .text) -> .LVL4095 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x798 (section: .text) -> .LVL4102 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: csot_init_sequence+0x7ac (section: .text) -> .LVL4105 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: it6505_parse_link_capabilities+0x404 (section: .text) -> .LBB1255 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mfd_add_device+0x204 (section: .text) -> .LVL33 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mfd_add_device+0x244 (section: .text) -> .LVL37 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mfd_add_device+0x338 (section: .text) -> .LBB14 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mfd_add_device+0x354 (section: .text) -> jffs2_lzo_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mfd_add_device+0x36c (section: .text) -> .LBB19 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ntxec_probe+0x128 (section: .text) -> autofs_dev_ioctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ntxec_probe+0x12c (section: .text) -> autofs_dev_ioctl_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: doc_register_readb+0x128 (section: .text) -> init_trusted (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: doc_register_readb+0x17c (section: .text) -> cleanup_trusted (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: doc_register_readb+0x1e0 (section: .text) -> init_trusted (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: flashcontrol_show+0x7c (section: .text) -> cleanup_trusted (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: flashcontrol_show+0x88 (section: .text) -> capability_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: dps0_is_key_locked+0x16c (section: .text) -> capability_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dps0_is_key_locked+0x1b4 (section: .text) -> capability_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dps0_is_key_locked+0x1d4 (section: .text) -> capability_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: version_show+0x14 (section: .text) -> .LBB226 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: autoresize+0x1e8 (section: .text) -> .LVL73 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: uif_init+0x28 (section: .text) -> security_initcall_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uif_init+0x88 (section: .text) -> security_initcall_early (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: uif_init+0x228 (section: .text) -> security_initcall_pure (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x2c (section: .text) -> .LFB5725 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x68 (section: .text) -> .LBI263 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x74 (section: .text) -> .LBB263 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x80 (section: .text) -> avc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x98 (section: .text) -> .LBB265 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0xa8 (section: .text) -> .LVL204 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0xd0 (section: .text) -> .LVL205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0xe8 (section: .text) -> .LVL208 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x108 (section: .text) -> .LVL211 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x130 (section: .text) -> .LVL212 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x148 (section: .text) -> .LVL213 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x170 (section: .text) -> .LVL214 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x190 (section: .text) -> .LVL215 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show.part.0+0x1b0 (section: .text) -> .LVL216 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show+0xc (section: .text) -> .LVL217 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show+0x20 (section: .text) -> .LVL220 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: dev_attribute_show+0x68 (section: .text) -> early_security_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: io_init+0x2e0 (section: .text) -> .LVL197 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: io_init+0x2e4 (section: .text) -> .LVL198 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: io_init+0x30c (section: .text) -> .LVL199 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: io_init+0x310 (section: .text) -> .LVL200 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: io_init+0x330 (section: .text) -> security_add_hooks (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_volume_notify+0x7c (section: .text) -> .LBI248 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_get_device+0x28 (section: .text) -> .LBI250 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_get_by_major+0x68 (section: .text) -> .LBB252 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_get_by_major+0xbc (section: .text) -> .LVL189 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_major2num+0x18 (section: .text) -> .LVL194 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_major2num+0xa4 (section: .text) -> .LFB5721 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0xe8 (section: .text) -> lsm_init_single (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x130 (section: .text) -> lsm_init_single (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x198 (section: .text) -> lsm_blob_size_update (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x1f0 (section: .text) -> lsm_enabled_set (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x208 (section: .text) -> lsm_debug_enable (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x228 (section: .text) -> lsm_choose_lsm (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x408 (section: .text) -> lsm_choose_security (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: ubi_attach_mtd_dev+0x560 (section: .text) -> lsm_prepare.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_notify_add+0x28 (section: .text) -> .LVL106 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_notify_add+0x2c (section: .text) -> .LVL107 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_notify_add+0x74 (section: .text) -> .LVL108 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_notify_add+0xa8 (section: .text) -> .LVL109 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x20 (section: .text) -> .LVL110 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x3c (section: .text) -> .LVL111 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x70 (section: .text) -> .LVL112 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x7c (section: .text) -> .LVL113 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x9c (section: .text) -> .LVL114 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0xa0 (section: .text) -> .LVL115 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0xbc (section: .text) -> lsm_order_parse.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0xd8 (section: .text) -> lsm_order_parse.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0xf0 (section: .text) -> .LVL118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x11c (section: .text) -> .LVL119 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x120 (section: .text) -> .LVL120 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x180 (section: .text) -> .LVL121 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x184 (section: .text) -> .LVL122 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x1e4 (section: .text) -> .LVL123 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_detach_mtd_dev+0x234 (section: .text) -> .LVL125 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vol_cdev_read+0x31c (section: .text) -> securityfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vol_cdev_ioctl+0x430 (section: .text) -> securityfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eraseblk_count_seq_show+0x100 (section: .text) -> checkreqprot_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dfs_file_write+0x8c (section: .text) -> .LBI2926 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dfs_file_read+0x288 (section: .text) -> .LVL80 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dfs_file_read+0x2b0 (section: .text) -> selinux_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: eraseblk_count_open+0x1c (section: .text) -> selinux_enabled_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_dump_flash+0xc8 (section: .text) -> .LBI2922 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init+0x30 (section: .text) -> .LVL76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init+0x34 (section: .text) -> checkreqprot_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_exit+0x8 (section: .text) -> .LVL76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init_dev+0x2c (section: .text) -> enforcing_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init_dev+0x4c (section: .text) -> .LVL76 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init_dev+0x70 (section: .text) -> .LBI2918 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init_dev+0xd8 (section: .text) -> .LVL72 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_debugfs_init_dev+0xec (section: .text) -> selinux_enabled_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gsw1xx_setup+0x1c (section: .text) -> cast5_mod_fini (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: gsw1xx_setup+0x154 (section: .text) -> cast6_mod_fini (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: gsw1xx_port_setup+0x94 (section: .text) -> cast5_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gsw1xx_port_setup+0x98 (section: .text) -> cast6_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mv88e6xxx_get_rxnfc+0x10c (section: .text) -> crypto842_mod_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mv88e6xxx_port_db_get+0x3c (section: .text) -> rng_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mv88e6xxx_port_db_load_purge+0x4c (section: .text) -> crypto842_mod_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mv88e6xxx_port_db_load_purge+0x124 (section: .text) -> drbg_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: qca8k_parse_port_leds+0x1e0 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: rtl8366rb_setup_led+0xe4 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: mt76x02_init_beacon_config+0x2c (section: .text) -> .LVL116 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt76x02_init_beacon_config+0x158 (section: .text) -> .LVL117 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt76x02_mac_set_beacon+0x1c (section: .text) -> .LVL124 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt76x02_enqueue_buffered_bc+0x50 (section: .text) -> .LBB367 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_wiphy+0xb4 (section: .text) -> ltc4283_gpio_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x154 (section: .text) -> ltc4283_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x15c (section: .text) -> ltc4283_gpio_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x184 (section: .text) -> max7300_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x1c4 (section: .text) -> max7300_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x1e0 (section: .text) -> ltc4283_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x1ec (section: .text) -> max732x_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x1fc (section: .text) -> max7300_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x220 (section: .text) -> max77759_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x22c (section: .text) -> max7300_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x264 (section: .text) -> max77759_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x290 (section: .text) -> mb86s70_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x2b4 (section: .text) -> gpio_mockup_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x330 (section: .text) -> max7300_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_register_ext_phy+0x344 (section: .text) -> max7300_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x88 (section: .text) -> gpio_mockup_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0xb4 (section: .text) -> max7300_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0xc8 (section: .text) -> gpio_mockup_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x108 (section: .text) -> gpio_mockup_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x14c (section: .text) -> palmas_gpio_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x16c (section: .text) -> palmas_gpio_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x18c (section: .text) -> palmas_gpio_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x1b0 (section: .text) -> palmas_gpio_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x1dc (section: .text) -> pca953x_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x20c (section: .text) -> pca9570_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x24c (section: .text) -> pca9570_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x28c (section: .text) -> pcf857x_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x2cc (section: .text) -> idio_24_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x308 (section: .text) -> idio_24_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x33c (section: .text) -> max77759_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x378 (section: .text) -> max77759_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x3b0 (section: .text) -> idio_16_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x3d0 (section: .text) -> rdc321x_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x404 (section: .text) -> rdc321x_gpio_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_init_device+0x44c (section: .text) -> gpio_shared_proxy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_mac_add_txs+0x498 (section: .text) -> pca953x_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_mac_write_txwi+0x60 (section: .text) -> pca953x_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_mac_tx_free_token+0xc8 (section: .text) -> pca953x_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_pm_wake_work+0x84 (section: .text) -> pca953x_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7615_pm_power_save_work+0x74 (section: .text) -> pca9570_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt7925e_mac_reset+0x3e4 (section: .text) -> __TRACE_SYSTEM_WB_REASON_DONTCACHE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: mt7925e_mcu_init+0x9c (section: .text) -> __TRACE_SYSTEM_WB_REASON_DONTCACHE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: qtnf_shm_ipc_init+0x100 (section: .text) -> meson_pcie_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_flush_deferred_work+0xac (section: .text) -> sky81452_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_flush_deferred_work+0xc8 (section: .text) -> sky81452_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_ap_set_probe_resp_tmpl_legacy+0x13c (section: .text) -> sky81452_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_bss_info_changed_sta+0x304 (section: .text) -> sky81452_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_bss_info_changed_sta+0x324 (section: .text) -> tps65217_bl_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_bss_info_changed_sta+0x590 (section: .text) -> tps65217_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_bss_info_changed_sta+0x5f0 (section: .text) -> tps65217_bl_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: wl1271_init_ieee80211.isra.0+0x2ec (section: .text) -> .Lpcadd_hi0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
