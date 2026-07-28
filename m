Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BF842A167
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235365; cv=none; b=q0hf5ngK5t/wYt1ylIDuLAwhq4YuPIOkNGUQRkyMeFDXycYjNvnFtaRW3kswgmAwhHT/XL2G/MqIBAaSXOgvObf+GhBOaaXbXlthWoIgFkxb6TEJZKBh3wHj06/KhywbVgosLy1N4ZaO/N79uCEz9+s2Ey4rU2qp61rx/Kcnr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235365; c=relaxed/simple;
	bh=cvBXze/G6TC++oiTptAKPb7pO28EM3OkjRZlLyRY8fc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zq9Qyz09ZFNGlfVJl08iiM9YPxnxatCGfBZfOjb43PkGjx3KR1YSi/06E3p4keUr0+0BhTlSELIi07cpQ9LgQGoI1e2uw4RzlqginufA9Wt+zQuXfBf1AVwXuwzKc0npr/1F0lciHG+lLaGg1C70yi9xjRdV10htdOsP8W2KplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7h9lYB4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7h9lYB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785235364; x=1816771364;
  h=date:from:to:cc:subject:message-id;
  bh=cvBXze/G6TC++oiTptAKPb7pO28EM3OkjRZlLyRY8fc=;
  b=k7h9lYB4gX2Uo1boxh+8nxwcnyBqpap3phqfK97zv9v6kpWh9mF3hNkB
   YkIUNEgowZuZv18DAk8ebSrm7VVpW7ictI4U8c7ER3dWildSL2tcIGVN6
   1rkw/hSdf7v1gQ6lfunJJAivNHYUi4GCv6dkLX7FlaJVSvH+iUhKcG/oI
   q2XQxgPXiDmnEOcDfpzshHcHXCECHqbx8fslkQPD1h9AyZqdKerkSifqF
   J7HoLr5SS5y9TboltdN6wGwVkRKmiY9qY6sSu4siLrlmzhhPKsHX1exwv
   EewAWMHviErc3MqMT8H7/idajZ6y47xobEnow5XePoxL7zAGkzgyPJEuK
   w==;
X-CSE-ConnectionGUID: Yd9CWYBQST+ZWzg3ApCklA==
X-CSE-MsgGUID: sKPYgm4NSg+oZ2xtPtbntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84794332"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84794332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:42:43 -0700
X-CSE-ConnectionGUID: bJEUVYxlQ+ipjm3Ln1RqUA==
X-CSE-MsgGUID: 8KyxP+wFRamMFWfgAKLWKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263453273"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jul 2026 03:42:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofGh-00000000eFr-35D0;
	Tue, 28 Jul 2026 10:42:39 +0000
Date: Tue, 28 Jul 2026 18:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/1]
 drivers/firmware/arm_scmi/shmem.c:190:9: warning: 'reg_io_width' is used
 uninitialized
Message-ID: <202607281819.jg2NEySd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Florian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a6fc30b246f0d8be1c91e0d37c8b3bc859b1b2bc
commit: fa34bcaf9e7b5bd86a417a14ea86bb88d9ea524e [0/1] BACKPORT: firmware: arm_scmi: Support 'reg-io-width' property for shared memory
config: x86_64-buildonly-randconfig-003-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281819.jg2NEySd-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281819.jg2NEySd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281819.jg2NEySd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/shmem.c: In function 'shmem_get_io_ops':
>> drivers/firmware/arm_scmi/shmem.c:190:9: warning: 'reg_io_width' is used uninitialized [-Wuninitialized]
     190 |         switch (reg_io_width) {
         |         ^~~~~~
   drivers/firmware/arm_scmi/shmem.c:187:13: note: 'reg_io_width' was declared here
     187 |         u32 reg_io_width;
         |             ^~~~~~~~~~~~


vim +/reg_io_width +190 drivers/firmware/arm_scmi/shmem.c

   184	
   185	struct scmi_shmem_io_ops *shmem_get_io_ops(struct device_node *shmem)
   186	{
   187		u32 reg_io_width;
   188	
   189		of_property_read_u32(shmem, "reg-io-width", &reg_io_width);
 > 190		switch (reg_io_width) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
