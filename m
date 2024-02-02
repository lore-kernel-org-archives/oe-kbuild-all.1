Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3266F182BB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889974; cv=none; b=WGeVBwAsHG0JAzlnvTbXE88XEnkOwxS62CHCCUEXDT04WFK4Opbg/KQXM8zkFcea5N3YBo1QOJa1FUwep7TwQSN/uHJl70RLuIJGy3lQbzH+J7Rmpw+yx9l8JkdWQvt+HcB/jbBeW21DcLFHmaTgThXw/Vq7V9wJ/yAA+qmh9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889974; c=relaxed/simple;
	bh=Pw6bHXUfDTHT30wCaDWHZJcoxOcm5BNRaq/ohjK5O7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=puQxg8PvlDg8JIi67YvEwB16adLIk7pS7/Fwumpwn231BccQDmC67HPc9Dc31V86uqCeDIxxyMeBSU/jKycj+64QbIhp3gHvsYeiANZX3Rn4KZMdVpaLRv4VpMd21+vT/XIF5p7QYZUrFT7QhYwfDQB9MBH1qje7UpZxH7D3vns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDG1BFpX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDG1BFpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706889971; x=1738425971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pw6bHXUfDTHT30wCaDWHZJcoxOcm5BNRaq/ohjK5O7k=;
  b=lDG1BFpXEmfe6v6IAAUgEeumu/fWOq99Fuop2eSnZLQGLXjnkBssFby9
   6SmuDVu+zFacnNDsgXMTNuHa0KzeQVeYnyso5l249sIW4FI4YNZX3pLOd
   d+5n8OtD0NO3fgSqezmllX5OgnW/Eca4wEc0HEGWTW47GK9vX5FrXBwoV
   5CdAxvdE2N6kJggCMix5adkZ0ZpOnFBLdBpaDec8pypM+81x2E+uXMuk5
   If6x8YlUS1sKhHxfcQGEN6WytKY9NSf84HfQeSQwpJXECWozAjtBJxpB+
   0bonzOauFA7OOF2EPxuVGQ6/T+PM+9DkVuErFfYvOXtHwauYqMKTvvYFz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="412287"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="412287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 08:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="111204"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Feb 2024 08:05:44 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVw2v-00041R-0N;
	Fri, 02 Feb 2024 16:05:41 +0000
Date: Sat, 3 Feb 2024 00:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 23/24] net/rxrpc/output.c:270:60: error:
 'empty_zero_page' undeclared; did you mean 'memzero_page'?
Message-ID: <202402022326.jwuMkYNM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-iothread
head:   975bd4732a7b88c6ec05685c43b639000f888fbe
commit: 83f863dfba3ae06a4b4f5369c46e9a39594d6da9 [23/24] rxrpc: Implement path-MTU probing using padded PING ACKs (RFC8899)
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240202/202402022326.jwuMkYNM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240202/202402022326.jwuMkYNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402022326.jwuMkYNM-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/rxrpc/output.c: In function 'rxrpc_send_ACK':
>> net/rxrpc/output.c:270:60: error: 'empty_zero_page' undeclared (first use in this function); did you mean 'memzero_page'?
     270 |                         txb->kvec[txb->nr_kvec].iov_base = empty_zero_page;
         |                                                            ^~~~~~~~~~~~~~~
         |                                                            memzero_page
   net/rxrpc/output.c:270:60: note: each undeclared identifier is reported only once for each function it appears in
--
   net/rxrpc/txbuf.c: In function 'rxrpc_free_txbuf':
>> net/rxrpc/txbuf.c:183:46: error: 'empty_zero_page' undeclared (first use in this function); did you mean 'memzero_page'?
     183 |                     txb->kvec[i].iov_base != empty_zero_page)
         |                                              ^~~~~~~~~~~~~~~
         |                                              memzero_page
   net/rxrpc/txbuf.c:183:46: note: each undeclared identifier is reported only once for each function it appears in


vim +270 net/rxrpc/output.c

   237	
   238	/*
   239	 * Queue an ACK for immediate transmission.
   240	 */
   241	void rxrpc_send_ACK(struct rxrpc_call *call, u8 ack_reason,
   242			    rxrpc_serial_t serial, enum rxrpc_propose_ack_trace why)
   243	{
   244		struct rxrpc_txbuf *txb;
   245	
   246		if (test_bit(RXRPC_CALL_DISCONNECTED, &call->flags))
   247			return;
   248	
   249		rxrpc_inc_stat(call->rxnet, stat_tx_acks[ack_reason]);
   250	
   251		txb = rxrpc_alloc_ack_txbuf(call, call->ackr_wtop - call->ackr_window);
   252		if (!txb) {
   253			kleave(" = -ENOMEM");
   254			return;
   255		}
   256	
   257		txb->ack_why = why;
   258	
   259		rxrpc_fill_out_ack(call, txb, ack_reason, serial);
   260	
   261		/* Extend a path MTU probe ACK. */
   262		if (why == rxrpc_propose_ack_ping_for_mtu_probe) {
   263			size_t probe_mtu = call->peer->pmtud_trial + sizeof(struct rxrpc_wire_header);
   264	
   265			if (txb->len > probe_mtu)
   266				goto skip;
   267			while (txb->len < probe_mtu) {
   268				size_t part = min_t(size_t, probe_mtu - txb->len, PAGE_SIZE);
   269	
 > 270				txb->kvec[txb->nr_kvec].iov_base = empty_zero_page;
   271				txb->kvec[txb->nr_kvec].iov_len = part;
   272				txb->len += part;
   273				txb->nr_kvec++;
   274			}
   275		}
   276	
   277		call->ackr_nr_unacked = 0;
   278		atomic_set(&call->ackr_nr_consumed, 0);
   279		clear_bit(RXRPC_CALL_RX_IS_IDLE, &call->flags);
   280	
   281		trace_rxrpc_send_ack(call, why, ack_reason, serial);
   282		rxrpc_send_ack_packet(call, txb, why);
   283	skip:
   284		rxrpc_put_txbuf(txb, rxrpc_txbuf_put_ack_tx);
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
