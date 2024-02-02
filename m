Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C7715E5BA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706901951; cv=none; b=Zm/dQJx2fAI/DKpdURZfKBiHF3XLrkcvsldq8rCsYHPeIEDXY+Ld19YgJg3CFZcXFXLpkCf0nRLXBGcBdayCtRB9VBdwRihLQorsMO2XY+CL2t12gqth8YirCN1Z5hMlneA6Ztk1Cw9ulNfl4xrcRkGGFEidYzYbaHUYHF3yJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706901951; c=relaxed/simple;
	bh=rO/4piFDiQXXsuef0W1WgoriWG5NhITZnQFKHu7K2vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMm9TcyQ8nLOlW0z96O3pYXR5bTxjZ8blGpyHNy2/8jNV1CNw729W94TD+ZsXBECKXI4padq577K8g8E3mBIdQwlhaNZzJOhVM3RjdGX/MBLJKZeW/r5/hyeZqWWMhxDTi1Gh0OJxZpYIt7TaXA8aZHTyrttTOLWqRxOQ87p0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csquiwDa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csquiwDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706901949; x=1738437949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rO/4piFDiQXXsuef0W1WgoriWG5NhITZnQFKHu7K2vw=;
  b=csquiwDa1cyksTLWaxZY7sEQEaDMP1LZyPrfWKBLUsHhlQcuifDZI7ID
   Ngxvzqdb7xv3F6/ltzUeoTmzQUB3sJb9mtibWFVrcjaqHugsNLmHLmQjU
   YksigVos5DtusLMYMfqUfw/nF7C/BAJ7/WG2lKMy6QXZAU8gNvpdPrgTm
   Gg9bC2pzCfNpUU7jpwXOkx8Hi+ztTn40mYRIh8IIpE8m9p3bbQ+ljRw17
   QQxCNOsn47SjJndtWmUDiU5nP+yhuQ8TB8mXygpIRTCsYuDH4Diz3X8T2
   5Rmh3kHzBu+2OS2b9F3qIHfjfjtYMRfD7vUeJLGVyveVudll5noMhEh/I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="135072"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="135072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 11:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="37567976"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Feb 2024 11:25:46 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVzAV-0004Cw-1x;
	Fri, 02 Feb 2024 19:25:43 +0000
Date: Sat, 3 Feb 2024 03:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-iothread 23/24] net/rxrpc/output.c:270:58:
 warning: assignment to 'void *' from 'long unsigned int' makes pointer from
 integer without a cast
Message-ID: <202402030324.zgljQAUQ-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240203/202402030324.zgljQAUQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030324.zgljQAUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030324.zgljQAUQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rxrpc/output.c: In function 'rxrpc_send_ACK':
>> net/rxrpc/output.c:270:58: warning: assignment to 'void *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     270 |                         txb->kvec[txb->nr_kvec].iov_base = empty_zero_page;
         |                                                          ^
--
   net/rxrpc/txbuf.c: In function 'rxrpc_free_txbuf':
>> net/rxrpc/txbuf.c:183:43: warning: comparison between pointer and integer
     183 |                     txb->kvec[i].iov_base != empty_zero_page)
         |                                           ^~


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
