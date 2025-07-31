Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B91225784
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753982098; cv=none; b=Rhm2Ox0WwuhxueRCM5Jzkgp9WsGckoIB/EDty5ansvxA1Rm7ipc/wodHYVV6scrVnBTM2sSJ7BpHiHNN8akXSLcfzA+g/yEd3U15bOxY/PuN7Z2zu09ZsiIoiOakyBy2JypLOMNezd/p8ayuBWEDTGmRt8mqA+DXfIal9Wdr6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753982098; c=relaxed/simple;
	bh=a6x6+uLEPhojwhSdVUwMTqeFuUSHlI2GWeVQBN6Pc4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5Fs0iQfCha0q6150HRhZ7NBlbA1cYinA5kkoESz4hJQ45ovZEd7mccCly9TZpVXrXAFBi+bBHZdJhdTkmFdVyPPML0RrqSCuD9aO4i3S+Ew9ezAcJch1EzK4BYbmfVYOKlydLkhzGCnM1H9ifwalAftg5yrUbgZpX7xSxwZ7rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnzFSdN3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnzFSdN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753982097; x=1785518097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6x6+uLEPhojwhSdVUwMTqeFuUSHlI2GWeVQBN6Pc4o=;
  b=QnzFSdN3DH1j/e4dPWuyJBxBLTL9795Ko7BH1rcg+dhAx6fzcZmdXchm
   j9AUWj3+6+MkmcJTcQRSz3AsFKH24g20violrqSlUTclfCIymDb/8MWx6
   KqgSdRCje8EXv48Exh9gYV9U85ZZqDQg1wJJDsopAyq3W1vGXJL/4H2UW
   U6VEGPTYYIKVCZXoTc0i4bFqV6JvQcZO9s1nFoBfSknYycOCyxaEgkl6x
   5TVQwK5ABwS7vEIC1xqUbGA/fl/9UYqP49viUXJ+SRBXW00NqHFjq/4kD
   qIQ3zwiPkP7edO1oreZElpXIMx7hlcZq+84UUyKEpisyg9MEu798Msfxq
   A==;
X-CSE-ConnectionGUID: C0+/npRlQeqbn1xCKU02Eg==
X-CSE-MsgGUID: eKvc/j6mSpqqsE/wRzsLDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66883878"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="66883878"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 10:14:53 -0700
X-CSE-ConnectionGUID: /29tk+8KQdmuJMhwc1Zabg==
X-CSE-MsgGUID: OtAvhG7rT1Gv0g5Gwtnn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; 
   d="scan'208";a="163029276"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 10:14:46 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhWrb-00013P-0G;
	Thu, 31 Jul 2025 17:14:43 +0000
Date: Thu, 31 Jul 2025 19:14:24 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1]
 drivers/mailbox/pcc.c:292:11: warning: variable 'dev' is uninitialized when
 used here
Message-ID: <202507311905.ygrtQjmk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: c61693c8e176dca43fd83ef800ae3fb8d04c2aa1 [0/1] mailbox: pcc: Move bulk of PCCT parsing into pcc_mbox_probe
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250731/202507311905.ygrtQjmk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6540c93aa991dbc2b09cc5395493dadd7181551e)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311905.ygrtQjmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311905.ygrtQjmk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/pcc.c:292:11: warning: variable 'dev' is uninitialized when used here [-Wuninitialized]
     292 |                 dev_err(dev, "Channel not found for idx: %d\n", subspace_id);
         |                         ^~~
   drivers/mailbox/pcc.c:283:20: note: initialize the variable 'dev' to silence this warning
     283 |         struct device *dev;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/dev +292 drivers/mailbox/pcc.c

