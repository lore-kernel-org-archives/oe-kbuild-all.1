Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0435417E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 05:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677301761; x=1708837761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=36t4ORIbDoRWxGvK80DVAPSVvEBRfWQOCzHJZ6g3ep0=;
  b=eKJv17sjwNEQnUwgxsXnk749hQKcRo3B8MPNp3PTo0HDYOZZPu7LHDxl
   5Ddy0TtwfT7wOi/g9JNimGqpVf52PUgAkpIdkrmlA1HY8Oy51Nlg5tWb4
   /ubsgdWeH2URCfvXGihWFrnaty+WPCVqZUrg8ZyA4HMBdL/SR57++Yr2b
   FOvEUMVqRaUm/GzxqQGdfuiwLAR4NqKQ01xm9e9zZ9vODUeZljVjYPpKK
   buaFyX+YGbFjV3N1RntqBSN4LJO61CLNwijp66HkXX8JTjpAIzBuZsgvi
   RGpVq4NxnKyKutTlsSDVT706tAoXJbIBN2Zo6YKULsXmGoS03mNf3XFIL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361143553"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361143553"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 21:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741875202"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="741875202"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2023 21:09:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVmo9-0002wB-33;
	Sat, 25 Feb 2023 05:09:17 +0000
Date: Sat, 25 Feb 2023 13:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-rpc-with-tls-upcall 11/18] net/sunrpc/xprtsock.c:1256:
 undefined reference to `tls_handshake_cancel'
Message-ID: <202302251315.KI0xxV1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   5e1d0a1c4a326be5eefbcce8c08dfd8520a46d54
commit: 568a4556979ee8fc231f8f8b11372b5bec41b0e7 [11/18] SUNRPC: Add RPC-with-TLS support to xprtsock.c
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230225/202302251315.KI0xxV1W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=568a4556979ee8fc231f8f8b11372b5bec41b0e7
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 568a4556979ee8fc231f8f8b11372b5bec41b0e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251315.KI0xxV1W-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: net/sunrpc/xprtsock.o: in function `xs_reset_transport':
>> net/sunrpc/xprtsock.c:1256: undefined reference to `tls_handshake_cancel'


vim +1256 net/sunrpc/xprtsock.c

  1231	
  1232	static void xs_reset_transport(struct sock_xprt *transport)
  1233	{
  1234		struct socket *sock = transport->sock;
  1235		struct sock *sk = transport->inet;
  1236		struct rpc_xprt *xprt = &transport->xprt;
  1237		struct file *filp = transport->file;
  1238	
  1239		if (sk == NULL)
  1240			return;
  1241		/*
  1242		 * Make sure we're calling this in a context from which it is safe
  1243		 * to call __fput_sync(). In practice that means rpciod and the
  1244		 * system workqueue.
  1245		 */
  1246		if (!(current->flags & PF_WQ_WORKER)) {
  1247			WARN_ON_ONCE(1);
  1248			set_bit(XPRT_CLOSE_WAIT, &xprt->state);
  1249			return;
  1250		}
  1251	
  1252		if (atomic_read(&transport->xprt.swapper))
  1253			sk_clear_memalloc(sk);
  1254	
  1255		/* XXX: Maybe also send a TLS Closure alert? */
> 1256		tls_handshake_cancel(sock);
  1257	
  1258		kernel_sock_shutdown(sock, SHUT_RDWR);
  1259	
  1260		mutex_lock(&transport->recv_mutex);
  1261		lock_sock(sk);
  1262		transport->inet = NULL;
  1263		transport->sock = NULL;
  1264		transport->file = NULL;
  1265	
  1266		sk->sk_user_data = NULL;
  1267	
  1268		xs_restore_old_callbacks(transport, sk);
  1269		xprt_clear_connected(xprt);
  1270		xs_sock_reset_connection_flags(xprt);
  1271		/* Reset stream record info */
  1272		xs_stream_reset_connect(transport);
  1273		release_sock(sk);
  1274		mutex_unlock(&transport->recv_mutex);
  1275	
  1276		trace_rpc_socket_close(xprt, sock);
  1277		__fput_sync(filp);
  1278	
  1279		xprt_disconnect_done(xprt);
  1280	}
  1281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
