Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E9522E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 22:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717452949; cv=none; b=o+i8xlpWIbhy2skzJQbVfGBv7gI5nvCYP0JpmYzHvk3naLO449Ls4NnNnFmnc0G3EfNhb+ZfQrcmHCALuGnJep4EviV5iQ522Q0C74NLXWSWad4F2YQT4OVhQsxFBcuOkINYCTh8pVNA2BuElUjAMfJ7HxQcJfXL4BTVd3I50z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717452949; c=relaxed/simple;
	bh=YFHm8b6gvARHgsJqgFSxBMw4Shv6/d1T4nFSrKCDRYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcuUyThLmYsJXveDjFkiWnIWBY5DlSFWVUz1PmmVR0j/FBp98HFWgnTMhSA8GnR+YGB+J4ZeteBqXAGbz0g2rs2NJFJU+w9fN2BOYrvzIZLxa5Mr+9C6/HSMcX6kTV4y6ev+HdLSpf6AZ0mLPpugCGi7KzPGgbtS/L3P6u+3JH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wdg4U1mi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wdg4U1mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717452948; x=1748988948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YFHm8b6gvARHgsJqgFSxBMw4Shv6/d1T4nFSrKCDRYk=;
  b=Wdg4U1miia/Lm+fRyZe7h6UgV4Nz17ARv0nAolvCBcqQrDzXtJnMEHp+
   p7E9cSK2uHiOqp6bpMCioeLINPN6cKdqTnB/xoxoe4xNuGOpK5o4u6e7z
   FJeJb4YAGnLqC9fEsr1Y6fwh/47xi8Yg0twetVin8Oq9iuFyEq+RM2Kx+
   dGfdfACS/SRLr8MwO2E4MJTc3muTvgrWIaSIlSzOGED5V+nwJwCRC1lfS
   Rh67jhuexznlXJbFSr6S8KPrJ0vWIqM7Qql210SYLKIkTLQM5uFXuvhcN
   HNfK87grdHzqyDMEC74nrTELt0UU+De2F51scqi3GDX0UgaDLlD6hHL3A
   A==;
X-CSE-ConnectionGUID: sf58Kw36ReOS70lW3jkLbA==
X-CSE-MsgGUID: XJe4E7X7QeS4CM1Bi6KSaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24550692"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="24550692"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 15:15:47 -0700
X-CSE-ConnectionGUID: n/IL6jZ+QSqM6ZvBqHPD7Q==
X-CSE-MsgGUID: teMfo290TE+4N/oA3FeBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="67849492"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 15:15:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEFxj-000MFj-2E;
	Mon, 03 Jun 2024 22:15:34 +0000
Date: Tue, 4 Jun 2024 06:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rc 2302/2326]
 drivers/macintosh/via-macii.c:470:18: warning: comparison between signed and
 unsigned integer expressions
Message-ID: <202406040607.5o4L4DCg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rc
head:   ecbb82ce18d073400afead62c777e18a6b64ef28
commit: 68011e754b4a501fc94283a6676dae33e7c80bd7 [2302/2326] macintosh/via-macii: Remove BUG_ON assertions
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240604/202406040607.5o4L4DCg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040607.5o4L4DCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040607.5o4L4DCg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:18:0,
                    from include/linux/kernel.h:10,
                    from drivers/macintosh/via-macii.c:29:
   arch/m68k/include/asm/bitops.h: In function 'find_first_zero_bit':
   arch/m68k/include/asm/bitops.h:340:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return res < size ? res : size;
                ^
   arch/m68k/include/asm/bitops.h:340:26: warning: signed and unsigned type in conditional expression [-Wsign-compare]
     return res < size ? res : size;
                             ^
   arch/m68k/include/asm/bitops.h: In function 'find_first_bit':
   arch/m68k/include/asm/bitops.h:395:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return res < size ? res : size;
                ^
   arch/m68k/include/asm/bitops.h:395:26: warning: signed and unsigned type in conditional expression [-Wsign-compare]
     return res < size ? res : size;
                             ^
   In file included from include/linux/cpumask.h:11:0,
                    from include/linux/interrupt.h:9,
                    from drivers/macintosh/via-macii.c:32:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from drivers/macintosh/via-macii.c:36:0:
   arch/m68k/include/asm/mac_via.h: In function 'rbv_set_video_bpp':
   arch/m68k/include/asm/mac_via.h:272:25: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     if (!rbv_present || val<0) return -1;
                            ^
   drivers/macintosh/via-macii.c: In function 'macii_init_via':
   drivers/macintosh/via-macii.c:157:16: warning: variable 'x' set but not used [-Wunused-but-set-variable]
     unsigned char x;
                   ^
   drivers/macintosh/via-macii.c: In function 'macii_interrupt':
