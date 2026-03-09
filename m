Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525337C921
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Mar 2026 23:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099218; cv=none; b=UFSXDDNpT4Ph9R7mNdorcw4UCT3QtoYJej/HMhb5hxqSV6oTrEn878dxlSa31yojQPGl2HpwkRbdlyM41XFA532Bg7+Ku9BAas9ZEP0dm1baxC6284iEg+ZHUDxVyUvT8HjUyK8WuIDCzJbww6Y5GpM0movd1BRhNOfSyEg2fpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099218; c=relaxed/simple;
	bh=VWpVm8OV2xk6rz5vH7dc1Gc1mqNKQgb5qVPurmLKJ/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kU/PCX0Goqhhi8ixdUbDb+8hud7LqSS6pg73HNp9ZsObCLs4zC6bSMmdGRAWYHWEr3093HrqFBZi8Qg//MwpaCcrKX6JCt8bRLq64H6QFnR0LiwKpjjpiK8y3m9cypIGvvALtXMsIXO2KfZ293c4MbqKD6QmS4ljnr/v+QA3/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzTqfl50; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzTqfl50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773099217; x=1804635217;
  h=date:from:to:cc:subject:message-id;
  bh=VWpVm8OV2xk6rz5vH7dc1Gc1mqNKQgb5qVPurmLKJ/c=;
  b=mzTqfl50yNKv7o2giL4NYmq4GRUUsJ+iMNejJLmPZcmVNV2UiMw2KYAo
   xdH+cSuDFRpELTvImKi9F4JbWP+SBXYlDhyvRVnhsw2PY/uWjRpN9R6is
   pgdHnhAWn/UWTNdK5fp7bwLEzKQueIMuPXXvskKrfs2kSLowvHefL770S
   VKCEX3Rv95veRixsI3b13X4Qi/uo9R342rQFpwkxJD/EfJdTCoduKyaBg
   KiiA+x7RQ79wc5CqFJGUf4k7Cnerqx37B6YXks9YkVnb9B/oTyjrPH+UW
   MLmZVjQJGczNfJ0wvionEjnK5zX+lhEyRWDDkZgtEucFfXNMdIjDWEiZ+
   Q==;
X-CSE-ConnectionGUID: Qt0sZmS9Tm2hF5mc9EM5ZQ==
X-CSE-MsgGUID: FT+Ry5XvTbmMfThknO64/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91709892"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="91709892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:33:37 -0700
X-CSE-ConnectionGUID: U2oJHZ+RTxOXyIAg8AgWYA==
X-CSE-MsgGUID: chR+QadNTUGaq0jiNsePRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219124841"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 16:33:35 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzk6O-000000002xp-1prM;
	Mon, 09 Mar 2026 23:33:32 +0000
Date: Tue, 10 Mar 2026 00:32:40 +0100
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [linux-next:master 4353/4591]
 arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: dcmi@4c006000 (st,stm32-dcmi):
 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603100010.wT8G3g4S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
commit: bb3fa3f8a4166e6fbc769e208a1932242800f8e5 [4353/4591] ARM: dts: stm32: enable DCMI DMA-MDMA chaining on stm32mp157c-ev1.dts
config: arm-randconfig-2052-20260308 (https://download.01.org/0day-ci/archive/20260310/202603100010.wT8G3g4S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603100010.wT8G3g4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603100010.wT8G3g4S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: dcmi@4c006000 (st,stm32-dcmi): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: dcmi@4c006000 (st,stm32-dcmi): dma-names: ['tx', 'mdma_tx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: dcmi@4c006000 (st,stm32-dcmi): dmas: [[34, 75, 1024, 1], [72, 0, 3, 301989898, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: dcmi@4c006000 (st,stm32-dcmi): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: dcmi@4c006000 (st,stm32-dcmi): dma-names: ['tx', 'mdma_tx'] is too long
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: dcmi@4c006000 (st,stm32-dcmi): dmas: [[36, 75, 1024, 1], [74, 0, 3, 301989898, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/media/st,stm32-dcmi.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
