Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F851326D4A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708903; cv=none; b=F0M9C9746x4CJR2bJB+cDmud05ifnUJdHD1GUr84o5r1J6I8Gl36HIzZBsrkjquca5PW3sHirq5cPr9jy6QPbVvj6ZAkVtebJHqd58CRjNA3CAjBTqGXXCDGQ2CapfJy7yiS7YxOgPcdkkdC720yXUg7UW8j3tWObb0v22yHFoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708903; c=relaxed/simple;
	bh=GODChvqZ83FIoTwOhID0kfLYLe7RS6CKaXsRBgERFjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxluK04iKqEETS/g5G9ScOg6XvykGmcEi+q4kVm64QH+5wH9FB21wgr/GqQtDU5oCFOW0odD9Awd1rKPbBi/xzNj7Mi8jKwVyPWfSlkCdETjIdqBsbdrXrizGQv+32/CGo8CZvBEovEhAnDzSN2h/ZDDviauMG5AE+bAkhZRnr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgBontRX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgBontRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755708901; x=1787244901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GODChvqZ83FIoTwOhID0kfLYLe7RS6CKaXsRBgERFjo=;
  b=hgBontRXwfQ8/drX6b5vAqbtjPoI6nFPJ1mu+M5T3+nf8hWWfuPWAGjr
   a0Wvf5aR237DDvezL2eQuy/AIDtZ+J10ekGz2avpYfgku1YBYoN7nbque
   GLdFoYoSsyKtKwEJ96819cfmEf5fwHwzZVoA3hLzk31oJGSlPObIZWsmn
   ZgJkmfMk/VUXTQ/1da9X7/8WAwghrDa1NC7Wg4fLzWUefO6fSqK+ThpO6
   N5lq1Pl5C/PnuTfUUTigIZkJh5vIzk7T/NHZYSomMxfGnLVW/Z2DBjKO8
   Vqj7f3HPArPViP4cQ0eXHGlm6mDtOUr9zHRM+WPa4/5Xh9I9+Cv399khq
   g==;
X-CSE-ConnectionGUID: JThgp68DSCqmmrfLW4U7AQ==
X-CSE-MsgGUID: 4+jnFdbTQeyCTGOZEAA7/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58130374"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58130374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 09:55:00 -0700
X-CSE-ConnectionGUID: GVm1/PbjSVm/at49qB3npA==
X-CSE-MsgGUID: +gFkmcRYTg2JVOk1z5VU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168443268"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2025 09:55:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uom5R-000JVv-15;
	Wed, 20 Aug 2025 16:54:57 +0000
Date: Thu, 21 Aug 2025 00:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Francis Rossi <francisdrossi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [linux-next:master 982/3631]
 fs/bcachefs/sb-counters_format.h:129:27: error: label at end of compound
 statement
Message-ID: <202508210025.tB6xO9tw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5303936d609e09665deda94eaedf26a0e5c3a087
commit: 38de8638343667e94e924ac4f54c37947d0fa725 [982/3631] bcachefs: Switch statement evaluate ids and confirm they are unique going forward
config: nios2-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210025.tB6xO9tw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508210025.tB6xO9tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508210025.tB6xO9tw-lkp@intel.com/

Note: the linux-next/master HEAD 5303936d609e09665deda94eaedf26a0e5c3a087 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs_format.h:524,
                    from fs/bcachefs/bcachefs.h:218,
                    from fs/bcachefs/bkey_methods.c:3:
   fs/bcachefs/sb-counters_format.h: In function 'check_bch_counter_ids_unique':
>> fs/bcachefs/sb-counters_format.h:129:27: error: label at end of compound statement
     129 | #define x(t, n, ...) case (n):
         |                           ^
   fs/bcachefs/sb-counters_format.h:106:2: note: in expansion of macro 'x'
     106 |  x(error_throw,     93, TYPE_COUNTER)
         |  ^
   fs/bcachefs/sb-counters_format.h:130:9: note: in expansion of macro 'BCH_PERSISTENT_COUNTERS'
     130 |         BCH_PERSISTENT_COUNTERS()
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +129 fs/bcachefs/sb-counters_format.h

   126	
   127	static inline void __maybe_unused check_bch_counter_ids_unique(void) {
   128		switch(0){
 > 129	#define x(t, n, ...) case (n):
   130	        BCH_PERSISTENT_COUNTERS()
   131	#undef x
   132		}
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
