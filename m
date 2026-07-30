Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243A37CD45
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425679; cv=none; b=lOVeV+YLtnhUrnTHc4Seu9YHI/bqvoVbpejcW5/o7UkTd8FHEd7JjuEePO3YYEFnVStbxTz00TXd8fZoFmC2sFRy4LYWKpqa7R76928eTVcdSq6zhMlAoD55hisutnBBQAmMJzW4PAv/KsTDDh9JmcqFi7N2+71/YE58iRnkQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425679; c=relaxed/simple;
	bh=BmljqG5996Q3TeIoNkD1MZ78mgfZ5630HWdKzRqOlIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tDCIm3cvjPRW7YWAyydna/l916FNDPIp15mC1kKn6F8sYFShP3ixTNFK5Di24kgawAW3A+ePN+obkHPH0fnItHXeBDC0CZ1zuhLK6BMQhqQAOXVmasKzYR6t+k5f8XHIczKPKfG0bH/uz0D6Y9AUbLP2EIQ0azegRt+s6XH+hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djbLGg5x; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djbLGg5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785425677; x=1816961677;
  h=date:from:to:cc:subject:message-id;
  bh=BmljqG5996Q3TeIoNkD1MZ78mgfZ5630HWdKzRqOlIM=;
  b=djbLGg5x4MiliHBpzewixodswOWH9GlvK9lbRZ1BWxVoONZk2bA38TZv
   mifsL5DFJ9VEgYt1WXNuxFUqXkfsyO6lByLHBh3cPw4YpJ8kBFQBNLgdL
   bkVAp4aDumYYMcSMCi0c/KIeL6v1LxejP9Cd8sFIWkqTU/oeMKDZLzWYs
   bLgVYvUa607G0uddEHsqkozBYfWKexuqfryeiMGi9Jgpm+k05xcrcBHG6
   4pSVaF/CzL9ZSIaNVjf/kOvcXQw/w20MWjoJkoSS0xoaTB8wJVSiGubx5
   pztCsVfPIuYSDOSf5rqqD3A/a33Z5vLuSMtnPKmjjmvPQUI71ZfU7+a2G
   g==;
X-CSE-ConnectionGUID: 0yxNXJHQTNOc80ZpwNNm/Q==
X-CSE-MsgGUID: PXkAKtQ+RuG9bqBW0QoxDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86238440"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86238440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 08:34:36 -0700
X-CSE-ConnectionGUID: H5i+L9oAQySaswIA7TkIyw==
X-CSE-MsgGUID: Tjy/iEuRTs+8TVxL5zSvxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="263804546"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jul 2026 08:34:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpSmG-00000000gzb-0mg6;
	Thu, 30 Jul 2026 15:34:32 +0000
Date: Thu, 30 Jul 2026 23:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-fixes 8/9] net/rxrpc/sendmsg.c:335:37:
 warning: implicit conversion from 'int' to 'enum rxrpc_abort_reason' changes
 value from 128 to -128
