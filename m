Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30731113
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 02:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686277570; x=1717813570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKNfeOH8EuRSUoYQcHJfSuwjgEEbSIhp8y5y9msAsyY=;
  b=hEcOwEsomzXtMgU7NzdX26rssT4sDBWrssvJ99QNKFLe1+XcORs8Zspm
   DZ2JWyDHRB+AXE9Ty9fB+SnumIhkjDlACa6bjy4P53BYvIFPXPCh8OaWP
   Tc5o/oXxiQiZW9JoNeCeEyBiBh+nrtokC61bTQ0raWT8xk85ElBmW4bHG
   b+mWlh+PdxUt/9bpwNeH6jFLdTpbC2bgjdJ/ZcWunUjPFCHXBzj8eZPWu
   OBBmf3Ta9Cq9kk0oujUnvFMZ6/WR4Ls/doD4GgnUhcxGvNGogWL9ocXNP
   yRRPYHgtEJCByS//nii1Vy9/O+ZNiPLa1DiugPRj9fu5vhOy7WT9uIU/d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347141220"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="347141220"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 19:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="743322258"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="743322258"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Jun 2023 19:26:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7RpF-0008WG-2M;
	Fri, 09 Jun 2023 02:26:05 +0000
Date: Fri, 9 Jun 2023 10:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 18/19] net/rxrpc/txbuf.c:90:41: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202306091035.DvqNVi0n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   5b181cb5852b03279d830e9d98cdc20ae1ca6e8e
commit: 0a4f5f1d27250fe42cd28c0729377a5351a07e5b [18/19] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: s390-randconfig-s052-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091035.DvqNVi0n-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=0a4f5f1d27250fe42cd28c0729377a5351a07e5b
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 0a4f5f1d27250fe42cd28c0729377a5351a07e5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091035.DvqNVi0n-lkp@intel.com/

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
