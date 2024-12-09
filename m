Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A26715C13F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718863; cv=none; b=JTnJRMf6BsMKcVY+JVeDWGGJHYgfy575d0ic8lD66Ldv+vzPXOYi+/JsfDtPwC1e3pkIjIeabvHUdATcB1aa22zEqPYoQ5RjPoJ03HxTO98n5EwsNROXfyIWgFpEZ6JAVK/TuwdTTL1nKkO3LJ3OV6uxwgzYCgRusFSTWAtZY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718863; c=relaxed/simple;
	bh=b86vIT/q6JzXIlYI/ahDRD2UrtWBM6Bein9OcH4SMec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOsw0ngdFA1+csEVeCZU0xJhXUJ0f40JgfnYzch82cy5rOIoCzOOs6ouBRvzYE6kdEFPMh6/BkU/LN513wkA0Qga9K0k/4ekzASJYAif9m9R57EJRhorwy4JX7bNuuvON5d+NcJc3153T0mleGqSdlgPXAeLVtkaLHj4GME78Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USHKqmD2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USHKqmD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718863; x=1765254863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b86vIT/q6JzXIlYI/ahDRD2UrtWBM6Bein9OcH4SMec=;
  b=USHKqmD2eIGVq82JUPDeuiCpxsNqWaCU0/Si6ysYUgJA3HhUrsT2JQLl
   lBCMwtSNam3MeuSVtAb9BRcy8CaUjqsOO9ixcCDVcLjqpFjgqt1EhttNj
   g3SgL+yIwD072OI0YkIeK78Tc3lKXp9o1blpAn07nI+mwZgmzGdy//Dgt
   8lWY8e64zRP65guAJ/AZ9a/iK8bHtySNnQbNjWiie1s+1Q9a2jwbI8b7v
   98Y9bqeIQ34GWcGh2QQ+EqmmjXRduzelykl5MZIFIYEiuk4ougYTTM44p
   HyTT1OFmbY9T/8IL9wtDHMpRdheDvVXl6BadR0C0VM99OcrVZATPSnihi
   Q==;
X-CSE-ConnectionGUID: tFQ5HPGeS4aRBq4dK1088Q==
X-CSE-MsgGUID: eavqh47TQnC97hjvKkL6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45014124"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45014124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:34:21 -0800
X-CSE-ConnectionGUID: p3EViXL9RiKhH1a/IW7NIA==
X-CSE-MsgGUID: 6T0rdX39TyO94pZRiI0Xew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95048928"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2024 20:34:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVTM-0003sU-1p;
	Mon, 09 Dec 2024 04:34:16 +0000
Date: Mon, 9 Dec 2024 12:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202412080800.7u41CGUl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 0110feaaf6d0610d0089ae4897387df9a963b5f0 arm64: Use new fallback IO memcpy/memset
date:   6 weeks ago
config: arm64-randconfig-r131-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080800.7u41CGUl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241208/202412080800.7u41CGUl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080800.7u41CGUl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@
   drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     got void *
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     expected void *mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     got void [noderef] __iomem *
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *dtb_mem_region @@     got void [noderef] __iomem * @@
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     expected void *dtb_mem_region
   drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     got void [noderef] __iomem *

vim +137 drivers/remoteproc/qcom_q6v5_pas.c

b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson     2016-08-22  121  
181da4bcc3d4bb drivers/remoteproc/qcom_q6v5_pas.c Krzysztof Kozlowski 2023-05-07  122  static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  123  		       void *dest, size_t offset, size_t size)
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  124  {
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  125  	struct qcom_adsp *adsp = rproc->priv;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  126  	int total_offset;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  127  
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  128  	total_offset = segment->da + segment->offset + offset - adsp->mem_phys;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  129  	if (total_offset < 0 || total_offset + size > adsp->mem_size) {
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  130  		dev_err(adsp->dev,
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  131  			"invalid copy request for segment %pad with offset %zu and size %zu)\n",
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  132  			&segment->da, offset, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  133  		memset(dest, 0xff, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  134  		return;
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  135  	}
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  136  
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02 @137  	memcpy_fromio(dest, adsp->mem_region + total_offset, size);
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  138  }
a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          2022-11-02  139  

:::::: The code at line 137 was first introduced by commit
:::::: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: Adjust the phys addr wrt the mem region

:::::: TO: Yogesh Lal <quic_ylal@quicinc.com>
:::::: CC: Bjorn Andersson <andersson@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
