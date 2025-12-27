Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E5321457
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766859714; cv=none; b=A3R0sXx5wTNeeDmyz3fpNMZsvCTdoOmpXpIJ2N36Y/D6Ct9MoeX4n53fuHUFmMSJld/LgZ5UqlYo9slsA6L9+6w+OpWuevBj5FsN0FinI63m6Zi9TShNgBtdfjthdQ1UdzBVfAsagLs+p0zUYeRS8H7imrmJxDUlvp+HIAAdyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766859714; c=relaxed/simple;
	bh=91h/xMQn4rWDdp+eTKH02Rc3AMVL6eX9hGRZxFJyWd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sq0eoSYoXYpjD2beTHg4Ooj7fZ+ZDv4Hj0YWaD/sPKzlTmLZnwknXB4tVy5YcyAc9Gg5IfN0NkanlIQAPiXVQuqmcG5eNQ+UhxTgXWW/AYgqHKg2itBJEN3fmrkgvv/UL6GZQyQo2csA6hSS1N5Cg9QiDiJKhi5bPtHQBBN7t5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNciS5oV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNciS5oV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766859711; x=1798395711;
  h=date:from:to:cc:subject:message-id;
  bh=91h/xMQn4rWDdp+eTKH02Rc3AMVL6eX9hGRZxFJyWd4=;
  b=BNciS5oVoDoC9OAPAIZLxepU3y1V02cLrqkAYBK5/gZ//TReJNkqNFBi
   +2h90sBTk2rj5jIu/hflpStmP7kidd+X0XiaK/9neV2WWNjmnlFxkKK70
   VIHossc8IJJDzJHfj3k2kFh0BU6GuhzoqYT4FNS4vbHKrg1Bgmkn0IzKm
   XCjg+afdv1oLoQPMTjV6H3EncvR8ZsTz27GwzfhCRyCt1UaMObCtkEl2c
   g05gcxzuSlt2g5fkrE1MkJ32ckYbxxuwK5R1k/qFxRrbcwDcquzYfDtZ+
   g9YdLIbdEf2/JzIxC/3gY/PMITfWppKCvchOXmaH8SwyK5iTf1ZzvHkeK
   g==;
X-CSE-ConnectionGUID: mi2i+wgJQW+ykvqfb41Pyg==
X-CSE-MsgGUID: 1Me14zh4R4OfvI+/aoUChA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="86130363"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="86130363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 10:21:49 -0800
X-CSE-ConnectionGUID: 89b/hnfZRN6mS2p1g5DVJg==
X-CSE-MsgGUID: 2AXhiIG0R2uTIQ6JjIi2Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205116974"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2025 10:21:47 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZYvA-00000000619-3Co0;
	Sat, 27 Dec 2025 18:21:44 +0000
Date: Sun, 28 Dec 2025 02:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/vmcs12_fields_hardware 2/3]
 arch/x86/kvm/vmx/hyperv_evmcs.c:15:9: sparse: sparse: cast truncates bits
 from constant value (1a079a becomes 79a)
