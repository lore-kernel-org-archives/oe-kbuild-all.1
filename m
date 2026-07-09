Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F234CDD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602077; cv=none; b=ThP6wlWoCeJM4zkmz02V6XXu4qf0+uWwVlVfTjPGIzAB/Obm53SDN5cKRT29FanjCC86aQbay/QTJKZozj64gItS5wAot7UW5qRbXld0/q+Lf0JJqXnVY5RFHSKzyyKdv/3b97yaJJyPaahKHznuDHVv/GLf98Ok2rUFuLC7qeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602077; c=relaxed/simple;
	bh=YXKDLfWKP5noRHP+dKgcgYd9MMgWh7AHkZZ3cxdKwBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UADZzlw7dBxXJGaC01GZJq2e879ndYa2ErT6CdmK5ZIPhWG1VCtvdfKzm9EnroH+qEKgBPt07JXv/mjB/MHyb0xQ2P6hKqbkF1eVpYYZoE25GZqUEKDkuZli6e1J0473WYB2oJlnKFCLbBL41vwhyR3+kM2C32GD8W6WzNfzwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hd5xaLfz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hd5xaLfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783602074; x=1815138074;
  h=date:from:to:cc:subject:message-id;
  bh=YXKDLfWKP5noRHP+dKgcgYd9MMgWh7AHkZZ3cxdKwBc=;
  b=hd5xaLfzWq4mxgxKXOxCKdUb6qLjlpkBVMKTgLHHVbJMRkfFfzCoRkIb
   FrjnhMNT92YtoIJ8hVumML7PoDZID07tUf+l0nREHGVzeTSIWLQaLggvl
   uXuDUwPJ/pJDedcxt0cikBXHLuAEwY9h7TTK2pwQAkDdRPfrXsz9tdV6/
   1EE1bDlfzoPETljktgTla3txwfeBDjjtLmJUW1+VhtxChVk4O8j+VucoJ
   7MSaJEKjBkfwVMi00wIVoYpiFspN4x+7vDbeXiyLPN3MdTa8q6advQF90
   LErA1FvTRqAVnX1LkifrJKvbbkwVXRjKrLrV/KSkhXto19+Mhv8hjEYA4
   Q==;
X-CSE-ConnectionGUID: sEAS8KGbSxSj6ZUQgC3OtQ==
X-CSE-MsgGUID: SauGIblIQYi0h4SmHb3GJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="71801139"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="71801139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:01:12 -0700
X-CSE-ConnectionGUID: p1z9t9Z9ReGc+Im7FP0Y2Q==
X-CSE-MsgGUID: J3twGqYXTxyJRbIBOYQyXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250181877"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 06:01:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whoNI-00000000HhP-1LTc;
	Thu, 09 Jul 2026 13:01:08 +0000
Date: Thu, 09 Jul 2026 21:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 0/15]
 kernel/locking/rwsem.c:1651:9: error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202607092059.Hm3vFYSq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   f59cd62de6c1f35216e5e618ba7b16e55469dfc9
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [0/15] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-003 (https://download.01.org/0day-ci/archive/20260709/202607092059.Hm3vFYSq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092059.Hm3vFYSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092059.Hm3vFYSq-lkp@intel.com/

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
