Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98CD3209
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740632714; cv=none; b=B9gf8MuoOU12vnlibh9xU2QyNqkYlGYKO0XgDpDChdBr2YZEpIKpdZCQ9782Mj/w0PHTfG9bASLJM+apBmSvRyuGyLSYnheeBc+A81Ikir0A4pcvCUzZauKmFIhycn40EsHdmuYYt5cxfM50G9NbZ08vk7lqdcZxjGeFS4WOpXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740632714; c=relaxed/simple;
	bh=RsoNroxM2DafA6mz0RBqoNlpCry1fREsn/rDn7cSpQ8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8Pq+wreoA74WyHQ2nMwM3M7ATBf2+Wxp4xkVVE1uS2LkmCcCplHubLugeRE718xkI4MUi5pdcvwdmqvCGhSJF0oDjdRqXH6yuTLkzpqfm7GSekGaTsQsM3d4d/zA26bq85C1fnvG1ibchBzt83nZVjleGKqFnLWUEyE+XLmH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vjri2gqX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vjri2gqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740632713; x=1772168713;
  h=date:from:cc:subject:message-id:mime-version;
  bh=RsoNroxM2DafA6mz0RBqoNlpCry1fREsn/rDn7cSpQ8=;
  b=Vjri2gqX95mvbJawtwy4C8JbfIq+iejlzwvspU3H0F4WseZNQPOW0snR
   z0IB/5od5ud16uD2uiCz+6FBaBJBnUjpp1ZfTslBSBBiuupWu4SXqU/6+
   UxvWlVOwWU6fVoxr6xYG6OMoZEtymC9cAF5YJhXWqliTOxu92vdeq51cs
   8Qca4SnKj9qWZMHu/DA4Scr1+99kKIZRXJj86MaIqkF+hfNPLs4GiGijS
   BX2lTc6BNaXclU4Ps3kWbFBhSCKoqJQw+oKlK12EJXOpL5g6rFvnxnIWv
   W9yrISJdPa5MhUihjsSlNSn0dppxOnlpwz9pzd4KvGop6vJdmOQ08EP2i
   g==;
X-CSE-ConnectionGUID: teOwp/kjQUy6aoVA8/qW9Q==
X-CSE-MsgGUID: uTRC6S0BQL2qyZnhOlRsqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40684277"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40684277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:05:12 -0800
X-CSE-ConnectionGUID: cAVRzbUqSl2xQHqFh4gbkA==
X-CSE-MsgGUID: g2tfhxyIQp2k6nPufVyN+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="116709680"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2025 21:05:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnW57-000Cs6-24
	for oe-kbuild-all@lists.linux.dev;
	Thu, 27 Feb 2025 05:05:09 +0000
Date: Thu, 27 Feb 2025 13:04:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] net/sched/cls_u32.c: linux/netdevice.h is
 included more than once.
Message-ID: <202502271244.63vk6x3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 3cd904ecbb5d0bcf36dfca7e726bdfd6d3644334 [1/1] net_sched: kill u32_node pointer in Qdisc
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271244.63vk6x3c-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/sched/cls_u32.c: linux/netdevice.h is included more than once.

vim +43 net/sched/cls_u32.c

  > 43	#include <linux/netdevice.h>
    44	#include <linux/hash.h>
    45	#include <net/netlink.h>
    46	#include <net/act_api.h>
    47	#include <net/pkt_cls.h>
  > 48	#include <linux/netdevice.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
