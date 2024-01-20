Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51839F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 23:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705795141; cv=none; b=GAP42rKv82ZQLBiZjncG7YfJElssvxAM3OygVuvFWL5NEtav16FsCGkHapFmnfBSfb0vlTGXT1HcB9YHta9JWRQmeJBvpkVCtKnYRjQZL89Vp9+FYDvzAC2W/q4Ei8QaZtNbtuTtYiW2XqxWWH0Mz2KljwpSxQudRMG5gVo6Lvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705795141; c=relaxed/simple;
	bh=VOq6hTHZXh+4WzLVF8vJrlTh249NkYJXZI5Ev+xHY+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tb2ZCo1kaOuG6UFi5hKA1GyDwxe/iIUBr2HX+lnoeCG1vVEX/yKDyLtyJSQds0IgXoVBhYI2clagKmfwABSevd7xTgRjj92BRaP7RiC1Odi9rJKD84S31H5Ts1gJqUGqn7VGAa6rV+vS5+6A+UxDPOSESEYKV+9wZUGBBaFyfdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty5suePu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty5suePu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705795140; x=1737331140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOq6hTHZXh+4WzLVF8vJrlTh249NkYJXZI5Ev+xHY+Y=;
  b=Ty5suePu2AqpRSUUEv4AvPlzwoyNbfGO9mqDOmkEYt+FfdoWriXQMyAa
   3fBjYbjq/zCpgeccl5SwLUuN3OxocaK7il5HC2TLQV124XHkhiZo96xjv
   hME3zm3XWOcW5mhOa8V9lerbvryWgT6PPt1jgBRhmG6EWUlugRscPu+AQ
   NELj/WJzIgl1JTGhEzouOafjoCkk1NKGsSQ/R3ma7EElxhnPtNUwelgJL
   jkyCsoCTlmV6znVfnUc4TkxNZG5uHjh8UXwPuLUc1mpdwbp4LsGPT+BYW
   bIMPHZhpPLEcHtlkKSqQ+Dlq+1pjwAOR3JjmNj/gkxngvNmdo9K0ujJTD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="872641"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="872641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 15:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="734836886"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="734836886"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2024 15:58:57 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRLEk-0005XW-2V;
	Sat, 20 Jan 2024 23:58:54 +0000
Date: Sun, 21 Jan 2024 07:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:v2/6.7 8/11] /bin/bash: line 1: 18350 Aborted
                 s390-linux-ld -m elf64_s390 -z noexecstack
 --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds
 --whole-archive vmlinux.a --no-whole-archive --start-group --end-group
Message-ID: <202401210749.ISCUbRAR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.7
head:   59b53403fac6433487b678d487564fa2ee67f229
commit: df8b67f4493c3b35575a87765a6afdfeb61ebb64 [8/11] ctf: generate CTF information for the kernel
config: s390-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210749.ISCUbRAR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210749.ISCUbRAR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210749.ISCUbRAR-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: relocatable linking with relocations from format elf64-s390 (arch/s390/kernel/head64.o) to format elf32-s390 (vmlinux.o) is not supported
   double free or corruption (out)
>> /bin/bash: line 1: 18350 Aborted                 s390-linux-ld -m elf64_s390 -z noexecstack --no-warn-rwx-segments -r -o vmlinux.o -T .tmp_remove-ctf.lds --whole-archive vmlinux.a --no-whole-archive --start-group --end-group

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