Message-ID: <202512280253.pPLYoOi0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux vmx/vmcs12_fields_hardware
head:   1a613f6eadb2b2f59864e6217e332148b9e38fc4
commit: 5b09dfe2a6ba7ceaab639234b3a50cc4dbbb4132 [2/3] KVM: nVMX: Disallow access to vmcs12 fields that aren't supported by "hardware"
config: x86_64-randconfig-122-20251227 (https://download.01.org/0day-ci/archive/20251228/202512280253.pPLYoOi0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280253.pPLYoOi0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512280253.pPLYoOi0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:15:9: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:17:9: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:19:9: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:21:9: sparse: sparse: cast truncates bits from constant value (b000b becomes b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:23:9: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:25:9: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:27:9: sparse: sparse: cast truncates bits from constant value (1b001b becomes 1b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:29:9: sparse: sparse: cast truncates bits from constant value (1b009b becomes 9b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:31:9: sparse: sparse: cast truncates bits from constant value (1b011b becomes 11b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:33:9: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:35:9: sparse: sparse: cast truncates bits from constant value (1b049b becomes 49b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:37:9: sparse: sparse: cast truncates bits from constant value (1b059b becomes 59b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:39:9: sparse: sparse: cast truncates bits from constant value (80008 becomes 8)
   arch/x86/kvm/vmx/hyperv_evmcs.c:41:9: sparse: sparse: cast truncates bits from constant value (80088 becomes 88)
   arch/x86/kvm/vmx/hyperv_evmcs.c:43:9: sparse: sparse: cast truncates bits from constant value (80108 becomes 108)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:45:9: sparse: sparse: cast truncates bits from constant value (1a019a becomes 19a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:47:9: sparse: sparse: cast truncates bits from constant value (1a021a becomes 21a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:49:9: sparse: sparse: cast truncates bits from constant value (1a029a becomes 29a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:51:9: sparse: sparse: cast truncates bits from constant value (1a031a becomes 31a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:53:9: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:55:9: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:57:9: sparse: sparse: cast truncates bits from constant value (1a049a becomes 49a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:59:9: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:61:9: sparse: sparse: cast truncates bits from constant value (1a059a becomes 59a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:63:9: sparse: sparse: cast truncates bits from constant value (1a061a becomes 61a)
   arch/x86/kvm/vmx/hyperv_evmcs.c:65:9: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv_evmcs.c:67:9: sparse: sparse: cast truncates bits from constant value (80488 becomes 488)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:69:9: sparse: sparse: cast truncates bits from constant value (a000a becomes a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:71:9: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:73:9: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:75:9: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:77:9: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:79:9: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:81:9: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:83:9: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:85:9: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:87:9: sparse: sparse: cast truncates bits from constant value (1a089a becomes 89a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:89:9: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:91:9: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv_evmcs.c:93:9: sparse: sparse: cast truncates bits from constant value (180018 becomes 18)
   arch/x86/kvm/vmx/hyperv_evmcs.c:95:9: sparse: sparse: cast truncates bits from constant value (180098 becomes 98)
   arch/x86/kvm/vmx/hyperv_evmcs.c:97:9: sparse: sparse: cast truncates bits from constant value (180118 becomes 118)
   arch/x86/kvm/vmx/hyperv_evmcs.c:99:9: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:101:9: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:103:9: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:105:9: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:107:9: sparse: sparse: cast truncates bits from constant value (1a069a becomes 69a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:109:9: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:111:9: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:113:9: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:115:9: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:117:9: sparse: sparse: cast truncates bits from constant value (1b039b becomes 39b)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:119:9: sparse: sparse: cast truncates bits from constant value (1b051b becomes 51b)
   arch/x86/kvm/vmx/hyperv_evmcs.c:121:9: sparse: sparse: cast truncates bits from constant value (80688 becomes 688)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:123:9: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:125:9: sparse: sparse: cast truncates bits from constant value (80b08 becomes b08)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:127:9: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:129:9: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv_evmcs.c:151:9: sparse: sparse: cast truncates bits from constant value (90009 becomes 9)
   arch/x86/kvm/vmx/hyperv_evmcs.c:153:9: sparse: sparse: cast truncates bits from constant value (190019 becomes 19)
   arch/x86/kvm/vmx/hyperv_evmcs.c:167:9: sparse: sparse: cast truncates bits from constant value (190299 becomes 299)
   arch/x86/kvm/vmx/hyperv_evmcs.c:175:9: sparse: sparse: cast truncates bits from constant value (80188 becomes 188)
   arch/x86/kvm/vmx/hyperv_evmcs.c:177:9: sparse: sparse: cast truncates bits from constant value (80208 becomes 208)
   arch/x86/kvm/vmx/hyperv_evmcs.c:179:9: sparse: sparse: cast truncates bits from constant value (80288 becomes 288)
   arch/x86/kvm/vmx/hyperv_evmcs.c:183:9: sparse: sparse: cast truncates bits from constant value (100710 becomes 710)
   arch/x86/kvm/vmx/hyperv_evmcs.c:185:9: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv_evmcs.c:187:9: sparse: sparse: cast truncates bits from constant value (100090 becomes 90)
   arch/x86/kvm/vmx/hyperv_evmcs.c:189:9: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv_evmcs.c:191:9: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv_evmcs.c:193:9: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv_evmcs.c:195:9: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv_evmcs.c:198:9: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv_evmcs.c:200:9: sparse: sparse: cast truncates bits from constant value (130013 becomes 13)
   arch/x86/kvm/vmx/hyperv_evmcs.c:202:9: sparse: sparse: cast truncates bits from constant value (100010 becomes 10)
   arch/x86/kvm/vmx/hyperv_evmcs.c:204:9: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv_evmcs.c:206:9: sparse: sparse: cast truncates bits from constant value (100790 becomes 790)
   arch/x86/kvm/vmx/hyperv_evmcs.c:208:9: sparse: sparse: cast truncates bits from constant value (120012 becomes 12)
   arch/x86/kvm/vmx/hyperv_evmcs.c:210:9: sparse: sparse: cast truncates bits from constant value (120092 becomes 92)
   arch/x86/kvm/vmx/hyperv_evmcs.c:212:9: sparse: sparse: cast truncates bits from constant value (120112 becomes 112)
   arch/x86/kvm/vmx/hyperv_evmcs.c:214:9: sparse: sparse: cast truncates bits from constant value (120192 becomes 192)
   arch/x86/kvm/vmx/hyperv_evmcs.c:216:9: sparse: sparse: cast truncates bits from constant value (120212 becomes 212)
   arch/x86/kvm/vmx/hyperv_evmcs.c:218:9: sparse: sparse: cast truncates bits from constant value (120292 becomes 292)
   arch/x86/kvm/vmx/hyperv_evmcs.c:220:9: sparse: sparse: cast truncates bits from constant value (120312 becomes 312)
   arch/x86/kvm/vmx/hyperv_evmcs.c:222:9: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv_evmcs.c:224:9: sparse: sparse: cast truncates bits from constant value (120412 becomes 412)
   arch/x86/kvm/vmx/hyperv_evmcs.c:226:9: sparse: sparse: cast truncates bits from constant value (120492 becomes 492)
   arch/x86/kvm/vmx/hyperv_evmcs.c:228:9: sparse: sparse: cast truncates bits from constant value (120512 becomes 512)
   arch/x86/kvm/vmx/hyperv_evmcs.c:230:9: sparse: sparse: cast truncates bits from constant value (120592 becomes 592)
   arch/x86/kvm/vmx/hyperv_evmcs.c:232:9: sparse: sparse: cast truncates bits from constant value (120612 becomes 612)
   arch/x86/kvm/vmx/hyperv_evmcs.c:234:9: sparse: sparse: cast truncates bits from constant value (120692 becomes 692)
   arch/x86/kvm/vmx/hyperv_evmcs.c:236:9: sparse: sparse: cast truncates bits from constant value (120712 becomes 712)
   arch/x86/kvm/vmx/hyperv_evmcs.c:238:9: sparse: sparse: cast truncates bits from constant value (120792 becomes 792)
   arch/x86/kvm/vmx/hyperv_evmcs.c:240:9: sparse: sparse: cast truncates bits from constant value (120812 becomes 812)
   arch/x86/kvm/vmx/hyperv_evmcs.c:242:9: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv_evmcs.c:244:9: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
>> arch/x86/kvm/vmx/hyperv_evmcs.c:246:9: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv_evmcs.c:250:9: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv_evmcs.c:252:9: sparse: sparse: cast truncates bits from constant value (110091 becomes 91)
   arch/x86/kvm/vmx/hyperv_evmcs.c:254:9: sparse: sparse: cast truncates bits from constant value (110111 becomes 111)
   arch/x86/kvm/vmx/hyperv_evmcs.c:256:9: sparse: sparse: cast truncates bits from constant value (110191 becomes 191)
   arch/x86/kvm/vmx/hyperv_evmcs.c:258:9: sparse: sparse: cast truncates bits from constant value (110211 becomes 211)
   arch/x86/kvm/vmx/hyperv_evmcs.c:260:9: sparse: sparse: cast truncates bits from constant value (110291 becomes 291)
   arch/x86/kvm/vmx/hyperv_evmcs.c:262:9: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv_evmcs.c:264:9: sparse: sparse: cast truncates bits from constant value (110391 becomes 391)
   arch/x86/kvm/vmx/hyperv_evmcs.c:268:9: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv_evmcs.c:270:9: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv_evmcs.c:272:9: sparse: sparse: cast truncates bits from constant value (100290 becomes 290)
   arch/x86/kvm/vmx/hyperv_evmcs.c:274:9: sparse: sparse: cast truncates bits from constant value (100390 becomes 390)
   arch/x86/kvm/vmx/hyperv_evmcs.c:276:9: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv_evmcs.c:278:9: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv_evmcs.c:282:9: sparse: sparse: cast truncates bits from constant value (30003 becomes 3)
   arch/x86/kvm/vmx/hyperv_evmcs.c:284:9: sparse: sparse: cast truncates bits from constant value (30083 becomes 83)
   arch/x86/kvm/vmx/hyperv_evmcs.c:286:9: sparse: sparse: cast truncates bits from constant value (30103 becomes 103)
   arch/x86/kvm/vmx/hyperv_evmcs.c:288:9: sparse: sparse: cast truncates bits from constant value (30183 becomes 183)
   arch/x86/kvm/vmx/hyperv_evmcs.c:290:9: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv_evmcs.c:292:9: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv_evmcs.c:294:9: sparse: sparse: cast truncates bits from constant value (30303 becomes 303)
   arch/x86/kvm/vmx/hyperv_evmcs.c:296:9: sparse: sparse: cast truncates bits from constant value (20002 becomes 2)
   arch/x86/kvm/vmx/hyperv_evmcs.c:298:9: sparse: sparse: cast truncates bits from constant value (20082 becomes 82)
   arch/x86/kvm/vmx/hyperv_evmcs.c:300:9: sparse: sparse: cast truncates bits from constant value (20102 becomes 102)
   arch/x86/kvm/vmx/hyperv_evmcs.c:302:9: sparse: sparse: cast truncates bits from constant value (20182 becomes 182)
   arch/x86/kvm/vmx/hyperv_evmcs.c:304:9: sparse: sparse: cast truncates bits from constant value (20202 becomes 202)
   arch/x86/kvm/vmx/hyperv_evmcs.c:306:9: sparse: sparse: cast truncates bits from constant value (20282 becomes 282)
   arch/x86/kvm/vmx/hyperv_evmcs.c:308:9: sparse: sparse: cast truncates bits from constant value (20302 becomes 302)
   arch/x86/kvm/vmx/hyperv_evmcs.c:310:9: sparse: sparse: cast truncates bits from constant value (20382 becomes 382)

vim +15 arch/x86/kvm/vmx/hyperv_evmcs.c

e7ad84db4d718e Vitaly Kuznetsov 2023-12-05    8  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05    9  #define EVMCS1_OFFSET(x) offsetof(struct hv_enlightened_vmcs, x)
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   10  #define EVMCS1_FIELD(number, name, clean_field)[ROL16(number, 6)] = \
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   11  		{EVMCS1_OFFSET(name), clean_field}
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   12  
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   13  const struct evmcs_field vmcs_field_to_evmcs_1[] = {
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   14  	/* 64 bit rw */
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @15  	EVMCS1_FIELD(GUEST_RIP, guest_rip,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   16  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_NONE),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @17  	EVMCS1_FIELD(GUEST_RSP, guest_rsp,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   18  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @19  	EVMCS1_FIELD(GUEST_RFLAGS, guest_rflags,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   20  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_BASIC),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @21  	EVMCS1_FIELD(HOST_IA32_PAT, host_ia32_pat,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   22  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @23  	EVMCS1_FIELD(HOST_IA32_EFER, host_ia32_efer,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   24  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @25  	EVMCS1_FIELD(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   26  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @27  	EVMCS1_FIELD(HOST_CR0, host_cr0,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   28  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @29  	EVMCS1_FIELD(HOST_CR3, host_cr3,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   30  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @31  	EVMCS1_FIELD(HOST_CR4, host_cr4,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   32  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @33  	EVMCS1_FIELD(HOST_IA32_SYSENTER_ESP, host_ia32_sysenter_esp,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   34  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @35  	EVMCS1_FIELD(HOST_IA32_SYSENTER_EIP, host_ia32_sysenter_eip,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   36  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @37  	EVMCS1_FIELD(HOST_RIP, host_rip,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   38  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @39  	EVMCS1_FIELD(IO_BITMAP_A, io_bitmap_a,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   40  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   41  	EVMCS1_FIELD(IO_BITMAP_B, io_bitmap_b,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   42  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_IO_BITMAP),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   43  	EVMCS1_FIELD(MSR_BITMAP, msr_bitmap,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   44  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_MSR_BITMAP),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @45  	EVMCS1_FIELD(GUEST_ES_BASE, guest_es_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   46  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @47  	EVMCS1_FIELD(GUEST_CS_BASE, guest_cs_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   48  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @49  	EVMCS1_FIELD(GUEST_SS_BASE, guest_ss_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   50  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @51  	EVMCS1_FIELD(GUEST_DS_BASE, guest_ds_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   52  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @53  	EVMCS1_FIELD(GUEST_FS_BASE, guest_fs_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   54  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @55  	EVMCS1_FIELD(GUEST_GS_BASE, guest_gs_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   56  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @57  	EVMCS1_FIELD(GUEST_LDTR_BASE, guest_ldtr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   58  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @59  	EVMCS1_FIELD(GUEST_TR_BASE, guest_tr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   60  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @61  	EVMCS1_FIELD(GUEST_GDTR_BASE, guest_gdtr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   62  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @63  	EVMCS1_FIELD(GUEST_IDTR_BASE, guest_idtr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   64  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   65  	EVMCS1_FIELD(TSC_OFFSET, tsc_offset,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   66  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   67  	EVMCS1_FIELD(VIRTUAL_APIC_PAGE_ADDR, virtual_apic_page_addr,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   68  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @69  	EVMCS1_FIELD(VMCS_LINK_POINTER, vmcs_link_pointer,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   70  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @71  	EVMCS1_FIELD(GUEST_IA32_DEBUGCTL, guest_ia32_debugctl,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   72  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @73  	EVMCS1_FIELD(GUEST_IA32_PAT, guest_ia32_pat,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   74  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @75  	EVMCS1_FIELD(GUEST_IA32_EFER, guest_ia32_efer,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   76  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @77  	EVMCS1_FIELD(GUEST_IA32_PERF_GLOBAL_CTRL, guest_ia32_perf_global_ctrl,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   78  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @79  	EVMCS1_FIELD(GUEST_PDPTR0, guest_pdptr0,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   80  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @81  	EVMCS1_FIELD(GUEST_PDPTR1, guest_pdptr1,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   82  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @83  	EVMCS1_FIELD(GUEST_PDPTR2, guest_pdptr2,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   84  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @85  	EVMCS1_FIELD(GUEST_PDPTR3, guest_pdptr3,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   86  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @87  	EVMCS1_FIELD(GUEST_PENDING_DBG_EXCEPTIONS, guest_pending_dbg_exceptions,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   88  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @89  	EVMCS1_FIELD(GUEST_SYSENTER_ESP, guest_sysenter_esp,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   90  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  @91  	EVMCS1_FIELD(GUEST_SYSENTER_EIP, guest_sysenter_eip,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   92  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   93  	EVMCS1_FIELD(CR0_GUEST_HOST_MASK, cr0_guest_host_mask,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   94  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   95  	EVMCS1_FIELD(CR4_GUEST_HOST_MASK, cr4_guest_host_mask,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   96  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   97  	EVMCS1_FIELD(CR0_READ_SHADOW, cr0_read_shadow,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   98  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05   99  	EVMCS1_FIELD(CR4_READ_SHADOW, cr4_read_shadow,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  100  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @101  	EVMCS1_FIELD(GUEST_CR0, guest_cr0,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  102  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @103  	EVMCS1_FIELD(GUEST_CR3, guest_cr3,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  104  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @105  	EVMCS1_FIELD(GUEST_CR4, guest_cr4,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  106  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @107  	EVMCS1_FIELD(GUEST_DR7, guest_dr7,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  108  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CRDR),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @109  	EVMCS1_FIELD(HOST_FS_BASE, host_fs_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  110  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @111  	EVMCS1_FIELD(HOST_GS_BASE, host_gs_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  112  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @113  	EVMCS1_FIELD(HOST_TR_BASE, host_tr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  114  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @115  	EVMCS1_FIELD(HOST_GDTR_BASE, host_gdtr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  116  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @117  	EVMCS1_FIELD(HOST_IDTR_BASE, host_idtr_base,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  118  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @119  	EVMCS1_FIELD(HOST_RSP, host_rsp,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  120  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_HOST_POINTER),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  121  	EVMCS1_FIELD(EPT_POINTER, ept_pointer,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  122  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_XLAT),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @123  	EVMCS1_FIELD(GUEST_BNDCFGS, guest_bndcfgs,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  124  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_GUEST_GRP1),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @125  	EVMCS1_FIELD(XSS_EXIT_BITMAP, xss_exit_bitmap,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  126  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @127  	EVMCS1_FIELD(ENCLS_EXITING_BITMAP, encls_exiting_bitmap,
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05  128  		     HV_VMX_ENLIGHTENED_CLEAN_FIELD_CONTROL_GRP2),
e7ad84db4d718e Vitaly Kuznetsov 2023-12-05 @129  	EVMCS1_FIELD(TSC_MULTIPLIER, tsc_multiplier,

:::::: The code at line 15 was first introduced by commit
:::::: e7ad84db4d718e18c7a133e941ba4c7d4c6d4cbf KVM: VMX: Split off hyperv_evmcs.{ch}

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
