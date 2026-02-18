Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0221EBFF7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771432622; cv=none; b=jU8tAW4uVpUYdvdCzzKXjuz5wmotoQGB3jvJvnHvDAlUAdow2LxCNAmbBE5Btb8q3rOhM+WukDFnoOb2lnn/f4AG5egyYODqV89DuYNGzLwK9K5lLqsk3XjptWW9cYYWSO83h9o7TN0K5MvZpsCCbrN4XJTHiavcCu3fcWCeCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771432622; c=relaxed/simple;
	bh=oWqS4i1EE86Bw47IiDHSgoLC0b4jzMrnCArcMoH3UO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHh/u/JXxTtXO5SLGD2aflyWBQCSt/fkN5vsj13CchqPsjGUa6MbdknEWRurbdoevf77WPDv1LPZfpGJqEsuGhI3Oo9EcFNQbShpf4fpdPR1WFfGryrDOxN7WI1ncB08aQtlVKKDJNDPFNpkQ9mzUasZ5GYZmnatmBzVW0U3JOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Az2GGyZy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Az2GGyZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771432621; x=1802968621;
  h=date:from:to:cc:subject:message-id;
  bh=oWqS4i1EE86Bw47IiDHSgoLC0b4jzMrnCArcMoH3UO0=;
  b=Az2GGyZylhN44cvuRMvbhFA07ou+YYT0AEnd8N83sr7hGueMW4BN9Dtd
   6CJ7hKqANuo96sHojNwzWnFvWFlnTugkFR6dmSfiD8SicQqTHCn1H9Y3Y
   97NuqQBtEN+DojiKTAbkRSb3zQGP8KY2XbCPuwPA0V+KEOLx56GPFbVc8
   8YJmljZtG6sslNqAUyLEmGbmVTpB99qTai2TtQ+78SZXWAsr2216SitRW
   yLeZOOGYwY/5/+VBa4YdLhEGR1cnoR5A0eAvEPYir4vTr/W3ZRv5B7zDR
   yPbaIcK4hqoei5KVpRsf2p5jqvIL+kc8pdrBUmwz8t8GE3BUAXAMzj1sY
   A==;
X-CSE-ConnectionGUID: xprztQoaQBCX+JBi7F0zLg==
X-CSE-MsgGUID: WxFU5OoCRVS6lwCogpLwUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72425696"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72425696"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 08:37:01 -0800
X-CSE-ConnectionGUID: UsaKKtGUTUineyTLYEKpXQ==
X-CSE-MsgGUID: nt146SVERGi4L+lyIW/ICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="237231197"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Feb 2026 08:37:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vskXp-000000012Xo-3Gf5;
	Wed, 18 Feb 2026 16:36:57 +0000
Date: Thu, 19 Feb 2026 00:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:dtor 2/2] kernel/bpf/bpf_local_storage.c:175:49:
 sparse: sparse: dereference of noderef expression
Message-ID: <202602190022.LM4J5A1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux dtor
head:   1b342710f493a21feab85aab1cfe1c4ae08e788f
commit: 1b342710f493a21feab85aab1cfe1c4ae08e788f [2/2] bpf: Delay freeing fields in local storage
config: x86_64-randconfig-r134-20260218 (https://download.01.org/0day-ci/archive/20260219/202602190022.LM4J5A1g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190022.LM4J5A1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190022.LM4J5A1g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/bpf_local_storage.c:175:49: sparse: sparse: dereference of noderef expression

vim +175 kernel/bpf/bpf_local_storage.c

   166	
   167	/* rcu callback for use_kmalloc_nolock == false */
   168	static void __bpf_selem_free_rcu(struct rcu_head *rcu)
   169	{
   170		struct bpf_local_storage_elem *selem;
   171	
   172		selem = container_of(rcu, struct bpf_local_storage_elem, rcu);
   173		/* bpf_selem_unlink_nofail already cleared smap and freed fields. */
   174		if (SDATA(selem)->smap)
 > 175			bpf_obj_free_fields(SDATA(selem)->smap->map.record, SDATA(selem)->data);
   176		kfree(selem);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
