Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7D174ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688149421; x=1719685421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zsCCZrCXkNpXoIxGNB30hbco0QxTBRpb3JZthqoqlBM=;
  b=ATbODE+OmV88/AK+rwjf2ZwDBPnJ5rpSB7AS7H/FRu5xtNvPG2Cw2jZt
   oTwx3BFe6h+qlwOF8on37kMttw0t5O31Q9037k7fNlsLOQ51QQiTvqOL8
   9DvCRA3HlJ4yBPBqPXAa82GUixZCFzZm+8/kDsWDbXUaVPuZPZnzhmPGn
   TpRl++/wB6zI1vu+BkSg/VEHEP4gDmJKoLk8EZyDOWVyZqKVgw2DQIhkL
   qDcrKZCYzAaBIaJ58eIEL9JXktU+BbIIBheUypufmUWaAXtH8XKVwi+5p
   aUHqgI8fjQJhXsDOQDh54f+WhRd6YtypDK9kAlHsu0gWSSREOOteJbjlD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365947326"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="365947326"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 11:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="787800665"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="787800665"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jun 2023 11:23:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFImQ-000FFZ-2A;
	Fri, 30 Jun 2023 18:23:38 +0000
Date: Sat, 1 Jul 2023 02:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 17253/29940]
 security/selinux/ss/services.c:2304:17: warning: variable 'sidtab' set but
 not used
Message-ID: <202307010225.9J21iCDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: 45319d01102b06152cb38abcc1cf9d09b2fe8046 [17253/29940] UPSTREAM: selinux: sidtab reverse lookup hash table
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230701/202307010225.9J21iCDh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010225.9J21iCDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010225.9J21iCDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/selinux/ss/services.c: In function 'security_port_sid':
>> security/selinux/ss/services.c:2304:17: warning: variable 'sidtab' set but not used [-Wunused-but-set-variable]
     struct sidtab *sidtab;
                    ^~~~~~
   security/selinux/ss/services.c: In function 'security_ib_endport_sid':
   security/selinux/ss/services.c:2393:17: warning: variable 'sidtab' set but not used [-Wunused-but-set-variable]
     struct sidtab *sidtab;
                    ^~~~~~
   security/selinux/ss/services.c: In function 'security_netif_sid':
   security/selinux/ss/services.c:2438:17: warning: variable 'sidtab' set but not used [-Wunused-but-set-variable]
     struct sidtab *sidtab;
                    ^~~~~~
   security/selinux/ss/services.c: In function 'security_fs_use':
   security/selinux/ss/services.c:2789:17: warning: variable 'sidtab' set but not used [-Wunused-but-set-variable]
     struct sidtab *sidtab;
                    ^~~~~~


vim +/sidtab +2304 security/selinux/ss/services.c

cee74f47a6baba Eric Paris        2010-10-13  2293  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2294  /**
^1da177e4c3f41 Linus Torvalds    2005-04-16  2295   * security_port_sid - Obtain the SID for a port.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2296   * @protocol: protocol number
^1da177e4c3f41 Linus Torvalds    2005-04-16  2297   * @port: port number
^1da177e4c3f41 Linus Torvalds    2005-04-16  2298   * @out_sid: security identifier
^1da177e4c3f41 Linus Torvalds    2005-04-16  2299   */
b86e8759d93cce Stephen Smalley   2018-03-01  2300  int security_port_sid(struct selinux_state *state,
b86e8759d93cce Stephen Smalley   2018-03-01  2301  		      u8 protocol, u16 port, u32 *out_sid)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2302  {
b86e8759d93cce Stephen Smalley   2018-03-01  2303  	struct policydb *policydb;
b86e8759d93cce Stephen Smalley   2018-03-01 @2304  	struct sidtab *sidtab;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2305  	struct ocontext *c;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2306  	int rc = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2307  
b86e8759d93cce Stephen Smalley   2018-03-01  2308  	read_lock(&state->ss->policy_rwlock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2309  
b86e8759d93cce Stephen Smalley   2018-03-01  2310  	policydb = &state->ss->policydb;
b134d23d3db00b Ondrej Mosnacek   2018-11-30  2311  	sidtab = state->ss->sidtab;
b86e8759d93cce Stephen Smalley   2018-03-01  2312  
b86e8759d93cce Stephen Smalley   2018-03-01  2313  	c = policydb->ocontexts[OCON_PORT];
^1da177e4c3f41 Linus Torvalds    2005-04-16  2314  	while (c) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2315  		if (c->u.port.protocol == protocol &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  2316  		    c->u.port.low_port <= port &&
^1da177e4c3f41 Linus Torvalds    2005-04-16  2317  		    c->u.port.high_port >= port)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2318  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2319  		c = c->next;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2320  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2321  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2322  	if (c) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2323  		if (!c->sid[0]) {
45319d01102b06 Jeff Vander Stoep 2019-11-22  2324  			rc = context_struct_to_sid(state, &c->context[0],
^1da177e4c3f41 Linus Torvalds    2005-04-16  2325  						   &c->sid[0]);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2326  			if (rc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2327  				goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2328  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2329  		*out_sid = c->sid[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  2330  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2331  		*out_sid = SECINITSID_PORT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2332  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2333  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2334  out:
b86e8759d93cce Stephen Smalley   2018-03-01  2335  	read_unlock(&state->ss->policy_rwlock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2336  	return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2337  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  2338  

:::::: The code at line 2304 was first introduced by commit
:::::: b86e8759d93cce8d89d227760e464fcc7f3f1370 BACKPORT: selinux: wrap global selinux state

:::::: TO: Stephen Smalley <sds@tycho.nsa.gov>
:::::: CC: Jeffrey Vander Stoep <jeffv@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
