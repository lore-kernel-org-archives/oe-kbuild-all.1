Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98A1F941B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 14:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521692; cv=none; b=oY6DJKfgmmpUbxH+1CFcRPHndycGxwVg+HiSPhGy+yV/wxx9RiKHPIBRSYZX9tfbZ58Wa9Wts9Karz2t0XJqDZsKXC0kK3blKz8Du+NQ6vZjzpd0F7pLHYuY26KdOa1jtP8rlA2b8bZbduSXRkYTIepmUUYRQtcw3tRCneNgLD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521692; c=relaxed/simple;
	bh=whovchUrFR93ZUhi3Oj8Ovjgv/6CsLcnwsjeCszRNbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uvj6+YKbToUFtBZh+eFlpTeS2ENXZUvEwA7qi7eLvFjCPfblU8zoXKDION8vy8ry2XTau9BOQCEkCzyxX952v235MVOBRiA7KozHz7Pzb2blNMMb4kU/1jvwb3JJVfCvbecAk08c5Cpi3F12ozeaPbBnsFgtDTXYhXhJfjJ21Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3/Jr9dE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3/Jr9dE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729521691; x=1761057691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whovchUrFR93ZUhi3Oj8Ovjgv/6CsLcnwsjeCszRNbI=;
  b=H3/Jr9dEyiN6Uo9RZJjvQosXm0lo0YDuPy+lMTWPUV+9BOgoVqjxeUWJ
   ZoBMWDHNZpr8dXDvLQkIDK103C1JzhDgYS7Xz0kqKM31KXbtDvJBfO6DP
   vVk+Qp6ie8LXH1bRc50N6YZ8AdAWVi9WiIuQasm5I6L0OKM1i6ArFGpz4
   krBkdz/j2Mk3jX4PN9Wxi20xmNDlReSTmb7GVjyi1yiKOykjoIe+hhpKe
   dmVbzQs4xtXCX109DXAv0G9oUB63awSSIkNpm+CDS/m0mPJro6Ern0RcE
   ImihHjL5HjQS5u7DvfsDgSPQKZopZkzn1vxmqGLz0ZD1J4IH67f6F4f3d
   w==;
X-CSE-ConnectionGUID: t3nWT241RzGcm8+0t1xrog==
X-CSE-MsgGUID: Artb3ugoSDiq/nODywFYPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28885208"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28885208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:41:30 -0700
X-CSE-ConnectionGUID: eBw/IlMXQvK7IunknspVZA==
X-CSE-MsgGUID: McNq+wThTSSF0lCwf4y4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="79489252"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 07:41:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2tb5-000SIM-1I;
	Mon, 21 Oct 2024 14:41:27 +0000
Date: Mon, 21 Oct 2024 22:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@sandeen.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:devtmpfs-mount-api 1/1] drivers/base/devtmpfs.c:88:30:
 sparse: sparse: symbol 'devtmpfs_context_ops' was not declared. Should it be
 static?
Message-ID: <202410212206.FMAnsFeA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git devtmpfs-mount-api
head:   41be740c85792fe4e7a844e5ddecd3a86600e49e
commit: 41be740c85792fe4e7a844e5ddecd3a86600e49e [1/1] devtmpfs: remove ->mount from public instance
config: x86_64-randconfig-122-20241021 (https://download.01.org/0day-ci/archive/20241021/202410212206.FMAnsFeA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410212206.FMAnsFeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410212206.FMAnsFeA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/devtmpfs.c:88:30: sparse: sparse: symbol 'devtmpfs_context_ops' was not declared. Should it be static?

vim +/devtmpfs_context_ops +88 drivers/base/devtmpfs.c

    86	
    87	/* Used to clone underlying context ops */
  > 88	struct fs_context_operations devtmpfs_context_ops = {};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
