Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654EC2ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714456755; cv=none; b=kmt/dVWbyfDuzceE2ZSZqSvCiFn26AVZPTegzZHMRJ2PETV0wOej/VzCf6oefjoPmPCeqZC2Vu4P8Mjab00+VRzWyG5hIuoIqFGbxIgcFjF+iS9E4jP5JUNxVjVNj4AqFYoJED96/QhtIsU7hh6uKpF+2Oy6q7sytfVmwx6bLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714456755; c=relaxed/simple;
	bh=XbTi6cEH2o1RjLu42OsAPeRKoQL+u/DDLPRzm4EgYwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kaf+Wim8Atv4tG9j/bkzS5rI3SVESrBmGkqTnQ+k0u0KGt122dy6VoabgsPWZYk7teZLNlVQS5WYln5baeRt9sjkX3zC8hbCCpINKJsQA7PluIzlWkwub+2kuDHlC2jsNGhkAGNjimEDku5KzwHJS56R+qkKrOAlRCwtoV8yAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNyy96Ks; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNyy96Ks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714456753; x=1745992753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XbTi6cEH2o1RjLu42OsAPeRKoQL+u/DDLPRzm4EgYwM=;
  b=hNyy96KsHYtvb19s/BvT54eBOMmzliDzufuhzgBBbQZ114PIqQhaU5wZ
   yfSyl/tyBnhDuk3yf779EK/Uig2QVFmydh+wsWaXvQoqYT+inNoDDHIax
   CaMkun1dtvwNtrCpypqEWG8RjGHCcD4bONGghhoPRuLEOp43Cps4m/oAi
   g6b4mH1pDW61MOQoaBYnJ4ZVe678t0yoJ+s+MKMfFeneTT+c0nhhu+rVV
   aArqtb5yri6i2C2Z8vd0cEl/pWNRkUV2o/bmynKk+DKKX9zZVRYAgc9cA
   21OH9VE1CVOZ+3zdCuO2YZ/CkjBSbF9Xh2/wSsUI4WwPyRMh62MmwJaAU
   w==;
X-CSE-ConnectionGUID: nqHHOThkQqiYIDrjrrAnRA==
X-CSE-MsgGUID: bqygaZnQSp66EQbN2ZbiBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10363259"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10363259"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 22:59:13 -0700
X-CSE-ConnectionGUID: 1BXd8/NWQ+qa7gsUxUwbVw==
X-CSE-MsgGUID: JWJ7LVXaR/KkeFgft+ogLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26338468"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2024 22:59:12 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1gWD-0007ng-1o;
	Tue, 30 Apr 2024 05:59:09 +0000
