Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22A31F99A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786583003; cv=none; b=IGLqBAqZYga+ATFVgnZzDq5ihBSOduRpjqpHpnQsg5L1uRJkvfCuI+TAcdfAILQQfO6ratH7SswJX2EhIU16wvGBVuRKEwkezs2+FIMop2GtYAhjQfQ1J0w1I+xN+K2Ctv39llOYVplUSH9fNtqLHcQH4IuyF20iGnwOgNjVLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786583003; c=relaxed/simple;
	bh=4BHJMrjocSUx4A+bGem27u/jtnzvscaDJwj9FwprpHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dxZFOuV8HRQNmCxi19uegnvNp9UFIs2FtOomL1CXPoS0QLc/JrBVFKc914ZuNnb8PBkVAv5tIjsiNztNGOl5uYQhY5qoQPvcHy2qeFJbrdYlgUobjXC/uJXFj4GQUX5icM9rZLI+qAgVERn8JynByPUbiUbSIWdf6hFt7SMaymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoTKMuXN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoTKMuXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786583001; x=1818119001;
  h=date:from:to:cc:subject:message-id;
  bh=4BHJMrjocSUx4A+bGem27u/jtnzvscaDJwj9FwprpHQ=;
  b=FoTKMuXNCX4qy9aBOUjV4wuAY5pWRL+w+sqku/VYeLGcpg3hn6VcCxyJ
   arunk8A5PjCQEWSXA6NkFX9p5sMMEYdb6IaE6SVDiaB3EgDj6u0vEoun1
   jlMtpwVw1ZuvHnN6J4FNu0HKj0dZHClc07JlpXRi9z/vR5xCzRSqj5kuA
   fjriE9HpxD1eVI7HHx8xpPosd3Q1jiYfFDkpj4MepfUBpz0+U/lgQ5Gdl
   2xpK9jwjbNC+iTu0YF9p7fHK26VYjmSi30ZCqdLEuMV/ynRshZq6r9Vkh
   PYNuT8c/3z0oiU/6SmGRI1ZGArl1r3nzpwJnC8ABqa/tTpGsBDvY5CqYW
   Q==;
X-CSE-ConnectionGUID: 5MpkmxamSyuVHoYpsJw2Xg==
X-CSE-MsgGUID: zYaTv+gPTMCvQtc78qyuFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97815982"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97815982"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 18:03:18 -0700
X-CSE-ConnectionGUID: UtA5Y/MKRBKTRUUObjhrzQ==
X-CSE-MsgGUID: WrHpMHqnRI+yHPCvmhZ03g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="262490031"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 18:03:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuJqk-00000000SLG-47z9;
	Thu, 13 Aug 2026 01:03:14 +0000
Date: Thu, 13 Aug 2026 09:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/locking/rwsem.c:1651:9: error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202608130815.rxMhNnSQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [1/1] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-004-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130815.rxMhNnSQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130815.rxMhNnSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130815.rxMhNnSQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'up_write':
>> kernel/locking/rwsem.c:1651:9: error: implicit declaration of function 'trace_android_vh_rwsem_write_finished'; did you mean 'trace_android_vh_rwsem_write_wait_finish'? [-Wimplicit-function-declaration]
    1651 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_android_vh_rwsem_write_wait_finish


vim +1651 kernel/locking/rwsem.c

  1644	
  1645	/*
  1646	 * release a write lock
  1647	 */
  1648	void up_write(struct rw_semaphore *sem)
  1649	{
  1650		rwsem_release(&sem->dep_map, _RET_IP_);
> 1651		trace_android_vh_rwsem_write_finished(sem);
  1652		__up_write(sem);
  1653	}
  1654	EXPORT_SYMBOL(up_write);
  1655	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
