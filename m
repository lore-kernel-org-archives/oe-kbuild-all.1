Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F91643D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712289809; cv=none; b=SMR0IfOyS+AvmZE8395mdMqbOcOiNXnXdVjsi5a6BjmuhEDKawIgKzjA8AkQIPkBuExNPzOdRcPWlninAyF36wrRl9OX/wYLRK9XyvS+rFsk2h1jSdsr6l08Gihn1Zx+yzCD7hulFDXTw7Fk/9bpQY3bxINktApv8ox33TQCaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712289809; c=relaxed/simple;
	bh=cZ38+i2YaS5cZ1QSlbSLgSaElzS9+zulMwG1CcSu2rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTVqrh643siHW2T7lGk7xbhlEBP2EpP1DF+4k7SRjwF5XiuA+7P8FDdMPOqup+6NgBHpWAVrrDev4nSjvt5QLyJJe++EAYcCH5epuQuH0H21ONOjIqSXCyQE3I1gvAOOVk2oeFgEd5QCGByf++ta9dnk4gl+6/dP3+QvRIReGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khjQHZ+3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khjQHZ+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712289807; x=1743825807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZ38+i2YaS5cZ1QSlbSLgSaElzS9+zulMwG1CcSu2rM=;
  b=khjQHZ+3+iZNSjwY1c6FkU6M8u7IJFOiDo0BWD121Mx1CJYpSScDgm+E
   ENqf/5r2UqtPPKsew2UWIMPFl2OiqfD2PHekcIFcWcxDXBj4qV6bFcoTd
   sX4J3HRWl4jEviJtK9lCtCv6Im5AeZ+aI2d/+JW1g1bcIcRlK8CI3djfP
   GxcJmF/1BVRwOYST12+BTkLTS4B4TKlJW5SOrgTEq7fHADgO/MX3odxC9
   MO38gf8Yfl54Kw4BeAz3fE0ZdnZFWKbLSkpZRhCwvpgbKtez5I9tXe+MG
   Pq7MNCw+WNB9Bl1o/XIMkEW3uKlwvUt6da4F4KW4ETmuhIbhodwaXdFMd
   g==;
X-CSE-ConnectionGUID: BpoqLaqfRhKA9+oxx2CtRA==
X-CSE-MsgGUID: QBncq1YyS6SRRAt5QjwedQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18340878"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18340878"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 21:03:26 -0700
X-CSE-ConnectionGUID: If2BBYpCTXu6MMCHFTbfHQ==
X-CSE-MsgGUID: D68rYCIOQKK9XQOQz+mpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19117969"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2024 21:03:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsanT-0001s4-1t;
	Fri, 05 Apr 2024 04:03:23 +0000
Date: Fri, 5 Apr 2024 12:02:51 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:dev/hazptr 1/1] kernel/rcu/hazptr.c:17:1: sparse: sparse:
 symbol '__pcpu_scope_hzc_list' was not declared. Should it be static?
Message-ID: <202404051213.EZOVYbov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git dev/hazptr
head:   809c307dd8a074d866ad97209209e7b8a4249861
commit: 809c307dd8a074d866ad97209209e7b8a4249861 [1/1] WIIP
config: i386-randconfig-062-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051213.EZOVYbov-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051213.EZOVYbov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051213.EZOVYbov-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/hazptr.c:17:1: sparse: sparse: symbol '__pcpu_scope_hzc_list' was not declared. Should it be static?
   kernel/rcu/hazptr.c:19:6: sparse: sparse: context imbalance in 'init_hazptr_context' - wrong count at exit

vim +/__pcpu_scope_hzc_list +17 kernel/rcu/hazptr.c

    16	
  > 17	DEFINE_PER_CPU(struct hazptr_context_list, hzc_list);
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
