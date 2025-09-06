Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72625D20D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757159318; cv=none; b=oPMlP7Ibntq1G+mNb2r2UG3vkG5FRGHA/9oOqIJnD3SBag/N9fZSUtY+GfBCKVK9+9VubscaDWbRYEgPR3yzLLGzSYeoko69AjP+a/bwmarH5a3ioUPDPTh1IItfMO2jKwoQFFOkqlpnJ/T8HNRujrcxSf8aO2sOaHNLKPVNgnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757159318; c=relaxed/simple;
	bh=kT2Y52dUmGOmoD+14m/V62YAY/kb7QmRqMWkKssPc74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usFAk4JcP4nf3/u68ZoL6CIIrLv5pWvjTQ8yI7/hZ4jaU8cZBee5ptIzQa8qRLXSO9f7v96pvL8XxL1WS1eF0WzuAGZtPRGiXc1HPc/oitEbNywJcFo5GdMcuqbbg6gwJmdZCBN27XLciDYCZP6mPauZQF+/Vzd7LplpVn0ABys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nvw4Iot4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nvw4Iot4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757159316; x=1788695316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kT2Y52dUmGOmoD+14m/V62YAY/kb7QmRqMWkKssPc74=;
  b=Nvw4Iot4j+jHXSxsEoxJ0PkGLPf/h96P9uQtDdHwdEMqz3smn83EOkbE
   4qg49A8jWwEkwrBk3uMCxbe6IqdWjc0Sov8/zp5z98nBRbiWT0ya9CoNf
   QIRRkR5dNZKyEJnQ/y7tQsHhmatUfGEzqdY/WMo/BCOPnsHhfV/Il/58p
   Pqfe83zDnQyH5h3jL10trL15rH14JerBKfiyBWlZuKZ4or1vpZvneDYoX
   BomAspmfx5hUg/q7CzfrvTyv/xDNjeI8H3yWQnEq7CFvAfdAqu4eZ9m+F
   PE9BqL8eMIsp+xcN7UAjSmuUPvYlYTtCyeVI2prhhJMDo3Zr4FpUK4Xgt
   g==;
X-CSE-ConnectionGUID: TT9U5teLQD+4zhIOt3JHDw==
X-CSE-MsgGUID: ZaQdewx5T3+kCT5KfySIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58526517"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58526517"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 04:48:33 -0700
X-CSE-ConnectionGUID: 2VoetSuMSK2Vm6ffcgeryA==
X-CSE-MsgGUID: 9LRs0mJZRT+6sIwB8PLCuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="203177594"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Sep 2025 04:48:32 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uurPB-0001Or-2O;
	Sat, 06 Sep 2025 11:48:29 +0000
Date: Sat, 6 Sep 2025 19:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6220/6355] ERROR: modpost:
 "page_range_contiguous" [drivers/tee/tee.ko] undefined!
Message-ID: <202509061924.O4PKPOfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5d4872e528796df9d7425f2bd9b3893eb3a42c
commit: 42618a95aaa2e55e8152708a4b78caa85a5c8a02 [6220/6355] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git
config: arm-randconfig-r072-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061924.O4PKPOfw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061924.O4PKPOfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061924.O4PKPOfw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "page_range_contiguous" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "page_range_contiguous" [crypto/krb5/krb5.ko] undefined!
ERROR: modpost: "page_range_contiguous" [drivers/dma/sh/rcar-dmac.ko] undefined!
ERROR: modpost: "page_range_contiguous" [drivers/mtd/nand/qpic_common.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/tee/tee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
