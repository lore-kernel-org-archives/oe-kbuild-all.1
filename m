Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A615A84E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726504402; cv=none; b=tSv6+PJ6DIjTHompw7W7bj5PPA5+LoolZx4Cn7SEcchyc/xqu2lD7+OiHkX3swNb1T0hq0K74a4s7WV/89eqWfXkwiJVJOUOlhGswWMSpeYp30bdmy3vu+Tjen1tJkwUc3hm7NNhmWBTUVnJ05t+DJ6kbIP0wf4WYBh4mRx9BZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726504402; c=relaxed/simple;
	bh=VkCUXj77W8LRqbFWsLugf6D4lFMRCmyT4bHmHXof/uI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyotGoMxLYtH4BaUzOA2i8mJmOBP7wUZrHUve5ktdSwribje9cUNeD4nuJcuOalkpAkcOZWQWbfkL/IhEGhh4gBcWZSmOGu7pV7ie51ne9vzTI0S9qVzY8xrD+DoW1Y2vR6mN9OWHK8onEpCPnkzTaU9xSOpei7qdeZ9K01MtGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJtyECTm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJtyECTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726504401; x=1758040401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VkCUXj77W8LRqbFWsLugf6D4lFMRCmyT4bHmHXof/uI=;
  b=CJtyECTm5ljRahoAG8gA7Cwww7d2zmzN/zZ8AlrrTgXbD+3ddX5YA8CQ
   N6UMfUDNT11wttBgJpcwum29rPktce7gKcZQ+dDyxrgL63tmONJ+NXXI0
   8vxr07kCgFAK8wusQ1V+lEBuSkh7hYWjQxwURMXMbqpN6xOMwrkwQAH6l
   WKib4wt3CahKMbFLtjKff7zSuEsfaVSm1XXBvgf1SgJ+ZdobpXGJyks1z
   8FQrNa8rg48KLtPaSB2QkqaKmHAMCZx5OUabKOfqIQxuN1lS8YX3aX55X
   33cjHLvxxbqP4eLw3QwvajFU6zGycDekgaBeych8TOChn3hrjhwxIDON1
   Q==;
X-CSE-ConnectionGUID: /nSHd8PqSZGWfp7jUcbK4g==
X-CSE-MsgGUID: 8uBRjt8BTS+kdx4Fvyfp0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29085210"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29085210"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 09:33:17 -0700
X-CSE-ConnectionGUID: f6xccfoVSqiE1+YGrwMxKg==
X-CSE-MsgGUID: NSzTbvToQHidddV/dIrg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68907795"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Sep 2024 09:33:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqEf4-000AHq-0Q;
	Mon, 16 Sep 2024 16:33:14 +0000
Date: Tue, 17 Sep 2024 00:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19376/23714] net/ax25/ax25_dev.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202409170005.Q9skpI8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 5ba8a3eb026f02aa75f4a22099250bfd4db659cb [19376/23714] ax25: add refcount in ax25_dev to avoid UAF bugs
config: x86_64-buildonly-randconfig-005-20240915 (https://download.01.org/0day-ci/archive/20240917/202409170005.Q9skpI8V-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170005.Q9skpI8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170005.Q9skpI8V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ax25/ax25_dev.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
