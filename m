Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25252848A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179580; cv=none; b=k+WcbfLIZYqb8l0c/N52BbB7C9Ye+gJ0IWxoLIzgp0VXOiQU5latT4dl3bUc/A3HY8wCQ0v6kva8oU+ClG4yDulMdDfENthKA58nKek2NsoitOgEm0VzyEI0rJ1K5HlSEV6ZqD2GVtC8uzx/0RgEdJMfqt/Uhm8rfH7KHMRzBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179580; c=relaxed/simple;
	bh=V9NmVG4bZXuLHEkIGQZQWoVHnZBDPMqegvOkdanL9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KlAK9QhtHkPRFoH57FW9knayvo/x5112xPr9XIMu01vx7Qp7FpMyhRJHq35rf+9YRdmCs5futdD/b6OQVpRQDfTPjd1IJRtfcDM0jHSA8QWDgJOkpsZh5RhGg+sibY93AVmdX2tB6k3vKyRzQOgbikbPkantIa28+VNHnpvlWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAJ2giU2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAJ2giU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766179579; x=1797715579;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=V9NmVG4bZXuLHEkIGQZQWoVHnZBDPMqegvOkdanL9MA=;
  b=CAJ2giU2xQSE2/qk5d0vdFefPVveEVGSH1rytzHfZ/SDHoaJ6FsmaEDi
   cXM40h5ps+KPPLYwU5OTO5kaoAMLOMOJ8kndOYZI28jhJWJNuXnaRETkU
   AEr/ZA81B4i/1dLklt2dDQJdab0YauQSNx6uCPP1btbfn9AE0GAjOAgYt
   u1d5vcRKmFozpdVzdHoMM7dS2qVlR3nafHEHY8Puqnh6vBixXUozqm0ND
   JJrw263SjoBM26qLFqFFpwgFdLQQ78VF1nda+DnO15A/q9s4i/Z5dAPNL
   FWXFYLHL3c0Mk3RdLcmCtFlAudI8gS1Nfy/b2pJeVOi5G24ztKAHvmvhg
   w==;
X-CSE-ConnectionGUID: zE14FfbDT9GMj5MqIIdjLQ==
X-CSE-MsgGUID: l9rATdUFS2O/A2EX9xiQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="72002064"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="72002064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 13:26:18 -0800
X-CSE-ConnectionGUID: tnAw63vdSA2g+wIP8H7ZLA==
X-CSE-MsgGUID: /GP9DHrPRGaKEQXEX6oaPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="229638445"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2025 13:26:17 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWhzK-0000000040W-2k9L;
	Fri, 19 Dec 2025 21:26:14 +0000
Date: Sat, 20 Dec 2025 05:25:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/4]
 drivers/remoteproc/remoteproc_core.c:193: warning: Function parameter or
 member 'is_iomem' not described in 'rproc_da_to_va'
Message-ID: <202512200545.pHT2yPkw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: 0cf9435352d4caac1aa224ddfac371ba40a62ea4 [0/4] BACKPORT: FROMGIT: remoteproc: add is_iomem to da_to_va
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512200545.pHT2yPkw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200545.pHT2yPkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200545.pHT2yPkw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/remoteproc/remoteproc_core.c:193: warning: Function parameter or member 'is_iomem' not described in 'rproc_da_to_va'


vim +193 drivers/remoteproc/remoteproc_core.c

