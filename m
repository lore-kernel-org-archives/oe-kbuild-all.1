Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905A2581
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714573045; cv=none; b=MBXkqpW2jrZfCrjZiKs/o9S8Iz0uUPHEgDX7Az/BTpVgY4vF3a4mWkQhL/Es6Mjl+yh4mJ2fM3F97WiBuxD2uS5zgnMO5is8iXAFgza4TpuU0DrOMIflY+C8RRlkx6JSVjs1BZw/3ISZckhPqz+FHGdGyFWVSN7y89tSVd6lsxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714573045; c=relaxed/simple;
	bh=mcLkQLdW8uT/EVIMc1AToQwBnqAEnGpe54f1K8KhELw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHbbh7xdWs1UWRyCHoah87MKmxf0eAmNkoAMiXLnPm8UOok/7Qd2efVE8ghtqaEZxTTUp92xVV6TUs3ELOK92SjEdsZqTk0bYUHtBOeYYcJiQncnUZwgGvNX8B7F1qudDuFdHUnXydhf4A9puXWA9nUaAe1TwIj3Ge2+Vqz78W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkHmTqMz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkHmTqMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714573044; x=1746109044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcLkQLdW8uT/EVIMc1AToQwBnqAEnGpe54f1K8KhELw=;
  b=TkHmTqMzZFiycf7dB5O5NRo5PtI7wC2+vXzggcKvIGeF4ssyViVE1vtQ
   e0Ug+O6by3qpSeARNt/4Ji0Pvf/xmSE12X/XVfwZCl+kAyyXUgNggVFpw
   k7qrE0+EJb1dV6HQADK1wTmhdIUlSltvhWSWgvLkOC9437i92ppl6YqW+
   arDF5vkuKhodH6mvC3Stb1+lUoMBRYao8EoWOWxVScIOTWXPxLUNqKfUI
   gXISQ63I9jRSqVcKu+YJC8pPle7eqU8Q5XfpbC4V7tVAn/Xoz56p6QYTg
   HuDAYBVwjicS6Dj0ZZKZwHM5NFTwdaey8HMuPDyHKjqJ26VH1/6MHESbH
   A==;
X-CSE-ConnectionGUID: VFlsOqN5Qx6J05Hr1PX0sg==
X-CSE-MsgGUID: QDcx72haSpKwcTsFcOu/vA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="20916942"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="20916942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 07:17:23 -0700
X-CSE-ConnectionGUID: KDGsyUWjQqGOVlswQ4jK6Q==
X-CSE-MsgGUID: 9/p+5D04SYKyRPxmAUtajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="27219131"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 May 2024 07:17:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Alr-0009aW-1a;
	Wed, 01 May 2024 14:17:19 +0000
Date: Wed, 1 May 2024 22:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 5/17] kernel/dma/mapping.c:978: warning:
 Excess function parameter 's' description in 'dma_start_range'
Message-ID: <202405012243.ELXQt2Po-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   98d7b876bb16c599190b66330cc7c5475620ec8c
commit: 86b6c0afbe811e9ad036864ef9b3bd419834cc09 [5/17] dma-mapping: implement link range API
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405012243.ELXQt2Po-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012243.ELXQt2Po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012243.ELXQt2Po-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:978: warning: Excess function parameter 's' description in 'dma_start_range'
>> kernel/dma/mapping.c:994: warning: Excess function parameter 's' description in 'dma_end_range'


vim +978 kernel/dma/mapping.c

   969	
   970	/**
   971	 * dma_start_range - Start a range of IOVA space
   972	 * @state: IOVA state
   973	 * @s: range state
   974	 *
   975	 * Start a range of IOVA space for the given IOVA state.
   976	 */
   977	void dma_start_range(struct dma_iova_state *state)
 > 978	{
   979		struct device *dev = state->iova->dev;
   980		const struct dma_map_ops *ops = get_dma_ops(dev);
   981	
   982		ops->start_range(state);
   983	}
   984	EXPORT_SYMBOL_GPL(dma_start_range);
   985	
   986	/**
   987	 * dma_end_range - End a range of IOVA space
   988	 * @state: IOVA state
   989	 * @s: range state
   990	 *
   991	 * End a range of IOVA space for the given IOVA state.
   992	 */
   993	void dma_end_range(struct dma_iova_state *state)
 > 994	{
   995		struct device *dev = state->iova->dev;
   996		const struct dma_map_ops *ops = get_dma_ops(dev);
   997	
   998		ops->end_range(state);
   999	}
  1000	EXPORT_SYMBOL_GPL(dma_end_range);
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
