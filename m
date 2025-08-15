Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8F24111D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247793; cv=none; b=nJe1KK0DzpgsVvqtWx2/KN/izyobB17+t07Yh8q2eZIspi+GNNxDbvYEpKs/xkbhClGRNDIioYBLEIk5vgpukWEmWHJu+DvUgn7/ubMEu6FhV/KnqMPtG7MfMKkUFknPt+lt8w5nX50vAr8fcE/lZuVl+5pW7+4jUsIa1NbO9KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247793; c=relaxed/simple;
	bh=AjKVHEU67rD2/VtBhPsEfZxxNE8/61yncO4ulPxIZSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LtIA2KfkE5Y9Ym6tcnxlJUgni1hudaG5ytjL/2uHyTZM7Qv4kI6YLqPsiOLmfvHAlRm5RsSPtJpDWupaO7BQz9xXbct60OJFOvShMl3fA2inUZX+W9rnCxJOvX82dXEtA6y/3C+99QhtueglELG5F6/gvC7DzgK7iryLbgsK2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxDDntQV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxDDntQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755247792; x=1786783792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjKVHEU67rD2/VtBhPsEfZxxNE8/61yncO4ulPxIZSg=;
  b=PxDDntQVZIzvLXvxd31lrZp5q3OhtaJOXngQOhVUY4Ybj8kbBzZd+J0Y
   3sdv3PPMdDLWS4InWmEme0hJ0+1EpS2jACW6+IIcJOY0bKdZO9Gdhm1F7
   wDvi5WiyjSLODb4OtOTzouP6WU6qEZqs7uCLGRhHemjd7pz6hFleWhlfy
   n2pQ/bGHKRbRk3Wv2JEUTP/cH+dz84hMFaaZGaTrew2yGDIYzv/DV8S7u
   36a5iJBO3bwzCbkwuP90wA0YK9yoIrbaluKiXqyEwAHrM7lsByx8SsuhW
   U7hkKz2Tj1bn5+RpO3y8hTVHQt9b+vcch0ba1NCPYz9R8BvaGg0R1QU8F
   w==;
X-CSE-ConnectionGUID: zwElkebFSZSIyudt9moCCA==
X-CSE-MsgGUID: w+7HiQ44TQC4UpK6J3t0YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75139405"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75139405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 01:49:51 -0700
X-CSE-ConnectionGUID: IcOakgL0TE2RXI0A9XJX+w==
X-CSE-MsgGUID: fOkPzcYbTwC5NUWM3nmk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197823551"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2025 01:49:50 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umq8B-0000Tv-2c;
	Fri, 15 Aug 2025 08:49:47 +0000
Date: Fri, 15 Aug 2025 10:49:04 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1755/1755] kernel/futex.c:1209:
 warning: Function parameter or member 'ret' not described in
 'wait_for_owner_exiting'
Message-ID: <202508151048.nycUlzlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8723dc57de6371f9cc8764e15d4cc9e57ae592ee
commit: 0b7ab5fb231754def820e514cc7607bbad377928 [1755/1755] futex: Prevent exit livelock
config: x86_64-buildonly-randconfig-2002-20250811 (https://download.01.org/0day-ci/archive/20250815/202508151048.nycUlzlC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151048.nycUlzlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151048.nycUlzlC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex.c:1209: warning: Function parameter or member 'ret' not described in 'wait_for_owner_exiting'


vim +1209 kernel/futex.c

  1201	
  1202	/**
  1203	 * wait_for_owner_exiting - Block until the owner has exited
  1204	 * @exiting:	Pointer to the exiting task
  1205	 *
  1206	 * Caller must hold a refcount on @exiting.
  1207	 */
  1208	static void wait_for_owner_exiting(int ret, struct task_struct *exiting)
> 1209	{
  1210		if (ret != -EBUSY) {
  1211			WARN_ON_ONCE(exiting);
  1212			return;
  1213		}
  1214	
  1215		if (WARN_ON_ONCE(ret == -EBUSY && !exiting))
  1216			return;
  1217	
  1218		mutex_lock(&exiting->futex_exit_mutex);
  1219		/*
  1220		 * No point in doing state checking here. If the waiter got here
  1221		 * while the task was in exec()->exec_futex_release() then it can
  1222		 * have any FUTEX_STATE_* value when the waiter has acquired the
  1223		 * mutex. OK, if running, EXITING or DEAD if it reached exit()
  1224		 * already. Highly unlikely and not a problem. Just one more round
  1225		 * through the futex maze.
  1226		 */
  1227		mutex_unlock(&exiting->futex_exit_mutex);
  1228	
  1229		put_task_struct(exiting);
  1230	}
  1231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
