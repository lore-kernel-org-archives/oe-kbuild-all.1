Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1474CB5B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Apr 2026 04:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777350716; cv=none; b=OnHFG9fud0sjOXyYKGVh47Ttr5oOF6unLThXWjF2wgj6Ub/l+MKoLZAV2UTxv9410J5hPYhxkn2mocJZQVTfUgOI9QxM4LrFKfFopWvxiDt1IB7VgRkpKuGl8SioGVH9XKZ8YYwAb8ntZPqBvTnYRovv3ZGkYkYy2brHSHJxw5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777350716; c=relaxed/simple;
	bh=+RwpQk3JAmXtMPsV30RWbCgR0SXYgLF9ebJNd6Oqocg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GgPyrmrX2o3ywnXJouEy1Ex93wt80EZXuxWxvQQwVCfyTLv8Rqvq5NugjgNlDXdtvMlYK/xHN1r5ROBDo2ftbtMWjEEFFDcLAcatpMaS1R634Oh6NpfsLkRFFd3TCaqznJ5/vFMbwswVvb1MBMkIBrvZyFRfbMFETlXkfIzXO2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ul1rFHjy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ul1rFHjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777350715; x=1808886715;
  h=date:from:to:cc:subject:message-id;
  bh=+RwpQk3JAmXtMPsV30RWbCgR0SXYgLF9ebJNd6Oqocg=;
  b=Ul1rFHjyXwOspUWJKM4UF8yx6yKpaU5XM7z125qJ+c4/YIBaxKvhy3Qm
   lOWgdxo/EElW388clWe5cjbq5Om+iJWvHm0NR3KsZ342AgbdVLLxTBWSL
   dZOdNfylJFePUyXUKlw3N41k7gkvmzKe+F6OG/AAUjKfwNnbewG1MBN4c
   FNn3JmKtFTt5CfVXBc97ytN1L8JSgM/SK4gzOdZ3iqK/sbmllSktWx19q
   4FPtxVL6E8GiS8CSnoUTypUUyfQnUBaG0qE5AoykygF+r80DMd3yY4iuT
   DUTfi9RENBQJrDcJI3mNyx4Zz1TkhJ0HFeZB/m2Grsd+bUKKS1r0xIvsM
   Q==;
X-CSE-ConnectionGUID: YdK76q/yT/eFs9jNpdai9A==
X-CSE-MsgGUID: J3PQ4+UqRGi8lhxa8lBF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77952764"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="77952764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 21:31:54 -0700
X-CSE-ConnectionGUID: QyRCRK36QRmLhRjeyJhVWw==
X-CSE-MsgGUID: 3VQJPQ7NRz6qFF2mwqj2UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; 
   d="scan'208";a="238817626"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Apr 2026 21:31:52 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHa6w-000000004Bd-2BwP;
	Tue, 28 Apr 2026 04:31:50 +0000
Date: Tue, 28 Apr 2026 06:31:30 +0200
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:mailbox/fixes 1/2] drivers/mailbox/mailbox.c:355:4:
 error: call to undeclared function 'mbox_clean_and_put_channel'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202604280643.h6cr5MQG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git mailbox/fixes
head:   9711b09d49880b99f0c62d16d7e2ad683bd44091
commit: eae8fe5cb969e57e5e13f84845bb248c6f0eb497 [1/2] mailbox: don't free the channel if the startup callback failed
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260428/202604280643.h6cr5MQG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604280643.h6cr5MQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604280643.h6cr5MQG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:355:4: error: call to undeclared function 'mbox_clean_and_put_channel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     355 |                         mbox_clean_and_put_channel(chan);
         |                         ^
>> drivers/mailbox/mailbox.c:484:6: error: conflicting types for 'mbox_clean_and_put_channel'
     484 | void mbox_clean_and_put_channel(struct mbox_chan *chan)
         |      ^
   drivers/mailbox/mailbox.c:355:4: note: previous implicit declaration is here
     355 |                         mbox_clean_and_put_channel(chan);
         |                         ^
   2 errors generated.


