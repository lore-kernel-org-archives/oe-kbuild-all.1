Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFF2E7F0E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756845749; cv=none; b=jBqFeR8iXTmYgj0+ODGtz68y4daXcN5qc2TTsrWjqAQtp/HsZpPqwyzU8pOw8Pv4+EsZE3VCYi8bQGUqvAaOWp0ym3bzqJRPbizZtuJ13EUMyCx5MwDB1tXSvOwwnt68Dkzj81qmZ2paInm63MMpPMKAU/miGDmDhq23yY+SQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756845749; c=relaxed/simple;
	bh=/FiIGMP4tijuYO92WNXTgkfU03j+g0vBAVZxzRCzmw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qMpUpWX3dxSxuBcAf8XOoBHgqrM3Nh4ct7A7kt/K1vByXe9lKDstGsPRDATgIM0bOiWIaCvY5UCcgRm9X9r8II8FvsZO+5nJv5GxGka3gC5jpYKda3PQpvsL/I22ZvSioTm+7u4ZYxG0aeO1MMaLJNTDr97kcLgEmJ5E8mZ+01c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PofsvhjD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PofsvhjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756845748; x=1788381748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FiIGMP4tijuYO92WNXTgkfU03j+g0vBAVZxzRCzmw8=;
  b=PofsvhjDIVxE9DASAagQTi9allq9w00W/VS3Y57HWajB9C7OXpiwGYqs
   RN8FZQzAovggxRlArymUf3/9UR03x6rdhyOp9QMicTA/uz9MOKuVjcgHd
   ncS5aVLBPFmVw9zvVkfc/Wxzi5nKmEYAVcf9F82NYurCLQZdrn5q3VNPm
   Of1w60W19O6wYW35BXcEJN7hZDg1ILlGKDBSg9Q0v2eol6ySzFdGRUKut
   wqz1Et+DyIRqeADuNLJ6IQLOyrExzFI3CcyrDK7gppeholM5AtURbYyfi
   le6hegf6Mh/qaOYO2PvuSKorsYC2cWE/PWtE8UMA43vAC0hjeiXOMlclD
   w==;
X-CSE-ConnectionGUID: 5FgQ0ldjRbO96VZhPypDrw==
X-CSE-MsgGUID: oHThMQTXQXyW4+Fys/ywDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59078828"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="59078828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 13:42:27 -0700
X-CSE-ConnectionGUID: UHmbqyu6TXm2dDUrYx2Etg==
X-CSE-MsgGUID: WAZN6IjUQFeLpzMRJD/epA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="175752781"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2025 13:42:23 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utXpc-0003LL-0J;
	Tue, 02 Sep 2025 20:42:20 +0000
Date: Tue, 2 Sep 2025 22:41:58 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202509022235.bp0pMdG1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   119e72f374248c57f950f0658c1e1099b40e2ffa
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [1/1] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250902/202509022235.bp0pMdG1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022235.bp0pMdG1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509022235.bp0pMdG1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
