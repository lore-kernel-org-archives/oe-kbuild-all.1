Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C54022F177
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605614; cv=none; b=IpW8B79c01HndtkFI7CHtJxFNxg8I4fS+xguY9Lv9qhpcV4VkY5hVKy7GmTkZymjaicn4SeAnrEdyt9aU5jKcAf/OvTrMlW8jmZc9AP1c4DGCQcx8g25vaXxk7Z2up7ezvhtD09k9I/IfrYIETB2w6pakGONmFocy/ZThZ5NzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605614; c=relaxed/simple;
	bh=8kxyN1/N5WjxObH+DYfP0z3G0aHQ0+O3Q0Q+89dr6Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulMRIC/7ymj345WDFsGITUCquATleWDFaIEhdHGlkVdxzHnrgSi3thAd+o9pYrAMk0IoF8dpITZbmMeFj+7wPS4fZfPFPSoOa71vwXqBNixTwBOJJxdCoBbUiqxda8wrtpOi7G118ivm0dbLngu82+kKWTEqNmKfNoIKG5DLXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRjp1Urb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRjp1Urb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765605610; x=1797141610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kxyN1/N5WjxObH+DYfP0z3G0aHQ0+O3Q0Q+89dr6Kc=;
  b=kRjp1Urb9hq8NNO4k4R4Aw66FwFpcW0rtAA/MsHiSfiZBqReNOrq7lML
   tIf98I1ZA7VbCAG4vrPrRv3hMOGuodynLZeYuoXQIc5zS2eFFKuNIXjV7
   vk/ODvj1/DHkSD/Uh1CyCMAanIX9SotXiHgnyuv1MaEBS+c/NRgs92Mu9
   9XIPCsQGqB1Bd6MVNNw7baAlQdX9cLU17cwed/f1k2bqt9yQ8pOAYOLmG
   nKcinxdnd0i58suKUO9gUPRgjX/2/SOxsBZ+UDu3gSlZfAD9coLStxGUK
   8Ys/jPJVAAAD3Eb6cfZ/TYF1S0rc3bYugLVOBTZHCAIfZLSZxYorfSw2i
   w==;
X-CSE-ConnectionGUID: kAaXV7vfS+24eOYj/Mwv0w==
X-CSE-MsgGUID: JpunYMZIRQqn0nBUyLd5uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67479172"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67479172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:00:08 -0800
X-CSE-ConnectionGUID: XgmBP6FDRbSHB7LbcAK8mA==
X-CSE-MsgGUID: NLwW2BY8SPKqrlPyYysyow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201749920"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 22:00:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUIfk-0000000078b-1Cp7;
	Sat, 13 Dec 2025 06:00:04 +0000
Date: Sat, 13 Dec 2025 13:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Lingfeng <lilingfeng3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] fs/nfs/nfs4state.c:1959:20:
 warning: this statement may fall through
Message-ID: <202512131318.6WaJp6sm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: e0266694b581d23df8040ccfa9b7b25e4545e25e [1941/1941] NFSv4: Fail mounts if the lease setup times out
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131318.6WaJp6sm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131318.6WaJp6sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131318.6WaJp6sm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sunrpc/sched.h:19,
                    from include/linux/sunrpc/auth.h:15,
                    from include/linux/nfs_fs.h:31,
                    from fs/nfs/nfs4state.c:44:
   include/linux/sunrpc/xdr.h: In function 'xdr_stream_decode_uint32_array':
   include/linux/sunrpc/xdr.h:512:17: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     512 |         if (len > SIZE_MAX / sizeof(*p))
         |                 ^
   fs/nfs/nfs4state.c: In function 'nfs4_handle_reclaim_lease_error':
>> fs/nfs/nfs4state.c:1959:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1959 |                 if (clp->cl_cons_state == NFS_CS_SESSION_INITING) {
         |                    ^
   fs/nfs/nfs4state.c:1963:9: note: here
    1963 |         case -EACCES:
         |         ^~~~
   fs/nfs/nfs4state.c:580: warning: Function parameter or member 'gfp_flags' not described in 'nfs4_get_state_owner'


vim +1959 fs/nfs/nfs4state.c

  1934	
  1935	/* Set NFS4CLNT_LEASE_EXPIRED and reclaim reboot state for all v4.0 errors
  1936	 * and for recoverable errors on EXCHANGE_ID for v4.1
  1937	 */
  1938	static int nfs4_handle_reclaim_lease_error(struct nfs_client *clp, int status)
  1939	{
  1940		switch (status) {
  1941		case -NFS4ERR_SEQ_MISORDERED:
  1942			if (test_and_set_bit(NFS4CLNT_PURGE_STATE, &clp->cl_state))
  1943				return -ESERVERFAULT;
  1944			/* Lease confirmation error: retry after purging the lease */
  1945			ssleep(1);
  1946			clear_bit(NFS4CLNT_LEASE_CONFIRM, &clp->cl_state);
  1947			break;
  1948		case -NFS4ERR_STALE_CLIENTID:
  1949			clear_bit(NFS4CLNT_LEASE_CONFIRM, &clp->cl_state);
  1950			nfs4_state_start_reclaim_reboot(clp);
  1951			break;
  1952		case -NFS4ERR_CLID_INUSE:
  1953			pr_err("NFS: Server %s reports our clientid is in use\n",
  1954				clp->cl_hostname);
  1955			nfs_mark_client_ready(clp, -EPERM);
  1956			clear_bit(NFS4CLNT_LEASE_CONFIRM, &clp->cl_state);
  1957			return -EPERM;
  1958		case -ETIMEDOUT:
> 1959			if (clp->cl_cons_state == NFS_CS_SESSION_INITING) {
  1960				nfs_mark_client_ready(clp, -EIO);
  1961				return -EIO;
  1962			}
  1963		case -EACCES:
  1964		case -NFS4ERR_DELAY:
  1965		case -EAGAIN:
  1966			ssleep(1);
  1967			break;
  1968	
  1969		case -NFS4ERR_MINOR_VERS_MISMATCH:
  1970			if (clp->cl_cons_state == NFS_CS_SESSION_INITING)
  1971				nfs_mark_client_ready(clp, -EPROTONOSUPPORT);
  1972			dprintk("%s: exit with error %d for server %s\n",
  1973					__func__, -EPROTONOSUPPORT, clp->cl_hostname);
  1974			return -EPROTONOSUPPORT;
  1975		case -NFS4ERR_NOT_SAME: /* FixMe: implement recovery
  1976					 * in nfs4_exchange_id */
  1977		default:
  1978			dprintk("%s: exit with error %d for server %s\n", __func__,
  1979					status, clp->cl_hostname);
  1980			return status;
  1981		}
  1982		set_bit(NFS4CLNT_LEASE_EXPIRED, &clp->cl_state);
  1983		dprintk("%s: handled error %d for server %s\n", __func__, status,
  1984				clp->cl_hostname);
  1985		return 0;
  1986	}
  1987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
