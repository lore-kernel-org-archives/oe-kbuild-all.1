Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B0171A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 02:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490779; cv=none; b=YZdeEFZPEmjc5C3RkuW1PqNtt+T/5KpCtDIIGDycZavvsg4oOJe8FdZAnEQaKtC1URG6lKs1pE+AX+0DznkngOvll+vkZacjPCIP61Mx+edv8k6v2ofNw6rVcJ3jTxwKzERiOaizt7aVRjvRgjg5mayNUW8mQilgBgf0JlZdkEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490779; c=relaxed/simple;
	bh=wX9GtfNUBT+B4Z0UfKwWajozQ3xKvd4NWn2dFfjv7xY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqH0ngvkzB9ig8ysubH3BMtLOO8L4ALMuZrIJpjvqNAjDK8qUEhMQQCXsoKIKPZTWB8jxmaVF886bcLh0rYYGGPmFfGdyNQCVZR1Tw4Zowpx3Os3yTFfPOOy13IjF+vrBFCCwAw4F6+i3HwtE/Gr8wTuX0vk1ilW7tUQv/kaGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3O8Rhpj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3O8Rhpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727490777; x=1759026777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wX9GtfNUBT+B4Z0UfKwWajozQ3xKvd4NWn2dFfjv7xY=;
  b=V3O8RhpjJtbNCjy2JLBG3AVbyTbyb5SRP8sIgvKwvLAI4fChQT9gGNMV
   cq9azyWraULK85n9bXQSbsfGxZfli4LHXp8QyDF6iXYJkBXfDN1ADtF1B
   Dq9AP/lyPbS+8U0GPmPteMurD9Ktz5rsl4eTxcF3v2smn11s0LcgVm2jY
   +uaUevDyIHLhImmbYeHbPXMLeLnE/3aNvZ/Tb+7b7KIxlvZQIKIbo2/yV
   /JTUGL3aU8h3+59XCl3HfWTzC+m72bdQlDA+idxBrhc3OpYq2koazps9e
   2+BBhoqz49ZROkw0KlMo6uoco/D0kI1JzXkKUyrUfoP3opxI0mDRmuOMw
   Q==;
X-CSE-ConnectionGUID: xsMrM5jCQfGRo4J5evWMbA==
X-CSE-MsgGUID: 18cXHnYWSziZ3+EzdxNiig==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26810621"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26810621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:32:57 -0700
X-CSE-ConnectionGUID: /A7mihYjRFSz8UhxFPWBoA==
X-CSE-MsgGUID: 9T3D4rdcRWeiqqTKnVvYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77243653"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2024 19:32:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suNGP-000Mqt-2V;
	Sat, 28 Sep 2024 02:32:53 +0000
Date: Sat, 28 Sep 2024 10:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15479/30000] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202409281008.YCpsDSF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [15479/30000] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281008.YCpsDSF7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281008.YCpsDSF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281008.YCpsDSF7-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1618:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1618 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1618 kernel/sched/topology.c

  1615	
  1616	static int __init sched_cluster_sysctl_init(void)
  1617	{
> 1618		register_sysctl_init("kernel", sched_cluster_sysctls);
  1619		return 0;
  1620	}
  1621	late_initcall(sched_cluster_sysctl_init);
  1622	#endif
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
