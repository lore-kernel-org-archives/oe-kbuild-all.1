Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33B53A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718500449; cv=none; b=gSSuAIG0JiF4t3ue9Mn7NGw+jOf0QfmuPdJVaZh08vRcqB/VEwcIPKhdojlKBiyakX7hYSiqABAbvh3vQPBAUDAW8CZDyubFK86QpCSUBSwHcCnj9C5Z9WljGF9wbFqr6+K6keGUHw9RuK2ZR91v+s82ZBJZsHTlsCKCnG8aM2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718500449; c=relaxed/simple;
	bh=YmcRsVPE+SKTtfmTSvmVZVTeJrnyqEuZtnP3mmE0aNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOldB8+6oV5ODWwyEXPPQ9+Hox+fxkQB7ZT45mKRvk4yz41+oYPmoDhFScpggWaM+R9Na3kadT9R3Z69E4yq83tk3o4E16o2FBgVqSgVH1WnGC5LQklBawOVOtL4VCeqNxETaVRn6644uaOZ20U/uFf+H2OmG404HhOIJ0LDP/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3tmhb2t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3tmhb2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718500447; x=1750036447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmcRsVPE+SKTtfmTSvmVZVTeJrnyqEuZtnP3mmE0aNk=;
  b=a3tmhb2tfAwTopgiSiyvEt0lRYYnWDiYlzZz1fjOg0uP5aW63VukBgFF
   lF5YvoB2ZUhyvmlnwvTpluMplFtBMxb0XubSFfsNfTlSLQimrUuZx0ik3
   52tIYG66kEQ1pSCrpSiHETA1yXa2QDCbYbrMV9a0xolqcBv4PTgQtQFEh
   ewpXyRW1CPEE9B2GkO2CjNVSNL84XianDZUw4s3KbtkTDO1TT6hPIvtJG
   WLBPKJY6E2l9CmFRSlrgRkMrsONcTHHKN8PAVG/4Jpem1hDw422Gao7EP
   cL5s8swNx3VagORxneFM2/IYlljT4A51OalI8A/sK8C4mHUUl0mxcWOVy
   w==;
X-CSE-ConnectionGUID: 17ua+fLeRF+jUFfMzYojyA==
X-CSE-MsgGUID: 1yNWNrdeS/e5TlWyj5EqMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19147413"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="19147413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 18:14:06 -0700
X-CSE-ConnectionGUID: QnRs7oD4QMuvL9O2rDvAwg==
X-CSE-MsgGUID: ZPyW4EzORviTlzILVRP+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40715310"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2024 18:14:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIeT5-0000gG-1S;
	Sun, 16 Jun 2024 01:14:03 +0000
Date: Sun, 16 Jun 2024 09:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11 10/18] fs/nfs/internal.h:464:14:
 warning: variable 'supported' set but not used
Message-ID: <202406160929.IL54LGrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   f9ea1e47a8aea89bbafd64779ba1280308029425
commit: 2ee1065487f33a5c39677ce54ca9f6740045c28e [10/18] nfs: implement v3 and v4 client support for NFS_LOCALIO_PROGRAM
config: sparc-randconfig-002-20240616 (https://download.01.org/0day-ci/archive/20240616/202406160929.IL54LGrq-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160929.IL54LGrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160929.IL54LGrq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/nfs4proc.c:61:
   fs/nfs/internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_create_session':
   fs/nfs/nfs4proc.c:9308:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9308 |         unsigned *ptr;
         |                   ^~~
--
   In file included from fs/nfs/direct.c:59:
   fs/nfs/internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~
--
   In file included from fs/nfs/localio.c:26:
   fs/nfs/internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~
   fs/nfs/localio.c: In function 'nfs_local_probe':
   fs/nfs/localio.c:295:49: error: 'net' undeclared (first use in this function)
     295 |                     !nfsd_uuid_is_local(&uuid, &net))
         |                                                 ^~~
   fs/nfs/localio.c:295:49: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/localio.c:295:22: error: too many arguments to function 'nfsd_uuid_is_local'
     295 |                     !nfsd_uuid_is_local(&uuid, &net))
         |                      ^~~~~~~~~~~~~~~~~~
   In file included from fs/nfs/localio.c:18:
   include/linux/nfslocalio.h:27:6: note: declared here
      27 | bool nfsd_uuid_is_local(const uuid_t *uuid);
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from fs/nfs/flexfilelayout/flexfilelayoutdev.c:15:
   fs/nfs/flexfilelayout/../internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/flexfilelayout/../internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayoutdev.c: In function 'nfs4_ff_alloc_deviceid_node':
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^~~
--
   In file included from fs/nfs/flexfilelayout/flexfilelayout.c:22:
   fs/nfs/flexfilelayout/../internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/flexfilelayout/../internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_io_track_ds_error':
   fs/nfs/flexfilelayout/flexfilelayout.c:1290:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1290 |         int err;
         |             ^~~
--
   In file included from fs/nfs/filelayout/filelayoutdev.c:35:
   fs/nfs/filelayout/../internal.h: In function 'nfs_init_localioclient':
>> fs/nfs/filelayout/../internal.h:464:14: warning: variable 'supported' set but not used [-Wunused-but-set-variable]
     464 |         bool supported = false;
         |              ^~~~~~~~~


vim +/supported +464 fs/nfs/internal.h

   454	
   455	#if IS_ENABLED(CONFIG_NFS_LOCALIO)
   456	/*
   457	 * Initialise an NFS localio client connection.
   458	 * Inlined here to allow nfs[34]client.c to share this code.
   459	 */
   460	static __always_inline void
   461	nfs_init_localioclient(struct nfs_client *clp,
   462			       const struct rpc_program *program, u32 vers)
   463	{
 > 464		bool supported = false;
   465	
   466		if (unlikely(!IS_ERR(clp->cl_rpcclient_localio))) {
   467			supported = true;
   468			goto out;
   469		}
   470		clp->cl_rpcclient_localio = rpc_bind_new_program(clp->cl_rpcclient,
   471								program, vers);
   472		if (IS_ERR(clp->cl_rpcclient_localio))
   473			goto out;
   474		/* No errors! Assume that localio is supported */
   475		supported = true;
   476	out:
   477		dfprintk_rcu(CLIENT, "%s: server (%s) %s NFS v%u LOCALIO\n", __func__,
   478			rpc_peeraddr2str(clp->cl_rpcclient, RPC_DISPLAY_ADDR),
   479			(supported ? "supports" : "does not support"), vers);
   480	}
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
