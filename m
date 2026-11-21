Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231302;
	b=UuQOq5uEJiFp7+izGrJdcBTGD8lzdUH23p7Qdt2myTvW4RvvQ5n0uI93vCk3Yjn4zEUW
	 8JGVdxM7V30cjAVczFX/yE9qtewAZFr3Eg/LCEop/YkZPHwnAaMespIwK1uoXiiMLnrKd
	 eQUysrdkB4x05593MTMWhaN7p2qFqw7+DRNwvGHYLyxvEKx6vd7IALdpAuj3qZoK4riZ0
	 fAcsG8GDUZaO7UH3UlaOxwry3emvIOdeAE09GEAJaocA0YDGK7wi44RhZiCP7FpMdwJoC
	 d8yzwc+XXpvcowp5kY8hWiOy6WL9rCOHgA/zMPaeKntqQDSWiJdgu+Kc4aTn8o7DaTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231302;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LivgHi8kuAqKDos5Wx2KMoXuk0SVMIYzF4QymkeeLCQ=;
	b=hwXOvGSb+mVaN+omauXX+aooiZRHogeoMnPU3kVPhi/FGk3GDBcSr4So2ouBhgEGI4nl
	 3gsW8UaIiptJDUYVDXw58jUEI7buAKc9j9VRVrhw4kzkBHkkOSTdzelURnBUzKCouuXH6
	 yD7/xhfVygsKaMsCIXi6LKgBmE2Mn2tKj08tQDsZe8BGlgfyp1amPkKR4el5KKK25YEs+
	 Z+sqs/XubfsDbB6FcrHTlXSJcFwn8bj5BrAv3iHHp3BR1WyuQFQ/MQywf8SEkNZSvz4vk
	 bfIBdrg0veLLNFXHj4YVB147yY7h34PAlMdNdAKUH9q73dyHtTMbRQQ4rusZMz3ioig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LL3OZl1N;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB74606A6B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 03:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB74606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LL3OZl1N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795231300; x=1826767300;
  h=date:from:to:cc:subject:message-id;
  bh=xWT99gUhs1avpU/IT6vx6ePVtNSren/7WvK4XkWyZYE=;
  b=LL3OZl1N++fWFfZDfbLgJLv8tYQvPjDgaaLCoQ1NPD91WVwikNaJOoZR
   cPyIqAR9q3k6jxV7sRUQiZGtU9OmN1wWbIGAbzZYpRwoyLp4GdfnsOEtB
   GIOAQRTEfwo1PAQN8EH7XsnNi/Hb8cNWDSzY6z5uZsP+2pa1BA2sQYxmw
   LsbeAK8zy9QfBLMGDTC70am05/yqlpWOtM9jLx+PGIi9FGfD89ATcqJQa
   bM/CT89+y/xFzFD/PIF+hGem3XqnuCXq6gBvRzPG+u7VaQqqIqlnb+eb6
   tUKu8fAK/5HIyCjow4Bi4pDjBECKbASIQTJ7uweNOy9nkwjE1mNyEb85O
   g==;
X-CSE-ConnectionGUID: vt5X2ossTSC97g4l0eq0vg==
X-CSE-MsgGUID: ZEf0HACbSkSNYEviTlkn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4217412"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4217412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 19:21:39 -0800
X-CSE-ConnectionGUID: 4GOSNR3mQ3eJygl9XSlhkA==
X-CSE-MsgGUID: JRMvIkhTT7mYeN8mdBg1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11132723"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2026 19:21:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUbfT-000000004Dx-33KM;
	Sat, 21 Nov 2026 03:21:35 +0000
Date: Sat, 21 Nov 2026 04:20:45 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 4/9] powerpc-linux-ld:
 fabrics.c:undefined reference to `nvme_auth_extract_key'
Message-ID: <20261121041804.w8OaSMlm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 471402e9fa1b77a993d10ccd1568579108ea44e8 [4/9] nvme: parse dhchap keys during option parsing
config: powerpc-randconfig-r2300-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121041804.w8OaSMlm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121041804.w8OaSMlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121041804.w8OaSMlm-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/nvme/host/fabrics.o: in function `nvmf_parse_options':
   fabrics.c:(.text+0x3134): undefined reference to `nvme_auth_extract_key'
>> powerpc-linux-ld: fabrics.c:(.text+0x31cc): undefined reference to `nvme_auth_extract_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
