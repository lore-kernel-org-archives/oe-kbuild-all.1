Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5604D823AC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380293; cv=none; b=k9QQqm4u3Bdpj5rQDODH+Ol5Euy4zVgLkZEgJo/1UwM0GvjqJxmDkLVlS9hoWsLBjDOM28iwr6QAlijdeZfBhv9BxDr8CFsCriQfQWweAXnAaWxxmHiEernOi+sT3bLsUdAX17dVaIBRZ1l8mVOnsqw8bDnn9QtHWLfHhAmHkwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380293; c=relaxed/simple;
	bh=xLdwzoylVY4zGN1TW/ToeyibJVn4xgDRYK7Eiy11LxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXJlFLPREeDp6FdBhvI6C0tUY+T6HSKhGXg+FlTzeL1dz5wik8NLOdLJtXpqal/iPCEvl+Zk1P5IztRqXv6XFvt77aol8xR50Zl+0qWhGI/k9GHKZJXWf2ostWxMGo97sNpQHD6gsJnGLv5sWlvgJu28rPLbFoJPAmCUXsAlOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHUj7Mfx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHUj7Mfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716380292; x=1747916292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLdwzoylVY4zGN1TW/ToeyibJVn4xgDRYK7Eiy11LxI=;
  b=UHUj7MfxCEwIFwhmJnIuAA/mLiLV/T6qSXiw/eK4ATGcwPoTqDlmGWNp
   zyRRojFUUpQnWd4dM4m8ULirbLPXJEpgI6pA+9FU+J98I5pv/mQ3spAQD
   RDfRVNxazk9x+EUZ/WXUsI/z1W4iG00NROLb8zJtI5qFt+evctn1Aogc8
   d7Z2bM9N7yEnJBQu7yOReA8QEVAHk35ed6JPZj1w7nYQc9nq2j3VeK5qQ
   MwiFozk/U0nbCBYrzvjV/zBS6mqQ7Xaf3hLJ+I5c6Pa3PBubsdB3CtRqg
   DyGAIRtaB1MaSMVBF7J1mfB5eqFYy5IxQc4jmOFyfvOmq5S8LpJsSSCyE
   g==;
X-CSE-ConnectionGUID: 6/JubGYfSMSkKDeWxY3WjQ==
X-CSE-MsgGUID: B+5Bc3zWQs+rO1b/FO31kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12566153"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12566153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:18:09 -0700
X-CSE-ConnectionGUID: bpQwEMMHQKGKMlXAFHydKQ==
X-CSE-MsgGUID: ziQzHXvzTSe7DXtBIUUNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="56515212"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 May 2024 05:18:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9kuz-0001Wz-1I;
	Wed, 22 May 2024 12:18:05 +0000
Date: Wed, 22 May 2024 20:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 23/29]
 drivers/iio/pressure/bmp280-core.c:2576:35: sparse: sparse: symbol
 'bmp280_buffer_setup_ops' was not declared. Should it be static?
Message-ID: <202405222026.cP2kdFgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   6c46802cc0c4ff878f07139f7b7b8774fd43ce3d
commit: 5ff1aadd158d876b8c0240c02e8626d9ac6ef7aa [23/29] iio: pressure: bmp280: Add triggered buffer support
config: openrisc-randconfig-r133-20240522 (https://download.01.org/0day-ci/archive/20240522/202405222026.cP2kdFgB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405222026.cP2kdFgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405222026.cP2kdFgB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/pressure/bmp280-core.c:2576:35: sparse: sparse: symbol 'bmp280_buffer_setup_ops' was not declared. Should it be static?

vim +/bmp280_buffer_setup_ops +2576 drivers/iio/pressure/bmp280-core.c

  2575	
> 2576	const struct iio_buffer_setup_ops bmp280_buffer_setup_ops = {
  2577		.preenable = bmp280_buffer_preenable,
  2578		.postdisable = bmp280_buffer_postdisable,
  2579	};
  2580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
