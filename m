Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E291CB524
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573589; cv=none; b=O/FiRpjI4uj3c7ePs/5wLCl/CJX/idMpUWXe9o+x7K8oe2ZJ55XmlFEvvNDEbMlsdW7G8uSzohK8TM3RiIN7198Ed+Aet3nqm52aYNBUqexxqlE9HP9kuzZwcAJBPDtod1gFyFEtGT1sqkleW8/NmMdwOAKWqMghc8XueS56z94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573589; c=relaxed/simple;
	bh=XevSFGNPlUvIvpx7vNAEjdvgvuandhbXlAf89DSAo2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfZP32B93v4lTOfTaRoK99grzZgQiY1gWwRXmiDDfJGy9J+YwsMY3qPb+1OR0y1B3+idvQokYNXkq1FEJwMIR5uuAY3PuW/VdG6EW18p/+dtIa/zCfzfKwPim9b996brxbobONvPzCXA1AVsNN9i7YZ43d92V6x0biKwvMm5PMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUO8wqQv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUO8wqQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728573587; x=1760109587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XevSFGNPlUvIvpx7vNAEjdvgvuandhbXlAf89DSAo2E=;
  b=FUO8wqQvAWWDCkm+vRqmYicuvp6h2sPHcr0Dgtzl8R+qAQsH3GqyyWU0
   Brgq+If9wb1+8TvHOIX3HPpIzkH0MQwmkGfvpw0tRBuxXRG+ianO9PITb
   YZGJoMerZetPfXqsQCdIveaMQueQzJg+V/xq8L2eY69G0D/+QQQy1xGjz
   enXF01DyiYhsq8URT96cWYrkIm9sodFCqtJwHxtO83e6MQG/Msx3GTWBg
   VoVryeEhMOjeyBybrdXEO30zQzWUdDG8+/sBW5XKV/UbVnCoMS3mW6xfl
   eMt52aDs7Gp2Yv9gojfwe9lPFuJr+cT2gyFCZArv3EJD2XE2Fjhv/uBUS
   g==;
X-CSE-ConnectionGUID: DG5lU7fgRhKjloIh1TR8KA==
X-CSE-MsgGUID: NwJirr3lRr+xNkOtOiUunA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28078828"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28078828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:19:18 -0700
X-CSE-ConnectionGUID: mQeb5GH9RwmnwToy58ad7w==
X-CSE-MsgGUID: H78BuGUISXyglmyKWkyi8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76286248"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2024 08:19:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syuwc-000AuN-25;
	Thu, 10 Oct 2024 15:19:14 +0000
Date: Thu, 10 Oct 2024 23:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 9/24] kernel/dma/mapping.c:1026: warning:
 Function parameter or struct member 'dma_addr' not described in
 'dma_destroy_iova'
Message-ID: <202410102306.t3a33Pmu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   80b55c691bd857259d981c6d59a48af24a36afd2
commit: 143fbf3395d66ac4244b2ff130ba4e1a7f446f6b [9/24] dma-mapping: implement link range API
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241010/202410102306.t3a33Pmu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410102306.t3a33Pmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410102306.t3a33Pmu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/mapping.c:1026: warning: Function parameter or struct member 'dma_addr' not described in 'dma_destroy_iova'


vim +1026 kernel/dma/mapping.c

  1015	
  1016	/**
  1017	 * dma_destroy_iova - Destroy IOVA range
  1018	 * @state: IOVA state
  1019	 * #dma_addr: First linked IOVA address
  1020	 * @size: Size to unlink
  1021	 *
  1022	 * Unlink whole IOVA range and free an IOVA space
  1023	 */
  1024	void dma_destroy_iova(struct dma_iova_state *state, dma_addr_t dma_addr,
  1025			      size_t size)
> 1026	{
  1027		if (!use_dma_iommu(state->dev))
  1028			return;
  1029	
  1030		iommu_dma_destroy_iova(state, dma_addr, size);
  1031	}
  1032	EXPORT_SYMBOL_GPL(dma_destroy_iova);
  1033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
