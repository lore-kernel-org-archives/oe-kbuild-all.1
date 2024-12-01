Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B711761FD8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733051825; cv=none; b=jZM4PzuUD1nyQjfbf3m8sduOJId3P2g7rYhDDRyKjJxRsczhzgalXX6OwinoA3IQLkBrsRhH9NqHOs5QhJ6U/1lK5sR5gCEf0reobFOmYJQNzxbqm2f8bbUXrLA4p4mbgDD6VZTpx2kGIyzn4kzOqDJrAhfGlcbacfijJFwZjM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733051825; c=relaxed/simple;
	bh=8fW8EKHDQYHDOAZ5DozbsLFgGYTBXnkm1mbe0gNQlNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ovGOQ8Jm9QxBCWRI3UUjdln5oQ7uciE1yOL1ySY/uCtbshF0SlY9pNWw/xpln7NjP42Ch0NNvMpBC3bWul0wdqNTaVsqE9F/t/UEw4HoFNOuTJaP+7B5Jze1FhLgsht7x+O3tOhoXrgr0RBoadMly1OrawYii2H1CYvaECQSF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgRrgbe0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgRrgbe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733051823; x=1764587823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8fW8EKHDQYHDOAZ5DozbsLFgGYTBXnkm1mbe0gNQlNE=;
  b=AgRrgbe05Wp99iBFhGNZ36TA10IpSeqWuyNS5YU/ZVLxeNVgPGDPqJfK
   AOk+97PVj3I1tMmyg5S/lHXLoodYphQOZdngZFeUxC8Hd9bngdH2OjNrM
   rn6G/oOmI9Jiicb3pmnYTCmGihPdiNhknBZNRpdO7GA7r6md0O878aW3O
   mh24f1jbVzszHwDYf0lZd7vzqVozMXvDThB3eio9HWOce8zPq0CD2m/lf
   YNQxYxMXmrwo3+Z7R6K4i2wsxJIZY/SzeXHJspUA9/vhvhTwpopzfJcsT
   tHk0xf2q5Vg+1CHvSkTblC2GHCeH6j1/t1ng/chevq2RSOpjtLwoyM5wc
   g==;
X-CSE-ConnectionGUID: 8lCp+PBMQsqI8M7Rqa+KRA==
X-CSE-MsgGUID: SA3QBnXwToW2FHBzscyoqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36085752"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="36085752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 03:17:03 -0800
X-CSE-ConnectionGUID: dmUkGG0pRfeysHSHEcw7Fw==
X-CSE-MsgGUID: syADxA+cQoSlXBqSB7QW1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97625212"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2024 03:17:02 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHhw1-0001UL-30;
	Sun, 01 Dec 2024 11:16:30 +0000
Date: Sun, 1 Dec 2024 19:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] binfmt_elf32.c:undefined reference to
 `arch_elf_adjust_prot'
Message-ID: <202412011905.YdgrD0E0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 7de3ab4c3dd938fae3626a6344830b018eb7ba4f [1466/1466] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-004-20241114 (https://download.01.org/0day-ci/archive/20241201/202412011905.YdgrD0E0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011905.YdgrD0E0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011905.YdgrD0E0-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_interp':
>> binfmt_elf32.c:(.text+0xb58): undefined reference to `arch_elf_adjust_prot'
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `load_elf_binary':
   binfmt_elf32.c:(.text+0x2044): undefined reference to `arch_elf_adjust_prot'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
