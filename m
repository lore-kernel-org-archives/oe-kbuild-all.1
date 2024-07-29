Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C9548F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261712; cv=none; b=oVSZ6Y3veFqunjhmPRYE2uzDkRa0NnTvjPcYW4prb+8yBrcah5fbo4QR7ya0N2CEP0PpXDqtz37aOibtVtLvHdhO3990r73rpPT4QbYTlBgg4WwhLKJS2+lXRgAy6tE7r1CI0vicQsPRqF1NsLliOHqO/5+SWjvH3t3skPj4rb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261712; c=relaxed/simple;
	bh=yKZPmp5AUvCQssaW4sD32yARvoCtaEpEqZjKLMr2fQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JsS4JHfFi8ZM4Tspo9T5BomDi5lU/CPo2004FBx/k9pnqmxClM5WfotJVnTjTwM5Od48WjnaYUP0ZeL4DLbKz7YLP0qt0ffu0tYjAcQXHDjm0Z7QJzrB22HxeDXxy9xTNbay1V9T5Rg8esUZ+3MFujTRkn9zPKTwvkc+PupJdr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRyr5RW2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRyr5RW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722261710; x=1753797710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKZPmp5AUvCQssaW4sD32yARvoCtaEpEqZjKLMr2fQ8=;
  b=PRyr5RW2xEyBGblIitCWMGb938ZNunHYv9VXaiJ50IuZY0N5tPN7EESK
   nlGOxSUzgcKTbl2JZoO3e8V5KjSD/RJTT2Q0VBXZn8U4ME7SKKTcH7qmF
   eB4h31kohVEXbnCPWB8IFdCxJYJ0+kkXkM66UZkJ0Pc0WOl4h/LzYxowV
   rjwt4I2hLDPSJzop+wJV/xABQo+0tSTHwAgvXg3z3HCPL8NPsV7TeYfJY
   41dEw2IaRUpRMfcRpJMjdX9PchTV9coF9x9S8NjH7drVPcnRi+koHR0Ku
   67+jj0FDER3LH7M/Sn4zYLYqyShFwAUlhlri4BIq0xXkcjrsLoeD1hqfk
   g==;
X-CSE-ConnectionGUID: WP+WqJttS/2jRYI3PwBN1A==
X-CSE-MsgGUID: moSxSXV8Tg2ntAFPqOpcgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="37525064"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="37525064"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 07:01:49 -0700
X-CSE-ConnectionGUID: 5tG8rTnfSpiea+p2ZcqbaQ==
X-CSE-MsgGUID: NZdsbXpsRu+eGGmIxY8o/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="77211804"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2024 07:01:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYQwc-000rjq-1Z;
	Mon, 29 Jul 2024 14:01:46 +0000
Date: Mon, 29 Jul 2024 22:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/scx 39/42] kernel/sched/sched.h:2371:9: error:
 too many arguments to function 'prev->sched_class->put_prev_task'
Message-ID: <202407292121.IpGxPm6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/scx
head:   df64e1ce653e6748aff3f6d7dea17a02c7905075
commit: 4dc9ef89e52432135c71303203f5b9868f2dde6c [39/42] sched: Combine the last put_prev_task() and the first set_next_task()
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20240729/202407292121.IpGxPm6R-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407292121.IpGxPm6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407292121.IpGxPm6R-lkp@intel.com/

Note: the peterz-queue/sched/scx HEAD df64e1ce653e6748aff3f6d7dea17a02c7905075 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:88:
   kernel/sched/sched.h: In function 'put_prev_task':
>> kernel/sched/sched.h:2371:9: error: too many arguments to function 'prev->sched_class->put_prev_task'
    2371 |         prev->sched_class->put_prev_task(rq, prev, false);
         |         ^~~~


vim +2371 kernel/sched/sched.h

  2367	
  2368	static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
  2369	{
  2370		WARN_ON_ONCE(rq->curr != prev);
> 2371		prev->sched_class->put_prev_task(rq, prev, false);
  2372	}
  2373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
