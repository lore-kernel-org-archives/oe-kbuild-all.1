Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF5AD5E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735468367; cv=none; b=oSAI4BbhKfkArS45oqW+Y1+6BE142jC1QKsFdtVjy3b5nO0zM9VYNixjZu5aA9dDphTH1zIqy+opxSE/O3ykZWm3nmCsANuH498U8QgmUB1aGhdMG2BJ0Ewl6GZDmDlT5t0D1srEUUBkPLWB2RHimBcn2V9N/i0vpDwqv9o8xP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735468367; c=relaxed/simple;
	bh=eQnhZDBB95TntYNZooA3DC/kOK+w71ACt+W91Is+gGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FanBqHZrb7LKMs7OS4MMzDRIyavNopetPu7UbsFX9v4fKRqAEN2UiD6Y5S8l0pmJj9KMUfuvDI/8ihFjQ7LQ74X+zT9wQBpsuc010dBnsC9RFKmuHAI2kozQYA+FzkBSs8L2tDcJxgOGbzqSqdf4GvP+mns5V7Mq/Tx01H1KHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zac9nQle; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zac9nQle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735468366; x=1767004366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQnhZDBB95TntYNZooA3DC/kOK+w71ACt+W91Is+gGA=;
  b=Zac9nQle+NvEarDo5OnuPZxhSuGQVKfkFQjMTEBN3LKCn7hcoAyoLt3f
   JxH0BGTeCcM1NkMLCMi+rBz6SB+Y7HmGc61jNDnrQQmG/bFXBtX7hF4qt
   mJwAjjK1VVaSvMntjaUwWT5Hwr6vvy2u//E/Dj7xlmfzbifikcI42sqUv
   dAVsV3btTENoPUvGaCVWy5Nro2vmyf96HfftnGc6/bqL5wS/Q7uZWFnYd
   dghq0B1k19LVdOi9DMQiGO8cpgEehMj/EIPPLQxRVr56Q3ZBJmSZp5u5Q
   K8sjKkTGAiUK5iEleur66JjFOJJ9DdcHHQdmhsS+HWrh4LxJ0MZbJZXKA
   w==;
X-CSE-ConnectionGUID: SBW29Yj/Q9SdCXpeo5SwOQ==
X-CSE-MsgGUID: 4yvYChzIRkiZnVQ/biyiGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46784255"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="46784255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 02:32:45 -0800
X-CSE-ConnectionGUID: udx4aw8/RCePfNJx/xRinA==
X-CSE-MsgGUID: BbKJndK1Ty64dWC1o28M/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105618530"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Dec 2024 02:32:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRqbB-0004bo-1o;
	Sun, 29 Dec 2024 10:32:41 +0000
Date: Sun, 29 Dec 2024 18:32:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Qixing <zhengqixing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] lib/sbitmap.o: warning: objtool:
 sbitmap_get()+0xa4: unreachable instruction
Message-ID: <202412291800.CLkIl8Wr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: e798f29c1c5233281940f742f29e4fad5d30fa80 [2589/2589] scsi: sbitmap: Move allocation hint into sbitmap
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412291800.CLkIl8Wr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291800.CLkIl8Wr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291800.CLkIl8Wr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sbitmap.o: warning: objtool: sbitmap_get()+0xa4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