aca314efb17727 hotran          2016-08-15  265  
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  266  /**
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  267   * pcc_mbox_request_channel - PCC clients call this function to
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  268   *		request a pointer to their PCC subspace, from which they
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  269   *		can get the details of communicating with the remote.
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  270   * @cl: Pointer to Mailbox client, so we know where to bind the
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  271   *		Channel.
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  272   * @subspace_id: The PCC Subspace index as parsed in the PCC client
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  273   *		ACPI package. This is used to lookup the array of PCC
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  274   *		subspaces as parsed by the PCC Mailbox controller.
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  275   *
787e3cef64bb64 Sudeep Holla    2021-09-17  276   * Return: Pointer to the PCC Mailbox Channel if successful or ERR_PTR.
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  277   */
787e3cef64bb64 Sudeep Holla    2021-09-17  278  struct pcc_mbox_chan *
787e3cef64bb64 Sudeep Holla    2021-09-17  279  pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  280  {
9df0d3791f85b0 Sudeep Holla    2021-09-17  281  	struct pcc_chan_info *pchan;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  282  	struct mbox_chan *chan;
c61693c8e176dc Sudeep Holla    2021-09-17  283  	struct device *dev;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  284  	unsigned long flags;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  285  
c61693c8e176dc Sudeep Holla    2021-09-17  286  	if (subspace_id < 0 || subspace_id >= pcc_chan_count)
787e3cef64bb64 Sudeep Holla    2021-09-17  287  		return ERR_PTR(-ENOENT);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  288  
787e3cef64bb64 Sudeep Holla    2021-09-17  289  	pchan = chan_info + subspace_id;
787e3cef64bb64 Sudeep Holla    2021-09-17  290  	chan = pchan->chan.mchan;
d311a28a585385 Sudip Mukherjee 2015-09-16  291  	if (IS_ERR(chan) || chan->cl) {
33350e6b1833b1 Ashwin Chaugule 2015-01-27 @292  		dev_err(dev, "Channel not found for idx: %d\n", subspace_id);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  293  		return ERR_PTR(-EBUSY);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  294  	}
c61693c8e176dc Sudeep Holla    2021-09-17  295  	dev = chan->mbox->dev;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  296  
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  297  	spin_lock_irqsave(&chan->lock, flags);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  298  	chan->msg_free = 0;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  299  	chan->msg_count = 0;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  300  	chan->active_req = NULL;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  301  	chan->cl = cl;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  302  	init_completion(&chan->tx_complete);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  303  
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  304  	if (chan->txdone_method == TXDONE_BY_POLL && cl->knows_txdone)
33cd7123ac0ba5 Sudeep Holla    2017-09-28  305  		chan->txdone_method = TXDONE_BY_ACK;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  306  
6ca595a70bc46e Hoan Tran       2016-11-14  307  	spin_unlock_irqrestore(&chan->lock, flags);
6ca595a70bc46e Hoan Tran       2016-11-14  308  
3edd64fa353452 Sudeep Holla    2021-09-17  309  	if (pchan->plat_irq > 0) {
aca314efb17727 hotran          2016-08-15  310  		int rc;
aca314efb17727 hotran          2016-08-15  311  
3edd64fa353452 Sudeep Holla    2021-09-17  312  		rc = devm_request_irq(dev, pchan->plat_irq, pcc_mbox_irq, 0,
9df0d3791f85b0 Sudeep Holla    2021-09-17  313  				      MBOX_IRQ_NAME, chan);
aca314efb17727 hotran          2016-08-15  314  		if (unlikely(rc)) {
aca314efb17727 hotran          2016-08-15  315  			dev_err(dev, "failed to register PCC interrupt %d\n",
3edd64fa353452 Sudeep Holla    2021-09-17  316  				pchan->plat_irq);
787e3cef64bb64 Sudeep Holla    2021-09-17  317  			pcc_mbox_free_channel(&pchan->chan);
787e3cef64bb64 Sudeep Holla    2021-09-17  318  			return ERR_PTR(rc);
aca314efb17727 hotran          2016-08-15  319  		}
aca314efb17727 hotran          2016-08-15  320  	}
aca314efb17727 hotran          2016-08-15  321  
787e3cef64bb64 Sudeep Holla    2021-09-17  322  	return &pchan->chan;
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  323  }
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  324  EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
86c22f8c9a3b71 Ashwin Chaugule 2014-11-12  325  

:::::: The code at line 292 was first introduced by commit
:::::: 33350e6b1833b15cf9c9c4c84d8534ad68b0c7b8 Mailbox: Restructure and simplify PCC mailbox code

:::::: TO: Ashwin Chaugule <ashwin.chaugule@linaro.org>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
