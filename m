Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0D14A4C7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725788770; cv=none; b=E9KCO6slgDgms8qx9h9Y2XUC2N2r0QcmyzyUiZFCi3MzI6kST12A+MIfXfHroQ9omtPWzTNgPIq2kCcRuwOjJwjJ0/cNTlUVm1+ubOppuaSqokEKPGVAzU83mniHkFfqhTTgyy1Cwf7nJkPrBt9ENunN+hEtT4kpcIMFgkUtC+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725788770; c=relaxed/simple;
	bh=KGdCvd6SeGNTommubSE+2yIVM89nPSUrGXi1Lt6g9Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXl+KrWelwI0VfBjnvwb3yrpzpJLA1BSpsxsiytJD3mg2iolOtCKuSG3PCY0hMuudPCW5HFrWZd8olaglWrdZTWkHDikrASU0/zynyi2f8hdUoX9UIfECDhqxs3XFD3b0DLtnRVo/2mUq2lERRTQSp9FMwsPhijBB13lbTbkZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI2RnnGS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI2RnnGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725788766; x=1757324766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGdCvd6SeGNTommubSE+2yIVM89nPSUrGXi1Lt6g9Oo=;
  b=LI2RnnGSjYssF7mmvZD+xMHQ2FesvNBxePRDQGHcIrZGubUuxpbaHcE5
   42IsbuR6psjt8EanCIU9v7Pf/8Hp9A97oq6SLHy6IYeOq1841GXizVtWu
   CRxyz1p9Xjf/2s/qLKoB8PzgArka8aShcdRUFJrEBIMmHH9b8QhSztdvO
   zj5FhvI6bpeiW7zd5lJVXo4acqT5Qn6lpVNiKwQzUzT77A40gKnt5aHOW
   XrjqlMrwicHYuZDHhjb2/wCesoXvjMPqIpullYNKVQxeAg1fSlfVOb4zG
   pANceXxfFztrmUGkZuML/1g9WPaBBlUiAPtDaL8STEwRM7FI7MuA9Tuaf
   Q==;
X-CSE-ConnectionGUID: VoSuVCoJQFCJd/qbTF5MPQ==
X-CSE-MsgGUID: LOciStkIS1mfsf9bhnpCCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35158348"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35158348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 02:46:05 -0700
X-CSE-ConnectionGUID: xB10wU8NQSWlULk0zVKEKw==
X-CSE-MsgGUID: kmwbyJwfQuuCpPNki0t8Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66919537"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2024 02:46:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snEUb-000DPj-0q;
	Sun, 08 Sep 2024 09:46:01 +0000
Date: Sun, 8 Sep 2024 17:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	NeilBrown <neilb@suse.de>
Subject: [snitzer:nfs-localio-for-next.v15 19/26]
 fs/nfs_common/nfslocalio.c:129:14: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202409081753.jdeuRxyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v15
head:   494f1a380b0adbc0fd4ba61103b456a1487c73c1
commit: aa9716930607e19f0891ac5451657e015ec114bb [19/26] nfs: add LOCALIO support
config: sh-randconfig-r113-20240908 (https://download.01.org/0day-ci/archive/20240908/202409081753.jdeuRxyc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409081753.jdeuRxyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081753.jdeuRxyc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfs_common/nfslocalio.c:56:15: sparse: sparse: symbol 'nfsd_mod' was not declared. Should it be static?
>> fs/nfs_common/nfslocalio.c:129:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/nfs_common/nfslocalio.c:129:14: sparse:    struct net [noderef] __rcu *
   fs/nfs_common/nfslocalio.c:129:14: sparse:    struct net *
   fs/nfs_common/nfslocalio.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +129 fs/nfs_common/nfslocalio.c

   117	
   118	struct nfsd_file *nfs_open_local_fh(nfs_uuid_t *uuid,
   119			   struct rpc_clnt *rpc_clnt, const struct cred *cred,
   120			   const struct nfs_fh *nfs_fh, const fmode_t fmode)
   121	{
   122		struct nfsd_file *localio;
   123	
   124		/*
   125		 * uuid->net must not be NULL, otherwise NFS may not have ref
   126		 * on NFSD and therefore cannot safely make 'nfs_to' calls.
   127		 */
   128		rcu_read_lock();
 > 129		if (!rcu_access_pointer(uuid->net)) {
   130			rcu_read_unlock();
   131			return ERR_PTR(-ENXIO);
   132		}
   133		localio = nfs_to.nfsd_open_local_fh(uuid, rpc_clnt, cred,
   134						    nfs_fh, fmode);
   135		rcu_read_unlock();
   136	
   137		return localio;
   138	}
   139	EXPORT_SYMBOL_GPL(nfs_open_local_fh);
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
