Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC0121CFF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472365; cv=none; b=rUN2pCbNANLWtWQFJgM+QF04Xmr49R2Ko3iRKjoppewoWIu58cU6sqxczebd61YJbcJjNd239PkmIqj8P8M1E7yqd27gcb4dZI32jlDrkY01yH2EY6hZglyQku0c7Jl+Ylw2X7J2tOlzB4SCBTUhIqp/lHZ2XbKeK/gPnTanmzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472365; c=relaxed/simple;
	bh=L+ISe20Y7tlwwLTw4Eyo0I7D9q5IwOxbJ+UKIZ0dD3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2AXbVy3NcXIK3jlCPc/JxM7qNR6m21RO9EUAPiu05I2fva48j8YbtSjy6woBnvGplzdKQHDWwMS6MuNBfqeOdBYss3IfWBCnEdo3MQRoSNWHXDMsGByhqCSlDH5Fj7V+da754wuk8FsnXc7XiFJXkAc5Agn1QNxwyBCHs/L8rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWn5sQjn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWn5sQjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742472363; x=1774008363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L+ISe20Y7tlwwLTw4Eyo0I7D9q5IwOxbJ+UKIZ0dD3E=;
  b=CWn5sQjnBJXUBmy1pudv1rliFoyf8dARRnE6CAYAK989sX9V9hP2Kejj
   UAcpy+ADZMYHCpFNKBDpLkXPXF9x2DXDmpxEkZLaKWZAcmpGZlhjKMoed
   jpzqNC6fF+B1pH/TZ1y3XsHh8XWJ7lyDZi9//SX3cnd09SPvrqUE77vOP
   a6bsrz5evGypRUgy6L92jb1V47WrFECv5YgFs9in8FdzAMSTNtXxcq+9r
   aLvWHKC0Bg9J9uRxvvi0w/Jsikfwh0QI3MDrG3i+iWxxqPJ0hX/vXnNjA
   Og4v+ZGBVSVJ9xRIPGan2XMRR8uD3qoU/Ppa2RtVfKf+7n1zNQgnuyQgT
   w==;
X-CSE-ConnectionGUID: TqZldlpVTKi9m/qvcYEB0w==
X-CSE-MsgGUID: +HYdEHjHRX6B+pR3RFd+MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66160461"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="66160461"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 05:06:02 -0700
X-CSE-ConnectionGUID: 7GssoNpUQJKXosk/12B5eg==
X-CSE-MsgGUID: rvYpw10/TFOCbbe5xits/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="127762214"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2025 05:06:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvEeu-0000Q3-06;
	Thu, 20 Mar 2025 12:06:00 +0000
Date: Thu, 20 Mar 2025 20:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2816/2816] kernel/rcu/update.o: warning:
 objtool: synchronize_rcu_tasks_rude()+0xe0: unreachable instruction
Message-ID: <202503202016.ACG7odcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   762816c3c07e052877c68911685e3700fe073298
commit: 2509f2079e7247ed0d695bdb69c3d019a700a4b8 [2816/2816] rcu-tasks: Make rude RCU-Tasks work well with CPU hotplug
config: x86_64-buildonly-randconfig-003-20250320 (https://download.01.org/0day-ci/archive/20250320/202503202016.ACG7odcD-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503202016.ACG7odcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503202016.ACG7odcD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/update.o: warning: objtool: synchronize_rcu_tasks_rude()+0xe0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