Date: Tue, 30 Apr 2024 13:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:purgatory-cleanup 10/10] riscv64-linux-ld: warning: orphan
 section `.text.verify_sha256_digest' from `arch/riscv/purgatory/purgatory.o'
 being placed in section `.text.verify_sha256_digest'
Message-ID: <202404301323.HTcO423l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git purgatory-cleanup
head:   f932918ce54607563ecc0558f6c14383564891f6
commit: f932918ce54607563ecc0558f6c14383564891f6 [10/10] Switch risc-v to PIE purgatory
config: riscv-randconfig-001-20240430 (https://download.01.org/0day-ci/archive/20240430/202404301323.HTcO423l-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301323.HTcO423l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301323.HTcO423l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.text.verify_sha256_digest' from `arch/riscv/purgatory/purgatory.o' being placed in section `.text.verify_sha256_digest'
>> riscv64-linux-ld: warning: orphan section `.text.purgatory' from `arch/riscv/purgatory/purgatory.o' being placed in section `.text.purgatory'
>> riscv64-linux-ld: warning: orphan section `.text.sha256_transform' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha256_transform'
>> riscv64-linux-ld: warning: orphan section `.text.sha256_transform_blocks' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha256_transform_blocks'
>> riscv64-linux-ld: warning: orphan section `.text.sha256_update' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha256_update'
>> riscv64-linux-ld: warning: orphan section `.text.sha256_final' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha256_final'
>> riscv64-linux-ld: warning: orphan section `.text.sha224_final' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha224_final'
>> riscv64-linux-ld: warning: orphan section `.text.sha256' from `arch/riscv/purgatory/sha256.o' being placed in section `.text.sha256'
>> riscv64-linux-ld: warning: orphan section `.text.strncasecmp' from `arch/riscv/purgatory/string.o' being placed in section `.text.strncasecmp'
>> riscv64-linux-ld: warning: orphan section `.text.strcasecmp' from `arch/riscv/purgatory/string.o' being placed in section `.text.strcasecmp'
>> riscv64-linux-ld: warning: orphan section `.text.strcpy' from `arch/riscv/purgatory/string.o' being placed in section `.text.strcpy'
>> riscv64-linux-ld: warning: orphan section `.text.strncpy' from `arch/riscv/purgatory/string.o' being placed in section `.text.strncpy'
   riscv64-linux-ld: warning: orphan section `.text.strscpy' from `arch/riscv/purgatory/string.o' being placed in section `.text.strscpy'
>> riscv64-linux-ld: warning: orphan section `.text.stpcpy' from `arch/riscv/purgatory/string.o' being placed in section `.text.stpcpy'
>> riscv64-linux-ld: warning: orphan section `.text.strcat' from `arch/riscv/purgatory/string.o' being placed in section `.text.strcat'
>> riscv64-linux-ld: warning: orphan section `.text.strncat' from `arch/riscv/purgatory/string.o' being placed in section `.text.strncat'
>> riscv64-linux-ld: warning: orphan section `.text.strlcat' from `arch/riscv/purgatory/string.o' being placed in section `.text.strlcat'
>> riscv64-linux-ld: warning: orphan section `.text.strchr' from `arch/riscv/purgatory/string.o' being placed in section `.text.strchr'
>> riscv64-linux-ld: warning: orphan section `.text.strchrnul' from `arch/riscv/purgatory/string.o' being placed in section `.text.strchrnul'
>> riscv64-linux-ld: warning: orphan section `.text.strnchrnul' from `arch/riscv/purgatory/string.o' being placed in section `.text.strnchrnul'
>> riscv64-linux-ld: warning: orphan section `.text.strrchr' from `arch/riscv/purgatory/string.o' being placed in section `.text.strrchr'
   riscv64-linux-ld: warning: orphan section `.text.strnchr' from `arch/riscv/purgatory/string.o' being placed in section `.text.strnchr'
   riscv64-linux-ld: warning: orphan section `.text.strnlen' from `arch/riscv/purgatory/string.o' being placed in section `.text.strnlen'
   riscv64-linux-ld: warning: orphan section `.text.strspn' from `arch/riscv/purgatory/string.o' being placed in section `.text.strspn'
   riscv64-linux-ld: warning: orphan section `.text.strcspn' from `arch/riscv/purgatory/string.o' being placed in section `.text.strcspn'
   riscv64-linux-ld: warning: orphan section `.text.strpbrk' from `arch/riscv/purgatory/string.o' being placed in section `.text.strpbrk'
   riscv64-linux-ld: warning: orphan section `.text.strsep' from `arch/riscv/purgatory/string.o' being placed in section `.text.strsep'
   riscv64-linux-ld: warning: orphan section `.text.memset16' from `arch/riscv/purgatory/string.o' being placed in section `.text.memset16'
   riscv64-linux-ld: warning: orphan section `.text.memset32' from `arch/riscv/purgatory/string.o' being placed in section `.text.memset32'
   riscv64-linux-ld: warning: orphan section `.text.memset64' from `arch/riscv/purgatory/string.o' being placed in section `.text.memset64'
   riscv64-linux-ld: warning: orphan section `.text.memcmp' from `arch/riscv/purgatory/string.o' being placed in section `.text.memcmp'
   riscv64-linux-ld: warning: orphan section `.text.bcmp' from `arch/riscv/purgatory/string.o' being placed in section `.text.bcmp'
   riscv64-linux-ld: warning: orphan section `.text.memscan' from `arch/riscv/purgatory/string.o' being placed in section `.text.memscan'
   riscv64-linux-ld: warning: orphan section `.text.strstr' from `arch/riscv/purgatory/string.o' being placed in section `.text.strstr'
   riscv64-linux-ld: warning: orphan section `.text.strnstr' from `arch/riscv/purgatory/string.o' being placed in section `.text.strnstr'
   riscv64-linux-ld: warning: orphan section `.text.memchr' from `arch/riscv/purgatory/string.o' being placed in section `.text.memchr'
   riscv64-linux-ld: warning: orphan section `.text.memchr_inv' from `arch/riscv/purgatory/string.o' being placed in section `.text.memchr_inv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