>> drivers/macintosh/via-macii.c:470:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
           reply_len < ARRAY_SIZE(reply_buf)) {
                     ^


vim +470 drivers/macintosh/via-macii.c

   338	
   339	/*
   340	 * The notorious ADB interrupt handler - does all of the protocol handling.
   341	 * Relies on the ADB controller sending and receiving data, thereby
   342	 * generating shift register interrupts (SR_INT) for us. This means there has
   343	 * to be activity on the ADB bus. The chip will poll to achieve this.
   344	 *
   345	 * The basic ADB state machine was left unchanged from the original MacII code
   346	 * by Alan Cox, which was based on the CUDA driver for PowerMac. 
   347	 * The syntax of the ADB status lines is totally different on MacII,
   348	 * though. MacII uses the states Command -> Even -> Odd -> Even ->...-> Idle
   349	 * for sending and Idle -> Even -> Odd -> Even ->...-> Idle for receiving.
   350	 * Start and end of a receive packet are signalled by asserting /IRQ on the
   351	 * interrupt line (/IRQ means the CTLR_IRQ bit in port B; not to be confused
   352	 * with the VIA shift register interrupt. /IRQ never actually interrupts the
   353	 * processor, it's just an ordinary input.)
   354	 */
   355	static irqreturn_t macii_interrupt(int irq, void *arg)
   356	{
   357		int x;
   358		struct adb_request *req;
   359	
   360		if (!arg) {
   361			/* Clear the SR IRQ flag when polling. */
   362			if (via[IFR] & SR_INT)
   363				via[IFR] = SR_INT;
   364			else
   365				return IRQ_NONE;
   366		}
   367	
   368		last_status = status;
   369		status = via[B] & (ST_MASK|CTLR_IRQ);
   370	
   371		switch (macii_state) {
   372			case idle:
   373				if (reading_reply) {
   374					reply_ptr = current_req->reply;
   375				} else {
   376					WARN_ON(current_req);
   377					reply_ptr = reply_buf;
   378				}
   379	
   380				x = via[SR];
   381	
   382				if ((status & CTLR_IRQ) && (x == 0xFF)) {
   383					/* Bus timeout without SRQ sequence:
   384					 *     data is "FF" while CTLR_IRQ is "H"
   385					 */
   386					reply_len = 0;
   387					srq_asserted = 0;
   388					macii_state = read_done;
   389				} else {
   390					macii_state = reading;
   391					*reply_ptr = x;
   392					reply_len = 1;
   393				}
   394	
   395				/* set ADB state = even for first data byte */
   396				via[B] = (via[B] & ~ST_MASK) | ST_EVEN;
   397				break;
   398	
   399			case sending:
   400				req = current_req;
   401				if (data_index >= req->nbytes) {
   402					req->sent = 1;
   403					macii_state = idle;
   404	
   405					if (req->reply_expected) {
   406						reading_reply = 1;
   407					} else {
   408						req->complete = 1;
   409						current_req = req->next;
   410						if (req->done) (*req->done)(req);
   411	
   412						if (current_req)
   413							macii_start();
   414						else
   415							if (need_autopoll())
   416								macii_autopoll(autopoll_devs);
   417					}
   418	
   419					if (macii_state == idle) {
   420						/* reset to shift in */
   421						via[ACR] &= ~SR_OUT;
   422						x = via[SR];
   423						/* set ADB state idle - might get SRQ */
   424						via[B] = (via[B] & ~ST_MASK) | ST_IDLE;
   425					}
   426				} else {
   427					via[SR] = req->data[data_index++];
   428	
   429					if ( (via[B] & ST_MASK) == ST_CMD ) {
   430						/* just sent the command byte, set to EVEN */
   431						via[B] = (via[B] & ~ST_MASK) | ST_EVEN;
   432					} else {
   433						/* invert state bits, toggle ODD/EVEN */
   434						via[B] ^= ST_MASK;
   435					}
   436				}
   437				break;
   438	
   439			case reading:
   440				x = via[SR];
   441				WARN_ON((status & ST_MASK) == ST_CMD ||
   442					(status & ST_MASK) == ST_IDLE);
   443	
   444				/* Bus timeout with SRQ sequence:
   445				 *     data is "XX FF"      while CTLR_IRQ is "L L"
   446				 * End of packet without SRQ sequence:
   447				 *     data is "XX...YY 00" while CTLR_IRQ is "L...H L"
   448				 * End of packet SRQ sequence:
   449				 *     data is "XX...YY 00" while CTLR_IRQ is "L...L L"
   450				 * (where XX is the first response byte and
   451				 * YY is the last byte of valid response data.)
   452				 */
   453	
   454				srq_asserted = 0;
   455				if (!(status & CTLR_IRQ)) {
   456					if (x == 0xFF) {
   457						if (!(last_status & CTLR_IRQ)) {
   458							macii_state = read_done;
   459							reply_len = 0;
   460							srq_asserted = 1;
   461						}
   462					} else if (x == 0x00) {
   463						macii_state = read_done;
   464						if (!(last_status & CTLR_IRQ))
   465							srq_asserted = 1;
   466					}
   467				}
   468	
   469				if (macii_state == reading &&
 > 470				    reply_len < ARRAY_SIZE(reply_buf)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
