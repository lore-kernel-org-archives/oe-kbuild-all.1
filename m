Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFE4405F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162388; cv=none; b=Cnn7QPZiGJn4HwOdP7zsiXsxR+D6yKCKe0nVvcrr3+dMH3zi/mc24lhS+6LgwetxR2BpUjtknH5qZLNk4NwqwZT6lo9gd5dGNZNqk9HDTJbXwjz0KlX3WQ8V0IaWl7rzWBxfzBl8r0SyEp09c8//V7ghnbKUsrhOkQpDEEGq/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162388; c=relaxed/simple;
	bh=Aqe88rn3oViFcNdwvnMktKXbRraAzpNWdgl8U0H2nLs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R9Rq8vCkuFBCpZrpDKgJGEJ3WOnjGA/jWxW0Sn8FngV/L18gYHIky/N4lGSUDEaE/WgDHgbEjVxrciKw4LN7Ne5I5/DFp9ECDYUCBK7n1cFvCCE7eJWLCgFyiZTEBr1XcHrTlzdQ/XL+ZZ4sjpjMC+RtzTNXglNv6OlVexmVZ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IA7girru; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IA7girru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784162387; x=1815698387;
  h=date:from:to:cc:subject:message-id;
  bh=Aqe88rn3oViFcNdwvnMktKXbRraAzpNWdgl8U0H2nLs=;
  b=IA7girrulah3HKnv2bm6w4kxLVDEzyX6a+BqisVcwPLOxiIeYnV6LqsQ
   /oXlFeUn47Tb5i81PWkxkattaHAMtGhSoBt8kWfSKsgqPDSYZVQuwzXJs
   PF7orTYWjNNia9t7umKuVeCqQ2LwWOnRK3NK9V5us8JH5MHGdfixQ8Xr3
   ZVYhmsMPVvXH+v3doUF0BuJ2Me6KXTbAagsjNOjmlAjsN2W1JgJtW/c2O
   aE/xceZBJpnbTjiQ5AK64WDHyCmmylCeC3wGWo3t4PrHi5psGgnplLiMo
   PsOpENup8jo7ZnflgWi+4v1lfyFKvaMihc0AYiJ302zogOklsjhysxdqy
   w==;
X-CSE-ConnectionGUID: tt2wgUFXQSKkGPh/VeG/3g==
X-CSE-MsgGUID: eWuQfkJaQoqb9TnaX+2odg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95459305"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="95459305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:39:46 -0700
X-CSE-ConnectionGUID: ykY/mB6iTeSJLiBxQrHnuA==
X-CSE-MsgGUID: sVZLHYbJRUWX2rs67vqpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="253719596"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2026 17:39:44 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkA8d-000000004PR-09wN;
	Thu, 16 Jul 2026 00:39:43 +0000
Date: Thu, 16 Jul 2026 02:39:02 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 23/23] fs/nfs/fscache.c:397:35:
 error: initialization of 'int (*)(struct netfs_io_subrequest *)' from
 incompatible pointer type 'void (*)(struct netfs_io_subrequest *)'
Message-ID: <202607160258.0saZpeQy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   796ea75f9f613fed6508719a8a1a71e3b1aededc
commit: 796ea75f9f613fed6508719a8a1a71e3b1aededc [23/23] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260716/202607160258.0saZpeQy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160258.0saZpeQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160258.0saZpeQy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/fscache.c:397:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'void (*)(struct netfs_io_subrequest *)' [-Wincompatible-pointer-types]
     397 |         .issue_read             = nfs_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/fscache.c:397:35: note: (near initialization for 'nfs_netfs_ops.issue_read')


vim +397 fs/nfs/fscache.c

000dbe0bec058c Dave Wysochanski 2023-02-20  393  
000dbe0bec058c Dave Wysochanski 2023-02-20  394  const struct netfs_request_ops nfs_netfs_ops = {
000dbe0bec058c Dave Wysochanski 2023-02-20  395  	.init_request		= nfs_netfs_init_request,
000dbe0bec058c Dave Wysochanski 2023-02-20  396  	.free_request		= nfs_netfs_free_request,
000dbe0bec058c Dave Wysochanski 2023-02-20 @397  	.issue_read		= nfs_netfs_issue_read,

:::::: The code at line 397 was first introduced by commit
:::::: 000dbe0bec058cbf2ca9e156e4a5584f5158b0f9 NFS: Convert buffered read paths to use netfs when fscache is enabled

:::::: TO: Dave Wysochanski <dwysocha@redhat.com>
:::::: CC: Anna Schumaker <Anna.Schumaker@Netapp.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
