Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418129C33F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 06:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786255639; cv=none; b=TApJqUKbx397W8mWcxORep94/b+SslXUo/r8FJtfCHbIgSEgrBk9RhLFKql6SpuzuaYe++zVS74GJVt6fCGOvs4uj8QZUEs+N3NQa/S94auv3ZzqWuSrSOzfeTvGz0lnQajMpggjGaRndH82mG3izqic7DOZAU2ZtIKiwAaPSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786255639; c=relaxed/simple;
	bh=IhLh61rE8nPfWndA2nLSbDfGju9PpQmPfKcifP+SFLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfjO/0L8ujZYVF1J8jqMtDyhAu2aQ6IW/nROb5Wty4hnwRO3hvhuVxV4Vxct/8z2gH7oBq1vt1fsM61Lsid1dMSO4zv1gUrs3svGjTHfXEcdOdfct/mCblRKHAYU+G9Qva4uwYjB9886iaqmu8fXBQHrqDo4o86jF4YsPsunIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkmYE46p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkmYE46p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786255636; x=1817791636;
  h=date:from:to:cc:subject:message-id;
  bh=IhLh61rE8nPfWndA2nLSbDfGju9PpQmPfKcifP+SFLU=;
  b=VkmYE46pHiqMc6ccqSq4CfxIQCLdrCf3rp8rVHpZ64hHtSi3Ka3Hdp+D
   6Cil2p7hmrPTWPompDLE7DLQMYoD37c9j7OAiiEUOEF+wY9dSa9LAUME7
   HnPiUdQOFWjsxlaAwWlB/FECnmdLTasIRwOdIyuerj72zmblDxwYKhz1M
   2xGsraVIpN02UERhNpndriWIqY0CHRh2pnn4AXh3DWus5TwBFC+tkdst3
   BNTGvfqZWP5NDeSOxyuAUVmZLKgXZ+bPJhaVeR2XFx0x8nnBjgcMBNdUZ
   hHqsB/SOMnD/uhotFaGGJzELC+upncNXiYGVxG6IZvQSGjAzg87QX+SEK
   w==;
X-CSE-ConnectionGUID: JzuAJihYQ+qcTX1cgsBtYA==
X-CSE-MsgGUID: nqmdlQ1BTRu+cUFDIxEOuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="97153761"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="97153761"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 23:07:15 -0700
X-CSE-ConnectionGUID: clybgtUUS8WAtx18mPi4ug==
X-CSE-MsgGUID: dj1xqtSrSciEoClwgtKIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="261002537"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2026 23:07:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wswgg-00000000LV7-45lB;
	Sun, 09 Aug 2026 06:07:10 +0000
Date: Sun, 09 Aug 2026 14:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [agd5f:drm-next-7.3 220/308]
 drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202608091359.6y1fsMSS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi YiPeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: d95700604fbc6fd7534303796d005e6efbd1d591 [220/308] drm/amd/ras: rename core ras_* files and update include guards
config: riscv-randconfig-r111-20260807 (https://download.01.org/0day-ci/archive/20260809/202608091359.6y1fsMSS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091359.6y1fsMSS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608091359.6y1fsMSS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:274:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:275:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:276:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:277:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:278:15: sparse:     got restricted __le32 [usertype]
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:287:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:288:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:289:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:290:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:291:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:333:15: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c:343:15: sparse: sparse: cast to restricted __le32
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c:115:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom_fw.c:367:56: sparse: sparse: Using plain integer as NULL pointer

vim +274 drivers/gpu/drm/amd/amdgpu/../ras/core/eeprom.c

5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  267  
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  268  static void
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  269  __encode_table_header_to_buf(struct ras_eeprom_table_header *hdr,
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  270  			     unsigned char *buf)
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  271  {
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  272  	u32 *pp = (uint32_t *)buf;
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  273  
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17 @274  	pp[0] = cpu_to_le32(hdr->header);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  275  	pp[1] = cpu_to_le32(hdr->version);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  276  	pp[2] = cpu_to_le32(hdr->first_rec_offset);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  277  	pp[3] = cpu_to_le32(hdr->tbl_size);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  278  	pp[4] = cpu_to_le32(hdr->checksum);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  279  }
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  280  
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  281  static void
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  282  __decode_table_header_from_buf(struct ras_eeprom_table_header *hdr,
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  283  			       unsigned char *buf)
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  284  {
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  285  	u32 *pp = (uint32_t *)buf;
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  286  
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17 @287  	hdr->header	      = le32_to_cpu(pp[0]);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  288  	hdr->version	      = le32_to_cpu(pp[1]);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  289  	hdr->first_rec_offset = le32_to_cpu(pp[2]);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  290  	hdr->tbl_size	      = le32_to_cpu(pp[3]);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  291  	hdr->checksum	      = le32_to_cpu(pp[4]);
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  292  }
5c3be5defc926ba drivers/gpu/drm/amd/ras/rascore/ras_eeprom.c YiPeng Chai 2025-03-17  293  

:::::: The code at line 274 was first introduced by commit
:::::: 5c3be5defc926ba8970bc3d1c26a14adad2b8a7a drm/amd/ras: Add eeprom ras functions

:::::: TO: YiPeng Chai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
