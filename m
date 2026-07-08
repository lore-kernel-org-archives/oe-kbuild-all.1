Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6BD3E92B9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 07:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494604; cv=none; b=iTbBAx6U1jOw0daQOXE9PilmBdgNG7s3KvZp6H3IxUiJtBIdkWe42ke1xFJzoxmZtG1EHhyfE5OgQSSMNmX3E6tkipxlteu83GGp26H3BBAkTVgpMyBd7CnZVNEYum/RSewzQRP2XnM4XPs5PK8QcHN2eZ53QUxdxgyQknipXl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494604; c=relaxed/simple;
	bh=Nki04iXCvLqlMCtvHIQMEC9O6vYjzliDF1qJds8HomA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ts2rP4eQyCbewtYIwREbkRGEEiSOQAGxht3wn998Nff9m3G7vDtZ03V9NgZUKrDsPy3v9OLLhp/GQZv8fyIjQctzGW8jwzLI35Blb/chXkf4mKQuRsXNP/s9NtINlGffULjfMMALgt5pqk6PvNmnPB5swC+9MAZa3efgvVFpEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAy95jVx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAy95jVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783494587; x=1815030587;
  h=date:from:to:cc:subject:message-id;
  bh=Nki04iXCvLqlMCtvHIQMEC9O6vYjzliDF1qJds8HomA=;
  b=GAy95jVx7Cu27x8WdeEiFi0NGTNmohw36RIL98gNQtndVsQLQV6AQk2+
   hbeDHCwTZqxsr9PqrMRzNqej9iQMI03AYI1eaGvh4H+GRR5kFLT4HrwRH
   ftW3+55WWQN40H3P7Jc8FjxCx3KTX4tz+2hJ4c9rKgoZkBJZQgEJvfGci
   pkcDNhzxxrt+kniUdOBuN4VoD60QWuY7gTvohA13FfwUUfRRapwzlNqG4
   QJL2+4CU0/kUdrNXsT6SxtwDrSyusRStAkZPGj7S/DyeDG23MFfwvThsO
   +i025sTuVsBRlwd/dvfjT203cn8U7Uwpn27v7F1dvCUQxd05wkNNI0AFF
   Q==;
X-CSE-ConnectionGUID: FaBXVn8oRgyJnxh7eKHBsg==
X-CSE-MsgGUID: buTMzqcyR96w5dXgTkAm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71668348"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71668348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 00:09:41 -0700
X-CSE-ConnectionGUID: PjdkK1qdRAuNQ5eQI1lsNg==
X-CSE-MsgGUID: PePVvrJDQsmFS1LvM1sY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254853859"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 08 Jul 2026 00:09:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whMPZ-00000000G7L-1xxK;
	Wed, 08 Jul 2026 07:09:37 +0000
Date: Wed, 08 Jul 2026 15:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 166/166]
 kernel/sched/core.c:4976:6: warning: no previous prototype for
 '__balance_callbacks'
Message-ID: <202607081517.0YNZGa7G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   7b80053b707666e258e504127dd1bf5ac555f5e1
commit: 51ba045c81b3d00225cfe6866e5fd18a1faddf30 [166/166] ANDROID: GKI: vendor code needs __balance_callbacks access
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260708/202607081517.0YNZGa7G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081517.0YNZGa7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081517.0YNZGa7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/core.c:4976:6: warning: no previous prototype for '__balance_callbacks' [-Wmissing-prototypes]
    4976 | void __balance_callbacks(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/__balance_callbacks +4976 kernel/sched/core.c

  4975	
> 4976	void __balance_callbacks(struct rq *rq)
  4977	{
  4978		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4979	}
  4980	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4981	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
