Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F92A32
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012782; x=1725548782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+FtahkMoRWKt+0gUQXFiqmznxqodBqp01BmX+Ro+YPY=;
  b=fn0dxLFDy4z8RP54DfN49mnaiUapjKbygStPt/lbHAdJwRR1eAQJDc2o
   srblPdyaDck4sX4hhPydMOUtq0wnuLNQ/otSwoQ0WjRolCmbCLRnrKlNA
   qJwFKP39Axnq0+gmR7vCY367klXvKjV0lC6EsJffKMaPSu8XlVCCNRwN7
   aEE8hN73wCEUK/2bFLQUM/hZQ+/A737tK8f80B+UEHjiXreJMWSkJKDHI
   vlga5lrsnbxh8o1Wtg1giiW7rBRk/Q42uLrmEortXGSrkugJfNyYviow4
   nF/R74RmwzIRozkp4vk/zJRCHjM7N4oCG5R2wMq6tm1r1kKUvnkzPp6bW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443478253"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="443478253"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865171163"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="865171163"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Sep 2023 08:06:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdu6f-0000Jd-1N;
	Wed, 06 Sep 2023 15:06:13 +0000
Date: Wed, 6 Sep 2023 23:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.5 10/13] net/9p/trans_fd.c:555: warning:
 Function parameter or member 'unused' not described in 'p9_pollwait'
Message-ID: <202309062253.7duSNXGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 [10/13] waitfd: new syscall implementing waitpid() over fds
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309062253.7duSNXGN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062253.7duSNXGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062253.7duSNXGN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1570:2: warning: #warning syscall waitfd not implemented [-Wcpp]
--
>> net/9p/trans_fd.c:555: warning: Function parameter or member 'unused' not described in 'p9_pollwait'
--
>> <stdin>:1570:2: warning: #warning syscall waitfd not implemented [-Wcpp]
--
>> <stdin>:1570:2: warning: #warning syscall waitfd not implemented [-Wcpp]


vim +555 net/9p/trans_fd.c

8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  542  
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  543  /**
5503ac56599883 Eric Van Hensbergen 2008-10-13  544   * p9_pollwait - add poll task to the wait queue
5503ac56599883 Eric Van Hensbergen 2008-10-13  545   * @filp: file pointer being polled
5503ac56599883 Eric Van Hensbergen 2008-10-13  546   * @wait_address: wait_q to block on
5503ac56599883 Eric Van Hensbergen 2008-10-13  547   * @p: poll state
ee443996a35c1e Eric Van Hensbergen 2008-03-05  548   *
5503ac56599883 Eric Van Hensbergen 2008-10-13  549   * called by files poll operation to add v9fs-poll task to files wait queue
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  550   */
ee443996a35c1e Eric Van Hensbergen 2008-03-05  551  
5503ac56599883 Eric Van Hensbergen 2008-10-13  552  static void
051cfd21028071 Nick Alcock         2018-11-14  553  p9_pollwait(struct file *filp, wait_queue_head_t *wait_address, poll_table *p,
051cfd21028071 Nick Alcock         2018-11-14  554  	    unsigned long unused)
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06 @555  {
5503ac56599883 Eric Van Hensbergen 2008-10-13  556  	struct p9_conn *m = container_of(p, struct p9_conn, pt);
5503ac56599883 Eric Van Hensbergen 2008-10-13  557  	struct p9_poll_wait *pwait = NULL;
5503ac56599883 Eric Van Hensbergen 2008-10-13  558  	int i;
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  559  
5503ac56599883 Eric Van Hensbergen 2008-10-13  560  	for (i = 0; i < ARRAY_SIZE(m->poll_wait); i++) {
5503ac56599883 Eric Van Hensbergen 2008-10-13  561  		if (m->poll_wait[i].wait_addr == NULL) {
5503ac56599883 Eric Van Hensbergen 2008-10-13  562  			pwait = &m->poll_wait[i];
5503ac56599883 Eric Van Hensbergen 2008-10-13  563  			break;
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  564  		}
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  565  	}
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  566  
5503ac56599883 Eric Van Hensbergen 2008-10-13  567  	if (!pwait) {
5d3851530d6d68 Joe Perches         2011-11-28  568  		p9_debug(P9_DEBUG_ERROR, "not enough wait_address slots\n");
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  569  		return;
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  570  	}
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  571  
5503ac56599883 Eric Van Hensbergen 2008-10-13  572  	pwait->conn = m;
5503ac56599883 Eric Van Hensbergen 2008-10-13  573  	pwait->wait_addr = wait_address;
5503ac56599883 Eric Van Hensbergen 2008-10-13  574  	init_waitqueue_func_entry(&pwait->wait, p9_pollwake);
5503ac56599883 Eric Van Hensbergen 2008-10-13  575  	add_wait_queue(wait_address, &pwait->wait);
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  576  }
8a0dc95fd976a0 Eric Van Hensbergen 2008-02-06  577  

:::::: The code at line 555 was first introduced by commit
:::::: 8a0dc95fd976a052e5e799ef33e6c8e3141b5dff 9p: transport API reorganization

:::::: TO: Eric Van Hensbergen <ericvh@opteron.homeip.net>
:::::: CC: Eric Van Hensbergen <ericvh@opteron.homeip.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
