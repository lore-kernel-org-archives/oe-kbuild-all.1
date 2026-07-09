Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC7332917
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612744; cv=none; b=MV3U/cACSYxUea+te3s16XmE6jHsMjhWXeWUiVS7yTA4O/NwayXlsOsmDliqCyL1iogGz3jen87k/uQQdLzbxuR/eUu2j7g6v2Xr4L3lTx4cctJcJexoKr35Qf3vOngLrBWdprC5+nDqR+so2UNuGFIBFHwsFRUV3A9V5sGNrT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612744; c=relaxed/simple;
	bh=FsdwZ/CZPPzJarl3TLb/Tafdelh2Tq7B4LHf6MxELrU=;
	h=Date:From:Cc:Subject:Message-ID; b=RIEQGU/Z6igjeJ8CE+RTsxj0NGy4L9OOj4A5aBi6NrshIKSVZom0dyvGsQATI+BrjsL0UjZO2WxvR6gNirYokciZxlOISkn1dz7XwJUGi+j0WPyjzJcP3RHHkBvaWCUZhRXW1bHblnqDLKcHP/Lb72l2MnAcydaLZfWhExYSugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyb9Gr4U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyb9Gr4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783612742; x=1815148742;
  h=date:from:cc:subject:message-id;
  bh=FsdwZ/CZPPzJarl3TLb/Tafdelh2Tq7B4LHf6MxELrU=;
  b=lyb9Gr4UH10gXmFPWQagmba89cddwzWHHOQqqr8IM3cAyMW0xAmhq9jh
   0aS2sxPk0wTUbVZ7pJddgpt9sLSD0z05H5KVbz465o0wi7oy0KHkN1M8E
   eKuMgF9+LSpU32D1ENta1z0Ur3zDydw5yyjqgtZkQTZg31noX4WbLA2Fc
   byMMUfOvJzJ/Oa60EO4o5PPODcn4cKpgxXAW5kDdSeTXWoVQwM3JuQk8i
   sI4wgdvZY5wgqWBUfEOkaKa9TwgE0xXQ4rTczlQt5dqbZ+KC9NsUXcAsv
   Zd85bjXmOziek/Usj1n1ls0m2uVV0uwVz8JPn7752l0rSPGzJeRunXtLs
   A==;
X-CSE-ConnectionGUID: 7grFTwkJSUGuMm5VA8YCDA==
X-CSE-MsgGUID: q3popKT/Sf+wqzejSSYbUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94946501"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94946501"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 08:59:00 -0700
X-CSE-ConnectionGUID: qtkykhxRSVWUpQIqi8zPVw==
X-CSE-MsgGUID: 8TRu6kAxQkic+4OYMA/xKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250221692"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 08:58:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whr9L-00000000Hpb-3WPq;
	Thu, 09 Jul 2026 15:58:55 +0000
Date: Thu, 09 Jul 2026 23:58:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, Chao Gao <chao.gao@intel.com>,
 "Xin Li (Intel)" <xin3.li@intel.com>
Subject: arch/x86/kvm/vmx/vmcs12.c:142:9: sparse: sparse: cast
 truncates bits from constant value (1a0a1a becomes a1a)
