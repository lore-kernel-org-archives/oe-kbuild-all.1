Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96D25A64A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 02:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737945666; cv=none; b=K/HGQDv5y5ELcNfIvfc6i2FgLoiPciosPi39miFrtFydb/KCg3kKZNGZgjhCpp/hjR+ZYC+XYgx/mDQi2yFpOTPmmxIu4PzbRbXoJxfDgbcKuwrGpN+vo7vo276Ff+Wduf75rVU5/UFHdMqfDBL8VgfZMqOBz9tYrKttghVA76s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737945666; c=relaxed/simple;
	bh=lukRssXcC55KphauPrrwjxrpEctiLYXI+zjC1OFNZps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QP3BO1/apO7AzL8m5p1JY94PvmU/kscU9vO7oblMpQSXtyAS5HCEnlO81t/0Ejrr7r/zQT2ENPq5xq19AmYcR6+yIFS0z+aikYW63gV8+Eds2h5YbS0Grj8n4N7RDvRq1S/FbGFjCVupqYxpIg6Er1W2YdSaa89vxQD5VkQSeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMS5tFU7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMS5tFU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737945663; x=1769481663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lukRssXcC55KphauPrrwjxrpEctiLYXI+zjC1OFNZps=;
  b=gMS5tFU77X2B72eGcZ7w1QMdRg6G+VDfKUlYXWLEuPD//z0XjZIskeH1
   HCgv3vjEiUbMm/VZEjPImFHxhZpKuk2HQWhw0sooOCQDoIx+RlIWV6DXD
   VhHWag6H6z2bi6sJctfvKcqYp4FHzwSGF+dxpB0vKCyOlJ39OzjnLb6qR
   yXFUt2J0n50Ug6RlLrQF3ynTcNJBJaVGlCqKtjWk8Z1CftXXLtSVpzleM
   qwC8ApbzA2X0sXiK9KZ+AFdssb/0YJ7dEi4YeTK/N6PTbe9ye2xH9rRw7
   pnjdL+otkDEORYc+H6rWEq61GnIPiiW+FJi133AY6MtNit95r/h6CEUrt
   A==;
X-CSE-ConnectionGUID: LA8oXgKyTYigst4iWvNnJw==
X-CSE-MsgGUID: eRk8pj4URLiXQAQSrq9aaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49817168"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49817168"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 18:41:02 -0800
X-CSE-ConnectionGUID: lTSg9djSRfCs2Sw1aT9ETw==
X-CSE-MsgGUID: LxEe3cUkRfqjH/NdyYaCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109222427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2025 18:41:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcF3a-000gKJ-2q;
	Mon, 27 Jan 2025 02:40:58 +0000
Date: Mon, 27 Jan 2025 10:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 31/83]
 drivers/firmware/psci/psci.c:724:undefined reference to
 `psci_cpu_suspend_enter'
Message-ID: <202501271006.V0zyWpDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: 8f5ac7a3bb201ee221c2c8dded806cf18eaba9de [31/83] firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
config: arm64-randconfig-003-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271006.V0zyWpDV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271006.V0zyWpDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271006.V0zyWpDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/firmware/psci/psci.o: in function `psci_cpu_suspend_s2ram_enter':
>> drivers/firmware/psci/psci.c:724:(.text+0x83c): undefined reference to `psci_cpu_suspend_enter'


vim +724 drivers/firmware/psci/psci.c

   721	
   722	static int psci_cpu_suspend_s2ram_enter(suspend_state_t state)
   723	{
 > 724		return psci_cpu_suspend_enter(psci_s2ram_suspend_param);
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
