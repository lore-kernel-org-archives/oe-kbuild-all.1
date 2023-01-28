Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1A5CA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674912394; x=1706448394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDffmOgCwKNp9IWQek+Suj1pZdfZzSyh58RRO0fop/4=;
  b=X3cIq8TWUkqzhkBPgHpQnl6aSM6hlwJ+VVOI1UJWWmUaXQ+jjl55EnGl
   auRF9Ip/LdLYZjopq1Kf0d51qY7N06k5ct+NQMQUC81CDOLoMZwIwDf2p
   0GpRI7K8dVBc5UhA12y5Qs+Io86hc3dM/LpR6CFIAU0Ad+YE2dgmXJhCN
   YC5zGeG9LoBHkUWx8mP+kN8EtdLDvHs+dr45wKm67F8rL4NKC2eEzq0Us
   vWGmuBBg2UhwGfTbCOfZmy1Lx6PQC/izOm+APqdKIZ6IG5Pr3YWkkk2d6
   +9xijY1zUNJop4wan/V8klYRxnEm7GcvhDqXEfhDM56wYJTuHriitbfdj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310911743"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310911743"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 05:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641028482"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="641028482"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 05:26:29 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLlDy-0000gP-0M;
	Sat, 28 Jan 2023 13:26:30 +0000
Date: Sat, 28 Jan 2023 21:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	"Paulo Alcantara (SUSE)" <pc@cjr.nz>,
	Steve French <stfrench@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/4.19 46/46]
 fs/cifs/smbdirect.c:1496:9: error: 'server' undeclared
Message-ID: <202301282126.FFtTwQQU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/4.19
head:   04b5970ec83ad91816c0a693204f60e7de7aece3
commit: 04b5970ec83ad91816c0a693204f60e7de7aece3 [46/46] cifs: Fix oops due to uncleared server->smbd_conn in reconnect
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230128/202301282126.FFtTwQQU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/04b5970ec83ad91816c0a693204f60e7de7aece3
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/4.19
        git checkout 04b5970ec83ad91816c0a693204f60e7de7aece3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/cifs/smbdirect.c:710:17: note: in expansion of macro 'log_rdma_event'
     710 |                 log_rdma_event(ERR, "rdma_resolve_addr() completed %i\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:717:17: note: in expansion of macro 'log_rdma_event'
     717 |                 log_rdma_event(ERR, "rdma_resolve_route() failed %i\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:724:17: note: in expansion of macro 'log_rdma_event'
     724 |                 log_rdma_event(ERR, "rdma_resolve_route() completed %i\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_ia_open':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:762:17: note: in expansion of macro 'log_rdma_event'
     762 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:765:17: note: in expansion of macro 'log_rdma_event'
     765 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:783:17: note: in expansion of macro 'log_rdma_event'
     783 |                 log_rdma_event(ERR, "ib_alloc_pd() returned %d\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_post_send_negotiate_req':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:157:17: note: in expansion of macro 'log_rdma'
     157 |                 log_rdma(level, LOG_RDMA_SEND, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:862:9: note: in expansion of macro 'log_rdma_send'
     862 |         log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
         |         ^~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_create_header':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:151:17: note: in expansion of macro 'log_rdma'
     151 |                 log_rdma(level, LOG_OUTGOING, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:942:17: note: in expansion of macro 'log_outgoing'
     942 |                 log_outgoing(ERR, "disconnected not sending\n");
         |                 ^~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_post_send':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:157:17: note: in expansion of macro 'log_rdma'
     157 |                 log_rdma(level, LOG_RDMA_SEND, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1060:17: note: in expansion of macro 'log_rdma_send'
    1060 |                 log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
         |                 ^~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_post_recv':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:159:17: note: in expansion of macro 'log_rdma'
     159 |                 log_rdma(level, LOG_RDMA_RECV, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1211:17: note: in expansion of macro 'log_rdma_recv'
    1211 |                 log_rdma_recv(ERR, "ib_post_recv failed rc=%d\n", rc);
         |                 ^~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'idle_connection_timer':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:161:17: note: in expansion of macro 'log_rdma'
     161 |                 log_rdma(level, LOG_KEEP_ALIVE, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1466:17: note: in expansion of macro 'log_keep_alive'
    1466 |                 log_keep_alive(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function 'smbd_destroy':
>> fs/cifs/smbdirect.c:1496:9: error: 'server' undeclared (first use in this function)
    1496 |         server->smbd_conn = NULL;
         |         ^~~~~~
   fs/cifs/smbdirect.c:1496:9: note: each undeclared identifier is reported only once for each function it appears in
   fs/cifs/smbdirect.c: In function 'allocate_caches_and_workqueue':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1595:17: note: in expansion of macro 'log_rdma_event'
    1595 |                 log_rdma_event(ERR, "failed to allocate receive buffers\n");
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c: In function '_smbd_get_connection':
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1639:17: note: in expansion of macro 'log_rdma_event'
    1639 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1651:17: note: in expansion of macro 'log_rdma_event'
    1651 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1669:17: note: in expansion of macro 'log_rdma_event'
    1669 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1672:17: note: in expansion of macro 'log_rdma_event'
    1672 |                 log_rdma_event(ERR, "Queue Pair creation may fail\n");
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1675:17: note: in expansion of macro 'log_rdma_event'
    1675 |                 log_rdma_event(ERR,
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1678:17: note: in expansion of macro 'log_rdma_event'
    1678 |                 log_rdma_event(ERR, "Queue Pair creation may fail\n");
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1713:17: note: in expansion of macro 'log_rdma_event'
    1713 |                 log_rdma_event(ERR, "rdma_create_qp failed %i\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1753:17: note: in expansion of macro 'log_rdma_event'
    1753 |                 log_rdma_event(ERR, "rdma_connect() failed with %i\n", rc);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)
         |                 ^~~~~~~~
   fs/cifs/smbdirect.c:1761:17: note: in expansion of macro 'log_rdma_event'
    1761 |                 log_rdma_event(ERR, "rdma_connect failed port=%d\n", port);
         |                 ^~~~~~~~~~~~~~
   fs/cifs/smbdirect.c:146:19: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     146 |         if (level <= smbd_logging_level || class & smbd_logging_class)  \
         |                   ^~
   fs/cifs/smbdirect.c:163:17: note: in expansion of macro 'log_rdma'
     163 |                 log_rdma(level, LOG_RDMA_EVENT, fmt, ##args)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=n] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=y] && MMU [=y]


vim +/server +1496 fs/cifs/smbdirect.c

  1480	
  1481	/* Destroy this SMBD connection, called from upper layer */
  1482	void smbd_destroy(struct smbd_connection *info)
  1483	{
  1484		log_rdma_event(INFO, "destroying rdma session\n");
  1485	
  1486		/* Kick off the disconnection process */
  1487		smbd_disconnect_rdma_connection(info);
  1488	
  1489		log_rdma_event(INFO, "wait for transport being destroyed\n");
  1490		wait_event(info->wait_destroy,
  1491			info->transport_status == SMBD_DESTROYED);
  1492	
  1493		destroy_workqueue(info->workqueue);
  1494		log_rdma_event(INFO,  "rdma session destroyed\n");
  1495		kfree(info);
> 1496		server->smbd_conn = NULL;
  1497	}
  1498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
