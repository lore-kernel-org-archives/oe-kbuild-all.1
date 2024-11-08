Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC1820C000
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079931; cv=none; b=deKrssGpidlpH0lJiZhHGyYskQO0M45zfpFdJEB0B3raGxzDh69doSmQQp2peoDaRFQpqXB/RB7hbBuohIMIwtb1r5TQoCi437VBGojiXq7jqgL4uq+hKj2BZ6qwyOl2fbC3wly4P2cpaQW5ZqfOGw0C/EPyWjrfMY3NlXwkNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079931; c=relaxed/simple;
	bh=WoM2pCKzj27F2gBCQ9pasHnwuvARkpBXQW52JRC56Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRCpwEMYc+1haCxIatZszFRVDJMIIs6MbC7pQXbnw3rJKKHpdZe8rsmG6ViKbS09v6bwJGs1CbCWBJGWlFRIsPYHyoj9uCh+BQwySL3f/QOkX9as755wwxhBv16dg4QY9PotAEZ8ZmtiQQM+kiBmMSqiQ5uCprzUxk1a13PFIls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0mNGQKr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0mNGQKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731079929; x=1762615929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoM2pCKzj27F2gBCQ9pasHnwuvARkpBXQW52JRC56Rg=;
  b=K0mNGQKr0mDJvzF/0oUR26EQfxVlC0lgZkgVojwNrcxgm+bJLqC4SbxN
   i2ZKC6DhT7cbuictVjLD+cBWVtLQOUyM+lwggsAYs8kxDomlEzZD0hT+u
   H0shzQBHrMJkDOgNpjtkrj1F5Nm6y+Uhrr93d7DQABF5sUjxfPChYb6q/
   aerDc/Hq/n1HnSmJ+yAQCWTQskva3Co9OLDREkL+fHVRvos7/9ASvgmM1
   HfPAHvnourWPf9unUhSxfseOYtleueH+3U1PwDdK67zsUo/wPl5kE1ow2
   vAEQp3qGyl3AIowf7JzWrNTxQgrRVHTklidF182vAIYSXuFNbrJqRaxTK
   g==;
X-CSE-ConnectionGUID: qKIQEdr7RDeudAeBXGXqmA==
X-CSE-MsgGUID: sSeWBMYORWuOTzWFA4I0aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31194658"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="31194658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:32:08 -0800
X-CSE-ConnectionGUID: sIDNjb6tTtaKqP5EI1l4Mw==
X-CSE-MsgGUID: 3KbKuF0eQo6k6ZtPQom0tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="85520853"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2024 07:32:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Qxx-000rXq-2M;
	Fri, 08 Nov 2024 15:32:05 +0000
Date: Fri, 8 Nov 2024 23:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/5] kernel/locking/rwsem.c:1651:9:
 error: implicit declaration of function
 'trace_android_vh_rwsem_write_finished'; did you mean
 'trace_android_vh_rwsem_write_wait_finish'?
Message-ID: <202411082335.FRSH5HVW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   4092f6f4620ca7a3e3e7ef052dc402b73a35705d
commit: 78cf7a145c200d185e2370c712abd8235d1bd5aa [2/5] ANDROID: rwsem: Add vendor hook to the rw-semaphore
config: x86_64-buildonly-randconfig-005-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082335.FRSH5HVW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082335.FRSH5HVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082335.FRSH5HVW-lkp@intel.com/

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
