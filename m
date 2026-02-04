Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320432BAF7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241779; cv=none; b=Tl9tn+5VAAqt05mD3fR9RtQ9Ylko+VAO4DOGsU0hIfXUOV5GYtXU/YvmWwbxrKIau137DDiFWEu1/89POQQs7v0jV+ymvYR5aGwZ7uBMgyueC8l+m//sb126eosDXpJ/TyTKUpfiamkuT1lKf0Av2I/SH2/0P0qDolKxwBwDffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241779; c=relaxed/simple;
	bh=P1YQtzlXXuIdBxaL2ShfgIg9easMz8PHl96qmhj2750=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OZ3b6OrN6nOeGvBmUDgGsbXl8Up9aGVkFacQJzOUJZMrWFlvLSnRzL5SFw271tEgMuQ+LJMdCyVlCVYWbwaHLkXNfmORtgY5wZZpeDy4cirfBZasZUSzVxBbEb6OPMAx9vKldpcS5qCe2pHXGIorbZJnoarqrstcKxpm07NGHyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6Q7K8Jm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6Q7K8Jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770241779; x=1801777779;
  h=date:from:to:cc:subject:message-id;
  bh=P1YQtzlXXuIdBxaL2ShfgIg9easMz8PHl96qmhj2750=;
  b=L6Q7K8Jmne1FCqXqJ5dc/baTaJbNxAqyeza1j7a5C30G41RRZk3ZqBDy
   WayTD0C/tKTk7z+wUAniEUt4+1Urdkzy8DK2zAlBcKpcwCRa+I1hkULq2
   +l4tnbSiasGRIwi2+PtqXCGUuPLyKZGhjwMv6JTQF9afk6GFQPdg1w899
   VhLjkdeTpkmnSR6VbK8TDpfDy8fC7bK/CZw9OLjdAkwwZQDa/tF8FdZlU
   3m9Z819Q+Jsmr5QIhuYK6kDzI0MHRiQQOZBuCXQOaXd914B734tYuL5Bo
   /RA28AE4B4q6SPy9Bxbo+zOQ7i95eTkBKzMOunF014INeFdQE62MCGnVd
   g==;
X-CSE-ConnectionGUID: TzZkx9nISamajKGHO4XaBQ==
X-CSE-MsgGUID: 4QVuSo4DSrO82nZy/4wpwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71423258"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71423258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 13:49:38 -0800
X-CSE-ConnectionGUID: x73/HksNSe+Z/07vpUXbYg==
X-CSE-MsgGUID: 8V10KG3wSUixXpGBZU7jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214952716"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Feb 2026 13:49:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnkkh-00000000jC8-00Bh;
	Wed, 04 Feb 2026 21:49:35 +0000
Date: Thu, 05 Feb 2026 05:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 60/61] verbs.c:undefined
 reference to `ib_umem_release'
Message-ID: <202602050553.WfD8GITU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   6a7762a640a0fe814aaa802c7ef4b2a2766ab112
commit: 4cd95d4a7a15885c665c85569a44c6476871d567 [60/61] RDMA/core: Manage CQ umem in core code
config: sparc64-randconfig-001-20260205 (https://download.01.org/0day-ci/archive/20260205/202602050553.WfD8GITU-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050553.WfD8GITU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602050553.WfD8GITU-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/infiniband/core/verbs.o: in function `ib_destroy_cq_user':
>> verbs.c:(.text+0x250c): undefined reference to `ib_umem_release'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
