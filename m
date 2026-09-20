Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67E2E1F0E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 05:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880545; cv=none; b=V6JyxkOErk871QxW+cucemWQXJi6jTvi/7dABS1QyBJgb7yXtC6QZR9NvSUFIEbd9bCCqPU0s6/QJQmiSPn0i8Zeuw2MIk+qihmcKwxGddRQSFov33yYJT/yeLzKtKAcALA+pYo+Shux7SzcgIeCD8t2BnAxdjv1kzk+YbZIOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880545; c=relaxed/simple;
	bh=DqNUiybL7oM0kDgjoZbL4SkuS2LzDEysIkKXZVlUWAY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JDhAL5v/TGwH9/efJwsKqNi0tH03zXIYmntTYab+EW0k1TnpYB0+j/xzWQ5Ik+sRXXMfRdzNEXp+yH9oTH1qxYVqnEEADWWZBcpAj6KhrJdq502qfXOlSO53sMviBooD4eu9Np/V6qwbmiXu+Mm1dTf93UYkacqKZZbkYkddJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvZDziIV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvZDziIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789880534; x=1821416534;
  h=date:from:to:cc:subject:message-id;
  bh=DqNUiybL7oM0kDgjoZbL4SkuS2LzDEysIkKXZVlUWAY=;
  b=QvZDziIVyef33hUhskqjCwALSBhifKM0fcBY75ezNWdL0ojfsaHnz1YZ
   ciqDIF2bi10sGar4syAS60BLoOsIUBjI0KP1LvpB8DrZTJCrBc8S/sqjx
   JSrww/FWb28/slm6XaiP0E+gOI5QiekIjId6M06Kd5SSQaFiGw7tjpB9j
   WCMvobCdfbBDeC9CWwhlIj3RT9nYsRiZsQXZH58JqpIrMZlfaPzCN40hv
   8agt4tem548H9HPNVTIAXb+p+UGoq4u4F6EgmPRIFLE6h+i/d2hCY583B
   DzAc5LQqDdTEK8qvDcEThIYDbkQFqG9vVjXj67KnbccGNtyjoBj+zfVh2
   A==;
X-CSE-ConnectionGUID: hjhH6wFEQFSwrq1thMkN1A==
X-CSE-MsgGUID: 1f+2G2btTh6LXuwataQ5Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="101053129"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="101053129"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 22:02:14 -0700
X-CSE-ConnectionGUID: LtHgL5OCS5SAwV/DyKcBxw==
X-CSE-MsgGUID: QihTsLItS6mUTUt5Ro76BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="300110785"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Sep 2026 22:02:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x89gn-00000000Btn-3Dh2;
	Sun, 20 Sep 2026 05:02:09 +0000
Date: Sun, 20 Sep 2026 13:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol
 'pl011_hyp_init' was not declared. Should it be static?
Message-ID: <202609201247.4MEZQzzN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 1a8bda12e0e953d8b55f264a3ca0e33a508965ab [1/1] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260920/202609201247.4MEZQzzN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201247.4MEZQzzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201247.4MEZQzzN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: sparse: sparse: symbol 'pl011_hyp_init' was not declared. Should it be static?

vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
