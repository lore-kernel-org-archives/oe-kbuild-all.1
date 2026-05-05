Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DAF8460
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777969491; cv=none; b=UpaCqkOJDGOytdZZoeUScsNLjUzkMvHFvrje9bdS8YMGuKHDoOyF9SxdnwQ0rvtVYi4mZpFh8W+HfiOywaj1kvb8AFDgDIMosy5ZlO5GSCbgDoZ+sJUCTMYwmPAU40e+8ymL6RlXdYeIOjkJlYrxIDJOefFkHTZiw4wbhqnCRqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777969491; c=relaxed/simple;
	bh=5IQGkyhVXQWvPNTPn1FOsAlo8bdIuPCk11jpGjX6kXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DrNDuTL4qdz1IOij22xuo6WL0mxbBMZwpiyYZ7CFaE8MqaEEF3WHvqOig4049dAuk1bYxA5Bq2E+OfwuDVZAo1uvUXAB4W2ezhVMjxyaAjMH4oU6lgt/uszZ5eCQQuKMKpAmqylR9RMSFjVV9wacuYDh1B/dr67E4haVpp1UcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaB5jRWx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaB5jRWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969490; x=1809505490;
  h=date:from:to:cc:subject:message-id;
  bh=5IQGkyhVXQWvPNTPn1FOsAlo8bdIuPCk11jpGjX6kXc=;
  b=DaB5jRWx8IDdZtzoPWdUW50q7VulJ/eDQZnV8DfiH0vdvGUwYrXYEC5Z
   PYWd+HMQzlN1Op0wfB/S3ta8im8qaljfl0vEDbuRole0nkEZbUEDX5PTz
   K++7N98Ns/7/3dFw4exelv5VWigjxkNZYPc6fAiyAn0Nnh56DFOSXmy6K
   eJbzHYA5pA/viIKt+HqXZaJ8N9Pr7hBAFNr77nu3FwVdY4Q8PQ2ySkqOo
   dAwsYayTgzjp4dV/3SrfLiPs1E5fHZ3Yt7z+WN1n8TcR+7MIdivyWVPX+
   m8T98KK9NmVBkD9+rV9PPLLNp+BJzdxGgVT4f8raE6jidnn9deiqewUOs
   Q==;
X-CSE-ConnectionGUID: fZgkt1p6RNKSYH1f5n+HJg==
X-CSE-MsgGUID: /i5gAgLST1+ELJx+kzPTYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78738958"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78738958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:24:50 -0700
X-CSE-ConnectionGUID: DF8fsbDZTw2FhfPcmAhxSA==
X-CSE-MsgGUID: v5fN/s9bSAOx0kWDIKJyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="240742501"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2026 01:24:48 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKB5B-000000004Np-2Rua;
	Tue, 05 May 2026 08:24:45 +0000
Date: Tue, 05 May 2026 16:23:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:mailbox/fixes 1/2] drivers/mailbox/mailbox.c:330:6:
 sparse: sparse: symbol 'mbox_clean_and_put_channel' was not declared. Should
 it be static?
Message-ID: <202605051621.Zji6DuZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git mailbox/fixes
head:   21fdb395d5bbbb3afe33cd67ff134f8aa1e51d9c
commit: 81f886f4579645adb4b200e5289e826944d89dad [1/2] mailbox: don't free the channel if the startup callback failed
config: sparc-randconfig-r131-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051621.Zji6DuZP-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051621.Zji6DuZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051621.Zji6DuZP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/mailbox.c:330:6: sparse: sparse: symbol 'mbox_clean_and_put_channel' was not declared. Should it be static?

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
