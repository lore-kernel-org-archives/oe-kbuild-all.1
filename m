Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F057081A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 21:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733001701; cv=none; b=KLfzxYzbBXPO+saCCGmfmMMv6P0Roe2f/KLLWSYzqi9OeJWqJILFlb8ianN24lM+SqjtpK1ivQ+I/V3lZqQ8rgrDaI6E9IqyNYgpev/UFBREMKWxEZ0AokZoYxc+QU7iqev6alBJhgK0wDTMeaa8EqmB4o/R2GC8kBNnXugHO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733001701; c=relaxed/simple;
	bh=vhDHRZ4YvqJEMsaNwywMcd5E7eZGg0VUJ+IFCSiNVqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUeRu/OOUNwLZXhhHgCVXbLySQ/e+KKWNE7BDYxRByEvOLPtrg7erfROFPKMgDEUlJ0c84uRzLvw5cDpYBJjZAYffds05xNWCVhoebIL06cqxtpdgqi0dZ/bhNYpURrad2KuVOWmwFNzdd+nIq4NUXE1LyDqPFlqCQHQoX4zuFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwZbIrSQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwZbIrSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733001699; x=1764537699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhDHRZ4YvqJEMsaNwywMcd5E7eZGg0VUJ+IFCSiNVqM=;
  b=PwZbIrSQIQfRjOd+Pv6z2rqo2wfLtgzcK6Mg951Ij3iXCiawT90FUUM0
   Z++ZnX+4mxwm4+hr21K25suj+x5REp1pzLldhVWE5i82jHahvk8xIX97X
   DyErXI3K4sEYf0SjtfboChQgQvsPnmvx/0KCLdNoai6Q4be03E1NgSV7M
   m730j8qWnXi4bWQad8Vr+pMqqNT05ktxEkvYgkxAMrP9uermkuN02WrHq
   lWaK8Uts9RfhFaSNhAV7ug88Vd7F6lwXtKLi83olP/hHPXbf9alAutsri
   MNBM4jCHD3no7U7qUOmM86EsFztuO4eZNy0Kdzn5vOH2/clj02tSniPo2
   Q==;
X-CSE-ConnectionGUID: c4A4s5qnTCS18LUM6bU4qw==
X-CSE-MsgGUID: yjSDPpJZTqeLeqXupswBDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33340974"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33340974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:21:39 -0800
X-CSE-ConnectionGUID: 6f+krGuhSbef0R5emJRIXg==
X-CSE-MsgGUID: 9z+u9zzmSfa6+O9hjb85Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97709704"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Nov 2024 13:21:38 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHUuF-0000z5-1O;
	Sat, 30 Nov 2024 21:21:35 +0000
Date: Sun, 1 Dec 2024 05:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Youling Tang <tangyouling@loongson.cn>
Subject: arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text:
 unexpected end of section
Message-ID: <202412010508.PLHqFGSx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e287d31b62bb53ad81d5e59778384a40f8b6f56
commit: cb8a2ef0848ca80d67d6d56e2df757cfdf6b3355 LoongArch: Add ORC stack unwinder support
date:   9 months ago
config: loongarch-randconfig-r053-20241201 (https://download.01.org/0day-ci/archive/20241201/202412010508.PLHqFGSx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010508.PLHqFGSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010508.PLHqFGSx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/loongarch/kernel/machine_kexec.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
