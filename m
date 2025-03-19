Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE690213232
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417671; cv=none; b=uKPcdoc6a+kei+UnUFccnXvtgMUeJBkpuo+IPu0eBSJ0YfrUDLklRzJe/aJnia7z9OELTYY6bJNrnTqWNFkGUiwWuqflSZwHv542JZh6gFpgm3EtVQhjdGWJggs1QR157xtyzStuAfhaC+4forE9N+4bqpnhKIltlPNiM7KC9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417671; c=relaxed/simple;
	bh=3bCY6HsdyWvhI7VFxbIY6M1QdaFGaNjFeRKZ6bA/7qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ja+/MZcgYgnQKrAkuj/Be2g0Dj3hR6oRQT4e+1SwhlGtDbld+76Rq1ghRRmcN0uFseB1nY73KFRv0uroOK17vSeNrNwqB6qBagDwkt3Q3bpZgn349+xc3VATw15vL2FJ+V4kSZRzpoy1o4uPQ1KcoVIB23XUCk8UR3h0FswzEe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9gOTOUs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9gOTOUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742417669; x=1773953669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bCY6HsdyWvhI7VFxbIY6M1QdaFGaNjFeRKZ6bA/7qs=;
  b=b9gOTOUsG9BWQjS9dD3OkjQCNcZihfBUD2we4fk0TSPu8tn01EOuiubL
   s/YiuwAHVnYdLBGsCWuBzajG6SkEnUEBjrv6lui07MmxeeGydmltHoOPm
   DrIt/Wvuy9DN6whlz6n8khz4Cf2K8ahfAjY/C8QD5otnSVJBV0X7cOj7C
   DsNMtS4QYmj8W74WuemF5P0l66Zryi3ZVMhQjPyycWVHru+ie8isxAHUd
   lW3EIYTevpEpMyzQZu5RBarUq3TSMV1BP0512tDBr7l9OZKs95iDDXPpY
   KknEVTq6S72XEMcq2XLC1cw9NBd+hpmGQCx4Z4gcgtyPhZmX1qeTLoMnf
   Q==;
X-CSE-ConnectionGUID: KaLUsLlpRaSvtS16wxOjaw==
X-CSE-MsgGUID: g1J0b2FqQWmNNPCH7syDPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="68982921"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="68982921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 13:54:26 -0700
X-CSE-ConnectionGUID: mmpausyqRUOoVVtiktE2mw==
X-CSE-MsgGUID: LI0/3Fk/QC6IQp8+7Dg9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122808094"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Mar 2025 13:54:26 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv0Qh-000Feq-34;
	Wed, 19 Mar 2025 20:54:23 +0000
Date: Thu, 20 Mar 2025 04:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org
Subject: [ceph-client:tls_logger 21/39] fs/ceph/debugfs.c:413:23: error:
 'struct task_struct' has no member named 'cgroups'
Message-ID: <202503200414.qjE4Iyqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls_logger
head:   9d7726eb13dd4dbf6bba377991e8c20e18f26dae
commit: 150b41eb9654d09e993407ae522128f5af588e04 [21/39] debugfs: fixups
config: x86_64-buildonly-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200414.qjE4Iyqi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200414.qjE4Iyqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200414.qjE4Iyqi-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/debugfs.c: In function 'print_task_cgroup':
>> fs/ceph/debugfs.c:413:23: error: 'struct task_struct' has no member named 'cgroups'
     413 |     if (!task || !task->cgroups)
         |                       ^~
   fs/ceph/debugfs.c:416:15: error: 'struct task_struct' has no member named 'cgroups'
     416 |     css = task->cgroups->subsys[0];
         |               ^~
>> fs/ceph/debugfs.c:418:39: error: invalid use of undefined type 'struct cgroup_subsys_state'
     418 |         cgroup_path_from_kernfs_id(css->cgroup->kn->id, cgroup_path, size);
         |                                       ^~


vim +413 fs/ceph/debugfs.c

   409	
   410	static int print_task_cgroup(struct task_struct *task, char *cgroup_path, size_t size)
   411	{
   412	    struct cgroup_subsys_state *css;
 > 413	    if (!task || !task->cgroups)
   414	        return 0;
   415	
   416	    css = task->cgroups->subsys[0];
   417	    if (css) {
 > 418	        cgroup_path_from_kernfs_id(css->cgroup->kn->id, cgroup_path, size);
   419	    }
   420	    return 1;
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
