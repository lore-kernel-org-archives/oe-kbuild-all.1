Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5F13D896
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 03:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731208997; cv=none; b=e/5Ret1/t1aP2OgMCL5foYn/KIZqsrsi3B3c6pMd6jlBhKTDIpfwdKFTh6uPcc8JK6nertyQro8PjhEYFdCJ3qUl2d/xbA532nV9DIiFE+kftfpOTx+Twq4SkTN5cXi5+zAE7lsoIvXPtlaSRz12PvmiHGuAgv0sPDhwUX5zH4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731208997; c=relaxed/simple;
	bh=br77sf8fQ9yLYX3jsE+vNe+JOMCFF74fGMsA/OVv+7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXK4jOiqzK5OUr7Gz5Ccfhn1xdwPN21VvS/pvU4QXjN8QLr0N95nhybRTYKsdnjkwGlVNx4uL0gIIHwRtXOhDynPOfHp6ERyyB5uLzLkFe+YqE2uNLqHA0FgDjeAI5oZY+laVsqP0P63D4id5c9yKASvuPWFQd93lKUSt1wG10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhHBtgyS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhHBtgyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731208995; x=1762744995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=br77sf8fQ9yLYX3jsE+vNe+JOMCFF74fGMsA/OVv+7s=;
  b=LhHBtgySBy1RWr3E36ALULgWJu32YkeGZuMeNeHnh+AmXDQGj/sFT/py
   JjWrCceZtGOGpFlhw4WU6MqkW0uyRO2YJV/Yedqt5mF8U2Ts2HkMd+nq8
   9D5BPmYis/ksgH2GBTVQgbjU9ZFKsm0MmC/5IF/F4LTmD405k47wq6jnB
   pF07gDQ1lf0AWjqzGxXXwWL1fypcVTLEf2BPACiofbxvHBengX9+4cLwQ
   9VwEpvtO89B2AcdRk2rH7zIFIyI/YeLY7HG+Yz9mHxH8K25+rAUaWCLUf
   gfJxwfamxspbwhVcaZisNzsfpqe4c0N835Qn4lV7yskK/06VVqif3mY/D
   A==;
X-CSE-ConnectionGUID: Z1DmB1MMTCuj2oYzJBnC9A==
X-CSE-MsgGUID: l/RN77bCQXCPiH53C9o+7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30904444"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30904444"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 19:23:12 -0800
X-CSE-ConnectionGUID: StijOmYgTfO38a+CHvYxew==
X-CSE-MsgGUID: x9w4/YQSRF+drqgiRvyGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="90955509"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2024 19:23:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9yXd-000stu-02;
	Sun, 10 Nov 2024 03:23:09 +0000
Date: Sun, 10 Nov 2024 11:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:buffered-uncached.5 15/16] ERROR: modpost:
 "__filemap_fdatawrite_range" [fs/xfs/xfs.ko] undefined!
Message-ID: <202411101117.dKLxqZRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git buffered-uncached.5
head:   1445690deebffc43e0fb856a84167b9cbce51792
commit: 9e4a3305a06fbf2c54e46758d2e8b0976002a83f [15/16] xfs: call generic_uncached_write() when buffered write have been done
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241110/202411101117.dKLxqZRo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101117.dKLxqZRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101117.dKLxqZRo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__filemap_fdatawrite_range" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
