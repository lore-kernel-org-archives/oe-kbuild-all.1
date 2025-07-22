Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6A4C92
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 23:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753226639; cv=none; b=I8Bi+OynMExlWWHK3PMmBip98O58EiUrdrk3oqaM3LKXs3eIIRsWLbWBhmD0iBiKVHqAqHF+POnNwlfJ4YePuwOKV8EeKg2rcyZ09YeWvbJkikt02KpweEbYtZVBx1oWYGuuroeeFGpOoeT2ldoJlIFHh9d1wGdzkA5JDKW7Ups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753226639; c=relaxed/simple;
	bh=Z632afWRggBwEtgKAB372+XfMfIBX/ypIA6DLaMT0gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJ6CFnGMPYgbF9HrhJxxVjY/UMfe4ph2K86nF1PWL6BvPnlaBW/v6R2JXdBlzjtzryMOZpB71Dgw0r8SkeqGGh4iNDzRhrqihsCdhb8QZ84XSBJMdC2BoINvR3f3e1Xi+c6KeqyTu7jfxoGzsY1gqKvKD6xgticdcZ+0aNwD594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzWprA4t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzWprA4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753226638; x=1784762638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z632afWRggBwEtgKAB372+XfMfIBX/ypIA6DLaMT0gM=;
  b=kzWprA4tURL5F9BmGvDp9QyeAVh79Igo3GAWzoVYyIMr51vNgJSjSfI3
   kw85FSQ0+4Rs6JK1ddi0JL/BCFboU10gTqgQ1By4cbdUkNb07dzMjHRjQ
   FmTGYkhXHqgaw/nQPBWi38ELsKrMG5vpmZdWrZT/5xTO/6rj8wQJaKK2z
   /E/XIjl9P73ETx1JA1yCnCQOkr+O6wEEXgD34r0yYjLUIQvA8dAwOGCxr
   wGm1MfvyBBoCsBBgctHUHeBxoW6+kH+qwRta5GTGq0z5HGJF8UFE/xiTC
   IehwnE+PXBEsd/8XbLJanaeyBOYGIQNCzDIyhkih7pa6fsSAFkpy1Bt+u
   w==;
X-CSE-ConnectionGUID: N3CBctxmQMSf81zg2RLOVw==
X-CSE-MsgGUID: 8loIiEdFSTyPoOv83O3sOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55590306"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="55590306"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 16:23:57 -0700
X-CSE-ConnectionGUID: 7Nw77CWiQz6SYy1iKEEARg==
X-CSE-MsgGUID: SptiOBGGQOKRpT04sgB8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="158575351"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Jul 2025 16:23:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueMKv-000Imp-0S;
	Tue, 22 Jul 2025 23:23:53 +0000
Date: Wed, 23 Jul 2025 07:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/9] drivers/mailbox/pcc.c:292:11:
 warning: variable 'dev' is uninitialized when used here
Message-ID: <202507230723.m7sr9nlN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7fc3abd8b21f1ef01108269b858d36abd6b95372
commit: c61693c8e176dca43fd83ef800ae3fb8d04c2aa1 [0/9] mailbox: pcc: Move bulk of PCCT parsing into pcc_mbox_probe
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507230723.m7sr9nlN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230723.m7sr9nlN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230723.m7sr9nlN-lkp@intel.com/

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
