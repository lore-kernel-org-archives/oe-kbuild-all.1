Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792920DC4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 22:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717972481; cv=none; b=VevhltBVRK2pFdxyO2Az1QZL3V8SBt+2iGHCAHBkTeDgWKkcd2OTbyn2nFPeCdtAqaNy4WqDJ1gsds/4GAuMpi+5wNaz5VF8TjOxTG2J25Or+rvHwocNlfqKEa8Cme9U5d1tFzq+Re/AMO0v4hhEInEuisBxC1YjHjVx2+PqCaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717972481; c=relaxed/simple;
	bh=0SXNMdHlkbVg4dTocEcUUETdUgZHx6Lrn5xblAfhdqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GzQwO5n2PVDpku01NIFw6CdK+maOvFa74oG8yEBUh0/vey8NPIhR4+dLOwPRnZOakcBY59E9fg2BCGBxXY6kmZ+jxiQoA+X7FQ+dd53XSBtc8jI6tLvFH3vDeI1jQnQKTC9ZrPJKy4SvKw1ebQdHMBixF1Ume5WSoxI1A2Ug3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8DTnyiS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8DTnyiS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717972479; x=1749508479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0SXNMdHlkbVg4dTocEcUUETdUgZHx6Lrn5xblAfhdqg=;
  b=H8DTnyiSvn2dBtGTfbIfE2obU7m9B5Wnmhs2YblDWpS3rF/08BJWwSZC
   tBSbg14QNe7tpee/AzWtCjPM6eNd5rMT2DueOzEgivi3Z1UeFfX/Lmfum
   R32zLMXrXjK7uFya0/DYvqNwJEsnlZseRtUM6Fg4GP1H81hnRKlc99RWH
   A8B+DgRo5MkMeakefdH1C8sHhbb/ylkiSzYSAePezuRPBo+h8pm/Ib/Bq
   cNVvZShragwg3LnVxr+t7SF924RuwbGsY9XjdxsrMJkxyd0gunH+BCpyk
   p3+ARlfCXSRp0AjDbrXN4jObIE9ZvHspFAqrbXxWRRGzVmi30cUHMthlA
   A==;
X-CSE-ConnectionGUID: 0Y9H3EAqRHykTZJe4hineg==
X-CSE-MsgGUID: enxeXi+hTE2c0v4kmHy4JA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14803226"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14803226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 15:34:39 -0700
X-CSE-ConnectionGUID: w9QFKjuLS3utGq9kNg4qsQ==
X-CSE-MsgGUID: 8cy84ZhURfqyKRhZxFTPBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43314161"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2024 15:34:37 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGR7T-0001eI-17;
	Sun, 09 Jun 2024 22:34:35 +0000
Date: Mon, 10 Jun 2024 06:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Winston Wen <wentao@uniontech.com>,
	Paulo Alcantara <pc@manguebit.com>
Subject: [samba-ksmbd:for-next 462/600] fs/cifs/connect.c:2304:49: warning:
 passing argument 1 of 'load_nls' discards 'const' qualifier from pointer
 target type
Message-ID: <202406100635.EHsbq8pU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   3fe4ba20003290acf0547625cccc34db928d156e
commit: 210478bd8268be0166a31bdacb90baf59d46c479 [462/600] cifs: fix charset issue in reconnection
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240610/202406100635.EHsbq8pU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100635.EHsbq8pU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100635.EHsbq8pU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/cifs/connect.c:35:
   fs/cifs/cifspdu.h:512:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     512 |                 DECLARE_FLEX_ARRAY(unsigned char, EncryptionKey);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2289:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2289 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2328:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2328 |         DECLARE_FLEX_ARRAY(char, LinkDest);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2377:9: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2377 |         DECLARE_FLEX_ARRAY(__u8, alt_name);
         |         ^~~~~~~~~~~~~~~~~~
   fs/cifs/cifspdu.h:2488:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    2488 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from fs/cifs/cifsglob.h:26,
                    from fs/cifs/connect.c:36:
   fs/cifs/../smbfs_common/smb2pdu.h:818:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
     818 |                 DECLARE_FLEX_ARRAY(struct smb2_lock_element, locks);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/../smbfs_common/smb2pdu.h:1638:17: error: expected specifier-qualifier-list before 'DECLARE_FLEX_ARRAY'
    1638 |                 DECLARE_FLEX_ARRAY(char, FileName);
         |                 ^~~~~~~~~~~~~~~~~~
   fs/cifs/connect.c: In function 'cifs_get_smb_ses':
