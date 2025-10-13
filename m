Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB36D2C08A1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378226; cv=none; b=Ol5y6Wbj9VIGMCJGwHmDuElad2qqkzOKEvpiaUHlRj7R2yJrzJm6RH9hyvRG+9BVgiaHj66JJbFmjDncMKX8ETtMG1JRhzUW/qtkHRgblKdb5x9/UdoSycMQdUzHBcQF3ETOWs0scCTaOoRN3I3feyacrCLVNBFK5/h0d8eXQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378226; c=relaxed/simple;
	bh=XYUm9rw1FzGBPHfPeTxSbFskUhOYDiin4dfQXORtJ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RNtVz9QGhr1mSACqtMI0EUxXFzEwHlmnMVesnj7kn45ZvWLkmcPuvTTTdHxdplItSZHDEDOlhD80mFzacXgXY7I9b6udOph0FQGlQ4+MVMsncyr0/Vpl7Tj4vwIzR60eyCe71amimrD340jwaiC+JW2/NoffTGUjMmWLDGXjb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwBIRrp/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwBIRrp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760378225; x=1791914225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYUm9rw1FzGBPHfPeTxSbFskUhOYDiin4dfQXORtJ9g=;
  b=IwBIRrp/cGxgIlamr26rpchyXBvxhIQ0m/g6U1Hrx4Zx2zi0FBP12+cU
   Bcv+y95tO3tD7jhuFgGTJ/6gVd1rVBvShZdD06ug9BJ2OxQY6IKHXUnBr
   0GY8V9ixK9oGv5ZbTejtFsIzECNIG6sSIwme8hoH1HzhZnISCdTyFPQAP
   kG0OAi5yCezKHihFnTGPtzmAdf+vlp30l4GFVPz829Gcf7K5zcggk8Wwg
   fAjjp1fjfSp32yX4YCB/FnlnECbXZl9/s6XNeBvaVZ2yOXsiL3Mi9a8DT
   x0nvrSuPAxAKNBezueOaJQtRjFjhqtwOHFacLxof9170dFyVCKYiWBfZj
   Q==;
X-CSE-ConnectionGUID: DnNBvbrXQYaEcqdQaf8LwQ==
X-CSE-MsgGUID: AA6oY9ZCQXuaCRhc6Op6LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66378419"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="66378419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 10:57:04 -0700
X-CSE-ConnectionGUID: 8l6d+QsdT0il0Ev9XJOzvA==
X-CSE-MsgGUID: FNKoUbkfQOCIKogcBhamUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="205356360"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2025 10:57:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Mmn-0001wL-0r;
	Mon, 13 Oct 2025 17:56:46 +0000
Date: Tue, 14 Oct 2025 01:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 5/6] include/linux/seqlock.h:1243:
 undefined reference to `__scoped_seqlock_bug'
Message-ID: <202510140115.NW5RohLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   bc46a565798322686d367c09b790a43a5b6fd847
commit: 5259948079562bd66aecfbc7f799bca42899bae2 [5/6] seqlock: Change do_task_stat() to use scoped_seqlock_read()
config: nios2-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140115.NW5RohLv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140115.NW5RohLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140115.NW5RohLv-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: fs/proc/array.o: in function `do_task_stat':
>> include/linux/seqlock.h:1243: undefined reference to `__scoped_seqlock_bug'
>> include/linux/seqlock.h:1243:(.text+0x704): relocation truncated to fit: R_NIOS2_CALL26 against `__scoped_seqlock_bug'


vim +1243 include/linux/seqlock.h

05b1c033ff04fa Peter Zijlstra 2025-10-09  1237  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1238  static inline void
05b1c033ff04fa Peter Zijlstra 2025-10-09  1239  __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
05b1c033ff04fa Peter Zijlstra 2025-10-09  1240  {
05b1c033ff04fa Peter Zijlstra 2025-10-09  1241  	switch (sst->state) {
05b1c033ff04fa Peter Zijlstra 2025-10-09  1242  	case ss_done:
05b1c033ff04fa Peter Zijlstra 2025-10-09 @1243  		__scoped_seqlock_bug();
05b1c033ff04fa Peter Zijlstra 2025-10-09  1244  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1245  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1246  	case ss_lock:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1247  	case ss_lock_irqsave:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1248  		sst->state = ss_done;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1249  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1250  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1251  	case ss_lockless:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1252  		if (!read_seqretry(lock, sst->data)) {
05b1c033ff04fa Peter Zijlstra 2025-10-09  1253  			sst->state = ss_done;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1254  			return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1255  		}
05b1c033ff04fa Peter Zijlstra 2025-10-09  1256  		break;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1257  	}
05b1c033ff04fa Peter Zijlstra 2025-10-09  1258  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1259  	switch (target) {
05b1c033ff04fa Peter Zijlstra 2025-10-09  1260  	case ss_done:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1261  		__scoped_seqlock_invalid_target();
05b1c033ff04fa Peter Zijlstra 2025-10-09  1262  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1263  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1264  	case ss_lock:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1265  		sst->lock = &lock->lock;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1266  		spin_lock(sst->lock);
05b1c033ff04fa Peter Zijlstra 2025-10-09  1267  		sst->state = ss_lock;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1268  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1269  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1270  	case ss_lock_irqsave:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1271  		sst->lock_irqsave = &lock->lock;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1272  		spin_lock_irqsave(sst->lock_irqsave, sst->data);
05b1c033ff04fa Peter Zijlstra 2025-10-09  1273  		sst->state = ss_lock_irqsave;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1274  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1275  
05b1c033ff04fa Peter Zijlstra 2025-10-09  1276  	case ss_lockless:
05b1c033ff04fa Peter Zijlstra 2025-10-09  1277  		sst->data = read_seqbegin(lock);
05b1c033ff04fa Peter Zijlstra 2025-10-09  1278  		return;
05b1c033ff04fa Peter Zijlstra 2025-10-09  1279  	}
05b1c033ff04fa Peter Zijlstra 2025-10-09  1280  }
05b1c033ff04fa Peter Zijlstra 2025-10-09  1281  

:::::: The code at line 1243 was first introduced by commit
:::::: 05b1c033ff04fa84fd6f64491dfdc9dbc614109e seqlock: Introduce scoped_seqlock_read()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
