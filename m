Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A8288CAC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470175; cv=none; b=MbRQC/lQBoiiyR+b9ey6u/0KxuDrXgn6NtYnAN8H9o7M2+J4XqLxFlbZwOk9Qki1/tVI4c0pPg7pXXXO5sFzMf0dwHx26XekADx+8vkOSBXcHdslDMwTltdX26Iitj4On4X1Re9SDNzx22aeHsnlwKH+N2qtJFeFaNgtoZmwaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470175; c=relaxed/simple;
	bh=UT7nyhPdmQHN7/JI1uNqlPwK6jbBizOYJ8aBe6M/5B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uo/07ZUnD89JylkyFmzK9WjOaXBYCgBi/eycQ/186fZypRKsw70Ftv/Nk/db3e+HsCZxo4dnkShC+PvcbYeudOrJVauWTqJjCEwnEVlhYLV3E8nx61WduKRn8IUVNoX6tLF7XRSV1ZpTxMvV65tgDaD6xF5qrf+3jL870RVqHEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9VCtafd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9VCtafd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754470174; x=1786006174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UT7nyhPdmQHN7/JI1uNqlPwK6jbBizOYJ8aBe6M/5B4=;
  b=K9VCtafd29EuqkhPP5J0SVuMWZ9kcl8ac2aDtxqaDIq9aLl2x13gSyIA
   z7mbDnsGHy0VOvp3lxIfnnicHBoDoOtLG+W8Lua+USt8s+kD9rHUeZMbM
   xoPRD4/CVydrJ9sfeVtYBawuEBClhbmbrtDCMDxJ9XYEtRsr/gWZwIcL8
   X/ZZh2U67N3BJm4/I5CeOyM6/1mADpZcvqNIE3FlfXLrV9toOKUf6HKv3
   5G8oipCSRbT0RMRkFl2QPzvNZTDw+Ff5zuRVpIKIYfb7MiUdcGbZL7Rgm
   Vn8QaL+ajLmSLxR4hTa84KzT08WyO1lMpm5w+EdC9wUNW1VYsMC5rYjvQ
   w==;
X-CSE-ConnectionGUID: +fY9QSkzStecYqtJZ1AYhg==
X-CSE-MsgGUID: XlnrG4jiTsCAwQGTdDaZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60592907"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="60592907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 01:49:33 -0700
X-CSE-ConnectionGUID: 4Es0gvxgQzCxXuWJyAfO+g==
X-CSE-MsgGUID: QQxiaIafRdaVEXxNMAYdQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164380151"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Aug 2025 01:49:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujZpt-0001Q2-1r;
	Wed, 06 Aug 2025 08:49:25 +0000
Date: Wed, 6 Aug 2025 16:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] kernel/locking/rwsem.c:1651:9:
 error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202508061604.3VhGf2Id-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   886d2f37b79982531259490548bc83b9216ca685
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/1] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: i386-buildonly-randconfig-004-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061604.3VhGf2Id-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061604.3VhGf2Id-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061604.3VhGf2Id-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function 'up_write':
>> kernel/locking/rwsem.c:1651:9: error: implicit declaration of function 'trace_android_vh_rwsem_write_finished'; did you mean 'trace_android_vh_rwsem_write_wait_finish'? [-Werror=implicit-function-declaration]
    1651 |         trace_android_vh_rwsem_write_finished(sem);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         trace_android_vh_rwsem_write_wait_finish
   cc1: some warnings being treated as errors


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
