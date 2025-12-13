Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E3A13D891
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632287; cv=none; b=C2gtH50s5g0PfaIGdtBbYXiTxd1xKvTlhS6DNMrqANd27XWsEQMA7SNeLjc4NbPYLvEzP6RSuTtZY7Sm/TthSO5mN9dNA47JjBC7yUdEoZSti/SLTF3bAzWdEmr8FJ5RM6RC7yg5LbKUQtzFo3efhUoYie9A8TynN7QUvWmaWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632287; c=relaxed/simple;
	bh=koblCUSYmGFmCbQBxKwOQCy1XmK6w2fw9Heqd/w172E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnOqX2j0oAX0Rgd+2agrznuw7URUdrhklompfPsHcWOOCGg4N7XJNQO5fOQa8bzBcIdoRUFB4oDbignqQaz4q0NujBg1K8zISp3ylhj3WEf6xoiaaqW5JWIFSZOvTW1+x3xRR7PfrRIPLzJjVESp7HFQ1UfPoqhH9NgYIPiTDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqh1rJ77; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqh1rJ77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765632284; x=1797168284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koblCUSYmGFmCbQBxKwOQCy1XmK6w2fw9Heqd/w172E=;
  b=mqh1rJ77eAjE9hMytnWzgrS9xljmulkFl6Jaij1Da/NX2gkl2UAETU+d
   UWKoSa4qvaxodvk1SgkFqenxqIorScRkXlq5ZaEyVCCyg9+9wFS5JuPK7
   tpI05P9rMvjDD1NsIBLYC8UPxIgMwbHhqjQFwoHAQDDGESMjmpVMXmpeA
   1PaplfnOYTgEhsFxchn1cV/w2WBqYbPNIHmM5g09RlYnz8cY+fAGxrNhc
   4sdASWHv/EmBAzLP/tsCsdWs090RWD6qe7dAo1vujrmKRoHk+EKqIrNuj
   sGCp0HeizEqRRT8aEd2YnDNojpKxhxu0CZwLYGWGVzJLmgGGbDmDi2NUr
   Q==;
X-CSE-ConnectionGUID: HmVEHR8nT+Gq2QBCB6xQGA==
X-CSE-MsgGUID: yJe+MXY+S9W4eI/uJvUtzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71460859"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71460859"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:24:44 -0800
X-CSE-ConnectionGUID: 3xlGKASBS0CeMJKNDssvAg==
X-CSE-MsgGUID: KL/j0iMyT6qJsgtAuKViwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196929865"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 05:24:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPc0-000000007fv-2wpY;
	Sat, 13 Dec 2025 13:24:40 +0000
Date: Sat, 13 Dec 2025 21:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, =?utf-8?B?6Zer5rW35rab?= <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] fs/nfs/dir.c:1498:6: sparse: sparse:
 symbol 'nfs_check_have_lookup_cache_flag' was not declared. Should it be
 static?
Message-ID: <202512132106.3RmZpaUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: 18e360871c3f648ecb0d8cc9b23fd4268a64c17f [3541/3541] add enfs feature
config: x86_64-randconfig-r134-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132106.3RmZpaUX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132106.3RmZpaUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132106.3RmZpaUX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/dir.c:1498:6: sparse: sparse: symbol 'nfs_check_have_lookup_cache_flag' was not declared. Should it be static?
--
>> net/sunrpc/clnt.c:1588:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/sunrpc/clnt.c:1588:15: sparse:    struct rpc_xprt [noderef] __rcu *
   net/sunrpc/clnt.c:1588:15: sparse:    struct rpc_xprt *

vim +/nfs_check_have_lookup_cache_flag +1498 fs/nfs/dir.c

  1497	
> 1498	bool nfs_check_have_lookup_cache_flag(struct nfs_server *server, int flag)
  1499	{
  1500	#if IS_ENABLED(CONFIG_ENFS)
  1501		return enfs_check_have_lookup_cache_flag(server, flag);
  1502	#else
  1503		return (server->flags & NFS_MOUNT_LOOKUP_CACHE_NONE);
  1504	#endif
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
