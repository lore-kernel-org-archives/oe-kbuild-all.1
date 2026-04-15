Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA323E32B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776224433; cv=none; b=MvYgSRKKM7J02Ll5LOcqgJVW4f1bVQOnu6msgCkzSVacPKiam+e2Cxd1ZQ7sjQJzIvfX8O08kZ5ccJkkVcywWJX9OYPfU5OLiRqfHx3Y0xNFOkfD69oJ7u4rP6hdY+G8gQK/x/3ZRF07wzU2yKX9eQFJLeXXV0/Z6utBNaa0uz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776224433; c=relaxed/simple;
	bh=UvaCVLx2R7NhKTY8mVY4yzfRyT2AhXhWreCFVaKicOo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WiGKxd/hA+6Ggf4MaoiuBUZwY5CE166NhqVeKgWOsB011lQk2GV6cqifaDjdqyxY1jZXfudl38ugYxmFhKUm+6YZwZfBo0/zgucWTsHp15bbCz5P7x7DmXt7AnqoVu/ETaoMhTYcreW6iqINAJ+g0RFg+dxshPqJhAWfqhJyVHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6fmMeFZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6fmMeFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776224430; x=1807760430;
  h=date:from:to:cc:subject:message-id;
  bh=UvaCVLx2R7NhKTY8mVY4yzfRyT2AhXhWreCFVaKicOo=;
  b=l6fmMeFZ71pAfOMurqNcvjWuPvNthETyTnxFMpxD3H1gpgqo/Nm5DlQF
   /dCpebnW1upcGHl4Wm9F51lyyNz4tLd1JNBxuN5gl/2rG0BJ4ML1f26ps
   lGoWgf9WhqpBgAmOIM9oY2Z8cYIYD/DYF+gDO5cW76kusQw2HwxgzoBRG
   VxWNkMZzFj+mgsLot/gTnxRKHgCmWip+FksYjtVEURi41y7HgrxuoDJQc
   19X8Olu8gzNDstiLseI93qrFmJpLFVHf1fUWTFgFA7SMq8f8/OFKbjKmu
   3iStjLyY6JslhdEbefYqHIiF96uBjSHH5uQW4JFkMN/HM5PdqMMnTlDwS
   w==;
X-CSE-ConnectionGUID: MUZQTqhpRnGcLNTsgHWXyQ==
X-CSE-MsgGUID: KsB7Nkw8RzmSp9VlREWC7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77373816"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77373816"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 20:40:30 -0700
X-CSE-ConnectionGUID: nLDhyPi+RjuK7sm4kFnXCA==
X-CSE-MsgGUID: rPmoN+AzQOWxdfa858o3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253686071"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 20:40:28 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCr74-0000000006j-0uzz;
	Wed, 15 Apr 2026 03:40:26 +0000
Date: Wed, 15 Apr 2026 11:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-7.0.y 120/192] ERROR: modpost:
 "s2idle_set_ops" [drivers/soc/qcom/qcom_rpmh.ko] undefined!
Message-ID: <202604151104.VzjnWCOm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/steev/linux lenovo-x13s-linux-7.0.y
head:   577f25eff3014cf94dcfb85d3230d31ca505d3a4
commit: 9a4298a1fd82560f63a288423afbc28744093bbe [120/192] soc: qcom: rpmh-rsc: Register s2idle_ops to indicate s2ram behavior in s2idle
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604151104.VzjnWCOm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151104.VzjnWCOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151104.VzjnWCOm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "s2idle_set_ops" [drivers/soc/qcom/qcom_rpmh.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
