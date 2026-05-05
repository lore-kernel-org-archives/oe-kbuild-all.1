Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9313EF0C4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969199; cv=none; b=eINLJiY/PtFL8JPPktqqneJG344xpcNn3+rMtDRYfZOYKOZd0ZM3CW8FGAg+BhPOwUAz4RmOwT+Nxrfj0KR+pcdk9OvZs9WuLbf1NQqJeULi2KMxJAGDXA4XAE2ANIKojKkzjA+YTNWhu59W4dDHmZ8q6PaFXjfs9Qvix5sRDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969199; c=relaxed/simple;
	bh=ll8iWc1TkqsgrRQV/fyrG4Ph6+OKRTrIi3p8XeRzXHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rg4SSMUn9BFTk+Iy2pNFPgQHosdq9c0INliSl+TefNLXz9qijarAjxnztYfjskI6LHkcu9ufn87VVt7xlAhHftnfpMTTNYkV8wktr+ELveNWEM/o9WrS5sYGLkFZ07RSGSxfYGuRZVCiCgei06FgF9UZ/cNxIAUncgDaU/+Kk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lgtt6vOc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lgtt6vOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969198; x=1809505198;
  h=date:from:to:cc:subject:message-id;
  bh=ll8iWc1TkqsgrRQV/fyrG4Ph6+OKRTrIi3p8XeRzXHI=;
  b=Lgtt6vOcmqaJjkH3+qEzT+CAV4pJ92zvm7jbMXT8tpkL7QzCaPVFgOE3
   jg+tkZzk4Urq6ZnSAvT2zntuN1Dps3dVwrtghdH1V9Mig3ttUmeyz/JYZ
   EDL+iHXOmNdnq2ruTw0RjY7BluOpvZd/0e6/k4OVWrv47kLuXhw28Bf3Y
   UquYWcVHb6okSCoHpPajD4awtAP3N3HCgovK1qKwgp/tNzQb0eiSnz7Cz
   pc0epS1AJGb4Q/fKO02pIW6kbpCCgmIJsIxZMYh3nzGkCpPKHRiA4vEuX
   iF35dHNm4ngUqp0XSQikS3dDtAv3qKeftL23FVX0vIoCpSwTo+TCLnGUz
   A==;
X-CSE-ConnectionGUID: q/ApS0VySM68FbXLS7i4dQ==
X-CSE-MsgGUID: aMMI4De8R/WjQL/tIskUkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89936909"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="89936909"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:19:57 -0700
X-CSE-ConnectionGUID: VOwaiFubRoOMfAzzQHtJgQ==
X-CSE-MsgGUID: BAa7ZHu3QkuzmmLTMSOpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="231171845"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2026 01:19:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKB0U-000000006C1-1gzn;
	Tue, 05 May 2026 08:19:54 +0000
Date: Tue, 05 May 2026 10:19:43 +0200
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:mailbox/fixes 1/2] drivers/mailbox/mailbox.c:330:6:
 warning: no previous prototype for function 'mbox_clean_and_put_channel'
Message-ID: <202605051003.poUyiMLO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git mailbox/fixes
head:   21fdb395d5bbbb3afe33cd67ff134f8aa1e51d9c
commit: 81f886f4579645adb4b200e5289e826944d89dad [1/2] mailbox: don't free the channel if the startup callback failed
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260505/202605051003.poUyiMLO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051003.poUyiMLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051003.poUyiMLO-lkp@intel.com/

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