eb30596eae947ce Loic Pallardy   2018-07-27  162  
a01f7cd657c9594 Suman Anna      2015-05-22  163  /**
a01f7cd657c9594 Suman Anna      2015-05-22  164   * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
a01f7cd657c9594 Suman Anna      2015-05-22  165   * @rproc: handle of a remote processor
a01f7cd657c9594 Suman Anna      2015-05-22  166   * @da: remoteproc device address to translate
a01f7cd657c9594 Suman Anna      2015-05-22  167   * @len: length of the memory region @da is pointing to
a01f7cd657c9594 Suman Anna      2015-05-22  168   *
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  169   * Some remote processors will ask us to allocate them physically contiguous
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  170   * memory regions (which we call "carveouts"), and map them to specific
a01f7cd657c9594 Suman Anna      2015-05-22  171   * device addresses (which are hardcoded in the firmware). They may also have
a01f7cd657c9594 Suman Anna      2015-05-22  172   * dedicated memory regions internal to the processors, and use them either
a01f7cd657c9594 Suman Anna      2015-05-22  173   * exclusively or alongside carveouts.
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  174   *
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  175   * They may then ask us to copy objects into specific device addresses (e.g.
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  176   * code/data sections) or expose us certain symbols in other device address
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  177   * (e.g. their trace buffer).
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  178   *
a01f7cd657c9594 Suman Anna      2015-05-22  179   * This function is a helper function with which we can go over the allocated
a01f7cd657c9594 Suman Anna      2015-05-22  180   * carveouts and translate specific device addresses to kernel virtual addresses
a01f7cd657c9594 Suman Anna      2015-05-22  181   * so we can access the referenced memory. This function also allows to perform
a01f7cd657c9594 Suman Anna      2015-05-22  182   * translations on the internal remoteproc memory regions through a platform
a01f7cd657c9594 Suman Anna      2015-05-22  183   * implementation specific da_to_va ops, if present.
a01f7cd657c9594 Suman Anna      2015-05-22  184   *
a01f7cd657c9594 Suman Anna      2015-05-22  185   * The function returns a valid kernel address on success or NULL on failure.
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  186   *
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  187   * Note: phys_to_virt(iommu_iova_to_phys(rproc->domain, da)) will work too,
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  188   * but only on kernel direct mapped RAM memory. Instead, we're just using
a01f7cd657c9594 Suman Anna      2015-05-22  189   * here the output of the DMA API for the carveouts, which should be more
a01f7cd657c9594 Suman Anna      2015-05-22  190   * correct.
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  191   */
0cf9435352d4caa Peng Fan        2021-03-06  192  void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
400e64df6b237eb Ohad Ben-Cohen  2011-10-20 @193  {
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  194  	struct rproc_mem_entry *carveout;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  195  	void *ptr = NULL;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  196  
a01f7cd657c9594 Suman Anna      2015-05-22  197  	if (rproc->ops->da_to_va) {
0cf9435352d4caa Peng Fan        2021-03-06  198  		ptr = rproc->ops->da_to_va(rproc, da, len, is_iomem);
a01f7cd657c9594 Suman Anna      2015-05-22  199  		if (ptr)
a01f7cd657c9594 Suman Anna      2015-05-22  200  			goto out;
a01f7cd657c9594 Suman Anna      2015-05-22  201  	}
a01f7cd657c9594 Suman Anna      2015-05-22  202  
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  203  	list_for_each_entry(carveout, &rproc->carveouts, node) {
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  204  		int offset = da - carveout->da;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  205  
74457c40f97a981 Loic Pallardy   2019-01-10  206  		/*  Verify that carveout is allocated */
74457c40f97a981 Loic Pallardy   2019-01-10  207  		if (!carveout->va)
74457c40f97a981 Loic Pallardy   2019-01-10  208  			continue;
74457c40f97a981 Loic Pallardy   2019-01-10  209  
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  210  		/* try next carveout if da is too small */
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  211  		if (offset < 0)
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  212  			continue;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  213  
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  214  		/* try next carveout if da is too large */
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  215  		if (offset + len > carveout->len)
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  216  			continue;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  217  
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  218  		ptr = carveout->va + offset;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  219  
0cf9435352d4caa Peng Fan        2021-03-06  220  		if (is_iomem)
0cf9435352d4caa Peng Fan        2021-03-06  221  			*is_iomem = carveout->is_iomem;
0cf9435352d4caa Peng Fan        2021-03-06  222  
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  223  		break;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  224  	}
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  225  
a01f7cd657c9594 Suman Anna      2015-05-22  226  out:
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  227  	return ptr;
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  228  }
4afc89d66c60a37 Sjur Brændeland 2012-06-19  229  EXPORT_SYMBOL(rproc_da_to_va);
400e64df6b237eb Ohad Ben-Cohen  2011-10-20  230  

:::::: The code at line 193 was first introduced by commit
:::::: 400e64df6b237eb36b127efd72000a2794f9eec1 remoteproc: add framework for controlling remote processors

:::::: TO: Ohad Ben-Cohen <ohad@wizery.com>
:::::: CC: Ohad Ben-Cohen <ohad@wizery.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
