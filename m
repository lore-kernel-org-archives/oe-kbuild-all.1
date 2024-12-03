Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF71DFE2E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212926; cv=none; b=KcmBqWUXOZnKOUKub/79P0SxduI8344NPWPBgIUel5m/AkSUZSqxDzxcUazVHJtD/wXur4lIW0r6jmFOcO3OsmoQAlSo6ldopt/iRBkHepd94LMb8FS45z51mE0fAVDOQi4ThkKBLWeisGjYi0kcVKB1yC1CWf3e7n/fEVjZfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212926; c=relaxed/simple;
	bh=bgUgNjI5CwZYUCMaIi5Pl9Y4YHyJdxRhabmmG4cHyO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjifpJwWR7cy9EWWZXefeYTKr479+x+zAz6iDNmVEN+T/SNcLVXCZ45sgqbdenQ4cN42zm07OEf11IExs8IY+ltKfWMLTAU296VJtTo5bEBsZZ5TvHbbichpqfmnhwsGyr2hJOYSKEMIFFl0hMd5pEq/lrab1crIO4LheKiv2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLtqZF+9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLtqZF+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212925; x=1764748925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bgUgNjI5CwZYUCMaIi5Pl9Y4YHyJdxRhabmmG4cHyO0=;
  b=SLtqZF+9vwDmmZ3oirLMHTnfGm1H+MhIz44hHFRiaYOeN72sx6adUHlP
   6Y3HL+h1z9qsOumVhBcQ1P8PrQ5Lt8/rbXKbf67MadyRchPYo2loCOmTD
   6hUaExP9IZ5PqoV2/85hKSBSdmGMss4RUFPGP8gORwzgb+BZOREm7gR62
   7pmZugA+6gH0ca+g+XYtIGUfc/I3DFnzxeLXQkb3W/rofA01xeprq6Z/C
   2ByVxkSnv4Xeod+6eLE9mm4kj5H3TjmaJZpo+zlEmCIJxAF5LRRYE658+
   oMv6f+5R4zi4mHnX4TjKRqkoWgjyGvcfbbZEMrIHsuBDKJb681oxtpl0i
   w==;
X-CSE-ConnectionGUID: 7ImnCjq6R4yTgqfcUOe6HQ==
X-CSE-MsgGUID: 54FU5zEfQ+GcDsprt1lckw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44079175"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44079175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:02:03 -0800
X-CSE-ConnectionGUID: jm/ynzqCRMOxyvJjqfPJFA==
X-CSE-MsgGUID: GmlW304CR/OQh3jNYKvfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98364762"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 00:02:02 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINr5-0000KJ-1K;
	Tue, 03 Dec 2024 08:01:59 +0000
Date: Tue, 3 Dec 2024 16:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yogesh Lal <quic_ylal@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Subject: drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202412031509.TMyYOtXN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: Adjust the phys addr wrt the mem region
date:   1 year, 10 months ago
config: arm-randconfig-r123-20241111 (https://download.01.org/0day-ci/archive/20241203/202412031509.TMyYOtXN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20241203/202412031509.TMyYOtXN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031509.TMyYOtXN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *from @@     got void * @@
   drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse:     expected void const volatile [noderef] __iomem *from
   drivers/remoteproc/qcom_q6v5_pas.c:123:9: sparse:     got void *
   drivers/remoteproc/qcom_q6v5_pas.c:108:6: sparse: sparse: symbol 'adsp_segment_dump' was not declared. Should it be static?
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:553:26: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:575:30: sparse:     got void [noderef] __iomem *

vim +123 drivers/remoteproc/qcom_q6v5_pas.c

   107	
   108	void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
   109			       void *dest, size_t offset, size_t size)
   110	{
   111		struct qcom_adsp *adsp = rproc->priv;
   112		int total_offset;
   113	
   114		total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
   115		if (total_offset < 0 || total_offset + size > adsp->mem_size) {
   116			dev_err(adsp->dev,
   117				"invalid copy request for segment %pad with offset %zu and size %zu)\n",
   118				&segment->da, offset, size);
   119			memset(dest, 0xff, size);
   120			return;
   121		}
   122	
 > 123		memcpy_fromio(dest, adsp->mem_region + total_offset, size);
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
