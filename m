Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F7158868
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736238343; cv=none; b=iMsTyAujWoFB/lGKdSx40XDzw2fOnnrYNXJ3bOZv3NC9XeVEw42DLFiHMVTbp40oAh0pZaC0ER1TMKhyn0Q3PT5sJLmhjMZqjfhblSZ6Xtk8GtQK2vuGYQeYRA9dkrYiiXflkCT29sEF1g8WvMEvFC3CwaQ1PHOlWz/DeeEtJTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736238343; c=relaxed/simple;
	bh=Ge+Lxvul77YblNYe2QQkuFNArtoFbtFFjW34eQO1mjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWMUnNlOI61bWz/8rZQ2TMBvto8C6QHeTq4JM0dZUbjjp0dEHgkJyegav76IpuyHKoKk2FPJIqFmazfamRIda6kllblT4moW66syjCAsDMsHyVHq12xbNsIqSqLEpFyssOyhBzJfbVvd7zVcWvSHwc7gM9e4rd6XzgVFhBi6ffk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Elc9iil2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Elc9iil2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736238341; x=1767774341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ge+Lxvul77YblNYe2QQkuFNArtoFbtFFjW34eQO1mjA=;
  b=Elc9iil2oXWCJ3dCo1kVSQpvYP0Mj7G6zytMvQR7mXyRFuZnBPF7WVtU
   NULzsy7YHt3di1yWHshSmgJFl++Aj/tH2YgDaZPxQaOpkqH1Bgei2ZSEE
   XRnQD1YBsYXOEhN9iLOp4xhHhK8RItd1ycGoJbXqFgEssbUFiBlCT/7Ze
   Z0RhsYTtDfLieUSgRG2B9Ju9tGq4oJTPiqAQrMNoyIYeYg92pyZ3S+JV2
   GHtMtk6a2Sr3RId2GQoWkZL7xkR+iEvgixdS46FdMG7fJ0hS6qvQHYwle
   4WKEd9EEFx8Ft/kcG5FdL2b0Z6AseLp+nbOaZ9LVRV8RY3Pfo6ZRiWhU9
   A==;
X-CSE-ConnectionGUID: rh+P7bzaQ3m3bI98vFD3BQ==
X-CSE-MsgGUID: exlzCHy8TAanUO6HncnLzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47397689"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47397689"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 00:25:40 -0800
X-CSE-ConnectionGUID: Hfkqjw4uTA+DXwVURhe7Yw==
X-CSE-MsgGUID: je5JMK5yReCNttvRmjIrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102882821"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 00:25:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV4u8-000EQB-1a;
	Tue, 07 Jan 2025 08:25:36 +0000
Date: Tue, 7 Jan 2025 16:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 1347/1347] drivers/nvme/host/qmap.c:34:21:
 sparse: sparse: symbol 'qmap_mgr' was not declared. Should it be static?
Message-ID: <202501071629.A0rfowSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 3a9b973eb8419fe1dad8585ceb7d4ab6cdcf8da0 [1347/1347] bytedance: nvme: Introduce nvme qmap
config: arm64-randconfig-r133-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071629.A0rfowSm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250107/202501071629.A0rfowSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.A0rfowSm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/qmap.c:34:21: sparse: sparse: symbol 'qmap_mgr' was not declared. Should it be static?
>> drivers/nvme/host/qmap.c:1135:30: sparse: sparse: symbol 'nvme_qmap_fops' was not declared. Should it be static?

vim +/qmap_mgr +34 drivers/nvme/host/qmap.c

    33	
  > 34	struct qmap_manager qmap_mgr;
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
