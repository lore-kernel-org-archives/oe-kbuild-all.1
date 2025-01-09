Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB1221B908
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434750; cv=none; b=R0wxvxvzAnZWU6aWnidVE1s3VbKhreezqUpvTFnTHtbW8JEpW0OpxcyeoSPU5HUfwWnhpM6DJ8STHv1n9S14IazbMypkfghGnpmdwBS4UqgI/0jYiP7N3GMiUr5s3yl9Ju79ShPTZ6UV2Jqvdu6qUC9BxhhIWOPkIYoy4r+WXFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434750; c=relaxed/simple;
	bh=ZmIik8rnE+hlb8qBS42iSRZ9upIlDD3KxXzjhUQQj0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJOhnNcOpHg2dTIsdD//S8yRinBeoLM/fih7BwKf+zVYBIl/5czIDq7tvXClLIbGbO/TujLnY/FTs4kRcXxXmhiEV6QIe7lI71MOGK5YFccfBU3nYdC1NShLXX34dKQ9w5kM4KSbd4rsn0yIyPHMgz9bKrKeYeY7l0BZyRJu/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HirjXvyD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HirjXvyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434749; x=1767970749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmIik8rnE+hlb8qBS42iSRZ9upIlDD3KxXzjhUQQj0E=;
  b=HirjXvyD7Cnw1NKOKWUQAvzWDNItAENvW4HgBl/efcZwvfWRbo1DUXWM
   6rHJ8D5Xay7J6r+t5W+hYV/hZD4IB93imnSl6KyV+YY2A+ZW5wNovJx5B
   dKHddpf3dBe6Kx5C5UmxRc8tWubnGOV4Nh6O3TcGjmI6aykfnfWXDxDYI
   /C8meXu3Qe0P3xjlmfRzE0O2yXE+0x3L2mYlM5QMMzwnf489SHFR6lVwG
   OHM1WgpyYp34QoChpXXbaQ3pSN9bNTNjiRDcTNW4Xba2Hp6qcJGB8tGDr
   hKrFwNq5FU/C1QyLa+zehTVVV1WBP3ljP6isCxb66yL1URsnmk34U/kCu
   g==;
X-CSE-ConnectionGUID: opIk0ZYeRT2/A3QBnOxmFQ==
X-CSE-MsgGUID: 8plTWi6rSJmkCFrENCmcSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36856504"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36856504"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:59:08 -0800
X-CSE-ConnectionGUID: 8u5G/HF7TrqeEDdoTsa2+Q==
X-CSE-MsgGUID: xoG10M93QtasDQTezK+Qmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103976172"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jan 2025 06:59:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVu01-000HhN-0j;
	Thu, 09 Jan 2025 14:59:05 +0000
Date: Thu, 9 Jan 2025 22:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2668/2668] fs/erofs/fscache.c:28:33: sparse:
 sparse: symbol 'erofs_fscache_inode_object_def' was not declared. Should it
 be static?
Message-ID: <202501092234.VRg7E3V6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1c1825ed0360fc09f928a4b2e1300f7b718df8dc
commit: d2f54ddb54950df46c7a841b90b57ff83b193d36 [2668/2668] erofs: add fscache context helper functions
config: x86_64-randconfig-121-20250108 (https://download.01.org/0day-ci/archive/20250109/202501092234.VRg7E3V6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092234.VRg7E3V6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092234.VRg7E3V6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/erofs/fscache.c:7:22: sparse: sparse: symbol 'erofs_fscache_netfs' was not declared. Should it be static?
   fs/erofs/fscache.c:22:33: sparse: sparse: symbol 'erofs_fscache_super_index_def' was not declared. Should it be static?
>> fs/erofs/fscache.c:28:33: sparse: sparse: symbol 'erofs_fscache_inode_object_def' was not declared. Should it be static?

vim +/erofs_fscache_inode_object_def +28 fs/erofs/fscache.c

    27	
  > 28	const struct fscache_cookie_def erofs_fscache_inode_object_def = {
    29		.name           = "CIFS.uniqueid",
    30		.type           = FSCACHE_COOKIE_TYPE_DATAFILE,
    31	};
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
