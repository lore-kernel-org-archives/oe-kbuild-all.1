Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3F4311942
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968770; cv=none; b=n4x4PdY1D0XPYgMG00wDUbt1zIa02KNSzzJFYiL5yqwf4p4y+FKfRJ/3cIuot8rNbwi/B39K2ADagCMa9acu5WEvpPisAD8AJqDRoMRKWR0emx5+0KpT3tZ86O65FTNvxoKkQQYmkHPsHU7AEga1kT/k4EYeixLfnfjQ8L8DaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968770; c=relaxed/simple;
	bh=PW7h38bFTioYEuN3RXWs5+sJ1qOsrm8mIEA599rCJ/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I4gdEbKBv1XInNgEbnp6/XTUJKk6DZqdqzsMiekdjg2FGMS67tT3nSWoEkPTcrMggI542yRi86jqbqMZ4wy4X1ZT0nO2ovOldZXZ/eS6RLmHOhwAREqctKCzso38TvonhxgdnsoUfL6I7k6ck2iAB0rMCGn61MOBdXnBQLWOLiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMZ2GyE+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMZ2GyE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777968769; x=1809504769;
  h=date:from:to:cc:subject:message-id;
  bh=PW7h38bFTioYEuN3RXWs5+sJ1qOsrm8mIEA599rCJ/s=;
  b=hMZ2GyE+sPbJ6g5ApO70kuFY4Utr0arIowPEYmQoeYeh1acfy69gd4Ku
   MQs0ptX9tBQF3vRgwk4zLHTbOyeWnBTXITDCR8YITBF4yDSwxT97qBpwy
   wxMOdt5/zNYpy2vraO3lsXMzBWd/z5WtcEcWu8GpRGlzb4fRFrSvWe1EK
   MmsaUPHnT/ef17wN4CRm+1Gqq1zyPHTZ7OSByQsQMeRD6OXNpiayK7J9m
   bdrr+NrEdA702MzB5ems48z08fEmVzSxzSOCzsxrTg2rmSniXLex6BXy1
   GkuJc19c6BNZJ64CqIZiJtF4znsSscHS2P156mWbpMaK6jRERy9zYuIUn
   Q==;
X-CSE-ConnectionGUID: 8CvdCE1VTWCG5oqhVL9qQw==
X-CSE-MsgGUID: TaobU+H2Q/Kedz+fRgAjuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78882402"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78882402"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:12:48 -0700
X-CSE-ConnectionGUID: g8sjx0v6REu0r5c3/JTN9g==
X-CSE-MsgGUID: K0WfM0aWSQOOgFAJ9F+ABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237522070"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 01:12:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAtZ-000000004NP-12D2;
	Tue, 05 May 2026 08:12:45 +0000
Date: Tue, 05 May 2026 16:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:mailbox/fixes 1/2] drivers/mailbox/mailbox.c:330:6:
 warning: no previous prototype for function 'mbox_clean_and_put_channel'
Message-ID: <202605051610.X5jeu7xB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git mailbox/fixes
head:   21fdb395d5bbbb3afe33cd67ff134f8aa1e51d9c
commit: 81f886f4579645adb4b200e5289e826944d89dad [1/2] mailbox: don't free the channel if the startup callback failed
config: s390-randconfig-001-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051610.X5jeu7xB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051610.X5jeu7xB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051610.X5jeu7xB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:330:6: warning: no previous prototype for function 'mbox_clean_and_put_channel' [-Wmissing-prototypes]
     330 | void mbox_clean_and_put_channel(struct mbox_chan *chan)
         |      ^
   drivers/mailbox/mailbox.c:330:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     330 | void mbox_clean_and_put_channel(struct mbox_chan *chan)
         | ^
         | static 
   1 warning generated.


vim +/mbox_clean_and_put_channel +330 drivers/mailbox/mailbox.c

   329	
 > 330	void mbox_clean_and_put_channel(struct mbox_chan *chan)
   331	{
   332		/* The queued TX requests are simply aborted, no callbacks are made */
   333		scoped_guard(spinlock_irqsave, &chan->lock) {
   334			chan->cl = NULL;
   335			chan->active_req = MBOX_NO_MSG;
   336			if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
   337				chan->txdone_method = MBOX_TXDONE_BY_POLL;
   338		}
   339	
   340		module_put(chan->mbox->dev->driver->owner);
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