Message-ID: <202607092323.FjmBQrHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 625884996bff1b25a39834fa4935d695d71ef1b1 KVM: nVMX: Prepare for enabling CET support for nested guest
date:   10 months ago
config: x86_64-randconfig-123-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092323.FjmBQrHT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092323.FjmBQrHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 625884996bff ("KVM: nVMX: Prepare for enabling CET support for nested guest")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092323.FjmBQrHT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/vmcs12.c:55:9: sparse: sparse: cast truncates bits from constant value (90049 becomes 49)
   arch/x86/kvm/vmx/vmcs12.c:56:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
   arch/x86/kvm/vmx/vmcs12.c:56:9: sparse: sparse: cast truncates bits from constant value (a004a becomes 4a)
   arch/x86/kvm/vmx/vmcs12.c:57:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/vmcs12.c:57:9: sparse: sparse: cast truncates bits from constant value (a00ca becomes ca)
   arch/x86/kvm/vmx/vmcs12.c:58:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/vmcs12.c:58:9: sparse: sparse: cast truncates bits from constant value (a014a becomes 14a)
   arch/x86/kvm/vmx/vmcs12.c:59:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
   arch/x86/kvm/vmx/vmcs12.c:59:9: sparse: sparse: cast truncates bits from constant value (a01ca becomes 1ca)
   arch/x86/kvm/vmx/vmcs12.c:60:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
   arch/x86/kvm/vmx/vmcs12.c:60:9: sparse: sparse: cast truncates bits from constant value (a024a becomes 24a)
   arch/x86/kvm/vmx/vmcs12.c:61:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/vmcs12.c:61:9: sparse: sparse: cast truncates bits from constant value (a02ca becomes 2ca)
   arch/x86/kvm/vmx/vmcs12.c:62:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/vmcs12.c:62:9: sparse: sparse: cast truncates bits from constant value (a034a becomes 34a)
   arch/x86/kvm/vmx/vmcs12.c:63:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/vmcs12.c:63:9: sparse: sparse: cast truncates bits from constant value (a03ca becomes 3ca)
   arch/x86/kvm/vmx/vmcs12.c:64:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/vmcs12.c:64:9: sparse: sparse: cast truncates bits from constant value (a044a becomes 44a)
   arch/x86/kvm/vmx/vmcs12.c:65:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/vmcs12.c:65:9: sparse: sparse: cast truncates bits from constant value (a04ca becomes 4ca)
   arch/x86/kvm/vmx/vmcs12.c:66:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
   arch/x86/kvm/vmx/vmcs12.c:66:9: sparse: sparse: cast truncates bits from constant value (b004b becomes 4b)
   arch/x86/kvm/vmx/vmcs12.c:67:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/vmcs12.c:67:9: sparse: sparse: cast truncates bits from constant value (b00cb becomes cb)
   arch/x86/kvm/vmx/vmcs12.c:68:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/vmcs12.c:68:9: sparse: sparse: cast truncates bits from constant value (b014b becomes 14b)
   arch/x86/kvm/vmx/vmcs12.c:69:9: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/vmcs12.c:70:9: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/vmcs12.c:71:9: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/vmcs12.c:72:9: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/vmcs12.c:73:9: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/vmcs12.c:74:9: sparse: sparse: cast truncates bits from constant value (100290 becomes 290)
   arch/x86/kvm/vmx/vmcs12.c:75:9: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/vmcs12.c:76:9: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/vmcs12.c:77:9: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/vmcs12.c:78:9: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/vmcs12.c:79:9: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/vmcs12.c:80:9: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/vmcs12.c:81:9: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/vmcs12.c:82:9: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/vmcs12.c:83:9: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/vmcs12.c:84:9: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/vmcs12.c:85:9: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/vmcs12.c:86:9: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/vmcs12.c:87:9: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/vmcs12.c:88:9: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/vmcs12.c:89:9: sparse: sparse: cast truncates bits from constant value (110211 becomes 211)
   arch/x86/kvm/vmx/vmcs12.c:90:9: sparse: sparse: cast truncates bits from constant value (110291 becomes 291)
   arch/x86/kvm/vmx/vmcs12.c:91:9: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/vmcs12.c:92:9: sparse: sparse: cast truncates bits from constant value (110391 becomes 391)
   arch/x86/kvm/vmx/vmcs12.c:93:9: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/vmcs12.c:94:9: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/vmcs12.c:95:9: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/vmcs12.c:96:9: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/vmcs12.c:97:9: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/vmcs12.c:98:9: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/vmcs12.c:99:9: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/vmcs12.c:100:9: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/vmcs12.c:101:9: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/vmcs12.c:102:9: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/vmcs12.c:103:9: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/vmcs12.c:104:9: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/vmcs12.c:105:9: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/vmcs12.c:106:9: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/vmcs12.c:107:9: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/vmcs12.c:108:9: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/vmcs12.c:109:9: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/vmcs12.c:110:9: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/vmcs12.c:111:9: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/vmcs12.c:112:9: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/vmcs12.c:113:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/vmcs12.c:114:9: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/vmcs12.c:115:9: sparse: sparse: cast truncates bits from constant value (120b92 becomes b92)
   arch/x86/kvm/vmx/vmcs12.c:116:9: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/vmcs12.c:117:9: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/vmcs12.c:118:9: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/vmcs12.c:119:9: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/vmcs12.c:120:9: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/vmcs12.c:121:9: sparse: sparse: cast truncates bits from constant value (190299 becomes 299)
   arch/x86/kvm/vmx/vmcs12.c:122:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/vmcs12.c:123:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/vmcs12.c:124:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/vmcs12.c:125:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
   arch/x86/kvm/vmx/vmcs12.c:126:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
   arch/x86/kvm/vmx/vmcs12.c:127:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
   arch/x86/kvm/vmx/vmcs12.c:128:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
   arch/x86/kvm/vmx/vmcs12.c:129:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/vmcs12.c:130:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/vmcs12.c:131:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
   arch/x86/kvm/vmx/vmcs12.c:132:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/vmcs12.c:133:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
   arch/x86/kvm/vmx/vmcs12.c:134:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/vmcs12.c:135:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
   arch/x86/kvm/vmx/vmcs12.c:136:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/vmcs12.c:137:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/vmcs12.c:138:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/vmcs12.c:139:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
   arch/x86/kvm/vmx/vmcs12.c:140:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/vmcs12.c:141:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
