Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3491D2F42
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 04:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761713452; cv=none; b=sGT0MAZdqGZjaRsuaN391e4bY29qvd7ti+aFSJFrNtODEIOXtwSryF3S+n3jWiUq7xKqWCkgv844plLF+K/DmpR3XSCzJoqiGGsqDUoT9eoFdfe6094Ldze26+ubuQ1kfKzmRLIl5nAdBAyk9dQ5/AuVsSKv0XmHf0sO5qiV0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761713452; c=relaxed/simple;
	bh=g4l3fL2uGbjVkJVU7WWrK4bqW37AXsY1rmnvoHAI+Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOnzewW/zIPBCSutFCnaF6ZNgclYbRhxclnZCqbEuce8Im5oWpNd5ngV7Yk2FbV4n8nValHUztlaVfS88lzmzJI5Xd/NI4v4yvfGRc8nuxMnJTnNDa17XxHYssS8dVK05JXMk+tpvg/93E8zjXFhOC7SOz/bG83LR7WPmXDjXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKHR4Iga; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKHR4Iga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761713450; x=1793249450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4l3fL2uGbjVkJVU7WWrK4bqW37AXsY1rmnvoHAI+Nc=;
  b=HKHR4Igauuz4NXB8GoHOdS3Ld9OTy8jEdY2J9F5EdItivUwLh13ngZJe
   mhLwcjSYWn1S5kF6cPZ48IRPi5j0iivnK10URzb89mOFlhprs6J1zEaHe
   5ijHdXNWzhgNO6e5uV6LfFfyPLuuF27utVUbqUhWu8xOTHvOaHA8NO7LF
   mdepxYXpwq845YsRDqGddOSYxZ03C+FW5ATrcLlsOr0VgYPgy/X3xkwvU
   4kfxR6/kUtuAU4/MKxJgwiW6ODNVibX7VXjuOKACtpYjYFeMCTLPchXhn
   /87Ro0Va2XvoJ71KjskyZHr8RDVRHz7bXu5TCMQrMPhf5JpDc08iW1NZe
   g==;
X-CSE-ConnectionGUID: DUrEM1OYTJGKKv0XNSqJmg==
X-CSE-MsgGUID: o7iYkK1QQ+yhvKnet27GCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63860078"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63860078"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:50:50 -0700
X-CSE-ConnectionGUID: gQORhO9KTpSMNZWq+XzZ1Q==
X-CSE-MsgGUID: VE7CEwiVQzS+vjT+pr5Mug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="222764368"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2025 21:50:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDy8v-000K9D-1h;
	Wed, 29 Oct 2025 04:50:42 +0000
Date: Wed, 29 Oct 2025 12:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 60/85]
 fs/fuse/file_iomap.c:1789:31: warning: 'fuse_iomap_swapfile_ops' defined but
 not used
Message-ID: <202510291214.t148qevB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   93ddb4aaf9c5c308eac7d9682a0954648f3f73ab
commit: 7e188421220b7b8cd5302faffbd4b9865d71d222 [60/85] fuse: enable swapfile activation on iomap
config: arc-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291214.t148qevB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291214.t148qevB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291214.t148qevB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file_iomap.c:1789:31: warning: 'fuse_iomap_swapfile_ops' defined but not used [-Wunused-const-variable=]
    1789 | static const struct iomap_ops fuse_iomap_swapfile_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/fuse_iomap_swapfile_ops +1789 fs/fuse/file_iomap.c

  1788	
> 1789	static const struct iomap_ops fuse_iomap_swapfile_ops = {
  1790		.iomap_begin		= fuse_iomap_swapfile_begin,
  1791	};
  1792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
