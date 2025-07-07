Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96911C3C04
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751930506; cv=none; b=nPBcbmkpTTMkzJw2urjP/w7FX34cStygva65uKENfG6Xz9DBRF2FHKvy5YhX7c7i+sRkRRtJ+KB26+xrdgl+jISryMbejH8NuTmbY6ZFGfVchpozR7YTyzw94S2hsL5+KRHBCR+UK5XLS8fbsw4rAPIeDZfjb6eBZkAX7NOyy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751930506; c=relaxed/simple;
	bh=AQcMzl0AOdGIy8Li24OwGWnis9F6bNKBP8/Vcnwa8CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4zDZS6Gwv6Mlyv354kjA0aquwftCk0YvXO51qDMCtVkQCjdJoERW4qHQJauBnwTCRhErLGcHbhWEIhxFZu9J757XAMv6xWjPHLPfEnJeYDZC1FyvU3RC6TYHooudPHFaAzBITMebl+CDEwUL5C2aC/KHmsE8upOmi4c6rOhGU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvbW1iKy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvbW1iKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751930504; x=1783466504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQcMzl0AOdGIy8Li24OwGWnis9F6bNKBP8/Vcnwa8CM=;
  b=AvbW1iKyVkH50Zvk3MfZCt0opUz1Ap+gsMFK1EbQ3kWBP73iyoM3OOhG
   wkKfki0UystPnMqfmL9tSYcjdoKJaOhjVNIv/Mq8m7Bx3yJRfwXJEuo6O
   Yl+saBOd6UMQiiEG4Q8i7KUq1DBwh63ua4efHCZ9gLKTStUEO+EIbdPIi
   6mVTRNM52LOAE7Es6Fgt2LhqsH8ZlQ0/TOz2pTrhIqrTU8paItg7v037w
   kBLWm3pLoluTwd9nVnWQjBNLa+PErtfyKLadfqFsdhlKoMfu4hdB97+pZ
   RHvvm5d9Rqhvkk2w1Cq76QhCrKmOykwUC4OCdNxcOrd0heP9LDor5/D8+
   w==;
X-CSE-ConnectionGUID: FJE3f9NtT9C6PN4WyYNT7w==
X-CSE-MsgGUID: YfdTphayQ7SApeA1R7P17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65222493"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="65222493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 16:21:44 -0700
X-CSE-ConnectionGUID: VmO95BqYSgmYXvxVJ3P0xw==
X-CSE-MsgGUID: /UoLiyDBQe+4DjeZjeeziA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="160989937"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jul 2025 16:21:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYv9Y-0000ol-0z;
	Mon, 07 Jul 2025 23:21:40 +0000
Date: Tue, 8 Jul 2025 07:20:58 +0800
From: kernel test robot <lkp@intel.com>
To: Parav Pandit <parav@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [rdma-rdma:wip/leon-for-next 20/40] ERROR: modpost:
 "rdma_uattrs_has_raw_cap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
Message-ID: <202507080725.bh7xrhpg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   f3b7a65ce551ee7800f759ec7e198ee5030243dc
commit: 95a89ec304c38f7447cdbf271f2d1cbad4c3bf81 [20/40] RDMA/mlx5: Check CAP_NET_RAW in user namespace for flow create
config: x86_64-buildonly-randconfig-004-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080725.bh7xrhpg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080725.bh7xrhpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080725.bh7xrhpg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rdma_uattrs_has_raw_cap" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