vim +/mbox_clean_and_put_channel +355 drivers/mailbox/mailbox.c

   329	
   330	static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
   331	{
   332		struct device *dev = cl->dev;
   333		int ret;
   334	
   335		if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
   336			dev_err(dev, "%s: mailbox not free\n", __func__);
   337			return -EBUSY;
   338		}
   339	
   340		scoped_guard(spinlock_irqsave, &chan->lock) {
   341			chan->msg_free = 0;
   342			chan->msg_count = 0;
   343			chan->active_req = MBOX_NO_MSG;
   344			chan->cl = cl;
   345			init_completion(&chan->tx_complete);
   346	
   347			if (chan->txdone_method	== MBOX_TXDONE_BY_POLL && cl->knows_txdone)
   348				chan->txdone_method = MBOX_TXDONE_BY_ACK;
   349		}
   350	
   351		if (chan->mbox->ops->startup) {
   352			ret = chan->mbox->ops->startup(chan);
   353			if (ret) {
   354				dev_err(dev, "Unable to startup the chan (%d)\n", ret);
 > 355				mbox_clean_and_put_channel(chan);
   356				return ret;
   357			}
   358		}
   359	
   360		return 0;
   361	}
   362	
   363	/**
   364	 * mbox_bind_client - Bind client to a mailbox channel.
   365	 * @chan: The mailbox channel to bind the client to.
   366	 * @cl: Identity of the client requesting the channel.
   367	 *
   368	 * The Client specifies its requirements and capabilities while asking for
   369	 * a mailbox channel. It can't be called from atomic context.
   370	 * The channel is exclusively allocated and can't be used by another
   371	 * client before the owner calls mbox_free_channel.
   372	 * After assignment, any packet received on this channel will be
   373	 * handed over to the client via the 'rx_callback'.
   374	 * The framework holds reference to the client, so the mbox_client
   375	 * structure shouldn't be modified until the mbox_free_channel returns.
   376	 *
   377	 * Return: 0 if the channel was assigned to the client successfully.
   378	 *         <0 for request failure.
   379	 */
   380	int mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
   381	{
   382		guard(mutex)(&con_mutex);
   383	
   384		return __mbox_bind_client(chan, cl);
   385	}
   386	EXPORT_SYMBOL_GPL(mbox_bind_client);
   387	
   388	/**
   389	 * mbox_request_channel - Request a mailbox channel.
   390	 * @cl: Identity of the client requesting the channel.
   391	 * @index: Index of mailbox specifier in 'mboxes' property.
   392	 *
   393	 * The Client specifies its requirements and capabilities while asking for
   394	 * a mailbox channel. It can't be called from atomic context.
   395	 * The channel is exclusively allocated and can't be used by another
   396	 * client before the owner calls mbox_free_channel.
   397	 * After assignment, any packet received on this channel will be
   398	 * handed over to the client via the 'rx_callback'.
   399	 * The framework holds reference to the client, so the mbox_client
   400	 * structure shouldn't be modified until the mbox_free_channel returns.
   401	 *
   402	 * Return: Pointer to the channel assigned to the client if successful.
   403	 *		ERR_PTR for request failure.
   404	 */
   405	struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
   406	{
   407		struct fwnode_reference_args fwspec;
   408		struct fwnode_handle *fwnode;
   409		struct mbox_controller *mbox;
   410		struct of_phandle_args spec;
   411		struct mbox_chan *chan;
   412		struct device *dev;
   413		unsigned int i;
   414		int ret;
   415	
   416		dev = cl->dev;
   417		if (!dev) {
   418			pr_debug("No owner device\n");
   419			return ERR_PTR(-ENODEV);
   420		}
   421	
   422		fwnode = dev_fwnode(dev);
   423		if (!fwnode) {
   424			dev_dbg(dev, "No owner fwnode\n");
   425			return ERR_PTR(-ENODEV);
   426		}
   427	
   428		ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
   429							 0, index, &fwspec);
   430		if (ret) {
   431			dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
   432			return ERR_PTR(ret);
   433		}
   434	
   435		spec.np = to_of_node(fwspec.fwnode);
   436		spec.args_count = fwspec.nargs;
   437		for (i = 0; i < spec.args_count; i++)
   438			spec.args[i] = fwspec.args[i];
   439	
   440		scoped_guard(mutex, &con_mutex) {
   441			chan = ERR_PTR(-EPROBE_DEFER);
   442			list_for_each_entry(mbox, &mbox_cons, node) {
   443				if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
   444					if (mbox->fw_xlate) {
   445						chan = mbox->fw_xlate(mbox, &fwspec);
   446						if (!IS_ERR(chan))
   447							break;
   448					} else if (mbox->of_xlate) {
   449						chan = mbox->of_xlate(mbox, &spec);
   450						if (!IS_ERR(chan))
   451							break;
   452					}
   453				}
   454			}
   455	
   456			fwnode_handle_put(fwspec.fwnode);
   457	
   458			if (IS_ERR(chan))
   459				return chan;
   460	
   461			ret = __mbox_bind_client(chan, cl);
   462			if (ret)
   463				chan = ERR_PTR(ret);
   464		}
   465	
   466		return chan;
   467	}
   468	EXPORT_SYMBOL_GPL(mbox_request_channel);
   469	
   470	struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
   471						      const char *name)
   472	{
   473		int index = device_property_match_string(cl->dev, "mbox-names", name);
   474	
   475		if (index < 0) {
   476			dev_err(cl->dev, "%s() could not locate channel named \"%s\"\n",
   477				__func__, name);
   478			return ERR_PTR(index);
   479		}
   480		return mbox_request_channel(cl, index);
   481	}
   482	EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
   483	
 > 484	void mbox_clean_and_put_channel(struct mbox_chan *chan)
   485	{
   486		/* The queued TX requests are simply aborted, no callbacks are made */
   487		scoped_guard(spinlock_irqsave, &chan->lock) {
   488			chan->cl = NULL;
   489			chan->active_req = MBOX_NO_MSG;
   490			if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
   491				chan->txdone_method = MBOX_TXDONE_BY_POLL;
   492		}
   493	
   494		module_put(chan->mbox->dev->driver->owner);
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
