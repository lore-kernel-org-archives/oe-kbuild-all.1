Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C25CCA62
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729349740; cv=none; b=GaWKb7RDZE70v7llVT3gh3BlpUW8zGV+9G0pvi9C51M7tksDBCvaAuV7knNCR6h7a6j9ycIuuraDV+Gm+Xr8Tp1TDyDYlEfJ6CXnN4/HaK0Hp9ZEYxmZJI70gIKDhF7jSrQSDVX+1yF8WXKLnrxLhPyfw7wNpd19hqM1X2DUbEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729349740; c=relaxed/simple;
	bh=YCmEHFtvuEuhcp6kjHTXjrurOpZFxtsbcpCMjaNraPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyyG+IW22d7PbVLqhjjnO0K6YVFOzcHalPv9gXywax0pIKfrJcf5qg0KrY7mRy5MoYpz4T13GqaOte9hJnjl5vHoVFlXIAalqheeeU9zAjXy4nfWK3z+Sslr073s+Bpa7lLXk/uB8ErAFTl8qBpVqm34yM8aVhobCCi0qNYuDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O84uksNe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O84uksNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729349738; x=1760885738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCmEHFtvuEuhcp6kjHTXjrurOpZFxtsbcpCMjaNraPQ=;
  b=O84uksNeqpDkL4Cxs8ZiV8eVrQRRQgtoxWVmPMxoed+uaPtAHofUEZrc
   m643bfI2iajnYgVuy6N9Bm389SXt9slHS8nICWems6UY7weSJ/zgBLQXF
   xpAyucGjzqN9alESCOj+ajRR3YtWVqoRvxW/J0VBtD5cR9gIoxVmaOO/V
   eR8LTy36gLa1xI+RVhHpj14EIu6RI1ZPiTbrvt4lkvIaQxBhQShIBhx0K
   aEChIz3bBmNhfinBat0h3PIwiKV17kT7RmHfBo7tzI1uS/bFgFIX77TgV
   eNJ/lhX2GFekjhza6y1B6EXlzPncEmuxeYADS3sk2VWEqo4RJBy7UC0Kf
   A==;
X-CSE-ConnectionGUID: U+7nVexzQJW3C9b1X//hUQ==
X-CSE-MsgGUID: u//diWj9QA6olNYUGhnTcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="32790387"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="32790387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 07:55:37 -0700
X-CSE-ConnectionGUID: HIrCQdGWRH2FM3Z6COw14g==
X-CSE-MsgGUID: uYbj2MNuTRWA+Lm+6gAyyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79046671"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2024 07:55:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Are-000P5x-0e;
	Sat, 19 Oct 2024 14:55:34 +0000
Date: Sat, 19 Oct 2024 22:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv8 6/6] nvme: enable FDP support
Message-ID: <202410192252.E6dMxyiI-lkp@intel.com>
References: <20241017160937.2283225-7-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017160937.2283225-7-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.12-rc3]
[cannot apply to brauner-vfs/vfs.all next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-fs-restore-kiocb-based-write-hint-processing/20241018-041459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20241017160937.2283225-7-kbusch%40meta.com
patch subject: [PATCHv8 6/6] nvme: enable FDP support
config: i386-randconfig-061-20241019 (https://download.01.org/0day-ci/archive/20241019/202410192252.E6dMxyiI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410192252.E6dMxyiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410192252.E6dMxyiI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/core.c:2178:34: sparse: sparse: cast to restricted __le16

vim +2178 drivers/nvme/host/core.c

  2138	
  2139	static int nvme_fetch_fdp_plids(struct nvme_ns *ns, u32 nsid)
  2140	{
  2141		struct nvme_fdp_ruh_status_desc *ruhsd;
  2142		struct nvme_ns_head *head = ns->head;
  2143		struct nvme_fdp_ruh_status *ruhs;
  2144		struct nvme_command c = {};
  2145		int size, ret, i;
  2146	
  2147		if (head->plids)
  2148			return 0;
  2149	
  2150		size = struct_size(ruhs, ruhsd, NVME_MAX_PLIDS);
  2151		ruhs = kzalloc(size, GFP_KERNEL);
  2152		if (!ruhs)
  2153			return -ENOMEM;
  2154	
  2155		c.imr.opcode = nvme_cmd_io_mgmt_recv;
  2156		c.imr.nsid = cpu_to_le32(nsid);
  2157		c.imr.mo = 0x1;
  2158		c.imr.numd =  cpu_to_le32((size >> 2) - 1);
  2159	
  2160		ret = nvme_submit_sync_cmd(ns->queue, &c, ruhs, size);
  2161		if (ret)
  2162			goto out;
  2163	
  2164		i = le16_to_cpu(ruhs->nruhsd);
  2165		if (!i)
  2166			goto out;
  2167	
  2168		ns->head->nr_plids = min_t(u16, i, NVME_MAX_PLIDS);
  2169		head->plids = kcalloc(ns->head->nr_plids, sizeof(head->plids),
  2170				      GFP_KERNEL);
  2171		if (!head->plids) {
  2172			ret = -ENOMEM;
  2173			goto out;
  2174		}
  2175	
  2176		for (i = 0; i < ns->head->nr_plids; i++) {
  2177			ruhsd = &ruhs->ruhsd[i];
> 2178			head->plids[i] = le16_to_cpu(ruhsd->pid);
  2179		}
  2180	out:
  2181		kfree(ruhs);
  2182		return ret;
  2183	}
  2184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
