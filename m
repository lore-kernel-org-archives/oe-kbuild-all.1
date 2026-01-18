Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB466FC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768772848; cv=none; b=mCZHmHQm8rv3k5oAK9QXRvfnPWAOfpAEI9wvUsNn0LPKJWAu3picCc7cwSC/T99yTC5V4mc0gMb8AAFkBg3xVP8gechlzGu9c9JGJFrZqnhC9d8bF3xBvbpuW97Z7fRLKjz9XDrjVPllq5+mtvY+bitgpbQ9SbUPQ15cp0rwF1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768772848; c=relaxed/simple;
	bh=0DcbXKn3Fr3IS3+EVWwC66LwE10UWfwVJRr/B91Kimc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V/FK0kRQjtg55rOs1vvX3/NVR8l2Ty8K6jRoaxJjv/XLXDrQcOiqouLdzjH9y7/t+19+etjqWGy2kVBfa+WnIXhHd8rvk3oEtUoPT604x7wyY8yJ7uGudN+IpOltnOiKz26DNCgHcPwKrPMk3tHC2OuuiPrFRNp59qswylMMrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXnY+yGn; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXnY+yGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768772845; x=1800308845;
  h=date:from:to:cc:subject:message-id;
  bh=0DcbXKn3Fr3IS3+EVWwC66LwE10UWfwVJRr/B91Kimc=;
  b=LXnY+yGnzKm20DETIFo98HbYbtLmJ+b8WRGfbkH0DpMek0MoYFqiq2Q5
   IYFEVaKMXt70CvlMHy5sNmCJb2413p3HTVFX+R81iBMmddkMNRK5QdoGm
   A5Mg7JfFDOGz/UDhoRFZPf0K7fkPr6Wk/qKSEotcRROqVsh7t19oQ12Fl
   O8Dvrqosm/yM2BxBa/rJnZHD3NvKb8P8xFoSkCGr2wkKSvavhRb8ZYzKh
   0qqE6drV1x0tmlXnfnI+v4sDh0dgCLiYz/bR51mBYrCqHei5H/JTZ2XO5
   8Z1gxd/PKlc/HBrGVV3RSqCjJpN7ZqTvDiEIEKER0drmsXv9F42wAAazW
   A==;
X-CSE-ConnectionGUID: CX8VHj+ASc+DxyfZiJk6jw==
X-CSE-MsgGUID: dSLNhhT9RsaY9E+tHZNUyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80712762"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="80712762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 13:47:25 -0800
X-CSE-ConnectionGUID: h0b4qBGITDmvSgYxlk66JA==
X-CSE-MsgGUID: crxwVz4pTdOlNr6T6iZ6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="205971969"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jan 2026 13:47:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhacC-00000000NEt-3wjj;
	Sun, 18 Jan 2026 21:47:20 +0000
Date: Mon, 19 Jan 2026 05:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <tangyouling@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: security/integrity/ima/ima_kexec.c:113:30: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202601190517.eFFmHh5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Youling,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: d162feec6b6e7ed97986118450812fdd7e9ba202 LoongArch: Add preparatory infrastructure for kexec_file
date:   4 months ago
config: loongarch-randconfig-r123-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190517.eFFmHh5X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190517.eFFmHh5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601190517.eFFmHh5X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_kexec.c:113:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] [usertype] version @@     got restricted __le16 [usertype] @@
   security/integrity/ima/ima_kexec.c:113:30: sparse:     expected unsigned short [addressable] [assigned] [usertype] version
   security/integrity/ima/ima_kexec.c:113:30: sparse:     got restricted __le16 [usertype]
>> security/integrity/ima/ima_kexec.c:114:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [addressable] [assigned] [usertype] count @@     got restricted __le64 [usertype] @@
   security/integrity/ima/ima_kexec.c:114:28: sparse:     expected unsigned long long [addressable] [assigned] [usertype] count
   security/integrity/ima/ima_kexec.c:114:28: sparse:     got restricted __le64 [usertype]
>> security/integrity/ima/ima_kexec.c:115:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [addressable] [assigned] [usertype] buffer_size @@     got restricted __le64 [usertype] @@
   security/integrity/ima/ima_kexec.c:115:34: sparse:     expected unsigned long long [addressable] [assigned] [usertype] buffer_size
   security/integrity/ima/ima_kexec.c:115:34: sparse:     got restricted __le64 [usertype]

vim +113 security/integrity/ima/ima_kexec.c

