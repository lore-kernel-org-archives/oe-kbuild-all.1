Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58CD27E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765511603; cv=none; b=rOH7SJDQHgtdOPqhFC2ovaSYC71OOELNMoprIL2hZDrCscm+m3GAc/vyIoAkEowr2tSMaCn/LrVKYGXNReO+DTzMpY7DjJ4+Kh1cnkU95auPsKNeEHzfjnmNDHxfp16qS1uXPmrZ92eEM4RYDbDavYoeMmfONavLHOru85HvaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765511603; c=relaxed/simple;
	bh=4Mt08toUkikQWmFmCIcZMqDajtwMTJPFKyTQT89TWig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBhCYc+gCpZlcTWlEkPwdjwO5Oeq8pDk+ZQjUzE4XfnC4foObRa3A8hPzlt8pmFDVnhKkfuE/b/1b/q/jhy+twQU7pjaBTBw0kxiFOrlEBGGr2MY/4TXIgJjMRbk7WfveAuEDIq1xBbJh+MhtQ5vxI20p8pBoLmIdKoF9DJkSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RF5czQky; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RF5czQky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765511601; x=1797047601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Mt08toUkikQWmFmCIcZMqDajtwMTJPFKyTQT89TWig=;
  b=RF5czQkyvWmc/b6sS5RVHUCQ0yMApRPB+40krPSkjl/KcAIpgnGx66EE
   uez23MEyX3A18eDpllWlfgsIok4SMnXWux9PjmNG0eA8keXfDl1KzxjOE
   3qAkxC2n6MpZ7gf79GIwNGrf0aXhb5Sk7eYR4i+zzuRQgMSdR7VjrIn1+
   BY4J0nM+IOQr+QyOLTFHkFtFE+z0bZkUNjOOeae1C9F3rdhtIa/wHMxvc
   iVVK++yh+gIOv1JJsZrQgkBqPynku6a+om6r/ZrgzAa4jO5u1i6/U6l0b
   /fw/50kiUzOoyivumWyLpnziwLslaEi1BxZkEpM4QqTx+GGT9i1tsEhmu
   Q==;
X-CSE-ConnectionGUID: sQyYJYc0QW2JojUZPoLntg==
X-CSE-MsgGUID: M0n+ChWLRE6v3+dZR3vnbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66682911"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="66682911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 19:53:21 -0800
X-CSE-ConnectionGUID: NOgq68F7TAyqiDZl36rAtQ==
X-CSE-MsgGUID: QsU8FpdWS3GVaUNtbbDKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196966642"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 19:53:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTuDV-000000005TB-2NsT;
	Fri, 12 Dec 2025 03:53:17 +0000
Date: Fri, 12 Dec 2025 11:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 kernel/locking/rwsem.c:1651:9: error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202512121103.lNOn5jjS-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/5] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: i386-buildonly-randconfig-003-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121103.lNOn5jjS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121103.lNOn5jjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121103.lNOn5jjS-lkp@intel.com/

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
