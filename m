Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44FD28399
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114299; cv=none; b=UYV2cxlLfHccUVSPer8o41N/o1viKvm+EFFxf72EtmsFJSoc8DP33EUbpd2NmWhOG/AS5PSgWVsWH36L4VXN7alzQmx/0+s5Vkd1TlUXhZx0wM5NPLG5j+7pGNoYj8q3o+Rs+KzRv4EkguSQZB6eMULhMeUNT/V+csteWaCPZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114299; c=relaxed/simple;
	bh=BXhx78FqUGtSNG0NxQdR+MGNMbH0hBC8P9SfZdaQUPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=li7TyfdUGmi9psYKpLinoN7g8Jxx9dLLSFncC5bShKcItnixcyG+cNKn7YNy6yI7Jf8MsB9Cba6OqcegdnoNfAazKePiMhKfb0EwkfDnqv/EKt7XG29hSxazJBLFumwmESzNI36iNK6nxyuNG4fDboQPx73tS2HqkcJ/Gy3+uOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1fMFqy7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1fMFqy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733114298; x=1764650298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXhx78FqUGtSNG0NxQdR+MGNMbH0hBC8P9SfZdaQUPQ=;
  b=Z1fMFqy7UMMBlx+ILDR+PfW0F6C7Sk+wagiK2PgdoZw6TLu+1CX3PKwd
   VR1+5xOUxJnc155MzE2YvaNJ4qkGWRNxzrXEYyi+JrKhdVn9U5U6+G5Zt
   Ri9IpslI3fdguPIDrsFweDmBlH5o4zDpY8Pbz9ZK4cA359P462e1h7dme
   XzqJGOOvl7/XUylMQKurwAKULAS0JLpkHaKeeRxFS+DIIJx/KYtG8h+bO
   1xcs+ymOP16INcky3jsEWy5xY1sVz4xi7pJAEJC0Lo8D35mvVcxm8ON2u
   KKtatLtdCvB2n3GFL0bvE4TyamTEpQ9LCL8ntV9XppUpqxZxvW5EIzvYN
   w==;
X-CSE-ConnectionGUID: /vvPDVMZSFO9GoqjWfh2RQ==
X-CSE-MsgGUID: UarO9WNTSpevdlTgkKRJkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33326009"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33326009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 20:38:17 -0800
X-CSE-ConnectionGUID: wlwEA/MbRhewounnPBiuxQ==
X-CSE-MsgGUID: FO2TTTcjQDSi15SRsp1cVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92816148"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2024 20:38:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHyCL-000255-26;
	Mon, 02 Dec 2024 04:38:13 +0000
Date: Mon, 2 Dec 2024 12:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Yi <yi.zhang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] fs/ext4/inode.c:3585:24: sparse:
 sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be
 static?
Message-ID: <202412021229.fYZgwAGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: a38e9381cf2ba6f3300c716b1cff4551bec0fbdf [1474/1474] ext4: implement buffered read iomap path
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412021229.fYZgwAGb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021229.fYZgwAGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021229.fYZgwAGb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext4/inode.c:3585:24: sparse: sparse: symbol 'ext4_iomap_buffered_read_ops' was not declared. Should it be static?

vim +/ext4_iomap_buffered_read_ops +3585 fs/ext4/inode.c

  3584	
> 3585	const struct iomap_ops ext4_iomap_buffered_read_ops = {
  3586		.iomap_begin = ext4_iomap_buffered_io_begin,
  3587	};
  3588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