Message-ID: <202607302351.cZHWspK0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-fixes
head:   1029fb7864dd1e7b840b9a434b682a9484239d4c
commit: 3b0083bb071d214ad455d484f8c3e80c69beff3f [8/9] rxrpc: Fix CHALLENGE packet overqueuing and simplify RESPONSE generation
config: hexagon-randconfig-r072-20260730 (https://download.01.org/0day-ci/archive/20260730/202607302351.cZHWspK0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302351.cZHWspK0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302351.cZHWspK0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/sendmsg.c:335:37: warning: implicit conversion from 'int' to 'enum rxrpc_abort_reason' changes value from 128 to -128 [-Wconstant-conversion]
     335 |                 trace_rxrpc_abort(call->debug_id, rxrpc_sendmsg_late_send,
         |                 ~~~~~~~~~~~~~~~~~                 ^~~~~~~~~~~~~~~~~~~~~~~
   net/rxrpc/sendmsg.c:383:37: warning: implicit conversion from 'int' to 'enum rxrpc_abort_reason' changes value from 128 to -128 [-Wconstant-conversion]
     383 |                 trace_rxrpc_abort(call->debug_id, rxrpc_sendmsg_late_send,
         |                 ~~~~~~~~~~~~~~~~~                 ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +335 net/rxrpc/sendmsg.c

b341a0263b1b80 David Howells 2024-12-04  315  
0b58b8a18be493 David Howells 2016-09-02  316  /*
0b58b8a18be493 David Howells 2016-09-02  317   * send data through a socket
0b58b8a18be493 David Howells 2016-09-02  318   * - must be called in process context
540b1c48c37ac0 David Howells 2017-02-27  319   * - The caller holds the call user access mutex, but not the socket lock.
0b58b8a18be493 David Howells 2016-09-02  320   */
0b58b8a18be493 David Howells 2016-09-02  321  static int rxrpc_send_data(struct rxrpc_sock *rx,
0b58b8a18be493 David Howells 2016-09-02  322  			   struct rxrpc_call *call,
e833251ad81316 David Howells 2017-08-29  323  			   struct msghdr *msg, size_t len,
87d2193d7d96a2 David Howells 2026-07-08  324  			   rxrpc_notify_end_tx_t notify_end_tx)
87d2193d7d96a2 David Howells 2026-07-08  325  	__releases(&call->user_mutex)
0b58b8a18be493 David Howells 2016-09-02  326  {
a4ea4c47761943 David Howells 2022-03-31  327  	struct rxrpc_txbuf *txb;
0b58b8a18be493 David Howells 2016-09-02  328  	struct sock *sk = &rx->sk;
b0f571ecd79434 David Howells 2022-08-24  329  	enum rxrpc_call_state state;
0b58b8a18be493 David Howells 2016-09-02  330  	long timeo;
b0f571ecd79434 David Howells 2022-08-24  331  	bool more = msg->msg_flags & MSG_MORE;
b0f571ecd79434 David Howells 2022-08-24  332  	int ret, copied = 0;
0b58b8a18be493 David Howells 2016-09-02  333  
f9c7117bd901bd David Howells 2026-07-07  334  	if (unlikely(test_bit(RXRPC_CALL_TX_NO_MORE, &call->flags))) {
ae4f899894792c David Howells 2024-12-12 @335  		trace_rxrpc_abort(call->debug_id, rxrpc_sendmsg_late_send,
ae4f899894792c David Howells 2024-12-12  336  				  call->cid, call->call_id, call->rx_consumed,
ae4f899894792c David Howells 2024-12-12  337  				  0, -EPROTO);
87d2193d7d96a2 David Howells 2026-07-08  338  		ret = -EPROTO;
87d2193d7d96a2 David Howells 2026-07-08  339  		goto out_unlock;
ae4f899894792c David Howells 2024-12-12  340  	}
f9c7117bd901bd David Howells 2026-07-07  341  	if (unlikely(test_bit(RXRPC_CALL_TX_ERROR, &call->flags))) {
f9c7117bd901bd David Howells 2026-07-07  342  		trace_rxrpc_abort(call->debug_id, rxrpc_sendmsg_tx_error,
f9c7117bd901bd David Howells 2026-07-07  343  				  call->cid, call->call_id, call->rx_consumed,
f9c7117bd901bd David Howells 2026-07-07  344  				  0, -EIO);
87d2193d7d96a2 David Howells 2026-07-08  345  		ret = -EIO;
87d2193d7d96a2 David Howells 2026-07-08  346  		goto out_unlock;
f9c7117bd901bd David Howells 2026-07-07  347  	}
ae4f899894792c David Howells 2024-12-12  348  
0b58b8a18be493 David Howells 2016-09-02  349  	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
0b58b8a18be493 David Howells 2016-09-02  350  
9d35d880e0e4a3 David Howells 2022-10-19  351  	ret = rxrpc_wait_to_be_connected(call, &timeo);
9d35d880e0e4a3 David Howells 2022-10-19  352  	if (ret < 0)
87d2193d7d96a2 David Howells 2026-07-08  353  		goto out_unlock;
9d35d880e0e4a3 David Howells 2022-10-19  354  
9d35d880e0e4a3 David Howells 2022-10-19  355  	if (call->conn->state == RXRPC_CONN_CLIENT_UNSECURED) {
9d35d880e0e4a3 David Howells 2022-10-19  356  		ret = rxrpc_init_client_conn_security(call->conn);
9d35d880e0e4a3 David Howells 2022-10-19  357  		if (ret < 0)
87d2193d7d96a2 David Howells 2026-07-08  358  			goto out_unlock;
9d35d880e0e4a3 David Howells 2022-10-19  359  	}
9d35d880e0e4a3 David Howells 2022-10-19  360  
0b58b8a18be493 David Howells 2016-09-02  361  	/* this should be in poll */
0b58b8a18be493 David Howells 2016-09-02  362  	sk_clear_bit(SOCKWQ_ASYNC_NOSPACE, sk);
0b58b8a18be493 David Howells 2016-09-02  363  
b0f571ecd79434 David Howells 2022-08-24  364  reload:
7a310f8d7dfe2d David Howells 2024-10-01  365  	txb = call->tx_pending;
7a310f8d7dfe2d David Howells 2024-10-01  366  	call->tx_pending = NULL;
7a310f8d7dfe2d David Howells 2024-10-01  367  	if (txb)
7a310f8d7dfe2d David Howells 2024-10-01  368  		rxrpc_see_txbuf(txb, rxrpc_txbuf_see_send_more);
7a310f8d7dfe2d David Howells 2024-10-01  369  
b0f571ecd79434 David Howells 2022-08-24  370  	ret = -EPIPE;
639f181f0ee20d David Howells 2020-07-20  371  	if (sk->sk_shutdown & SEND_SHUTDOWN)
b0f571ecd79434 David Howells 2022-08-24  372  		goto maybe_error;
d41b3f5b968818 David Howells 2022-12-19  373  	state = rxrpc_call_state(call);
b0f571ecd79434 David Howells 2022-08-24  374  	ret = -ESHUTDOWN;
b0f571ecd79434 David Howells 2022-08-24  375  	if (state >= RXRPC_CALL_COMPLETE)
b0f571ecd79434 David Howells 2022-08-24  376  		goto maybe_error;
b0f571ecd79434 David Howells 2022-08-24  377  	ret = -EPROTO;
9b6ce594808580 Wyatt Feng    2026-06-24  378  	if (state != RXRPC_CALL_CLIENT_PRE_SEND &&
9b6ce594808580 Wyatt Feng    2026-06-24  379  	    state != RXRPC_CALL_CLIENT_SEND_REQUEST &&
b0f571ecd79434 David Howells 2022-08-24  380  	    state != RXRPC_CALL_SERVER_ACK_REQUEST &&
2d689424b61845 David Howells 2022-11-11  381  	    state != RXRPC_CALL_SERVER_SEND_REPLY) {
2d689424b61845 David Howells 2022-11-11  382  		/* Request phase complete for this client call */
2d689424b61845 David Howells 2022-11-11  383  		trace_rxrpc_abort(call->debug_id, rxrpc_sendmsg_late_send,
2d689424b61845 David Howells 2022-11-11  384  				  call->cid, call->call_id, call->rx_consumed,
2d689424b61845 David Howells 2022-11-11  385  				  0, -EPROTO);
b0f571ecd79434 David Howells 2022-08-24  386  		goto maybe_error;
2d689424b61845 David Howells 2022-11-11  387  	}
0b58b8a18be493 David Howells 2016-09-02  388  
b0f571ecd79434 David Howells 2022-08-24  389  	ret = -EMSGSIZE;
e754eba685aac2 David Howells 2017-06-07  390  	if (call->tx_total_len != -1) {
b0f571ecd79434 David Howells 2022-08-24  391  		if (len - copied > call->tx_total_len)
b0f571ecd79434 David Howells 2022-08-24  392  			goto maybe_error;
b0f571ecd79434 David Howells 2022-08-24  393  		if (!more && len - copied != call->tx_total_len)
b0f571ecd79434 David Howells 2022-08-24  394  			goto maybe_error;
e754eba685aac2 David Howells 2017-06-07  395  	}
e754eba685aac2 David Howells 2017-06-07  396  
0b58b8a18be493 David Howells 2016-09-02  397  	do {
a4ea4c47761943 David Howells 2022-03-31  398  		if (!txb) {
49489bb03a5015 David Howells 2024-01-29  399  			size_t remain;
0b58b8a18be493 David Howells 2016-09-02  400  
0b58b8a18be493 David Howells 2016-09-02  401  			_debug("alloc");
0b58b8a18be493 David Howells 2016-09-02  402  
b0f571ecd79434 David Howells 2022-08-24  403  			if (!rxrpc_check_tx_space(call, NULL))
b0f571ecd79434 David Howells 2022-08-24  404  				goto wait_for_space;
0b58b8a18be493 David Howells 2016-09-02  405  
b341a0263b1b80 David Howells 2024-12-04  406  			/* See if we need to begin/extend the Tx queue. */
b341a0263b1b80 David Howells 2024-12-04  407  			if (!call->send_queue || !((call->send_top + 1) & RXRPC_TXQ_MASK)) {
b341a0263b1b80 David Howells 2024-12-04  408  				ret = rxrpc_alloc_txqueue(sk, call);
b341a0263b1b80 David Howells 2024-12-04  409  				if (ret < 0)
b341a0263b1b80 David Howells 2024-12-04  410  					goto maybe_error;
b341a0263b1b80 David Howells 2024-12-04  411  			}
b341a0263b1b80 David Howells 2024-12-04  412  
d7d775b1ffb154 David Howells 2020-09-16  413  			/* Work out the maximum size of a packet.  Assume that
d7d775b1ffb154 David Howells 2020-09-16  414  			 * the security header is going to be in the padded
d7d775b1ffb154 David Howells 2020-09-16  415  			 * region (enc blocksize), but the trailer is not.
d7d775b1ffb154 David Howells 2020-09-16  416  			 */
d7d775b1ffb154 David Howells 2020-09-16  417  			remain = more ? INT_MAX : msg_data_left(msg);
49489bb03a5015 David Howells 2024-01-29  418  			txb = call->conn->security->alloc_txbuf(call, remain, sk->sk_allocation);
89e4354110ca64 David Howells 2024-03-12  419  			if (!txb) {
89e4354110ca64 David Howells 2024-03-12  420  				ret = -ENOMEM;
0b58b8a18be493 David Howells 2016-09-02  421  				goto maybe_error;
49489bb03a5015 David Howells 2024-01-29  422  			}
0b58b8a18be493 David Howells 2016-09-02  423  		}
0b58b8a18be493 David Howells 2016-09-02  424  
0b58b8a18be493 David Howells 2016-09-02  425  		_debug("append");
0b58b8a18be493 David Howells 2016-09-02  426  
0b58b8a18be493 David Howells 2016-09-02  427  		/* append next segment of data to the current buffer */
0b58b8a18be493 David Howells 2016-09-02  428  		if (msg_data_left(msg) > 0) {
29e03ec757292e David Howells 2024-12-04  429  			size_t copy = umin(txb->space, msg_data_left(msg));
a4ea4c47761943 David Howells 2022-03-31  430  
a4ea4c47761943 David Howells 2022-03-31  431  			_debug("add %zu", copy);
06ea2c9c4163b8 David Howells 2025-02-09  432  			if (!copy_from_iter_full(txb->data + txb->offset,
ff342bdc59f4a7 David Howells 2024-01-29  433  						 copy, &msg->msg_iter))
0b58b8a18be493 David Howells 2016-09-02  434  				goto efault;
a4ea4c47761943 David Howells 2022-03-31  435  			_debug("added");
a4ea4c47761943 David Howells 2022-03-31  436  			txb->space -= copy;
a4ea4c47761943 David Howells 2022-03-31  437  			txb->len += copy;
a4ea4c47761943 David Howells 2022-03-31  438  			txb->offset += copy;
0b58b8a18be493 David Howells 2016-09-02  439  			copied += copy;
e754eba685aac2 David Howells 2017-06-07  440  			if (call->tx_total_len != -1)
e754eba685aac2 David Howells 2017-06-07  441  				call->tx_total_len -= copy;
0b58b8a18be493 David Howells 2016-09-02  442  		}
0b58b8a18be493 David Howells 2016-09-02  443  
e122d845a01ece David Howells 2019-01-10  444  		/* check for the far side aborting the call or a network error
e122d845a01ece David Howells 2019-01-10  445  		 * occurring */
d41b3f5b968818 David Howells 2022-12-19  446  		if (rxrpc_call_is_complete(call))
e122d845a01ece David Howells 2019-01-10  447  			goto call_terminated;
e122d845a01ece David Howells 2019-01-10  448  
0b58b8a18be493 David Howells 2016-09-02  449  		/* add the packet to the send queue if it's now full */
a4ea4c47761943 David Howells 2022-03-31  450  		if (!txb->space ||
0b58b8a18be493 David Howells 2016-09-02  451  		    (msg_data_left(msg) == 0 && !more)) {
f9c7117bd901bd David Howells 2026-07-07  452  			/* Do any required crypto.  If this fails, it could
f9c7117bd901bd David Howells 2026-07-07  453  			 * have corrupted the txbuf content with a partial
f9c7117bd901bd David Howells 2026-07-07  454  			 * encrypt.  Assume that ENOMEM is retryable, but
f9c7117bd901bd David Howells 2026-07-07  455  			 * everything else is terminal.
f9c7117bd901bd David Howells 2026-07-07  456  			 */
a4ea4c47761943 David Howells 2022-03-31  457  			ret = call->security->secure_packet(call, txb);
f9c7117bd901bd David Howells 2026-07-07  458  			if (ret < 0) {
f9c7117bd901bd David Howells 2026-07-07  459  				if (ret == -ENOMEM)
f9c7117bd901bd David Howells 2026-07-07  460  					goto maybe_error_rewind;
f9c7117bd901bd David Howells 2026-07-07  461  				set_bit(RXRPC_CALL_TX_ERROR, &call->flags);
87d2193d7d96a2 David Howells 2026-07-08  462  				goto out_txb;
f9c7117bd901bd David Howells 2026-07-07  463  			}
f9c7117bd901bd David Howells 2026-07-07  464  
f9c7117bd901bd David Howells 2026-07-07  465  			if (msg_data_left(msg) == 0 && !more)
f9c7117bd901bd David Howells 2026-07-07  466  				txb->flags |= RXRPC_LAST_PACKET;
a4ea4c47761943 David Howells 2022-03-31  467  			rxrpc_queue_packet(rx, call, txb, notify_end_tx);
a4ea4c47761943 David Howells 2022-03-31  468  			txb = NULL;
0b58b8a18be493 David Howells 2016-09-02  469  		}
0b58b8a18be493 David Howells 2016-09-02  470  	} while (msg_data_left(msg) > 0);
0b58b8a18be493 David Howells 2016-09-02  471  
0b58b8a18be493 David Howells 2016-09-02  472  success:
0b58b8a18be493 David Howells 2016-09-02  473  	ret = copied;
87d2193d7d96a2 David Howells 2026-07-08  474  out_txb:
a4ea4c47761943 David Howells 2022-03-31  475  	call->tx_pending = txb;
87d2193d7d96a2 David Howells 2026-07-08  476  out_unlock:
87d2193d7d96a2 David Howells 2026-07-08  477  	mutex_unlock(&call->user_mutex);
0b58b8a18be493 David Howells 2016-09-02  478  	_leave(" = %d", ret);
0b58b8a18be493 David Howells 2016-09-02  479  	return ret;
0b58b8a18be493 David Howells 2016-09-02  480  
e122d845a01ece David Howells 2019-01-10  481  call_terminated:
a4ea4c47761943 David Howells 2022-03-31  482  	rxrpc_put_txbuf(txb, rxrpc_txbuf_put_send_aborted);
87d2193d7d96a2 David Howells 2026-07-08  483  	call->tx_pending = NULL;
87d2193d7d96a2 David Howells 2026-07-08  484  	ret = call->error;
87d2193d7d96a2 David Howells 2026-07-08  485  	goto out_unlock;
e122d845a01ece David Howells 2019-01-10  486  
f9c7117bd901bd David Howells 2026-07-07  487  maybe_error_rewind:
f9c7117bd901bd David Howells 2026-07-07  488  	/* If we got a retryable error after copying all the supplied data into
f9c7117bd901bd David Howells 2026-07-07  489  	 * the last packet, we need to rewind the buffer by one byte so the
f9c7117bd901bd David Howells 2026-07-07  490  	 * caller knows they need to retry.
f9c7117bd901bd David Howells 2026-07-07  491  	 */
f9c7117bd901bd David Howells 2026-07-07  492  	if (copied && !more && !msg_data_left(msg)) {
f9c7117bd901bd David Howells 2026-07-07  493  		txb->space  += 1;
f9c7117bd901bd David Howells 2026-07-07  494  		txb->len    -= 1;
f9c7117bd901bd David Howells 2026-07-07  495  		txb->offset -= 1;
f9c7117bd901bd David Howells 2026-07-07  496  		copied      -= 1;
f9c7117bd901bd David Howells 2026-07-07  497  		if (call->tx_total_len != -1)
f9c7117bd901bd David Howells 2026-07-07  498  			call->tx_total_len += 1;
f9c7117bd901bd David Howells 2026-07-07  499  		iov_iter_revert(&msg->msg_iter, 1);
f9c7117bd901bd David Howells 2026-07-07  500  	}
0b58b8a18be493 David Howells 2016-09-02  501  maybe_error:
7ee907aa0a7c80 David Howells 2026-07-01  502  	if (copied) {
7ee907aa0a7c80 David Howells 2026-07-01  503  		if (rxrpc_call_is_complete(call) &&
7ee907aa0a7c80 David Howells 2026-07-01  504  		    call->error < 0) {
7ee907aa0a7c80 David Howells 2026-07-01  505  			ret = call->error;
87d2193d7d96a2 David Howells 2026-07-08  506  			goto out_unlock;
7ee907aa0a7c80 David Howells 2026-07-01  507  		}
0b58b8a18be493 David Howells 2016-09-02  508  		goto success;
7ee907aa0a7c80 David Howells 2026-07-01  509  	}
87d2193d7d96a2 David Howells 2026-07-08  510  	goto out_txb;
0b58b8a18be493 David Howells 2016-09-02  511  
0b58b8a18be493 David Howells 2016-09-02  512  efault:
0b58b8a18be493 David Howells 2016-09-02  513  	ret = -EFAULT;
87d2193d7d96a2 David Howells 2026-07-08  514  	goto out_txb;
b0f571ecd79434 David Howells 2022-08-24  515  
b0f571ecd79434 David Howells 2022-08-24  516  wait_for_space:
b0f571ecd79434 David Howells 2022-08-24  517  	ret = -EAGAIN;
b0f571ecd79434 David Howells 2022-08-24  518  	if (msg->msg_flags & MSG_DONTWAIT)
b0f571ecd79434 David Howells 2022-08-24  519  		goto maybe_error;
87d2193d7d96a2 David Howells 2026-07-08  520  	call->tx_pending = txb;
87d2193d7d96a2 David Howells 2026-07-08  521  	txb = NULL;
b0f571ecd79434 David Howells 2022-08-24  522  	mutex_unlock(&call->user_mutex);
87d2193d7d96a2 David Howells 2026-07-08  523  
b0f571ecd79434 David Howells 2022-08-24  524  	ret = rxrpc_wait_for_tx_window(rx, call, &timeo,
b0f571ecd79434 David Howells 2022-08-24  525  				       msg->msg_flags & MSG_WAITALL);
b0f571ecd79434 David Howells 2022-08-24  526  	if (ret < 0)
87d2193d7d96a2 David Howells 2026-07-08  527  		goto out_nolock;
b0f571ecd79434 David Howells 2022-08-24  528  	if (call->interruptibility == RXRPC_INTERRUPTIBLE) {
b0f571ecd79434 David Howells 2022-08-24  529  		if (mutex_lock_interruptible(&call->user_mutex) < 0) {
b0f571ecd79434 David Howells 2022-08-24  530  			ret = sock_intr_errno(timeo);
87d2193d7d96a2 David Howells 2026-07-08  531  			goto out_nolock;
b0f571ecd79434 David Howells 2022-08-24  532  		}
b0f571ecd79434 David Howells 2022-08-24  533  	} else {
b0f571ecd79434 David Howells 2022-08-24  534  		mutex_lock(&call->user_mutex);
b0f571ecd79434 David Howells 2022-08-24  535  	}
b0f571ecd79434 David Howells 2022-08-24  536  	goto reload;
87d2193d7d96a2 David Howells 2026-07-08  537  out_nolock:
87d2193d7d96a2 David Howells 2026-07-08  538  	_leave(" = %d [intr]", ret);
87d2193d7d96a2 David Howells 2026-07-08  539  	return copied ?: ret;
0b58b8a18be493 David Howells 2016-09-02  540  }
df423a4af125f5 David Howells 2016-09-02  541  

:::::: The code at line 335 was first introduced by commit
:::::: ae4f899894792c436d792c17d3f3e6a2affb787f rxrpc: Fix ability to add more data to a call once MSG_MORE deasserted

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