>> arch/x86/kvm/vmx/vmcs12.c:142:9: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
   arch/x86/kvm/vmx/vmcs12.c:143:9: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
   arch/x86/kvm/vmx/vmcs12.c:144:9: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
   arch/x86/kvm/vmx/vmcs12.c:145:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
   arch/x86/kvm/vmx/vmcs12.c:146:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
   arch/x86/kvm/vmx/vmcs12.c:147:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
   arch/x86/kvm/vmx/vmcs12.c:148:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/vmcs12.c:149:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/vmcs12.c:150:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
   arch/x86/kvm/vmx/vmcs12.c:151:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/vmcs12.c:152:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
   arch/x86/kvm/vmx/vmcs12.c:153:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/vmcs12.c:154:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
   arch/x86/kvm/vmx/vmcs12.c:155:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/vmcs12.c:156:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
   arch/x86/kvm/vmx/vmcs12.c:157:9: sparse: sparse: cast truncates bits from constant value (1b061b becomes 61b)
   arch/x86/kvm/vmx/vmcs12.c:158:9: sparse: sparse: cast truncates bits from constant value (1b069b becomes 69b)
   arch/x86/kvm/vmx/vmcs12.c:159:9: sparse: sparse: cast truncates bits from constant value (1b071b becomes 71b)

