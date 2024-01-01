Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7DE55F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 22:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZ91vsil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704148326; x=1735684326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21/6coiJgYXDuUdz1BrGc7zD4cor+rF46u4W5qMnUxc=;
  b=WZ91vsilxugE84SVgQD4FQy2THg+D2KpBKmVtMndFUIfTbrG7TNaL2J4
   mkJCnN/D+WWVqDUDQMZd7yYxobfQiUsAqGX+aOAODhh7Gt+b3tCJ1sOUO
   cbScEyi6YsCPalqvklZ9JUhcQhmQBVEWqjCx2H8uxreNZA8CXof/Ig2P8
   DVJFyARJWm9IxcdstjQZNjW7LF1EuZR2UynegHdboN70f+tBf6YEvymrT
   Kyr0f6SNacVSNIfT5zjStvtxiqZoYmAyfiFVr3qrdWDVcTxcLIp29YKgN
   HnXf3lZ6FNqDRreF7fB1oUuyYExS9PQTHkrSDz4I6/lujyx2eDjpGgEFg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="400624636"
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="400624636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 14:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="870072471"
X-IronPort-AV: E=Sophos;i="6.04,323,1695711600"; 
   d="scan'208";a="870072471"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jan 2024 14:32:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKQpG-000KaZ-0D;
	Mon, 01 Jan 2024 22:32:02 +0000
Date: Tue, 2 Jan 2024 06:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 20/21] net/rxrpc/txbuf.c:90:41: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202401020602.niNMXwmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ebd44e15422341724b06a3a13590ea80244ebbd6
commit: 02c20ee3703d16be4432d0632130d7b8c9ea6558 [20/21] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: i386-randconfig-062-20240102 (https://download.01.org/0day-ci/archive/20240102/202401020602.niNMXwmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240102/202401020602.niNMXwmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401020602.niNMXwmD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/rxrpc/txbuf.c:90:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] serviceId @@     got unsigned short [usertype] serviceId @@
   net/rxrpc/txbuf.c:90:41: sparse:     expected restricted __be16 [usertype] serviceId
   net/rxrpc/txbuf.c:90:41: sparse:     got unsigned short [usertype] serviceId

vim +90 net/rxrpc/txbuf.c

    58	
    59	/*
    60	 * Allocate and partially initialise a response transmission buffer.
    61	 */
    62	struct rxrpc_txbuf *rxrpc_alloc_response_txbuf(struct rxrpc_connection *conn,
    63						       struct sk_buff *challenge)
    64	{
    65		struct rxrpc_skb_priv *csp = rxrpc_skb(challenge);
    66		struct rxrpc_txbuf *txb;
    67	
    68		txb = kmalloc(sizeof(*txb), GFP_NOFS);
    69		if (txb) {
    70			INIT_LIST_HEAD(&txb->call_link);
    71			INIT_LIST_HEAD(&txb->tx_link);
    72			refcount_set(&txb->ref, 1);
    73			txb->call_debug_id	= 0;
    74			txb->debug_id		= atomic_inc_return(&rxrpc_txbuf_debug_ids);
    75			txb->space		= sizeof(txb->data);
    76			txb->len		= 0;
    77			txb->offset		= 0;
    78			txb->flags		= 0;
    79			txb->ack_why		= 0;
    80			txb->seq		= 0;
    81			txb->wire.epoch		= htonl(csp->hdr.epoch);
    82			txb->wire.cid		= htonl(csp->hdr.cid);
    83			txb->wire.callNumber	= 0;
    84			txb->wire.seq		= 0;
    85			txb->wire.type		= RXRPC_PACKET_TYPE_RESPONSE;
    86			txb->wire.flags		= conn->out_clientflag;
    87			txb->wire.userStatus	= 0;
    88			txb->wire.securityIndex	= csp->hdr.securityIndex;
    89			txb->wire._rsvd		= 0;
  > 90			txb->wire.serviceId	= csp->hdr.serviceId;
    91	
    92			trace_rxrpc_txbuf(txb->debug_id,
    93					  txb->call_debug_id, txb->seq, 1,
    94					  rxrpc_txbuf_alloc_response);
    95			atomic_inc(&rxrpc_nr_txbuf);
    96		}
    97	
    98		return txb;
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
