Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3114283
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsF8wPOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697456010; x=1728992010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imtdDi9nO6lOsrTuGMc5GaNBYRP0c2r5Czbztyf0XkQ=;
  b=fsF8wPOqzF0Z6ieO1cK/nwVYBzu9Rv5Vs+JfTbG0ck5B2g9vLLyZSxUW
   qbg0rbYQ727JeNpDOgP6ntUGXgGn0XL0jJb+1THzD0dKkcKv3gmfKnNle
   n+3pwEieyNqZi6Oa/348QH2tYn8+bUqL8Gu2sp2UNzRkG6o6qMHdc+aSk
   1koO+pAQoT1noq9wkcXA+Q681b+kh2Ax1BWZwaYtqtnRFpqVPr3VTFMaN
   E81h+dzxnbWvhpTIeLtVuZ4Wqw9f5p7vO5p5OHRJfmqa2oxz/sQm6bmZ2
   /7PjRBO4gyGD4IDaGO+tNJ5uGXKM/DBFOG9ujKiaj3S+lWkPPUkQJxewW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385343836"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="385343836"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749261590"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="749261590"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Oct 2023 04:33:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsLqf-0008LH-1w;
	Mon, 16 Oct 2023 11:33:25 +0000
Date: Mon, 16 Oct 2023 19:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] undefined reference to
 `uhid_hid_driver'
Message-ID: <202310161933.R8CPeqf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   8a0ac15c3162cd3792293d0848bde875b44e48d5
commit: 6804500c16a5ba86b57c9976fc1491fa0efc2132 [2/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-buildonly-randconfig-004-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161933.R8CPeqf8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161933.R8CPeqf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161933.R8CPeqf8-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/link-vmlinux.sh: 123: is_enabled: not found
   vmlinux.o: warning: objtool: mce_setup()+0x1a: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_read_aux()+0xc7: call to mca_msr_reg() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xcb: call to mce_gather_info() leaves .noinstr.text section
   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> (.text+0x35e3): undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_add_field':
   hid-core.c:(.text+0x3ec9): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
