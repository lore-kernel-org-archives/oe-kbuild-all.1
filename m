Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D461ACEAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 21:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748380716; cv=none; b=k4l36XAsbtf+KYi8ixeo/TjtmaAN+dc7+Gr46zG8apKbACOAlD3r7F6NERvGTVbUedWBRXzoO+6x0H/wm/oTL8aSaoHWL8gII1txDocv6BbkT5dqXSuDbqQzm+mRR6vZDuJNEn3JYRXNK53zM9/+rVbMUYvulfsChX9o/BE4YJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748380716; c=relaxed/simple;
	bh=2+1OSAg0PW79t8MpDkl/SHOBacf7815YQujNu8xuQZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MT9zfPk9sMOnWi3xzz1+9kt74GCh3LWYqsLwy+XayQoMmITwOExLH/q6RIWEi2xPdZY8UOJlDxr5qWGb9aZHPHTNHxWl9u+jecqmLO0UHe8b/IZah+7OSZLLWurSx4nznur6JGlIhOvR09tXa78w6EOY5oKr9iWrE5FhSGsaVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsH3+o3S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsH3+o3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748380715; x=1779916715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+1OSAg0PW79t8MpDkl/SHOBacf7815YQujNu8xuQZ4=;
  b=NsH3+o3SI3Lr0C9UG0T+P0yjF3w1eNRQUFy3diafPRJYJbaekvO94dfb
   sJL6lwNrYUXmYkyCnHmKiF9xCRmqTILUou5IbICuOA3NvpcBvQw7AfR87
   nCoqp3OPiYw0fJ+lvXi6X215bCK4Db7CKlRKzbn3LGJJhgXIW8bVB3I0C
   pDbfA0Ul0ik1jtCnNiuSgYdB8khvYJ+METYao4hNQHidzXY+1oAuiallg
   IIZitliDiS4VZJu6nGzE29lrpQyoDuO5VAd9WWC47cyvwepbus9W4ls34
   qhRdFjyRri1M6IJp2RDnMi1ccaEwM2otq/pj13YWCSqooB8NRTxtvOuq0
   A==;
X-CSE-ConnectionGUID: 6/5pNO/VSVmyZiAtFLGHcQ==
X-CSE-MsgGUID: 08deBssNQCO1s3TnpWU1oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50389446"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50389446"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:18:33 -0700
X-CSE-ConnectionGUID: OIKwvbioR+Gv2tcXoqceCw==
X-CSE-MsgGUID: csc2TozsT22bqviVqvI9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143950667"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 14:18:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK1gr-000V1J-2o;
	Tue, 27 May 2025 21:18:29 +0000
Date: Wed, 28 May 2025 05:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2928/2928] kismet: WARNING: unmet direct
 dependencies detected for BPF_NET_GLOBAL_PROG when selected by
 SCHED_TASK_RELATIONSHIP
Message-ID: <202505280545.IP3aIukn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   45e99bc87727bf5be83ac512da687f7742d4a8fb
commit: 64ba5634c4c60ea966612ab3eca75cbf2d90f9bc [2928/2928] net: add some bpf hooks in tcp stack for network numa relationship
config: x86_64-kismet-CONFIG_BPF_NET_GLOBAL_PROG-CONFIG_SCHED_TASK_RELATIONSHIP-0-0 (https://download.01.org/0day-ci/archive/20250528/202505280545.IP3aIukn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505280545.IP3aIukn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280545.IP3aIukn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG when selected by SCHED_TASK_RELATIONSHIP
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
     Depends on [n]: NET [=y] && BPF_SYSCALL [=n]
     Selected by [y]:
     - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
