Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF912E7F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 06:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314622; cv=none; b=Rx1RQAKnRGiINp+9+ZwH+Ea3lT+ZnAX/l5C2iNgX6crMw06tW40pBOs1nhAblpcM5qsGnYngmtqRRsv9S8yqjcH8UVXFlsv+YvMxViD79fpbbCgWtWN+WkAKOcS3R9KLNvaMArYpyMjSTBIJmDfl6NtmLqyRfQjr+wEjr5FRHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314622; c=relaxed/simple;
	bh=l6Nge/yprVWzsRs1PS6IhepOVfcKW92+Yftpx6shA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvdJvh8M+pvMbyzzdCUuQ6J+SWcIIMqdjBpmB6r0u5luI48QiNE8vAyPXhXO8iZmmaZ5fYRfg1d0pt/+wBHTB9JK9qls1hm++tmgEIXGnaEJjP+NqfjSk9YbNZmmQmNi1KNRUb13rdbsjAi2c7Ca2uGt5XTe0N0TwA8ooxd0HkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzSeayfx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzSeayfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743314620; x=1774850620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l6Nge/yprVWzsRs1PS6IhepOVfcKW92+Yftpx6shA+4=;
  b=fzSeayfxvM3TXzOLZxMb36qVq0XlMe5V7ui5+AV4vHwZ716RsRN/LbU1
   ZmAeGoqQHXCMCIdSJ5csviUFxqeZ0aBgIyBz3hhj4juu8W4GJ0OFRJXEK
   FPdaGjIFuTMxg3t6YizZ9mvbsRgJjzjBAe+ppcWeODYYVFCnTZdZEnSyM
   7cIAzBTYYWs8TJ5bUrVZkeOfbXxaz/xZQPnixxODmRyqgXwUWyLTa/zWD
   q3Kc6rDsWpruu8MQUIbWL31zc7fmYAHX2UHLHGZZ0FWv/4/PA5vZZ9zI7
   HTZGG3mxQlkfQe1tYjGFSFvba9+R34pAb7IuGwIYqR0cCL2dt2iNS+685
   g==;
X-CSE-ConnectionGUID: cQBPssTjTOeCKJRc0ehXeQ==
X-CSE-MsgGUID: bgIx+a9lT7aEdW1YNyGCXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="43877526"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="43877526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 23:03:39 -0700
X-CSE-ConnectionGUID: CIpp5KcUSpKr11JqwR62xQ==
X-CSE-MsgGUID: zwGNVW/oRiuwzA3fAQA7jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="130507308"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Mar 2025 23:03:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyllg-0008XY-27;
	Sun, 30 Mar 2025 06:03:36 +0000
Date: Sun, 30 Mar 2025 14:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531] drivers/dax/bus.o: warning:
 objtool: __dax_driver_register()+0xd5: unreachable instruction
Message-ID: <202503301315.o2E2dF19-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: 9bb67bd58e6a7e3ef00793b4966be7bb0a346830 [1531/1531] Intel: device-dax: Add support for a dax override driver
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301315.o2E2dF19-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301315.o2E2dF19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301315.o2E2dF19-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/bus.o: warning: objtool: __dax_driver_register()+0xd5: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