vim +142 arch/x86/kvm/vmx/vmcs12.c

     5	
     6	#define VMCS12_OFFSET(x) offsetof(struct vmcs12, x)
     7	#define FIELD(number, name)	[ROL16(number, 6)] = VMCS12_OFFSET(name)
     8	#define FIELD64(number, name)						\
     9		FIELD(number, name),						\
    10		[ROL16(number##_HIGH, 6)] = VMCS12_OFFSET(name) + sizeof(u32)
    11	
    12	const unsigned short vmcs12_field_offsets[] = {
    13		FIELD(VIRTUAL_PROCESSOR_ID, virtual_processor_id),
    14		FIELD(POSTED_INTR_NV, posted_intr_nv),
    15		FIELD(GUEST_ES_SELECTOR, guest_es_selector),
    16		FIELD(GUEST_CS_SELECTOR, guest_cs_selector),
    17		FIELD(GUEST_SS_SELECTOR, guest_ss_selector),
    18		FIELD(GUEST_DS_SELECTOR, guest_ds_selector),
    19		FIELD(GUEST_FS_SELECTOR, guest_fs_selector),
    20		FIELD(GUEST_GS_SELECTOR, guest_gs_selector),
    21		FIELD(GUEST_LDTR_SELECTOR, guest_ldtr_selector),
    22		FIELD(GUEST_TR_SELECTOR, guest_tr_selector),
    23		FIELD(GUEST_INTR_STATUS, guest_intr_status),
    24		FIELD(GUEST_PML_INDEX, guest_pml_index),
    25		FIELD(HOST_ES_SELECTOR, host_es_selector),
    26		FIELD(HOST_CS_SELECTOR, host_cs_selector),
    27		FIELD(HOST_SS_SELECTOR, host_ss_selector),
    28		FIELD(HOST_DS_SELECTOR, host_ds_selector),
    29		FIELD(HOST_FS_SELECTOR, host_fs_selector),
    30		FIELD(HOST_GS_SELECTOR, host_gs_selector),
    31		FIELD(HOST_TR_SELECTOR, host_tr_selector),
    32		FIELD64(IO_BITMAP_A, io_bitmap_a),
    33		FIELD64(IO_BITMAP_B, io_bitmap_b),
    34		FIELD64(MSR_BITMAP, msr_bitmap),
    35		FIELD64(VM_EXIT_MSR_STORE_ADDR, vm_exit_msr_store_addr),
    36		FIELD64(VM_EXIT_MSR_LOAD_ADDR, vm_exit_msr_load_addr),
    37		FIELD64(VM_ENTRY_MSR_LOAD_ADDR, vm_entry_msr_load_addr),
    38		FIELD64(PML_ADDRESS, pml_address),
    39		FIELD64(TSC_OFFSET, tsc_offset),
    40		FIELD64(TSC_MULTIPLIER, tsc_multiplier),
    41		FIELD64(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr),
    42		FIELD64(APIC_ACCESS_ADDR, apic_access_addr),
    43		FIELD64(POSTED_INTR_DESC_ADDR, posted_intr_desc_addr),
    44		FIELD64(VM_FUNCTION_CONTROL, vm_function_control),
    45		FIELD64(EPT_POINTER, ept_pointer),
    46		FIELD64(EOI_EXIT_BITMAP0, eoi_exit_bitmap0),
    47		FIELD64(EOI_EXIT_BITMAP1, eoi_exit_bitmap1),
    48		FIELD64(EOI_EXIT_BITMAP2, eoi_exit_bitmap2),
    49		FIELD64(EOI_EXIT_BITMAP3, eoi_exit_bitmap3),
    50		FIELD64(EPTP_LIST_ADDRESS, eptp_list_address),
    51		FIELD64(VMREAD_BITMAP, vmread_bitmap),
    52		FIELD64(VMWRITE_BITMAP, vmwrite_bitmap),
    53		FIELD64(XSS_EXIT_BITMAP, xss_exit_bitmap),
    54		FIELD64(ENCLS_EXITING_BITMAP, encls_exiting_bitmap),
    55		FIELD64(GUEST_PHYSICAL_ADDRESS, guest_physical_address),
    56		FIELD64(VMCS_LINK_POINTER, vmcs_link_pointer),
    57		FIELD64(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl),
    58		FIELD64(GUEST_IA32_PAT, guest_ia32_pat),
    59		FIELD64(GUEST_IA32_EFER, guest_ia32_efer),
    60		FIELD64(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl),
    61		FIELD64(GUEST_PDPTR0, guest_pdptr0),
    62		FIELD64(GUEST_PDPTR1, guest_pdptr1),
    63		FIELD64(GUEST_PDPTR2, guest_pdptr2),
    64		FIELD64(GUEST_PDPTR3, guest_pdptr3),
    65		FIELD64(GUEST_BNDCFGS, guest_bndcfgs),
    66		FIELD64(HOST_IA32_PAT, host_ia32_pat),
    67		FIELD64(HOST_IA32_EFER, host_ia32_efer),
    68		FIELD64(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl),
    69		FIELD(PIN_BASED_VM_EXEC_CONTROL, pin_based_vm_exec_control),
    70		FIELD(CPU_BASED_VM_EXEC_CONTROL, cpu_based_vm_exec_control),
    71		FIELD(EXCEPTION_BITMAP, exception_bitmap),
    72		FIELD(PAGE_FAULT_ERROR_CODE_MASK, page_fault_error_code_mask),
    73		FIELD(PAGE_FAULT_ERROR_CODE_MATCH, page_fault_error_code_match),
    74		FIELD(CR3_TARGET_COUNT, cr3_target_count),
    75		FIELD(VM_EXIT_CONTROLS, vm_exit_controls),
    76		FIELD(VM_EXIT_MSR_STORE_COUNT, vm_exit_msr_store_count),
    77		FIELD(VM_EXIT_MSR_LOAD_COUNT, vm_exit_msr_load_count),
    78		FIELD(VM_ENTRY_CONTROLS, vm_entry_controls),
    79		FIELD(VM_ENTRY_MSR_LOAD_COUNT, vm_entry_msr_load_count),
    80		FIELD(VM_ENTRY_INTR_INFO_FIELD, vm_entry_intr_info_field),
    81		FIELD(VM_ENTRY_EXCEPTION_ERROR_CODE, vm_entry_exception_error_code),
    82		FIELD(VM_ENTRY_INSTRUCTION_LEN, vm_entry_instruction_len),
    83		FIELD(TPR_THRESHOLD, tpr_threshold),
    84		FIELD(SECONDARY_VM_EXEC_CONTROL, secondary_vm_exec_control),
    85		FIELD(VM_INSTRUCTION_ERROR, vm_instruction_error),
    86		FIELD(VM_EXIT_REASON, vm_exit_reason),
    87		FIELD(VM_EXIT_INTR_INFO, vm_exit_intr_info),
    88		FIELD(VM_EXIT_INTR_ERROR_CODE, vm_exit_intr_error_code),
    89		FIELD(IDT_VECTORING_INFO_FIELD, idt_vectoring_info_field),
    90		FIELD(IDT_VECTORING_ERROR_CODE, idt_vectoring_error_code),
    91		FIELD(VM_EXIT_INSTRUCTION_LEN, vm_exit_instruction_len),
    92		FIELD(VMX_INSTRUCTION_INFO, vmx_instruction_info),
    93		FIELD(GUEST_ES_LIMIT, guest_es_limit),
    94		FIELD(GUEST_CS_LIMIT, guest_cs_limit),
    95		FIELD(GUEST_SS_LIMIT, guest_ss_limit),
    96		FIELD(GUEST_DS_LIMIT, guest_ds_limit),
    97		FIELD(GUEST_FS_LIMIT, guest_fs_limit),
    98		FIELD(GUEST_GS_LIMIT, guest_gs_limit),
    99		FIELD(GUEST_LDTR_LIMIT, guest_ldtr_limit),
   100		FIELD(GUEST_TR_LIMIT, guest_tr_limit),
   101		FIELD(GUEST_GDTR_LIMIT, guest_gdtr_limit),
   102		FIELD(GUEST_IDTR_LIMIT, guest_idtr_limit),
   103		FIELD(GUEST_ES_AR_BYTES, guest_es_ar_bytes),
   104		FIELD(GUEST_CS_AR_BYTES, guest_cs_ar_bytes),
   105		FIELD(GUEST_SS_AR_BYTES, guest_ss_ar_bytes),
   106		FIELD(GUEST_DS_AR_BYTES, guest_ds_ar_bytes),
   107		FIELD(GUEST_FS_AR_BYTES, guest_fs_ar_bytes),
   108		FIELD(GUEST_GS_AR_BYTES, guest_gs_ar_bytes),
   109		FIELD(GUEST_LDTR_AR_BYTES, guest_ldtr_ar_bytes),
   110		FIELD(GUEST_TR_AR_BYTES, guest_tr_ar_bytes),
   111		FIELD(GUEST_INTERRUPTIBILITY_INFO, guest_interruptibility_info),
   112		FIELD(GUEST_ACTIVITY_STATE, guest_activity_state),
   113		FIELD(GUEST_SYSENTER_CS, guest_sysenter_cs),
   114		FIELD(HOST_IA32_SYSENTER_CS, host_ia32_sysenter_cs),
   115		FIELD(VMX_PREEMPTION_TIMER_VALUE, vmx_preemption_timer_value),
   116		FIELD(CR0_GUEST_HOST_MASK, cr0_guest_host_mask),
   117		FIELD(CR4_GUEST_HOST_MASK, cr4_guest_host_mask),
   118		FIELD(CR0_READ_SHADOW, cr0_read_shadow),
   119		FIELD(CR4_READ_SHADOW, cr4_read_shadow),
   120		FIELD(EXIT_QUALIFICATION, exit_qualification),
   121		FIELD(GUEST_LINEAR_ADDRESS, guest_linear_address),
   122		FIELD(GUEST_CR0, guest_cr0),
   123		FIELD(GUEST_CR3, guest_cr3),
   124		FIELD(GUEST_CR4, guest_cr4),
   125		FIELD(GUEST_ES_BASE, guest_es_base),
   126		FIELD(GUEST_CS_BASE, guest_cs_base),
   127		FIELD(GUEST_SS_BASE, guest_ss_base),
   128		FIELD(GUEST_DS_BASE, guest_ds_base),
   129		FIELD(GUEST_FS_BASE, guest_fs_base),
   130		FIELD(GUEST_GS_BASE, guest_gs_base),
   131		FIELD(GUEST_LDTR_BASE, guest_ldtr_base),
   132		FIELD(GUEST_TR_BASE, guest_tr_base),
 > 133		FIELD(GUEST_GDTR_BASE, guest_gdtr_base),
   134		FIELD(GUEST_IDTR_BASE, guest_idtr_base),
   135		FIELD(GUEST_DR7, guest_dr7),
   136		FIELD(GUEST_RSP, guest_rsp),
   137		FIELD(GUEST_RIP, guest_rip),
   138		FIELD(GUEST_RFLAGS, guest_rflags),
   139		FIELD(GUEST_PENDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions),
   140		FIELD(GUEST_SYSENTER_ESP, guest_sysenter_esp),
   141		FIELD(GUEST_SYSENTER_EIP, guest_sysenter_eip),
 > 142		FIELD(GUEST_S_CET, guest_s_cet),

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
