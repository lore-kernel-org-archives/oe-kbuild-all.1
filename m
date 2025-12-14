Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19E223B627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 23:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765753673; cv=none; b=Wf2UKoOwFhvopQPUH4812Q56CX0QKfZRyaBKLtChBfsRiQUuSy7AhUC+zqW0lyU38dgVKbTMWwMGX0bHkiCtDLL+Cha6qGsWOscijogp6WSkUEkq+76yjBe07DH7YMet+oEzXxrmjiK1DCt21/Ubp6XJaIxI3lLZMRcVmXDCQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765753673; c=relaxed/simple;
	bh=vCOIiVd97akGBcaFl6wbelHhCXpZHF4TPK8hd4012cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiqaLxsyPZtIjK0dal+WYnSluZ9Rd3g6Yuhd0dGMQQxkUNfKY6mX8yxoDw6PXDUfnGHis8kj0HfexrkVJNz5OMvYHt91UiIpiksD5+kdIzd4iUGyLS2ds698+J0LETOgQ8pRXZRfRCvFTlJvnEV2KUIXuHRbwH8HbpZLKdBsqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoyX1xrv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoyX1xrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765753672; x=1797289672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCOIiVd97akGBcaFl6wbelHhCXpZHF4TPK8hd4012cw=;
  b=QoyX1xrvPxOVoNyUZ94kEIS14lmDErxFRk4xZsStR57oahGNJSIm/Viq
   8TEXraVjtch8RUt7Xhfkcjf/XYpaQep/yRK6+nXEHkJnIg5NQsM2v/avx
   s+apb9OnKaYbp5+S7y0NDLK5TWkK2TMyAWhfGuqjqMA0TyD6dB6VKLW8t
   DUqxn/oNZuJO2VInb2hOuXDkBDOXqhEwwciCi4DXbmg9hSuZyEmatPVNG
   Noq73B3f8Fo8Cn3YMOin4L7QtoAsSGUmX48QEL1/B3/i7zuoDHES3dIq8
   +xMYZRYJKIuZVOP/PRdWs+YuoGAI3BbUbWWKuc+6X0g/6dyEk4JEXHjWO
   Q==;
X-CSE-ConnectionGUID: VD6530dmS7qG3w5WhSDbRA==
X-CSE-MsgGUID: lOeGCBzZQcuP11wus39D7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66838473"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66838473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:07:51 -0800
X-CSE-ConnectionGUID: RHpXCkwsSb2kO9xA/QSpJQ==
X-CSE-MsgGUID: m/nFgvb0QmORZMf2brwA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201989824"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 15:07:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvBs-000000009TN-0tXI;
	Sun, 14 Dec 2025 23:07:48 +0000
Date: Mon, 15 Dec 2025 07:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c:1316: warning:
 Function parameter or member 'pf' not described in
 'nfp_cpp_from_nfp6000_pcie'
Message-ID: <202512150627.MKixaWD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 596d74aef182753626baf6fed836e46281c9d980 [25/25] anolis: nfp: fix initialization of incorrect PF id
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251215/202512150627.MKixaWD6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150627.MKixaWD6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150627.MKixaWD6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c:1316: warning: Function parameter or member 'pf' not described in 'nfp_cpp_from_nfp6000_pcie'


vim +1316 drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000_pcie.c

4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1305  
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1306  /**
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1307   * nfp_cpp_from_nfp6000_pcie() - Build a NFP CPP bus from a NFP6000 PCI device
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1308   * @pdev:	NFP6000 PCI device
9423d24b7b84b01 Jakub Kicinski 2022-03-11  1309   * @dev_info:	NFP ASIC params
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1310   *
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1311   * Return: NFP CPP handle
4cb584e0ee7df70 Jakub Kicinski 2017-02-09  1312   */
9423d24b7b84b01 Jakub Kicinski 2022-03-11  1313  struct nfp_cpp *
596d74aef182753 Yinjun Zhang   2024-03-06  1314  nfp_cpp_from_nfp6000_pcie(struct pci_dev *pdev, const struct nfp_dev_info *dev_info,
596d74aef182753 Yinjun Zhang   2024-03-06  1315  			  struct nfp_pf *pf)
4cb584e0ee7df70 Jakub Kicinski 2017-02-09 @1316  {

:::::: The code at line 1316 was first introduced by commit
:::::: 4cb584e0ee7df70fd0376aee60cf701855ea8c81 nfp: add CPP access core

:::::: TO: Jakub Kicinski <jakub.kicinski@netronome.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