>> fs/cifs/connect.c:2304:49: warning: passing argument 1 of 'load_nls' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2304 |         ses->local_nls = load_nls(ctx->local_nls->charset);
         |                                   ~~~~~~~~~~~~~~^~~~~~~~~
   In file included from fs/cifs/cifsproto.h:10,
                    from fs/cifs/connect.c:37:
   include/linux/nls.h:50:35: note: expected 'char *' but argument is of type 'const char *'
      50 | extern struct nls_table *load_nls(char *);
         |                                   ^~~~~~


vim +2304 fs/cifs/connect.c

  2201	
  2202	/**
  2203	 * cifs_get_smb_ses - get a session matching @ctx data from @server
  2204	 * @server: server to setup the session to
  2205	 * @ctx: superblock configuration context to use to setup the session
  2206	 *
  2207	 * This function assumes it is being called from cifs_mount() where we
  2208	 * already got a server reference (server refcount +1). See
  2209	 * cifs_get_tcon() for refcount explanations.
  2210	 */
  2211	struct cifs_ses *
  2212	cifs_get_smb_ses(struct TCP_Server_Info *server, struct smb3_fs_context *ctx)
  2213	{
  2214		int rc = 0;
  2215		unsigned int xid;
  2216		struct cifs_ses *ses;
  2217		struct sockaddr_in *addr = (struct sockaddr_in *)&server->dstaddr;
  2218		struct sockaddr_in6 *addr6 = (struct sockaddr_in6 *)&server->dstaddr;
  2219	
  2220		xid = get_xid();
  2221	
  2222		ses = cifs_find_smb_ses(server, ctx);
  2223		if (ses) {
  2224			cifs_dbg(FYI, "Existing smb sess found (status=%d)\n",
  2225				 ses->ses_status);
  2226	
  2227			spin_lock(&ses->chan_lock);
  2228			if (cifs_chan_needs_reconnect(ses, server)) {
  2229				spin_unlock(&ses->chan_lock);
  2230				cifs_dbg(FYI, "Session needs reconnect\n");
  2231	
  2232				mutex_lock(&ses->session_mutex);
  2233				rc = cifs_negotiate_protocol(xid, ses, server);
  2234				if (rc) {
  2235					mutex_unlock(&ses->session_mutex);
  2236					/* problem -- put our ses reference */
  2237					cifs_put_smb_ses(ses);
  2238					free_xid(xid);
  2239					return ERR_PTR(rc);
  2240				}
  2241	
  2242				rc = cifs_setup_session(xid, ses, server,
  2243							ctx->local_nls);
  2244				if (rc) {
  2245					mutex_unlock(&ses->session_mutex);
  2246					/* problem -- put our reference */
  2247					cifs_put_smb_ses(ses);
  2248					free_xid(xid);
  2249					return ERR_PTR(rc);
  2250				}
  2251				mutex_unlock(&ses->session_mutex);
  2252	
  2253				spin_lock(&ses->chan_lock);
  2254			}
  2255			spin_unlock(&ses->chan_lock);
  2256	
  2257			/* existing SMB ses has a server reference already */
  2258			cifs_put_tcp_session(server, 0);
  2259			free_xid(xid);
  2260			return ses;
  2261		}
  2262	
  2263		rc = -ENOMEM;
  2264	
  2265		cifs_dbg(FYI, "Existing smb sess not found\n");
  2266		ses = sesInfoAlloc();
  2267		if (ses == NULL)
  2268			goto get_ses_fail;
  2269	
  2270		/* new SMB session uses our server ref */
  2271		ses->server = server;
  2272		if (server->dstaddr.ss_family == AF_INET6)
  2273			sprintf(ses->ip_addr, "%pI6", &addr6->sin6_addr);
  2274		else
  2275			sprintf(ses->ip_addr, "%pI4", &addr->sin_addr);
  2276	
  2277		if (ctx->username) {
  2278			ses->user_name = kstrdup(ctx->username, GFP_KERNEL);
  2279			if (!ses->user_name)
  2280				goto get_ses_fail;
  2281		}
  2282	
  2283		/* ctx->password freed at unmount */
  2284		if (ctx->password) {
  2285			ses->password = kstrdup(ctx->password, GFP_KERNEL);
  2286			if (!ses->password)
  2287				goto get_ses_fail;
  2288		}
  2289		if (ctx->domainname) {
  2290			ses->domainName = kstrdup(ctx->domainname, GFP_KERNEL);
  2291			if (!ses->domainName)
  2292				goto get_ses_fail;
  2293		}
  2294	
  2295		strscpy(ses->workstation_name, ctx->workstation_name, sizeof(ses->workstation_name));
  2296	
  2297		if (ctx->domainauto)
  2298			ses->domainAuto = ctx->domainauto;
  2299		ses->cred_uid = ctx->cred_uid;
  2300		ses->linux_uid = ctx->linux_uid;
  2301	
  2302		ses->sectype = ctx->sectype;
  2303		ses->sign = ctx->sign;
> 2304		ses->local_nls = load_nls(ctx->local_nls->charset);
  2305	
  2306		/* add server as first channel */
  2307		spin_lock(&ses->chan_lock);
  2308		ses->chans[0].server = server;
  2309		ses->chan_count = 1;
  2310		ses->chan_max = ctx->multichannel ? ctx->max_channels:1;
  2311		ses->chans_need_reconnect = 1;
  2312		spin_unlock(&ses->chan_lock);
  2313	
  2314		mutex_lock(&ses->session_mutex);
  2315		rc = cifs_negotiate_protocol(xid, ses, server);
  2316		if (!rc)
  2317			rc = cifs_setup_session(xid, ses, server, ctx->local_nls);
  2318		mutex_unlock(&ses->session_mutex);
  2319	
  2320		/* each channel uses a different signing key */
  2321		spin_lock(&ses->chan_lock);
  2322		memcpy(ses->chans[0].signkey, ses->smb3signingkey,
  2323		       sizeof(ses->smb3signingkey));
  2324		spin_unlock(&ses->chan_lock);
  2325	
  2326		if (rc)
  2327			goto get_ses_fail;
  2328	
  2329		/*
  2330		 * success, put it on the list and add it as first channel
  2331		 * note: the session becomes active soon after this. So you'll
  2332		 * need to lock before changing something in the session.
  2333		 */
  2334		spin_lock(&cifs_tcp_ses_lock);
  2335		ses->dfs_root_ses = ctx->dfs_root_ses;
  2336		if (ses->dfs_root_ses)
  2337			ses->dfs_root_ses->ses_count++;
  2338		list_add(&ses->smb_ses_list, &server->smb_ses_list);
  2339		spin_unlock(&cifs_tcp_ses_lock);
  2340	
  2341		cifs_setup_ipc(ses, ctx);
  2342	
  2343		free_xid(xid);
  2344	
  2345		return ses;
  2346	
  2347	get_ses_fail:
  2348		sesInfoFree(ses);
  2349		free_xid(xid);
  2350		return ERR_PTR(rc);
  2351	}
  2352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
