Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0713C3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt/QBFu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698479056; x=1730015056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6n2/eYZVwViWxgG7CGUaYpv2CFtVzK9OgYaqBJ+50s=;
  b=Bt/QBFu1wcp3+KW5RYU7SBjiTK2Pjcr6N9njC8kS/lAnGc6WMfV8SkU6
   LpnB0tttRZh6w8Cb8F99NK+aX5VfyiW5iz7JpvttCNLCmJgxjuO1v7GWy
   QGjAvnBCn2XzYxSDfER0JulgKlfFv9yphuykUd80xR5rr87r6xr1hYOPP
   zFUG5yP8kzHQceiP4SxoR0GdQ+qTBNXKzaY/xo4SMLkvdFoRaIfyLRejr
   c/ob47x2KjNi6onAGMejx5XoE0MX7PPu6i+3HOZNTVo7kvUhQpf1dWrAe
   wA8uDZum40EqC6lSA8EZ4MusnK74fDj4JDMdKLGoQRKKCaSfMA4CDGKZ5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="682960"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="682960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 00:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="903506550"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; 
   d="scan'208";a="903506550"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2023 00:41:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwdzP-000BYt-2t;
	Sat, 28 Oct 2023 07:44:11 +0000
Date: Sat, 28 Oct 2023 15:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <pc@manguebit.com>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Steve French <stfrench@microsoft.com>
Subject: [arnd-playground:randconfig-6.7 2/325]
 fs/smb/client/connect.c:2398:33: warning: variable 'server' set but not used
Message-ID: <202310281536.PVTiJNE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7
head:   c9ecd45768d19a28da1d81e19ab3663828a4fec1
commit: b34e0b8be31c8139e90340d4eec0c0b15862b70a [2/325] cifs: fix sharing of DFS connections
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231028/202310281536.PVTiJNE4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281536.PVTiJNE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281536.PVTiJNE4-lkp@intel.com/

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
