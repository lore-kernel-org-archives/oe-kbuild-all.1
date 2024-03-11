Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4D535C6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710181021; cv=none; b=Avvi9pLAwgFwZzD7Lgpnsm4ZF6yskT2iWHuj75pNDMKl+RPci0MXT+oxd5lPttOHX6d7tG/dKkLeJNk/FpyO/8YSqUxGiCY7DstelJoY4EN8PwRJHmr0Qg+AiBU0Tavr6qrXuC5ooVt0UTCpjKxSlHCjdz8iv+OVZiecqJPr1uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710181021; c=relaxed/simple;
	bh=uA6mHVOMpY8jkuEx3CrAV0lMSrxwYeYxyjYzRflwWqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNG/R/q7vru7qFN8FM/6vVrvY15FCggDbhaxMjIR/tbgj8lQSR/2dAY8dfuWMy9Q8aOFK/Nn2ufrFiEaSgXPsYo1SEc/SUD+iEVtOTidIQgof0+/hZGryfUJB8zBBAvemA5dLrHx+0sLtW60Jjs7oGN/EQsQb5xqx2p0dLCqbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmMx5W+J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmMx5W+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710181018; x=1741717018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uA6mHVOMpY8jkuEx3CrAV0lMSrxwYeYxyjYzRflwWqY=;
  b=LmMx5W+JvYfZQGzh+2kL3coZXmV7ATACCLW5E0Tp/coHZgKCF1VsQCNm
   0f0EW7e6LWsVaKyQJ1m+AeOI/RJWhBxo6ZE6vRWCpYv/eT3ba8gbuTVwt
   lNOFdPavpslzpLiq3J3o0mSgLV1UJKsPjm+BvGgscXS+3kABmz6N47+ow
   zxbl5HvrSK+hKmYxNSL0qqNhkKIEvCOVvScvl5McZrHXTSHF0FYSvifCR
   ryRNV4u2o11SpsoeK/Jr0G2hmSF5A45VvnZzCLTGD7Ef8BjyoAbwc7LnB
   7AkpP9I+Kf7J8umhgbHX+qFFb1Zy5hxaoMJrXkS+aApPw/lY38bFE4FBu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4976659"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4976659"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 11:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11681334"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 11:16:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjkCh-0009LV-1c;
	Mon, 11 Mar 2024 18:16:51 +0000
Date: Tue, 12 Mar 2024 02:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 91/29558] kernel/sched/swork.c:110:
 warning: Function parameter or member 'sev' not described in 'swork_queue'
Message-ID: <202403120234.vchyu693-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   dce1701e767e33da39db64fe691cd4783ec7dbbf
commit: c0c39481390a053a3425c0091ddb2a0a22491088 [91/29558] work-simple: Simple work queue implemenation
config: arc-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240312/202403120234.vchyu693-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120234.vchyu693-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120234.vchyu693-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/swork.c:110: warning: Function parameter or member 'sev' not described in 'swork_queue'


vim +110 kernel/sched/swork.c

   101	
   102	/**
   103	 * swork_queue - queue swork
   104	 *
   105	 * Returns %false if @work was already on a queue, %true otherwise.
   106	 *
   107	 * The work is queued and processed on a random CPU
   108	 */
   109	bool swork_queue(struct swork_event *sev)
 > 110	{
   111		unsigned long flags;
   112	
   113		if (test_and_set_bit(SWORK_EVENT_PENDING, &sev->flags))
   114			return false;
   115	
   116		raw_spin_lock_irqsave(&glob_worker->lock, flags);
   117		list_add_tail(&sev->item, &glob_worker->events);
   118		raw_spin_unlock_irqrestore(&glob_worker->lock, flags);
   119	
   120		swake_up_one(&glob_worker->wq);
   121		return true;
   122	}
   123	EXPORT_SYMBOL_GPL(swork_queue);
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
