Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0618495
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695885713; x=1727421713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3Qdg8W5O1t6kW5d0G2Mq7RIeC/vcQkZYPvWq23YyWk=;
  b=L001+ntcjOQtXKmq+umEkwmYHQVq+nCE8DkLNXN2vPz6zVBGqHOSBGY+
   f0TVuvpklRbrUs/o+kSY3Yrn24k/Z6m+3cWCRz6GeE2GEMKXLTkhNbB8H
   c0hW6d8a7S5HKH9QNpvWndjDTY8wUDRzTUsVIanwQlpBBwQrULuwHArll
   dHz0139HtpBqy9UWMSj5uRenreYQKixIw7eYuz4pfQUYhH/XMcxG7McAv
   E0oaa3/no7uufWI6Sddwod0GEbwff9gb6DziYZlkiQF4O0iTC45qtuGJ6
   0BYGLN2Xx96Olm97BDklHu8yp+uMEAEY8bBJt2iamVCZSCrf2VoAYKbRd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="385864843"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="385864843"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 00:21:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923105985"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="923105985"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 00:21:51 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qllLH-0001E9-2G;
	Thu, 28 Sep 2023 07:21:47 +0000
Date: Thu, 28 Sep 2023 15:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <pc@manguebit.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Steve French <stfrench@microsoft.com>
Subject: [arnd-playground:randconfig-6.7-next 2/306]
 fs/smb/client/connect.c:2398:33: warning: variable 'server' set but not used
Message-ID: <202309281515.fj4sYtFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: 71b538aa1551f49b025d8fac4b781ee8912312d0 [2/306] cifs: fix sharing of DFS connections
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309281515.fj4sYtFP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281515.fj4sYtFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281515.fj4sYtFP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/connect.c: In function 'cifs_put_tcon':
>> fs/smb/client/connect.c:2398:33: warning: variable 'server' set but not used [-Wunused-but-set-variable]
    2398 |         struct TCP_Server_Info *server;
         |                                 ^~~~~~


vim +/server +2398 fs/smb/client/connect.c

  2394	
  2395	void
  2396	cifs_put_tcon(struct cifs_tcon *tcon)
  2397	{
> 2398		struct TCP_Server_Info *server;
  2399		struct cifs_ses *ses;
  2400		unsigned int xid;
  2401	
  2402		/*
  2403		 * IPC tcon share the lifetime of their session and are
  2404		 * destroyed in the session put function
  2405		 */
  2406		if (tcon == NULL || tcon->ipc)
  2407			return;
  2408	
  2409		ses = tcon->ses;
  2410		server = ses->server;
  2411		cifs_dbg(FYI, "%s: tc_count=%d\n", __func__, tcon->tc_count);
  2412		spin_lock(&cifs_tcp_ses_lock);
  2413		spin_lock(&tcon->tc_lock);
  2414		if (--tcon->tc_count > 0) {
  2415			spin_unlock(&tcon->tc_lock);
  2416			spin_unlock(&cifs_tcp_ses_lock);
  2417			return;
  2418		}
  2419	
  2420		/* tc_count can never go negative */
  2421		WARN_ON(tcon->tc_count < 0);
  2422	
  2423		list_del_init(&tcon->tcon_list);
  2424		tcon->status = TID_EXITING;
  2425		spin_unlock(&tcon->tc_lock);
  2426		spin_unlock(&cifs_tcp_ses_lock);
  2427	
  2428		/* cancel polling of interfaces */
  2429		cancel_delayed_work_sync(&tcon->query_interfaces);
  2430	#ifdef CONFIG_CIFS_DFS_UPCALL
  2431		cancel_delayed_work_sync(&tcon->dfs_cache_work);
  2432	#endif
  2433	
  2434		if (tcon->use_witness) {
  2435			int rc;
  2436	
  2437			rc = cifs_swn_unregister(tcon);
  2438			if (rc < 0) {
  2439				cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
  2440						__func__, rc);
  2441			}
  2442		}
  2443	
  2444		xid = get_xid();
  2445		if (ses->server->ops->tree_disconnect)
  2446			ses->server->ops->tree_disconnect(xid, tcon);
  2447		_free_xid(xid);
  2448	
  2449		cifs_fscache_release_super_cookie(tcon);
  2450		tconInfoFree(tcon);
  2451		cifs_put_smb_ses(ses);
  2452	}
  2453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
