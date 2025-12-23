Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7D2B2D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 05:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766467844; cv=none; b=b3pRZJWxv3GCi/QO5ESgtsjdmhpwQupXi6dpMojeZGnTvxCX/ek1xeuiRFnH85Ha9du7Oh7zNC8a2JwuW1tFVe7V9q1Qt0XYVI+ZvisiYGs+Ftmlyu7b6wtlVP+IkEk0qjtBPIZtZsZO5MESWnw2xZ3pv6lnfwtaJ/dgSMivTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766467844; c=relaxed/simple;
	bh=Z8IN4GEkohg2kE6nMJPJLpIycopK4dBf3pT2JVGPqI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hSdPPKDswKlntvCW0ZHT0Hyigmlc2so12GzFgArxN8uSh5KAbEm7cLZMpCn8bbs306rAksA5QezQJVY3Nl8mlUyGG3ptkUUiN6Bl9ESC05Ct18v7n+irNXNfZ7BsQ1d/n7puR4lJNkkwQwKbbWZ/Nikd7a1kzrqi+R/UfDNVtIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHU5HvE8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHU5HvE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766467843; x=1798003843;
  h=date:from:to:cc:subject:message-id;
  bh=Z8IN4GEkohg2kE6nMJPJLpIycopK4dBf3pT2JVGPqI4=;
  b=fHU5HvE8WHjII5KO/fsJCqavYQ7StT5BeVu5GE/LatGkr48+SrwWuoDl
   V2FPMVULnuCbM3RjH/lNqod70oPYpF+Cxv6cnbvMrwe6qOT8rCoxreL+V
   bqBM7tdPwZ2j6P12CmaNjlTUxLq4bOxwkjBpklIGUZnxO42oQGgXeutq3
   Q61rOkH6nTz0+1iIOlg6YW6jzw6DUK29JU7MatSIjXjFX6+TYpzIPAWpX
   sjTjUd3G280GWdcRWDjGrWJElfBXnPIcySCFvdY1upsxjYOYftDrW/VYi
   YuSY+zbCwXyzSbwgWtKOz4BS5ADpEke9zG9fWQ9x+mQmrYiPmSKqlaUC1
   g==;
X-CSE-ConnectionGUID: a5OCdSN1T/SHs/bxMcg06Q==
X-CSE-MsgGUID: ywKdm0oMR8SKAVxFkJ0GlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68255673"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68255673"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 21:30:43 -0800
X-CSE-ConnectionGUID: rCkYr4XnSg+nBSHX/DnGRw==
X-CSE-MsgGUID: MI2dSsaNQUOYXTzCwmYGKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199364265"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Dec 2025 21:30:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXuyP-000000001Uu-1EMY;
	Tue, 23 Dec 2025 05:30:19 +0000
Date: Tue, 23 Dec 2025 13:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Klayman <noah.klayman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 10/13]
 sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse: sparse: invalid assignment:
 |=
Message-ID: <202512231336.J0UuYrta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   e00fe1471431b89ac2b01eb02ba235375d8ff9e0
commit: 7a79ba9a0865c9efc5f5db3f5182ac445db67954 [10/13] ASoC: SOF: sof-client: expose Zephyr GDB stub
config: arm-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231336.J0UuYrta-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231336.J0UuYrta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231336.J0UuYrta-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse: sparse: invalid assignment: |=
   sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse:    left side has type restricted __poll_t
   sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse:    right side has type int
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse: sparse: invalid assignment: |=
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse:    left side has type restricted __poll_t
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse:    right side has type int

vim +365 sound/soc/sof/sof-client-fw-gdb.c

   351	
   352	static __poll_t sof_fw_gdb_dfs_poll(struct file *file, struct poll_table_struct *wait)
   353	{
   354		struct sof_client_dev *cdev = file->private_data;
   355		struct sof_fw_gdb_priv *priv = cdev->data;
   356		__poll_t mask = 0;
   357	
   358		mutex_lock(&priv->mutex);
   359		u32 head, tail;
   360	
   361		poll_wait(file, &priv->rxq, wait);
   362		poll_wait(file, &priv->txq, wait);
   363	
   364		if (sof_fw_gdb_get_rx_ptrs(cdev, &head, &tail) >= 0 && tail != head)
 > 365			mask |= POLLIN | POLLRDNORM;
   366		/* readable */
   367	
   368		if (sof_fw_gdb_get_tx_ptrs(cdev, &head, &tail) >= 0 && (head + 1) % RING_SIZE != tail)
   369			mask |= POLLOUT | POLLWRNORM;
   370		/* writable */
   371	
   372		mutex_unlock(&priv->mutex);
   373	
   374		return mask;
   375	}
   376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
