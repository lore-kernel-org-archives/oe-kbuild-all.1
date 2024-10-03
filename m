Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4B13FEE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 01:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727917732; cv=none; b=Xf036GOxxq+ub22ZybuEraNqDVLx6MuMN4Wj/2mn+yLLuzfwm8ySbCgJCV7x4TLZAppD4KWD2W/QOB7NmQli38CYD9rYT5ZwiKC9rngHSGrfO6IOWsJOD4mbQatkVISon2RMpJHhTelQavXmUcG6oOU7Zqm1FFkB4pQyfbOlkB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727917732; c=relaxed/simple;
	bh=IbIHabpOCu1Siu0CS320gZ4Rw7OSOa5NvvZmVROlyMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hO0Xm1YBUrftNa+m2TFWIfGVOaW2oRGGa47NuxwBcwLw+krOpaoY1Yghh/Ay7jxQlS+/er8ANOfeP5GGvbK2gxspj5OdG90jGzB148QvRfdAjfq/XwcPKD/Psuu/01gtD2K9o9LItwDwaqIxhABIuj6D8ztaFSOP1fRVffWI6DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHCpToFQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHCpToFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727917729; x=1759453729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbIHabpOCu1Siu0CS320gZ4Rw7OSOa5NvvZmVROlyMw=;
  b=KHCpToFQxQ7KtY5MgS8n3nTOlbZHcIsjBfewcCAOhge5E2JA2UZ0o1kT
   cJJuudoy8hcZbxy8mvpH+1kftq2sDG61Cn4tzg32m0niWszqrJ2LOZLNA
   mQyfyHgr7kYJgasKN8/OXsQipSYjnaNEr7KSQQ3hYc5Whq+0irbAg/LcW
   eG0eUGbQ4NKh9FSLhSElIr/4eXPkP8RFglsuaMRSB2EDwvlOdGaiLL45n
   jn/uGEVOnncdJcORarbup6RABaSUSEymJTgkym4bGgsg8fbT46Oz+3Ohm
   zXUcYtQLIAu1CQ+rQc4XoHjAMwn1Wgs2OHYPJCZ51m+OmvGRu3v72mK94
   A==;
X-CSE-ConnectionGUID: EAnzO9YAQgCoLSmQ8DGlPQ==
X-CSE-MsgGUID: 3NmlwfZfQ2mXM+O9F0Eimg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="30897492"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="30897492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 18:08:48 -0700
X-CSE-ConnectionGUID: D29akZdUS5ac1vbYsE7zQw==
X-CSE-MsgGUID: 1oep8+dtQlmn/EcKWrFhEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74610559"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Oct 2024 18:08:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swAKj-000Um2-1o;
	Thu, 03 Oct 2024 01:08:45 +0000
Date: Thu, 3 Oct 2024 09:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st56-rt51 106/395] kernel/softirq.c:450:1: warning:
 'inline' is not at beginning of declaration
Message-ID: <202410030951.YKvDLTep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st56-rt51
head:   83b6d202216c6d5a6a328dc895dd1b7005dedd92
commit: 6a3ed2167f29d8e8e97da9b95787fa25261ae1e4 [106/395] tasklet: Prevent tasklets from going into infinite spin in RT
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410030951.YKvDLTep-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030951.YKvDLTep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030951.YKvDLTep-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/softirq.c:450:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    static void inline
    ^~~~~~


vim +/inline +450 kernel/softirq.c

   449	
 > 450	static void inline
   451	__tasklet_common_schedule(struct tasklet_struct *t, struct tasklet_head *head, unsigned int nr)
   452	{
   453		if (tasklet_trylock(t)) {
   454	again:
   455			/* We may have been preempted before tasklet_trylock
   456			 * and __tasklet_action may have already run.
   457			 * So double check the sched bit while the takslet
   458			 * is locked before adding it to the list.
   459			 */
   460			if (test_bit(TASKLET_STATE_SCHED, &t->state)) {
   461				t->next = NULL;
   462				*head->tail = t;
   463				head->tail = &(t->next);
   464				raise_softirq_irqoff(nr);
   465				tasklet_unlock(t);
   466			} else {
   467				/* This is subtle. If we hit the corner case above
   468				 * It is possible that we get preempted right here,
   469				 * and another task has successfully called
   470				 * tasklet_schedule(), then this function, and
   471				 * failed on the trylock. Thus we must be sure
   472				 * before releasing the tasklet lock, that the
   473				 * SCHED_BIT is clear. Otherwise the tasklet
   474				 * may get its SCHED_BIT set, but not added to the
   475				 * list
   476				 */
   477				if (!tasklet_tryunlock(t))
   478					goto again;
   479			}
   480		}
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
