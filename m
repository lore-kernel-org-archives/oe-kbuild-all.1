Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FE98472
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743428360; cv=none; b=oOa1QpVzDvsTAZ3UpcqJiWtDTDH+BAgyA0a5aQPgJWjJijVkeQiojQ1Es+CnUYe+oK56fXC+QRH9LWAOzyCV6gfI/fKBrRZ2u9Q2zkI1jxMSfAoiPUX0t2WZ46+z6OvNka5C4xVLi+kRJjodlxrKtKCyVHONiESYM0J3yKkpJ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743428360; c=relaxed/simple;
	bh=+TpoH/YNjWssBH9JZwX+9xFGNW5OS3j6k8Pjulq/9iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbUkJmYPwZwfEokeR6bygQJLyq+pdke+iH8eWzA7OdRE4KCnWehLzZDfuCkBc6kTu0ep2P7RHkq1Kx/osZp9WCD84/xwV3uKC7+a3EeCRXsOHVTE8WzLfgRK0k42ldYpoIQowR0/z9qZARdFJ6DywBVn5xpsRxrr9gfIfzNLHaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8LYjMoS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8LYjMoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743428359; x=1774964359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+TpoH/YNjWssBH9JZwX+9xFGNW5OS3j6k8Pjulq/9iA=;
  b=M8LYjMoSbn0nhbBtNifeEKSbWEObKbdVm+cnY9I43GoOQLH2uI1LiD4S
   6qQBjWnY7EE1FhNeC4r+A8WuXf+K23W7bBwqfHhiKlun8fpgEqFVJcMtJ
   wcZff2/YnEMyodbgkTWeLrjXmJ5LuqJbqJ+JUWXgdW4TOuzXkGal95/4M
   MCUWZBBfpUcH744+w9QZBXNXH0rf2i9BxAcfCbC1iWO+cCKAoYuemFETT
   U6zA+GddFf+jY96rPV4G9AcMG9cnH6yWGOcFv8KZgu4TYljjpLXvrpH1B
   f6Z+bAUKA6dWYTOE9+626arBh9+5V/0brF1daOx63bq4JIGxWEASHICAs
   Q==;
X-CSE-ConnectionGUID: Ni1b59gWSvqMEhKKbXYtfA==
X-CSE-MsgGUID: e4fQtzkURiewJlVFxY1KzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48380523"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48380523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 06:39:18 -0700
X-CSE-ConnectionGUID: qzHoSNTrRdSnwLCfXSFDnA==
X-CSE-MsgGUID: saWMBhByT/OUy33c2Vb68g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="130929232"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2025 06:39:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzFLd-0009Ek-1O;
	Mon, 31 Mar 2025 13:39:14 +0000
Date: Mon, 31 Mar 2025 21:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tengda Wu <wutengda2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1541/1541]
 kernel/trace/.tmp_trace_output.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202503312102.s1xJYVFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c09d565ea3e651c408ca3d0e0c2499e5e90a77ae
commit: 31bf327231bb582ec7dca0490cc90c364b36e095 [1541/1541] tracing: Make sure trace_printk() can output as soon as it can be used
config: x86_64-buildonly-randconfig-003-20250331 (https://download.01.org/0day-ci/archive/20250331/202503312102.s1xJYVFA-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503312102.s1xJYVFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503312102.s1xJYVFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/.tmp_trace_output.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
