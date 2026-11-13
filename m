Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558121;
	b=zjVNhKT0NKNOKPrcZbE1kd/KPkafFg1dMiUP7jmsEDmibDSZ17ZczvzPlIyg8Ea+pfec
	 GAiwZfeBPmOs/VlC0TgRjt5vEAfQOXmZ4mMUFeUub6eEO3UpVMvfw5KtX3DvloPGPH2VZ
	 VGI1ey5lB/HewjViKJwqMF3mtKLypj+jJEqIZ8cA9u64LBHlVUgOt7PNuHSlzEpWNuQ8L
	 TOkwGieL1nYEIjzNZ9LRWUUMp1ROwgGkCRZ8cGrJwVhxlSGEQPIcPTJTxXpvMDsT0jeNg
	 kCbm4vDFmmrDm5N4wbR/hLMHBFCUly+K2bY4S5fmVdKvZKzc0+AJtPIkMrWVV9ZOFCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PIpUT7ECHVVtF3M+c3hCg14ovvIsP5Fbxl0TWplGebo=;
	b=WultCgTh+rJAU+/wKXpvqfD757EM4U8PYYpANfqLkkODdoko4HzCTHzPveQcIcDzF+Xa
	 QhkXgWjw4HEJw7r0V4Ek2fvrDGse2pP3hjcRJ4YE4MI94OqRxBT1IYzb7lrZZjEiXto9F
	 qwgxmbcNazPfinw3k2S2HlaV/eM0IlXpJPrqWGL3vB4oiEmCeIlXQ9e1Z102RiVi5GJgF
	 9c8TbRUAtMbyHZiUDRxckw+P7T8yyBCsZ3prwEqkOFlZwtiCDsdlOp/L9eZj3BUe3ixm3
	 IsihNri0VqrJvhe4FhwVpnT5rjO4wqGSQQGa7Qh5l5nx3DognCr4LSE6kYAn0WmQBwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVqUBzFW;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A032A606A32A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 08:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A032A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CVqUBzFW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794558120; x=1826094120;
  h=date:from:to:cc:subject:message-id;
  bh=iETxo66LKBsx9qFZR4S8PK0wEbto8xIMQ+YEfjo3QUk=;
  b=CVqUBzFWxEHgMF7RRzpF3CYN1twLE2sSVWcjYyOJhOzjdajYG9W7ZX0F
   Ryot4EIjP2o0NY2FAXH17TysmAViv27yANN64DaVnhw4R+Ne2rmRO7vOR
   v6iCtYlLYRr5cbhKoiTuv5K0CIcaUXfxu4AhwcE3JZmKlbIW8OL7iB1cV
   lYdUKrPxmllL/rt/HzFU6MIU9JZufIn25GU8ooMftjPt3xqzBW2QjCUWQ
   //FbA3IpDBcCq3fY5f/KayjPOLi2kg8BbF0MRsswmR4l6XyjrKhGy4QYn
   QFYIv6cJcDO4UMNPnqqGE6nWWq90++ztd7jdOnuiIK9uUtFhWREtAz9o7
   g==;
X-CSE-ConnectionGUID: ZlSRH9x/TJq6IPTXqfPIOQ==
X-CSE-MsgGUID: j361jvXURPKhIoCO23dZLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3366481"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3366481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 00:22:00 -0800
X-CSE-ConnectionGUID: r2DZds9RRe2DMkJuicJ6Rg==
X-CSE-MsgGUID: DsecWhNbSEqckid1gnENqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9148063"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2026 00:21:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRmXj-000000012Zd-2un2;
	Fri, 13 Nov 2026 08:21:55 +0000
Date: Fri, 13 Nov 2026 16:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Anil Kumar Mamidala <anil.mamidala@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 1475/1490] ERROR: modpost:
 "__ffsdi2" [drivers/media/platform/xilinx/xilinx-dprxss.ko] undefined!
Message-ID: <202611131642.tH6HkJQw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dhanunjanrao,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   964e4db09c78beb79bace2b636061cb3261b0512
commit: b0d1801d8b6db9066d1218a63a384868c3c71334 [1475/1490] media: xilinx: dprxss: follow the source out of UHBR into 8B/10B
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611131642.tH6HkJQw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131642.tH6HkJQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131642.tH6HkJQw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x88 (section: .text) -> is_static_object (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x8c (section: .text) -> is_static_object (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x294 (section: .text) -> dummy_tlb_add_page (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x29c (section: .text) -> dummy_tlb_add_page (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x418 (section: .text) -> dummy_tlb_flush (section: .init.text)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
ERROR: modpost: "__umoddi3" [drivers/gpu/drm/xlnx/xlnx-dptx.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xlnx/xlnx-dptx.ko] undefined!
>> ERROR: modpost: "__ffsdi2" [drivers/media/platform/xilinx/xilinx-dprxss.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/media/platform/xilinx/xilinx-isppipeline.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
