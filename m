Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F228DC4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756703550; cv=none; b=gVfPRuwVeK+xWUS65Pq3JE5ZOs0Kk8rzL16dDwwAAGxJ50d/uBvQ01DDDNSae0a02X+Z9EhsYEV0Q4UDt0QyHhNVoiLHrQqUNw8xlybrCXwskYjEXGHt58uiD7fQ9MtXQ4wvTuPoutlJKXV7wQRq4cNZrWoVadNUgCOqWyzMmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756703550; c=relaxed/simple;
	bh=bJOlaK6YTpRM6SWGZjciOkC+1vpNEn0+XF9vO7LiD94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCgH6dcKwRUapX3wRegRBQaC611zYmiZ72wge+CAdx0trv1WCtoAJL++KcQ6Tn+vxqEaxTawdORduR57gY3khNTtxiXxw+KOFWndX2tdsW9aZtf5VO1JRNasBx2aNDNwqgGkoEzyDBU1fIukTAHJg6i8uRKUsUZisRIygV6gMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+M7uvKV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+M7uvKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756703549; x=1788239549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJOlaK6YTpRM6SWGZjciOkC+1vpNEn0+XF9vO7LiD94=;
  b=m+M7uvKV1+bIvtPhkswHp+vG6gsJbu0gIfDcO5eEkskjeevMbikQ3T+j
   Z22Y61vXmcFLFIv5RAOD8ZCLYfDSGL63+8d5OaPVEDyPI7qBJFf+61I/K
   nuwr6otCg2zivp1Mc3Jbvk7/dxWCmoXBLI1LsJFTJsxMNaiC7o/IwRlRO
   HZ+1NtYyPM30Lq7ZMu39fBdbIcG7gmgJoz6wcq0I5zxBjfoTm9sFBv2LC
   tNJLmF7hJK34vKDZti/9wxOLWxGa+HFmsocdEd9L/bBYPS9lySo5OHOyL
   5/Yq3tAq5oHaZKkhrFKSSbv0jwgNOJTVDeAvNLb9NtD8YtsIK9qONURVf
   Q==;
X-CSE-ConnectionGUID: XLQGf773Rs2QABVAT4O9vw==
X-CSE-MsgGUID: oBd6pLJVTCi2SiLvqysYDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="62707888"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="62707888"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2025 22:12:13 -0700
X-CSE-ConnectionGUID: q0GOHL/sQmW+pD2+6TlQiQ==
X-CSE-MsgGUID: 3cDgpxznSqaPediUpJPtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175232289"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 31 Aug 2025 22:12:11 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uswpE-0000FT-0H;
	Mon, 01 Sep 2025 05:11:50 +0000
Date: Mon, 1 Sep 2025 13:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1353/1353] fs/debugfs/file.o: warning:
 objtool: full_proxy_open()+0x55a: unreachable instruction
Message-ID: <202509011343.tLFbbMN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Drew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: d4bdc26bcd632cee393b5171345d5fa6293fe42b [1353/1353] include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
config: x86_64-randconfig-122-20241226 (https://download.01.org/0day-ci/archive/20250901/202509011343.tLFbbMN4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250901/202509011343.tLFbbMN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509011343.tLFbbMN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/debugfs/file.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/debugfs/file.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-cd708029e0/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> fs/debugfs/file.o: warning: objtool: full_proxy_open()+0x55a: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