c95e1acb6d7f00 Steven Chen     2025-04-21   80  
7b8589cc29e7c3 Mimi Zohar      2016-12-19   81  static int ima_dump_measurement_list(unsigned long *buffer_size, void **buffer,
7b8589cc29e7c3 Mimi Zohar      2016-12-19   82  				     unsigned long segment_size)
7b8589cc29e7c3 Mimi Zohar      2016-12-19   83  {
7b8589cc29e7c3 Mimi Zohar      2016-12-19   84  	struct ima_queue_entry *qe;
d68a6fe9fccfd0 Mimi Zohar      2016-12-19   85  	struct ima_kexec_hdr khdr;
7b8589cc29e7c3 Mimi Zohar      2016-12-19   86  	int ret = 0;
7b8589cc29e7c3 Mimi Zohar      2016-12-19   87  
7b8589cc29e7c3 Mimi Zohar      2016-12-19   88  	/* segment size can't change between kexec load and execute */
cb5052282c65dc Steven Chen     2025-04-21   89  	if (!ima_kexec_file.buf) {
c95e1acb6d7f00 Steven Chen     2025-04-21   90  		pr_err("Kexec file buf not allocated\n");
c95e1acb6d7f00 Steven Chen     2025-04-21   91  		return -EINVAL;
7b8589cc29e7c3 Mimi Zohar      2016-12-19   92  	}
7b8589cc29e7c3 Mimi Zohar      2016-12-19   93  
d68a6fe9fccfd0 Mimi Zohar      2016-12-19   94  	memset(&khdr, 0, sizeof(khdr));
d68a6fe9fccfd0 Mimi Zohar      2016-12-19   95  	khdr.version = 1;
68af44a7197568 Breno Leitao    2024-11-21   96  	/* This is an append-only list, no need to hold the RCU read lock */
68af44a7197568 Breno Leitao    2024-11-21   97  	list_for_each_entry_rcu(qe, &ima_measurements, later, true) {
cb5052282c65dc Steven Chen     2025-04-21   98  		if (ima_kexec_file.count < ima_kexec_file.size) {
7b8589cc29e7c3 Mimi Zohar      2016-12-19   99  			khdr.count++;
cb5052282c65dc Steven Chen     2025-04-21  100  			ima_measurements_show(&ima_kexec_file, qe);
7b8589cc29e7c3 Mimi Zohar      2016-12-19  101  		} else {
7b8589cc29e7c3 Mimi Zohar      2016-12-19  102  			ret = -EINVAL;
7b8589cc29e7c3 Mimi Zohar      2016-12-19  103  			break;
7b8589cc29e7c3 Mimi Zohar      2016-12-19  104  		}
7b8589cc29e7c3 Mimi Zohar      2016-12-19  105  	}
7b8589cc29e7c3 Mimi Zohar      2016-12-19  106  
7b8589cc29e7c3 Mimi Zohar      2016-12-19  107  	/*
7b8589cc29e7c3 Mimi Zohar      2016-12-19  108  	 * fill in reserved space with some buffer details
7b8589cc29e7c3 Mimi Zohar      2016-12-19  109  	 * (eg. version, buffer size, number of measurements)
7b8589cc29e7c3 Mimi Zohar      2016-12-19  110  	 */
cb5052282c65dc Steven Chen     2025-04-21  111  	khdr.buffer_size = ima_kexec_file.count;
d68a6fe9fccfd0 Mimi Zohar      2016-12-19  112  	if (ima_canonical_fmt) {
d68a6fe9fccfd0 Mimi Zohar      2016-12-19 @113  		khdr.version = cpu_to_le16(khdr.version);
d68a6fe9fccfd0 Mimi Zohar      2016-12-19 @114  		khdr.count = cpu_to_le64(khdr.count);
d68a6fe9fccfd0 Mimi Zohar      2016-12-19 @115  		khdr.buffer_size = cpu_to_le64(khdr.buffer_size);
d68a6fe9fccfd0 Mimi Zohar      2016-12-19  116  	}
cb5052282c65dc Steven Chen     2025-04-21  117  	memcpy(ima_kexec_file.buf, &khdr, sizeof(khdr));
d68a6fe9fccfd0 Mimi Zohar      2016-12-19  118  
520451e90cbe9d Bruno Meneguele 2021-12-28  119  	print_hex_dump_debug("ima dump: ", DUMP_PREFIX_NONE, 16, 1,
cb5052282c65dc Steven Chen     2025-04-21  120  			     ima_kexec_file.buf, ima_kexec_file.count < 100 ?
cb5052282c65dc Steven Chen     2025-04-21  121  			     ima_kexec_file.count : 100,
520451e90cbe9d Bruno Meneguele 2021-12-28  122  			     true);
7b8589cc29e7c3 Mimi Zohar      2016-12-19  123  
cb5052282c65dc Steven Chen     2025-04-21  124  	*buffer_size = ima_kexec_file.count;
cb5052282c65dc Steven Chen     2025-04-21  125  	*buffer = ima_kexec_file.buf;
9f0ec4b16f2b41 Steven Chen     2025-04-21  126  
7b8589cc29e7c3 Mimi Zohar      2016-12-19  127  	return ret;
7b8589cc29e7c3 Mimi Zohar      2016-12-19  128  }
7b8589cc29e7c3 Mimi Zohar      2016-12-19  129  

:::::: The code at line 113 was first introduced by commit
:::::: d68a6fe9fccfd00589c61df672b449d66ba3183f ima: define a canonical binary_runtime_measurements list format

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
