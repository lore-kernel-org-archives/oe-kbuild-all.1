Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2062E3715
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 19:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753643001; cv=none; b=o5y/fj6YZQWkcA8ZCQSk4xVumy+yn1+6KUn7KVtYu00JuHQUHJIV2/GMVJDL3HmzUt2iCkwhK3vscJ61bcqbS6GPBIL2jKX7zEFwk9e3hI3qKAFp/p4dqvKJqpghfu0ZGYBcwBA3l3M21UyhIdYGe/2Zk/awrL7rM3gBJbJI0gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753643001; c=relaxed/simple;
	bh=/tjdoS2ly7+qx5m6diVctJtfyRjYa8yZS0YSPj1i3X0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XMyrEwBFWPrYkJRiAj4v5pJQhCCIDS9Tt6OW2epuFPgTRInrLK5x8Xg316dDUe6gYxuFf6wgFVCQGkWBTN2HrbJTUmxqVXyiN39Gr+Bdeg0smiokf3p2syUPhrfKgeN933vVdcCc3E+bwUfpdGicG8z7jdLlXcicVjSqILOz6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkeoYOHm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkeoYOHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753643000; x=1785179000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/tjdoS2ly7+qx5m6diVctJtfyRjYa8yZS0YSPj1i3X0=;
  b=NkeoYOHmMBU6RD+VYkq88ux89jVYS1uGgsKvN/Wtd7tHga7pPLckeIvL
   yueaSKA5c04K3cruyV8CcZEBxio5EqcDqsuS532CzTSnYaI6IsjtW4/jn
   P7TUI0Kb73MpSFrpDg1cmEz1EdGvw65eS7mYSiTBnJzSwnAUEoWzzPG1E
   OQgt9QcgKenjrAzslELZ4dG+oaT9E2YNh3J3zhl+r/YQ5wXgsm1KOPZiF
   Et9wNpjGw3x/5s99yE0byMPTps70xpiKlTHJnz8aqcJakrNmBcogsJpQl
   mFWZguoq92MhgWrpFQgenK1PuX7aopnxkCjODCDnldaX2wNn/01qvpZcE
   w==;
X-CSE-ConnectionGUID: SWJ0VtfhQHKP04WkSmMuxQ==
X-CSE-MsgGUID: +Ur03fHtSB2p2PQSwtGV6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67246084"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67246084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 12:03:19 -0700
X-CSE-ConnectionGUID: ujzkwNdhTFeiJqGh4i8pDQ==
X-CSE-MsgGUID: 1EgXFSAYSQKXAfc0UTdUsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162997789"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2025 12:03:18 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug6eR-0000RX-2c;
	Sun, 27 Jul 2025 19:03:15 +0000
Date: Sun, 27 Jul 2025 21:02:29 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] drivers/vhost/vringh.c:1323: warning:
 Function parameter or member 'idx' not described in
 'vringh_recover_desc_iotlb'
Message-ID: <202507272100.hiQEWc17-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 11d476e933635a37851ac05f919142a29b03ed6a [92/92] bytedance: vduse: Add mmap() interface to support inflight I/O tracking
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250727/202507272100.hiQEWc17-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272100.hiQEWc17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507272100.hiQEWc17-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vhost/vringh.c:1323: warning: Function parameter or member 'idx' not described in 'vringh_recover_desc_iotlb'
>> drivers/vhost/vringh.c:1323: warning: Function parameter or member 'head' not described in 'vringh_recover_desc_iotlb'


vim +1323 drivers/vhost/vringh.c

  1315	
  1316	/**
  1317	 * vringh_recover_desc_iotlb - recover desc head.
  1318	 * @vrh: the vringh to initialize.
  1319	 *
  1320	 * Returns an error if recovery fail.
  1321	 */
  1322	int vringh_recover_desc_iotlb(struct vringh *vrh, u16 idx, u16 head)
> 1323	{
  1324		idx = idx & (vrh->vring.num - 1);
  1325	
  1326		return putu16_iotlb(vrh, &vrh->vring.avail->ring[idx], head);
  1327	}
  1328	EXPORT_SYMBOL(vringh_recover_desc_iotlb);
  1329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
