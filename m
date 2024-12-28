Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9C73446
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 21:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735420426; cv=none; b=oxf9xmQ5OA4EaYPhOvVVAwbO3bKPd0cF6lQsXXJnKfcw+j1BIY6VpwQ9Dh4Z8k8fBXUwomCzayKLgW5METagf+JpfKnJTADoOz9DOySJP3OhoyYzo8mbaPzAHHn92t5ky4vwou52imnDS5zdTBHI5pkTtyzyqgNOAnV9+jP/vF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735420426; c=relaxed/simple;
	bh=rUOUHCYgHJgPM8aZO7M0GU3QROq0BUqyw4oWVkkh0zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwQM1UP/vteFjtMXUHi5mj3NoBF+vp2KJ2YccHRThd0MUeionybZj8BQLoG8rFxFNLj8+/8lQRbVf0DJdbjyfLvDE+sxt+BuWCOPQX+oOOvPbrqpH23uOMjhFsHHZFzD1xzgK0329QUikuctlgIWQf/Br0t9ubcC9bcQAto23lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b99oXOCz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b99oXOCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735420424; x=1766956424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rUOUHCYgHJgPM8aZO7M0GU3QROq0BUqyw4oWVkkh0zg=;
  b=b99oXOCzycW2rZGH5fB7mHCdFpphTH9mblUZ6FLY7VvOrKZYOkJ13C4p
   +BJ/uXA6LDGpWnThVkuoWAofigUQfPIvy2ITvIHxa+5xQLnKktb0cQiyZ
   Go2ewlAq/fJVEAoYkS+gYBiclG35HjWnag4CVVoYWAVWAXFm+bov/LMOa
   eXYgLjs2MJUi7uKjPD4sxm3uoGJYG5XHHnFivI+p2QdVIGtxy2CF04u2p
   9UAavrmbsVxZCezP50biu0/RgzATGuiEtzIPCQBCaa0MnqpQRCOTOLp70
   oU9e9IdsrYtn9aHuWX6jb1cH1jqYZQbJxdz7ZScNDwGzFPHds8//4573p
   Q==;
X-CSE-ConnectionGUID: u44nAp+MS8itDkTrDiKwrA==
X-CSE-MsgGUID: rNDz3d7NTMqwEOGa3lLtYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="38606217"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="38606217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:13:43 -0800
X-CSE-ConnectionGUID: uI8fC6CuRAaO8OoZIYA1Tw==
X-CSE-MsgGUID: ktPHeLBqTeur+oRmYnPw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123712238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Dec 2024 13:13:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRe7w-0004Jc-0w;
	Sat, 28 Dec 2024 21:13:40 +0000
Date: Sun, 29 Dec 2024 05:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1358/1358] fs/select.o: warning:
 objtool: poll_select_finish()+0x246: can't find switch jump table
Message-ID: <202412290510.qDzEXEra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 44ae3d3e5f1f99c0fd5f040e4da88b0c5b3ec76b [1358/1358] select: shift restore_saved_sigmask_unless() into poll_select_copy_remaining()
config: x86_64-randconfig-102-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290510.qDzEXEra-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290510.qDzEXEra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290510.qDzEXEra-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/select.o: warning: objtool: poll_select_finish()+0x246: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
