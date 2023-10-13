Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036E3266A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyUbywUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697233073; x=1728769073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acPI76q5HgcwZmSxmMjP94ACMX/QRXLBcI5WTCQJJH4=;
  b=TyUbywUtKGzgQ0LRrGBJIefdk3Snj3utZuJpuYiIAtB54DMUj1jOC6Rz
   qy16ypHBRPspK06HF4M8PPjPiOB/Nqb6qxCMLupq/byzqRAV8C5+rHgOS
   xpVXfKFq4dqAT07/kyf9TvM06vjgxjSOpymZPIf/5jpTDV0iH0gNpKS77
   WBmPvzlO8/Ii2ZgliHVHI/e4NMGzgNAi8++uTmrztvM6zBC4aWZm3qLHx
   xvbnl6tHPbZcofIb/tonDEVVlywnWlvLvKXacI96a0z4vUI7DnX7rd3VB
   C1QHGa/KrZb9hIoltfNDZzN6tJItIhHkBf3VY/TJvoW4OC2sQbQ93g0In
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388122843"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388122843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758630176"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="758630176"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 14:37:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPqv-0005QB-0u;
	Fri, 13 Oct 2023 21:37:49 +0000
Date: Sat, 14 Oct 2023 05:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-fsverity-kfunc 1/5] kernel/trace/bpf_trace.c:1449:
 warning: Function parameter or member 'file' not described in
 'bpf_get_file_xattr'
Message-ID: <202310140514.VDB76Ekg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-fsverity-kfunc
head:   1dc94c536fe6c5f3da4712d746698a38fdce474e
commit: 9418605c321ac2028411a0e8af3407e3ad62d963 [1/5] bpf: Add kfunc bpf_get_file_xattr
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140514.VDB76Ekg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140514.VDB76Ekg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140514.VDB76Ekg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/bpf_trace.c:1449: warning: Function parameter or member 'file' not described in 'bpf_get_file_xattr'


vim +1449 kernel/trace/bpf_trace.c

  1432	
  1433	/* filesystem kfuncs */
  1434	__diag_push();
  1435	__diag_ignore_all("-Wmissing-prototypes",
  1436			  "kfuncs which will be used in BPF programs");
  1437	
  1438	/**
  1439	 * bpf_get_file_xattr - get xattr of a file
  1440	 * @name_ptr: name of the xattr
  1441	 * @value_ptr: output buffer of the xattr value
  1442	 *
  1443	 * Get xattr *name_ptr* of *file* and store the output in *value_ptr*.
  1444	 *
  1445	 * Return: 0 on success, a negative value on error.
  1446	 */
  1447	__bpf_kfunc int bpf_get_file_xattr(struct file *file, struct bpf_dynptr_kern *name_ptr,
  1448					   struct bpf_dynptr_kern *value_ptr)
> 1449	{
  1450		if (!bpf_dynptr_is_string(name_ptr))
  1451			return -EINVAL;
  1452	
  1453		return vfs_getxattr(mnt_idmap(file->f_path.mnt), file_dentry(file), name_ptr->data,
  1454				    value_ptr->data, __bpf_dynptr_size(value_ptr));
  1455	}
  1456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
