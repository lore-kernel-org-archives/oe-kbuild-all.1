Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A371D0B98
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727887336; cv=none; b=rn13eIfrMbxtNrU9si0fB7++PZDTzaVX+o/FOzwfbg6naLQwZQQAItDScJ4bgzrDdTBNzCILOT/Z8zWQMxScRVvCGMmWP2IhHjVQJaVNGLs53GZL8YhCqj1lQMjmx9QikcjSeDiFX25ZXYWhK5Irtbjhbpgb/4fplaegjNwPID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727887336; c=relaxed/simple;
	bh=JIW4/LyL16U6/5A3n2VtnqIoK6cZAQn07REo8b3gUjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDKFC7fdPi6VNDFgH9lKCLQ8v5SKFcnnvpATY/3odRDZ2K68a25DojAiNaicwdgriUozJbxKXX72BYh9kU9kEIyiv0LWjysNEqDzKVLUMlYO7Jk/TKBBRFiR5jk4tY/fFDIMF9tUv5FJ/q6je8v66p281oqgQRb5SM0cBMYrVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJqMh+Yk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJqMh+Yk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727887334; x=1759423334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIW4/LyL16U6/5A3n2VtnqIoK6cZAQn07REo8b3gUjg=;
  b=jJqMh+YkQKRr3IPbAte+57gVffbxPtP8X/9+wqEj7Q/fr5UuVp+HHH2C
   A0Pm7MXsPBfNHzpV06GiRcugQEfI/v11cgO0rn1HDsTB5vAWZxTfjvvBq
   GJplR6L1NqgG5hJWwwyASnP1qFfgLYEaontp3MRsdtJ6l9R+pQbAvCHpA
   uqaBrDeCECz5pZ06KjK927NSacUyQe7OR+UrubgLzjAyIJ2XyVKHFv4+x
   JU6iC9QWfoaZGuYFqBofkvpVFWQ/qp9aUyd/RhCKbfKszQ/cOwyIVx+sw
   MKhoyYbANbKwRUcobA8PGPkn0bFNEcucY18wmicbo8MeSExS7GFAQVgMV
   A==;
X-CSE-ConnectionGUID: mSBGLeu4RdC0YBhsTAMTEQ==
X-CSE-MsgGUID: mt9h0ssDRCCbAp7a0/JzlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38420805"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="38420805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 09:37:25 -0700
X-CSE-ConnectionGUID: 4+8176pATQ6EreFm8gVA+w==
X-CSE-MsgGUID: 3KWBnIM8T/+lOfJmbUCylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="78910801"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Oct 2024 09:37:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw2Lo-000UFR-1Y;
	Wed, 02 Oct 2024 16:37:20 +0000
Date: Thu, 3 Oct 2024 00:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>,
	NeilBrown <neilb@suse.de>, Jeff Layton <jlayton@kernel.org>
Subject: fs/nfs/localio.c:209: undefined reference to `nfs_uuid_begin'
Message-ID: <202410030044.O2B9RUd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: 56bcd0f07fdbf9770284bedb982236ab881ef909 nfs: implement client support for NFS_LOCALIO_PROGRAM
date:   9 days ago
config: x86_64-randconfig-002-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030044.O2B9RUd2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030044.O2B9RUd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030044.O2B9RUd2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/nfs/localio.o: in function `nfs_local_iocb_alloc':
   fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:290: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_local_pgio_release':
   fs/nfs/localio.c:344: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:344: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:fs/nfs/localio.c:344: more undefined references to `nfs_to' follow
   ld: fs/nfs/localio.o: in function `nfs_local_disable':
   fs/nfs/localio.c:140: undefined reference to `nfs_uuid_invalidate_one_client'
   ld: fs/nfs/localio.o: in function `nfs_local_probe':
>> fs/nfs/localio.c:209: undefined reference to `nfs_uuid_begin'
>> ld: fs/nfs/localio.c:212: undefined reference to `nfs_uuid_end'
   ld: fs/nfs/localio.o: in function `nfs_local_open_fh':
   fs/nfs/localio.c:233: undefined reference to `nfs_open_local_fh'
   ld: fs/nfs/localio.o: in function `nfs_local_doio':
   fs/nfs/localio.c:600: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:600: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:625: undefined reference to `nfs_to'
   ld: fs/nfs/localio.c:625: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o: in function `nfs_local_release_commit_data':
   fs/nfs/localio.c:676: undefined reference to `nfs_to'
   ld: fs/nfs/localio.o:fs/nfs/localio.c:676: more undefined references to `nfs_to' follow


vim +209 fs/nfs/localio.c

   189	
   190	/*
   191	 * nfs_local_probe - probe local i/o support for an nfs_server and nfs_client
   192	 * - called after alloc_client and init_client (so cl_rpcclient exists)
   193	 * - this function is idempotent, it can be called for old or new clients
   194	 */
   195	void nfs_local_probe(struct nfs_client *clp)
   196	{
   197		/* Disallow localio if disabled via sysfs or AUTH_SYS isn't used */
   198		if (!localio_enabled ||
   199		    clp->cl_rpcclient->cl_auth->au_flavor != RPC_AUTH_UNIX) {
   200			nfs_local_disable(clp);
   201			return;
   202		}
   203	
   204		if (nfs_client_is_local(clp)) {
   205			/* If already enabled, disable and re-enable */
   206			nfs_local_disable(clp);
   207		}
   208	
 > 209		nfs_uuid_begin(&clp->cl_uuid);
   210		if (nfs_server_uuid_is_local(clp))
   211			nfs_local_enable(clp);
 > 212		nfs_uuid_end(&clp->cl_uuid);
   213	}
   214	EXPORT_SYMBOL_GPL(nfs_local_probe);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
