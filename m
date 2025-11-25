Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64CA286D4B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764055277; cv=none; b=TsFKnf58CeV+1moYVn+ehBD00EiEU5ikvLX+18MK/weHzkdDFyM35V3M7dx0yHYaaJFmsSbGpg3uKGzxXqzQl6cdYBSac89iq84dZw0sxKzh3NX4ljdFqPUIEpQiFm3TV5w1Naw26Vsj28xI6NxP/GaB6sHFw1ejSUkKQU0fXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764055277; c=relaxed/simple;
	bh=w75B7WOTq9vx4DzuLpj745lUgkIWBM8kDr36O/nGMpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUYpbas6kwDayt5cXY4um5A4lu/H24lTqZr5RPatdo1j8UQmHrqKlqqVDOpMGd3+54FFUoKhCv5pvFOG6Wu0aNeR/sWk/lD+lQMCMEzSsJQN/1vOQf45hajjdVKtx3jnN/FdMxqWtZFT+wJQcTfx4zV30tAYqmKxQEn9OESnxnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXTcQ7zz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXTcQ7zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764055274; x=1795591274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w75B7WOTq9vx4DzuLpj745lUgkIWBM8kDr36O/nGMpA=;
  b=MXTcQ7zzvd7qkapxOQ/sGjiRcnh7SZkscbbGa59tOxqriwdFwdiwQ2OA
   LxibYkoZy6UJ677T2p7M474grhC9JhTf3dj6Xs/eYUpPxC5Q/e97UCbgS
   75qi2Lacuaf5j0qRhxXryILwLK4OJkOyW2/+x+n9FwByN29QnqEuO0zHy
   tK9OGZT+nppw04t8TxOe88A9KGUsx8brlrVsZxYPPZTzVwxndnkJxC4xf
   xtv1fU74HHQy3agByM9V+crJd2wGoMNXgTEOY9fuu6QW+PJSaJz5YQ7rI
   d9yU+YZaNAswnh+PXzWCOeIY0NvKk3uUJ+DLlDtJZCP/b7PLtx4q69KsK
   w==;
X-CSE-ConnectionGUID: k8nfFLqSQl2X1cf0yEsKhQ==
X-CSE-MsgGUID: waw7K8HTQNGapf8W9wQQpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77434443"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="77434443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:21:13 -0800
X-CSE-ConnectionGUID: j5iKMMv4Rrq/7jW1tI1VkA==
X-CSE-MsgGUID: J1yrGyaGQ/muXs9WrkS82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="196734635"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Nov 2025 23:21:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnMM-000000001Sg-1ipG;
	Tue, 25 Nov 2025 07:21:10 +0000
Date: Tue, 25 Nov 2025 15:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/vstream.c:94:19:
 warning: no previous prototype for 'xcu_find'
Message-ID: <202511251558.2eHkQQky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   33cf1d28f3c50dfd5f2649216af46dce323c3f97
commit: 8dde1f2e6bf6049bf69c9f510349c698e0aba49d [3316/3316] xsched: Introduce vstream management
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251558.2eHkQQky-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251558.2eHkQQky-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251558.2eHkQQky-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/vstream.c:94:19: warning: no previous prototype for 'xcu_find' [-Wmissing-prototypes]
      94 | struct xsched_cu *xcu_find(uint32_t type,
         |                   ^~~~~~~~


vim +/xcu_find +94 kernel/xsched/vstream.c

    93	
  > 94	struct xsched_cu *xcu_find(uint32_t type,
    95					uint32_t dev_id, uint32_t channel_id)
    96	{
    97		struct xcu_group *group = NULL;
    98	
    99		/* Find xcu by type. */
   100		group = xcu_group_find(xcu_group_root, type);
   101		if (group == NULL) {
   102			XSCHED_ERR("Fail to find type group.\n");
   103			return NULL;
   104		}
   105	
   106		/* Find device id group. */
   107		group = xcu_group_find(group, dev_id);
   108		if (group == NULL) {
   109			XSCHED_ERR("Fail to find device group.\n");
   110			return NULL;
   111		}
   112		/* Find channel id group. */
   113		group = xcu_group_find(group, channel_id);
   114		if (group == NULL) {
   115			XSCHED_ERR("Fail to find channel group.\n");
   116			return NULL;
   117		}
   118	
   119		XSCHED_DEBUG("XCU found: type=%u, dev_id=%u, chan_id=%u.\n",
   120			type, dev_id, channel_id);
   121	
   122		return group->xcu;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
