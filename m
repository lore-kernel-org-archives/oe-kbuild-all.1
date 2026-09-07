Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931AB24BBEB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 23:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788825601; cv=none; b=j0Fcs5KRxjEgeL/CnrQ5FZN4Z8Ez9JmawClyXQED/EWCvGdedVi+rSE/LlyxdxnASnbYEGbQuZW2XqKOF6Ys6D4blE26IAWe0mRKI8o5g/HoLOLhExtWq4An7jo6rF4fPldc+Y03AmOVxW2S1J9sA4j14xgrOgKaM7UgzvoIeP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788825601; c=relaxed/simple;
	bh=ZagMcHcC31k0q4CxqW70lgJvJOl/Tcu6BCXeOKdPlPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rcgP0jzp4W+4HFnD63CIh18i35QRfmVFLK292irabJ0/QMMheu0HZEGTWjUISPTMG6yuPJIhwSll1wxVLBYl/fGczNiikUieUiAuWEGFPsGHgDATCcB2r6HcMVwOgUQmXClU1oj8YyhAYsG89jSmBlLnRRwtgS2wtqPXzK4Uf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4XlKww9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4XlKww9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788825600; x=1820361600;
  h=date:from:to:cc:subject:message-id;
  bh=ZagMcHcC31k0q4CxqW70lgJvJOl/Tcu6BCXeOKdPlPQ=;
  b=A4XlKww9/VURJecp9rY9qbgt8V+G/SUPNYKq83CUXHziPg5xHBRmYaRQ
   KBiWF4N5veIa4hUyYNQqveKcDrO51ZK+uPswPzw7eNXug4yjev6/9aRm7
   DyZpsUhLeANyx0SDcjl6SOuOl4RRKi9PicRlnNdMvJ5mUA+rhGUcxHDle
   Z3Ys/IMOPYewKOHrY5vTZZAeyhp15tPQVkb3BSKChQprXbuqBl8NUMIuS
   RJPGBckcBrd8OlyNi30QXKCwTX/UhMcC6efkfmjfawuoY87GVXB4p8kri
   WRPnP8S0L3vrdYGl+Ln+dA3+YTHWljzME8m2mqJt335hUYn4xrgNUcPDl
   g==;
X-CSE-ConnectionGUID: DNaCaXe9Qw+myKGCwlhYew==
X-CSE-MsgGUID: fN8g6k13QXivMLb9R0+wlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="92921374"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="92921374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 17:00:00 -0700
X-CSE-ConnectionGUID: KrNEwR5RSmqnwxY+wtn0Dg==
X-CSE-MsgGUID: AKIUzxh6RcWO++JsaxMWTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="274617668"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Sep 2026 16:59:58 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3jFk-000000001Pv-0Kgc;
	Mon, 07 Sep 2026 23:59:56 +0000
Date: Tue, 08 Sep 2026 07:59:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-native-utf16 5/9] riscv64-linux-ld:
 warning: orphan section `.init.modinfo' from
 `./drivers/firmware/efi/libstub/lib-ucs2_string.stub.o' being placed in
 section `.init.modinfo'
Message-ID: <202609080731.v287NYSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-native-utf16
head:   c23f326a96b5293512720f389c597f967132c334
commit: ec6219f4e5821cdee4fda37176bb676fd01a9886 [5/9] efi/libstub: Use ucs2_string library for UTF-16 to UTF-8 conversion
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260908/202609080731.v287NYSb-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080731.v287NYSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080731.v287NYSb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.init.modinfo' from `./drivers/firmware/efi/libstub/lib-ucs2_string.stub.o' being placed in section `.init.modinfo'
>> riscv64-linux-ld: warning: orphan section `.init.modinfo' from `./drivers/firmware/efi/libstub/lib-ucs2_string.stub.o' being placed in section `.init.modinfo'
>> riscv64-linux-ld: warning: orphan section `.init.modinfo' from `./drivers/firmware/efi/libstub/lib-ucs2_string.stub.o' being placed in section `.init.modinfo'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
