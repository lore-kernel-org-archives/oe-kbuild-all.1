Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0323753
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/+xI4Kt"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696454408; x=1727990408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KX2bHrJWPFoJkGP8/RmeXr5x3V/UWGg2el2X+PVVw50=;
  b=d/+xI4KtwUk36S3+BaUIkEgaknFyRVpHK+HKT74uAhejjAWwHS9Jd74q
   w1O2lpUhmkMGC3DdtLV/sipAIDjscXBwhrsu6kxv5iLlr0Ibfkywb7Ba1
   /sAhzoGMQhchZY09nHConfeEkjHj09GK1Kb7SvalTZhshGGmyKGbgU6c7
   HJL+HxGt9ldNmq2JuB4M+nKuy+hoaix8x4MNZqvuWpDWarqbmpRPZ7Rsf
   Wz0L44ekeOnVjo2IB2xSzsWcQ1gD87+a/yGg3ANPqH6iWV3mkXJlSAdd5
   ucZr4OOKxwIELC4GvVjfjm/tQFj2BbMtJr97VYOidHkmTFGFmj68TqTdD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386133747"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="386133747"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 14:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821848339"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="821848339"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2023 14:20:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo9Hk-000Kcm-1v;
	Wed, 04 Oct 2023 21:20:00 +0000
Date: Thu, 5 Oct 2023 05:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: [rt-devel:linux-6.6.y-rt-rebase 125/171] kernel/printk/nbcon.c:887:
 warning: Function parameter or member 'in_kthread' not described in
 'nbcon_emit_next_record'
