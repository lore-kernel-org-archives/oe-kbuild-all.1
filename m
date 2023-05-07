Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308ED5258
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683479318; x=1715015318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1jA5/bqdZ1jKy14+XRirsg1VQucbXc0uHwVUHwIsRmk=;
  b=P3iv1mBRv3fyC9RXnYHSrsMNCIShLasyZwVvhsdS9bzyBPERS3s7xWaf
   n+2mGzb+xg8mPAzuKEjkjq9hrkpnC0aIlegXodbABTV6iKNUi6rYqvZdn
   34isLOB9eI0r1vSds16U8VWgJCCoyxsXxMQM0eJ8eepI7dLEnb/BTH/xH
   uxK6BV5eZQmthynRHh2JvKLTzmDEnL1QEGEIB1+BT/OTnjhY5X5+/vofb
   vqyAPih1pFmPRNOtgGSLa9imuHZDEgQduhAaIJnc1WoEUdAtdthe5dQij
   UoymHVAY7nLtHRyTaMJEzq7NyXNW9Al99xUN5YOGm43lGuMN/hH/NmfVO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="346968519"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="346968519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 10:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="809991523"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="809991523"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 May 2023 10:08:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvhsB-0000oj-2t;
	Sun, 07 May 2023 17:08:35 +0000
Date: Mon, 8 May 2023 01:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 17/21] net/rxrpc/txbuf.c:90:41: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202305080106.UvIbIgjR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   c2bc708ea35105bd4b41269dcc6296037f0272c6
commit: 8be0de0a71d068addc309ef72528238c7ecf340e [17/21] rxrpc: rxgk: Implement the yfs-rxgk security class (GSSAPI)
config: alpha-randconfig-s041-20230507 (https://download.01.org/0day-ci/archive/20230508/202305080106.UvIbIgjR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=8be0de0a71d068addc309ef72528238c7ecf340e
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs crypto-krb5
        git checkout 8be0de0a71d068addc309ef72528238c7ecf340e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080106.UvIbIgjR-lkp@intel.com/

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
https://github.com/intel/lkp-tests
