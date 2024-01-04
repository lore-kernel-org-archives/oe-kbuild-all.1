Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340E82C842
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coE3Em1z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704404361; x=1735940361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Uuq2ibrOaYShDH6lsaxkXE45KL9PquvSo2/oyY3Mlo=;
  b=coE3Em1znHNlBqSJv7gX0Lw6RowLLRWUHp39yflvObg6Uq6Deb998M+l
   f4KxNO96ClQ+mM38t5bdaj82TtVysy+heMhn+3tMFgX7oFwznQmaAsZP8
   94uYSwZPFnaRAne8DZPl8R9HJ/LucOgkvFhGS8ibM0eGiv3oZ/BBOSAuv
   R3DClhGDHUG7tiE+pGgH8cpKjZ+jmqoN1dm5qnohKQs2dbn/Wjg32YQ0z
   qwXvI4tcLxTq1Wt9bLuG9fTYSdh7yFEm4XI1iZJzs9jUT24ve3b+cLoUo
   IF7er5f4Z4x+DKbPdPu54gqTyS7d7vS8eIL7JMaB8aryRAoYZvTNJg5mG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="382347253"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="382347253"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 13:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="773657014"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="773657014"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Jan 2024 13:39:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLVQq-0000Rs-1p;
	Thu, 04 Jan 2024 21:39:16 +0000
Date: Fri, 5 Jan 2024 05:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 5/9] security/apparmor/lsm.c:1068:
 warning: Excess function parameter 'ptotocol' description in
 'apparmor_socket_post_create'
Message-ID: <202401050531.FTGmGPbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   55a8210c9e7d21ff2644809699765796d4bfb200
commit: 1cba275017352ba887058934d23b5c76a3de62ae [5/9] apparmor: cleanup network hook comments
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240105/202401050531.FTGmGPbh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050531.FTGmGPbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050531.FTGmGPbh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/lsm.c:1068: warning: Function parameter or member 'protocol' not described in 'apparmor_socket_post_create'
>> security/apparmor/lsm.c:1068: warning: Excess function parameter 'ptotocol' description in 'apparmor_socket_post_create'


vim +1068 security/apparmor/lsm.c

56974a6fcfef69 John Johansen 2017-07-18  1051  
56974a6fcfef69 John Johansen 2017-07-18  1052  /**
56974a6fcfef69 John Johansen 2017-07-18  1053   * apparmor_socket_post_create - setup the per-socket security struct
1cba275017352b John Johansen 2023-11-26  1054   * @sock: socket that is being setup
1cba275017352b John Johansen 2023-11-26  1055   * @family: family of socket being created
1cba275017352b John Johansen 2023-11-26  1056   * @type: type of the socket
1cba275017352b John Johansen 2023-11-26  1057   * @ptotocol: protocol of the socket
1cba275017352b John Johansen 2023-11-26  1058   * @kern: socket is a special kernel socket
56974a6fcfef69 John Johansen 2017-07-18  1059   *
56974a6fcfef69 John Johansen 2017-07-18  1060   * Note:
1cba275017352b John Johansen 2023-11-26  1061   * -   kernel sockets labeled kernel_t used to use unconfined
56974a6fcfef69 John Johansen 2017-07-18  1062   * -   socket may not have sk here if created with sock_create_lite or
56974a6fcfef69 John Johansen 2017-07-18  1063   *     sock_alloc. These should be accept cases which will be handled in
56974a6fcfef69 John Johansen 2017-07-18  1064   *     sock_graft.
56974a6fcfef69 John Johansen 2017-07-18  1065   */
56974a6fcfef69 John Johansen 2017-07-18  1066  static int apparmor_socket_post_create(struct socket *sock, int family,
56974a6fcfef69 John Johansen 2017-07-18  1067  				       int type, int protocol, int kern)
56974a6fcfef69 John Johansen 2017-07-18 @1068  {
56974a6fcfef69 John Johansen 2017-07-18  1069  	struct aa_label *label;
56974a6fcfef69 John Johansen 2017-07-18  1070  
56974a6fcfef69 John Johansen 2017-07-18  1071  	if (kern) {
95c0581f9bfdfb John Johansen 2022-05-24  1072  		label = aa_get_label(kernel_t);
56974a6fcfef69 John Johansen 2017-07-18  1073  	} else
56974a6fcfef69 John Johansen 2017-07-18  1074  		label = aa_get_current_label();
56974a6fcfef69 John Johansen 2017-07-18  1075  
56974a6fcfef69 John Johansen 2017-07-18  1076  	if (sock->sk) {
79ddd4a7c5fa88 John Johansen 2023-03-06  1077  		struct aa_sk_ctx *ctx = aa_sock(sock->sk);
56974a6fcfef69 John Johansen 2017-07-18  1078  
56974a6fcfef69 John Johansen 2017-07-18  1079  		aa_put_label(ctx->label);
56974a6fcfef69 John Johansen 2017-07-18  1080  		ctx->label = aa_get_label(label);
56974a6fcfef69 John Johansen 2017-07-18  1081  	}
56974a6fcfef69 John Johansen 2017-07-18  1082  	aa_put_label(label);
56974a6fcfef69 John Johansen 2017-07-18  1083  
56974a6fcfef69 John Johansen 2017-07-18  1084  	return 0;
56974a6fcfef69 John Johansen 2017-07-18  1085  }
56974a6fcfef69 John Johansen 2017-07-18  1086  

:::::: The code at line 1068 was first introduced by commit
:::::: 56974a6fcfef69ee0825bd66ed13e92070ac5224 apparmor: add base infastructure for socket mediation

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
