Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED71B960
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732853409; cv=none; b=RqCPzx99kV6U1ulNQZXln52/vIDcevAR7hHKnp41ajv6c6++0XBiyg50U2vECyYdmh/wVjntuVjv+lipBiWYum1ioJrNPpn4vz0LAosFGUBnLNE0ZhNtWXfVKQGuk+tqkDpXfzfBzkXS4Lt1SKs5hq94EtJEiz/8P1lDIjmkk+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732853409; c=relaxed/simple;
	bh=AMxIk//siwGBmF5NYhtUrZLtufSJnCtyqx2Ki7LonLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szjC9YI/W+L8R1z5FApjDzyH9dE2Jyt5CL8TxPAqTADPw6TgHfg/z8PF5FciGbEZ9H3/BF5iCBVini6TG1cDKrNKG4JiCAr7JQOultq/Za9hYq5VzYln88xEZbPhBh0OwW/9nOxKhEnoRaeznqVyTgMZxL2AkAnwaUy1N3HkuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq+nBMHg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq+nBMHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732853407; x=1764389407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMxIk//siwGBmF5NYhtUrZLtufSJnCtyqx2Ki7LonLQ=;
  b=Iq+nBMHg7c/sHWJPDtBjHpkjHl/MiBtOVgZ6RrlMJRAv5cToQPf1MTcs
   VOsQAwJKVoEfdZi3lwCY/3Q2qxMlVgUfVNQ4DzojILcpuGED740L+HAJl
   vrERL7CHnXbzIiMA8Oc81J4mUdhrXQsuECewKSMA7fYv6FKSyh/aX2rZp
   JNd8Qf48I4QiK9ciogHi+a8xzR4xWftg9vCs6ycnIvS20M9UZS/e2pei3
   ZbKrWRrETwfC6g98Zpvbdvb2ddP5pO7OL/tAqJFnpG3360kdpqfok8XUh
   pTMmfvFIf8e/4XmY1XMU2OQiaCaBZ1dqX1xFt+RZpuSQB5e6wwdcP32No
   g==;
X-CSE-ConnectionGUID: O1D2w9QFQNazmgm3OiWuIg==
X-CSE-MsgGUID: F+t08OxwQkKvkPwCVNxGeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43752824"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="43752824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:10:06 -0800
X-CSE-ConnectionGUID: zEWGoPKoThuFSIcdhxPL/Q==
X-CSE-MsgGUID: 6tw+e2t7T2Ccppk8D1y1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123345782"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Nov 2024 20:10:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGsKR-000AK8-1y;
	Fri, 29 Nov 2024 04:10:03 +0000
Date: Fri, 29 Nov 2024 12:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2461/2461] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202411291255.OrGZGrUb-lkp@intel.com>
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
head:   1a47bbfaad6fcbfb4fe3935cb7408d843caf3760
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [2461/2461] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-001-20241120 (https://download.01.org/0day-ci/archive/20241129/202411291255.OrGZGrUb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291255.OrGZGrUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291255.OrGZGrUb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:2967:22: error: array type has incomplete element type 'struct cftype'
    2967 | extern struct cftype cgroup_v1_psi_files[];
         |                      ^~~~~~~~~~~~~~~~~~~
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
