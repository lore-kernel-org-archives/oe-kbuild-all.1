Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771E19BBA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 15:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735658896; cv=none; b=Hg2nGwetEyUv4sJ3tTgTAVGoHUpP92bElp29Y7Mc8191F0b132d14LTDQ5D8Fozr3QRyhr+0BYckmg0C5u+wumYwfP4zMIKIRx+8zZIhIR54MrwghQZfWhj9YcrbI+mGgvqrPpmNh++g4IAtiGPuIKmicmQemPue+vUwrkKqdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735658896; c=relaxed/simple;
	bh=iH3kTFm9NEJok/xY6R5CZynXAxJVgoCz4Iv8OQUUK5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tFU9phSqwL3wBrojtOY5nmwHRLCIBVvU/vrGLcR+N1UwYdRAPgo1zHlYkgXj6qDl+9FG0EKP/Cek8b9JRufFCGSksRMF6OuyvGWlWf/bHdpj5/sIL/W/2lTw5P/TOaJsQpy0cNJjfZMNPGxnGsbYQKF3nMyEGHOZfP4bBarNNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMUFwnDJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMUFwnDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735658895; x=1767194895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iH3kTFm9NEJok/xY6R5CZynXAxJVgoCz4Iv8OQUUK5o=;
  b=EMUFwnDJmZFUUbsyN+PJeX2kvaah+XReOWwsRccLzea+vD/VKeNt3ilA
   Ho862s6OGRlR6sXk4d+QxquWAy9CugtlmJWPfDamjw1y0JizhdsYSr1sI
   hwAQTQRTlTO9y1PU0Ww7J/sVLLIBYKJvhQ+dHbrTLNtzAroZL4vi/H2Nh
   78mrBs/7LPVSaeHujOftjaskV3rLuhC8GDh+clSYxUcMS6nFZ4K9KPsTl
   hjVkyJ1SHOt0/1eRH+oSWw5xrQI2fYutxw9Z6T9dteSIVVjcu8puEYK9n
   xDqcmamuHxFCc+U3CQIOyb2tkSMFCwNm2t1SThcQyxovq7XnFlMxFHkqs
   g==;
X-CSE-ConnectionGUID: BEkQvtCIR56GmNxuWhkCdw==
X-CSE-MsgGUID: Cbxvh08uRjez/djZUwtIxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36052759"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="36052759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 07:28:14 -0800
X-CSE-ConnectionGUID: uAkfU9A9RQmv9y/zaz2SqQ==
X-CSE-MsgGUID: c0pIh3gxQU6JXpg/eK1BqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106075133"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Dec 2024 07:28:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSeAF-0007D5-10;
	Tue, 31 Dec 2024 15:28:11 +0000
Date: Tue, 31 Dec 2024 23:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2602/2602] drivers/misc/eeprom/idt_89hpesx.o:
 warning: objtool: idt_dbgfs_csr_write()+0xed: unreachable instruction
Message-ID: <202412312353.A1QeV40A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   55bf638d3d29c53ddd64ed89efda8b70b47ccbbc
commit: f375c431218120ab6cb5ea6cd5bb6982759dce2a [2602/2602] eeprom: idt_89hpesx: uninitialized data in idt_dbgfs_csr_write()
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241231/202412312353.A1QeV40A-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412312353.A1QeV40A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412312353.A1QeV40A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/eeprom/idt_89hpesx.o: warning: objtool: idt_dbgfs_csr_write()+0xed: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
