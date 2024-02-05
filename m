Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331348C09
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 00:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707094381; cv=none; b=qf/c8NdHInM37JrFt7Sy6m1tqirS4eyfeKwTzWCZxZ/cMXONi+U3VVEVcH9kfhjIEACgTQ+sfDmnaAqJ/uVFUbsxfdSaDyH0BTg2yti9z2EI+1CBBjoukqo5jvk9+k8xI23lYnetAS2h8im1Ezq35gL7x2BjW5QrTuzRGHoCVaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707094381; c=relaxed/simple;
	bh=hk72ZOqq0QU98meWp69OqazO+jDi8XnhFKLeOqIRnmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HOwPq3PIFDKHW59ccnWI9QUsr6YeukrxHM/I3XMRSybAmpUfxDWEe+y7RHJKg5IGjvL7+tmk0KaRSBqkR4xbhqSPne+2Phv3UsD7fTj6ryG/TQyKT+DT2rVvfZ6tad+MVa/1aJtCg8aGekUrNPV5c4uG/RxCV6Tlk+F8cMusaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikhq66MV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikhq66MV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707094380; x=1738630380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hk72ZOqq0QU98meWp69OqazO+jDi8XnhFKLeOqIRnmg=;
  b=ikhq66MVZRB4aeXL7eN3SySL5Wy20kldQjXnXqkVZC2WTkudgSDSaPO1
   0KGx6gsCFrHJVZuknBq8shk5A55bpQs2jS4tovYcELmMojkhfOSXTGqyf
   aychE9R5eXZX5ry2sF9wkQLAxmCj1sqkMzpzNVDRTMYYbgasirs4LvfAh
   my8vwBGQw/02QsMvYTuaapbmPj/Yht4i6Qt2tZE1SptOs9/W6A7NRXxv9
   Yuslt7hVDjF/3eZKqTTGpc8p0/C6ZKq6/W5MkXihgAlYw9/NEO91cZKkP
   IaBcWFYF+yhUZTbfZpT6uuXWigKgfbM25YsQP5+n0jGbVjpZFQehgO60M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="3392126"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3392126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 16:52:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5183411"
Received: from lkp-server02.sh.intel.com (HELO 1098e01a32bc) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 16:52:56 -0800
Received: from kbuild by 1098e01a32bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWnEC-00003Z-3A;
	Mon, 05 Feb 2024 00:52:52 +0000
Date: Mon, 5 Feb 2024 08:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19453/30000] htmldocs: Warning:
 drivers/irqchip/Kconfig references a file that doesn't exist:
 Documentation/loongarch/irq-chip-model.rst
Message-ID: <202402050826.SZRkCUpf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   30dc7d25bd219b67796d07b2918ebacfd05b4abc
commit: 8dbec732f16ae6510354065536da591114ec83ab [19453/30000] irqchip: Add LoongArch CPU interrupt controller support
reproduce: (https://download.01.org/0day-ci/archive/20240205/202402050826.SZRkCUpf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050826.SZRkCUpf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
