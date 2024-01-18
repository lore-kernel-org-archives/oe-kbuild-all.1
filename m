Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C628DDA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705594345; cv=none; b=Ob0hPunp5CB3jOn9/b4wBOZEfJkj+gG0S0Fk9UC6lmPLl7QJcmbuUkTy72UcZl3WyvsqFLWC1n7YW4Wz3pFVWIzPRswWrr5DEvYJYElw5hBmgVytmzMMx/0Ubzq2bOZOQ8uIkTsgRCPUroqadRU4MM6/D6D97S4XCWHwXQe5mlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705594345; c=relaxed/simple;
	bh=FdTWpPCuq/IMu6Sr9f/uTVLFISan+5UX6pIsPq4d4Ik=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=M4KHqpB2df+q3uuDIrDnfzgQvSINxlQ9GF+jmhZ6LWpAzfuWRxOinmUnNeZIZkxImR+QUM1PoxJECU4O3q+Hz+Y4JkYlbutrpzIYtP0TG5sXnYk9V1Q+bU0wEZMp2hp7nC04jVqG/mHpCavPj4fHUbZKfVp+946K1Sr7ox3wNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7CNTX68; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7CNTX68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705594343; x=1737130343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdTWpPCuq/IMu6Sr9f/uTVLFISan+5UX6pIsPq4d4Ik=;
  b=Q7CNTX68mHgVM5WpsT0e8+oaRXULNyk9eD75A2aYeHKemYVWF7/dPvnZ
   X303y4wa7g0uJd8/kmYjhY+m9XwKLfEBAJDCjJ6WXd7Lgi/SQhLXVQosS
   kD+PZGDbM/7EP4pWj3aHnFHrAO1Q2DSrXyctvvV6JOtjzaX6MTUOptm9a
   5z23j6M7fJn45Wnd/0WGLf+q++ks9LYpnRFvNnRAtslOQCRFjyqYHTuKo
   01QH4CSZ4t2e3MDKOnJn/qa4RW+y7NLtxy74tyEBQzRgg/L/gUkcr7uu7
   k7fw8HcqvuImwu02Ty9sn1xKhlaQncN7jEhq9ZdzGw9JDZZ2PJWIoT8wC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7888116"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7888116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 08:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903875068"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="903875068"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2024 08:12:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQV07-00037s-2x;
	Thu, 18 Jan 2024 16:12:19 +0000
Date: Fri, 19 Jan 2024 00:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/dax_abi 2/5] drivers/dax/bus.c:19:1: sparse: sparse:
 symbol 'dax_region_rwsem' was not declared. Should it be static?
Message-ID: <202401190002.akeSPLMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   d3de88ca301b687923a19a41d16a22afcd9c40a1
commit: 2e7ab04d7b9be08918c4166412b02550d545819c [2/5] dax/bus.c: replace driver-core lock usage by a local rwsem
config: x86_64-randconfig-121-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190002.akeSPLMC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190002.akeSPLMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190002.akeSPLMC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dax/bus.c:19:1: sparse: sparse: symbol 'dax_region_rwsem' was not declared. Should it be static?
>> drivers/dax/bus.c:25:1: sparse: sparse: symbol 'dax_dev_rwsem' was not declared. Should it be static?

vim +/dax_region_rwsem +19 drivers/dax/bus.c

    14	
    15	/*
    16	 * All changes to the dax region configuration occur with this lock held
    17	 * for write.
    18	 */
  > 19	DECLARE_RWSEM(dax_region_rwsem);
    20	
    21	/*
    22	 * All changes to the dax device configuration occur with this lock held
    23	 * for write.
    24	 */
  > 25	DECLARE_RWSEM(dax_dev_rwsem);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
