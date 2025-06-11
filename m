Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EC8F5B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 05:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749619135; cv=none; b=Po2+0zZWGW8DCYiL8msyIkmNSdbZBQ+NwXFdJdjMFCNAnemXDLt77Xn7Y4OqWkStwo3OYfPbHdbYOKQanWyTc5yCKG1i5KJm/LBaWYMaKsy7EPSVuqGeXrGWbYaNoRWwS2B6PHSDABw2UVVw4x82HBSeNcGT1bKB/0DBrpajWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749619135; c=relaxed/simple;
	bh=AqaL1h9y/qyGnA1A6/TzeDjv7QbJgaYaJVRifAJqXQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTcdx6FiHd7yG0nsl7/Wva+WvpQ9J32A/8UYkflEvVaoLpy5x54lh0A5R75xnjoZ7nYIhrGJdWPpMa/S8HZI2eh6Yxc0IgoBfxC8xZagmGnOCt+jXYeG3rgfp7EH7K/TF2RabHXzfHYmzDKtoF6qQxGF2CSHwItOJ4KCvcPEBSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TShBO0I3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TShBO0I3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749619133; x=1781155133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AqaL1h9y/qyGnA1A6/TzeDjv7QbJgaYaJVRifAJqXQk=;
  b=TShBO0I3nP+qYT/3wi5ckT9S62X7ZboPcdkA9VuosNPgVxBKYW/UXJbY
   gPD+qh+JcF2fRHN/+asOFzOSy1P2aw6fMHNBMe6E+ikqKOS4kBnFP2RtH
   zcQCNfjTtu1zKILCMZoLVC7d1WZbWNgg7ZgwOB23OfBXELrt0FqTfJ5d9
   Q3ZMZNO1yE7UJZ9w2yaTrl49XCSAKCfoZwQn0ypTCfC2wo1ysjRGJr+EA
   AcqHmC/EoBE3HMoNxDPo68KRIS0IRaOKqDHz45W2xLl/v9pgQfTCnPfLr
   7YABgS2jOyAJH0d7yYalycG2Z9+Sy0mqBm+luERluBp6RotVOsnXQvXtY
   Q==;
X-CSE-ConnectionGUID: YBdZuhWxSQmzJEk6LLSEaw==
X-CSE-MsgGUID: JfDaGk2nSTWOHh6FZQNTiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51850465"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51850465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 22:18:52 -0700
X-CSE-ConnectionGUID: e20++YDgRvO5gGWJeNFxIw==
X-CSE-MsgGUID: VBgmK77TTIackvnzp3gs0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="170240720"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2025 22:18:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPDrN-000A1a-0k;
	Wed, 11 Jun 2025 05:18:49 +0000
Date: Wed, 11 Jun 2025 13:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2954/2954] fs/proc/base.c:1454:6: sparse:
 sparse: symbol 'pbha_bit0_hide_file' was not declared. Should it be static?
Message-ID: <202506111322.Edx0vIZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   90ff3e07cc268a8e40bd578dcc4907a3db419c52
commit: bea38841945a52bd03004240eb0da6a5115bae21 [2954/2954] arm64: mm: Hide pbha_bit0 in procfs if pbha is not enabled
config: arm64-randconfig-r133-20250610 (https://download.01.org/0day-ci/archive/20250611/202506111322.Edx0vIZW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250611/202506111322.Edx0vIZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111322.Edx0vIZW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/base.c:1454:6: sparse: sparse: symbol 'pbha_bit0_hide_file' was not declared. Should it be static?
   fs/proc/base.c:2471:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2528:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2625:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:719:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:719:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:719:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:1126:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock

vim +/pbha_bit0_hide_file +1454 fs/proc/base.c

  1453	
> 1454	bool pbha_bit0_hide_file(const char *name)
  1455	{
  1456		if (!system_support_pbha_bit0() && !strncmp("pbha_bit0", name, 9))
  1457			return true;
  1458	
  1459		return false;
  1460	}
  1461	#else
  1462	static bool pbha_bit0_hide_file(const char *name) { return false; }
  1463	#endif
  1464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