Message-ID: <202310050536.rpuODK1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt-rebase
head:   5280195b37c522a21e069a0f0623bb26edc52a77
commit: ccd5ba7dfb4a7dff9abb8c5c87ea3daf783d46b9 [125/171] printk: nbcon: Introduce printer threads
config: powerpc64-randconfig-003-20231005 (https://download.01.org/0day-ci/archive/20231005/202310050536.rpuODK1m-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050536.rpuODK1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050536.rpuODK1m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/nbcon.c:887: warning: Function parameter or member 'in_kthread' not described in 'nbcon_emit_next_record'


vim +887 kernel/printk/nbcon.c

1b1b37e586bc29 Thomas Gleixner 2023-09-16  869  
58c773474719d2 Thomas Gleixner 2023-09-16  870  /**
58c773474719d2 Thomas Gleixner 2023-09-16  871   * nbcon_emit_next_record - Emit a record in the acquired context
58c773474719d2 Thomas Gleixner 2023-09-16  872   * @wctxt:	The write context that will be handed to the write function
58c773474719d2 Thomas Gleixner 2023-09-16  873   *
58c773474719d2 Thomas Gleixner 2023-09-16  874   * Return:	True if this context still owns the console. False if
58c773474719d2 Thomas Gleixner 2023-09-16  875   *		ownership was handed over or taken.
58c773474719d2 Thomas Gleixner 2023-09-16  876   *
58c773474719d2 Thomas Gleixner 2023-09-16  877   * When this function returns false then the calling context no longer owns
58c773474719d2 Thomas Gleixner 2023-09-16  878   * the console and is no longer allowed to go forward. In this case it must
58c773474719d2 Thomas Gleixner 2023-09-16  879   * back out immediately and carefully. The buffer content is also no longer
58c773474719d2 Thomas Gleixner 2023-09-16  880   * trusted since it no longer belongs to the calling context. If the caller
58c773474719d2 Thomas Gleixner 2023-09-16  881   * wants to do more it must reacquire the console first.
58c773474719d2 Thomas Gleixner 2023-09-16  882   *
58c773474719d2 Thomas Gleixner 2023-09-16  883   * When true is returned, @wctxt->ctxt.backlog indicates whether there are
58c773474719d2 Thomas Gleixner 2023-09-16  884   * still records pending in the ringbuffer,
58c773474719d2 Thomas Gleixner 2023-09-16  885   */
ccd5ba7dfb4a7d Thomas Gleixner 2023-09-22  886  static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool in_kthread)
58c773474719d2 Thomas Gleixner 2023-09-16 @887  {
58c773474719d2 Thomas Gleixner 2023-09-16  888  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
58c773474719d2 Thomas Gleixner 2023-09-16  889  	struct console *con = ctxt->console;
58c773474719d2 Thomas Gleixner 2023-09-16  890  	bool is_extended = console_srcu_read_flags(con) & CON_EXTENDED;
58c773474719d2 Thomas Gleixner 2023-09-16  891  	struct printk_message pmsg = {
58c773474719d2 Thomas Gleixner 2023-09-16  892  		.pbufs = ctxt->pbufs,
58c773474719d2 Thomas Gleixner 2023-09-16  893  	};
58c773474719d2 Thomas Gleixner 2023-09-16  894  	unsigned long con_dropped;
58c773474719d2 Thomas Gleixner 2023-09-16  895  	struct nbcon_state cur;
58c773474719d2 Thomas Gleixner 2023-09-16  896  	unsigned long dropped;
58c773474719d2 Thomas Gleixner 2023-09-16  897  	bool done;
58c773474719d2 Thomas Gleixner 2023-09-16  898  
58c773474719d2 Thomas Gleixner 2023-09-16  899  	/*
58c773474719d2 Thomas Gleixner 2023-09-16  900  	 * The printk buffers are filled within an unsafe section. This
58c773474719d2 Thomas Gleixner 2023-09-16  901  	 * prevents NBCON_PRIO_NORMAL and NBCON_PRIO_EMERGENCY from
58c773474719d2 Thomas Gleixner 2023-09-16  902  	 * clobbering each other.
58c773474719d2 Thomas Gleixner 2023-09-16  903  	 */
58c773474719d2 Thomas Gleixner 2023-09-16  904  
58c773474719d2 Thomas Gleixner 2023-09-16  905  	if (!nbcon_context_enter_unsafe(ctxt))
58c773474719d2 Thomas Gleixner 2023-09-16  906  		return false;
58c773474719d2 Thomas Gleixner 2023-09-16  907  
58c773474719d2 Thomas Gleixner 2023-09-16  908  	ctxt->backlog = printk_get_next_message(&pmsg, ctxt->seq, is_extended, true);
58c773474719d2 Thomas Gleixner 2023-09-16  909  	if (!ctxt->backlog)
58c773474719d2 Thomas Gleixner 2023-09-16  910  		return nbcon_context_exit_unsafe(ctxt);
58c773474719d2 Thomas Gleixner 2023-09-16  911  
58c773474719d2 Thomas Gleixner 2023-09-16  912  	/*
58c773474719d2 Thomas Gleixner 2023-09-16  913  	 * @con->dropped is not protected in case of an unsafe hostile
58c773474719d2 Thomas Gleixner 2023-09-16  914  	 * takeover. In that situation the update can be racy so
58c773474719d2 Thomas Gleixner 2023-09-16  915  	 * annotate it accordingly.
58c773474719d2 Thomas Gleixner 2023-09-16  916  	 */
58c773474719d2 Thomas Gleixner 2023-09-16  917  	con_dropped = data_race(READ_ONCE(con->dropped));
58c773474719d2 Thomas Gleixner 2023-09-16  918  
58c773474719d2 Thomas Gleixner 2023-09-16  919  	dropped = con_dropped + pmsg.dropped;
58c773474719d2 Thomas Gleixner 2023-09-16  920  	if (dropped && !is_extended)
58c773474719d2 Thomas Gleixner 2023-09-16  921  		console_prepend_dropped(&pmsg, dropped);
58c773474719d2 Thomas Gleixner 2023-09-16  922  
58c773474719d2 Thomas Gleixner 2023-09-16  923  	if (!nbcon_context_exit_unsafe(ctxt))
58c773474719d2 Thomas Gleixner 2023-09-16  924  		return false;
58c773474719d2 Thomas Gleixner 2023-09-16  925  
58c773474719d2 Thomas Gleixner 2023-09-16  926  	/* For skipped records just update seq/dropped in @con. */
58c773474719d2 Thomas Gleixner 2023-09-16  927  	if (pmsg.outbuf_len == 0)
58c773474719d2 Thomas Gleixner 2023-09-16  928  		goto update_con;
58c773474719d2 Thomas Gleixner 2023-09-16  929  
58c773474719d2 Thomas Gleixner 2023-09-16  930  	/* Initialize the write context for driver callbacks. */
58c773474719d2 Thomas Gleixner 2023-09-16  931  	wctxt->outbuf = &pmsg.pbufs->outbuf[0];
58c773474719d2 Thomas Gleixner 2023-09-16  932  	wctxt->len = pmsg.outbuf_len;
58c773474719d2 Thomas Gleixner 2023-09-16  933  	nbcon_state_read(con, &cur);
58c773474719d2 Thomas Gleixner 2023-09-16  934  	wctxt->unsafe_takeover = cur.unsafe_takeover;
58c773474719d2 Thomas Gleixner 2023-09-16  935  
ccd5ba7dfb4a7d Thomas Gleixner 2023-09-22  936  	if (!in_kthread && con->write_atomic) {
58c773474719d2 Thomas Gleixner 2023-09-16  937  		done = con->write_atomic(con, wctxt);
ccd5ba7dfb4a7d Thomas Gleixner 2023-09-22  938  	} else if (in_kthread && con->write_thread && con->kthread) {
ccd5ba7dfb4a7d Thomas Gleixner 2023-09-22  939  		done = con->write_thread(con, wctxt);
58c773474719d2 Thomas Gleixner 2023-09-16  940  	} else {
58c773474719d2 Thomas Gleixner 2023-09-16  941  		nbcon_context_release(ctxt);
58c773474719d2 Thomas Gleixner 2023-09-16  942  		WARN_ON_ONCE(1);
58c773474719d2 Thomas Gleixner 2023-09-16  943  		done = false;
58c773474719d2 Thomas Gleixner 2023-09-16  944  	}
58c773474719d2 Thomas Gleixner 2023-09-16  945  
58c773474719d2 Thomas Gleixner 2023-09-16  946  	/* If not done, the emit was aborted. */
58c773474719d2 Thomas Gleixner 2023-09-16  947  	if (!done)
58c773474719d2 Thomas Gleixner 2023-09-16  948  		return false;
58c773474719d2 Thomas Gleixner 2023-09-16  949  
58c773474719d2 Thomas Gleixner 2023-09-16  950  	/*
58c773474719d2 Thomas Gleixner 2023-09-16  951  	 * Since any dropped message was successfully output, reset the
58c773474719d2 Thomas Gleixner 2023-09-16  952  	 * dropped count for the console.
58c773474719d2 Thomas Gleixner 2023-09-16  953  	 */
58c773474719d2 Thomas Gleixner 2023-09-16  954  	dropped = 0;
58c773474719d2 Thomas Gleixner 2023-09-16  955  update_con:
58c773474719d2 Thomas Gleixner 2023-09-16  956  	/*
58c773474719d2 Thomas Gleixner 2023-09-16  957  	 * The dropped count and the sequence number are updated within an
58c773474719d2 Thomas Gleixner 2023-09-16  958  	 * unsafe section. This limits update races to the panic context and
58c773474719d2 Thomas Gleixner 2023-09-16  959  	 * allows the panic context to win.
58c773474719d2 Thomas Gleixner 2023-09-16  960  	 */
58c773474719d2 Thomas Gleixner 2023-09-16  961  
58c773474719d2 Thomas Gleixner 2023-09-16  962  	if (!nbcon_context_enter_unsafe(ctxt))
58c773474719d2 Thomas Gleixner 2023-09-16  963  		return false;
58c773474719d2 Thomas Gleixner 2023-09-16  964  
58c773474719d2 Thomas Gleixner 2023-09-16  965  	if (dropped != con_dropped) {
58c773474719d2 Thomas Gleixner 2023-09-16  966  		/* Counterpart to the READ_ONCE() above. */
58c773474719d2 Thomas Gleixner 2023-09-16  967  		WRITE_ONCE(con->dropped, dropped);
58c773474719d2 Thomas Gleixner 2023-09-16  968  	}
58c773474719d2 Thomas Gleixner 2023-09-16  969  
58c773474719d2 Thomas Gleixner 2023-09-16  970  	nbcon_seq_try_update(ctxt, pmsg.seq + 1);
58c773474719d2 Thomas Gleixner 2023-09-16  971  
58c773474719d2 Thomas Gleixner 2023-09-16  972  	return nbcon_context_exit_unsafe(ctxt);
58c773474719d2 Thomas Gleixner 2023-09-16  973  }
58c773474719d2 Thomas Gleixner 2023-09-16  974  

:::::: The code at line 887 was first introduced by commit
:::::: 58c773474719d2bf20be6ee277340ab748541b41 printk: nbcon: Add emit function and callback function for atomic printing

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
