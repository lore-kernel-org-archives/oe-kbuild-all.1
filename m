Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53D4399FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832889; cv=none; b=O9PctOEUhiMURja/BvC7526YkTK/0BzAL/4nq7aKvhaM7F5AVsvRQ6hjavP4UzTBKYVQUoTfD6QPOOPGUCxkrf1mcaq67iTsUFqaFXsTwR8Jahx3LET+XGmn93tZDS3dD/60DFXwlcDlFjRlqpK/yBnzfWgxPMx0fsX0/nFnEk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832889; c=relaxed/simple;
	bh=LE+ETnB0HhxcAnO10AsB6UbFIaFKgNe5AW7K145UK78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAN3ru4XZLkOUBBMZbYn9zItQ4Osf7rBWHpvBudNtHP+XDsy5sDS7SUJQON3VPJ4GmpQA0UE3Vse7z6vlzuERs3TbDgRL2zgqKZLyQ/mZ4monwFany2RLBJBHy+O+k8Xg2829cKtsWVKBx1p64uQxZrv6hNTnDSjaIt+5oLzdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4Wpmyqj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4Wpmyqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785832887; x=1817368887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LE+ETnB0HhxcAnO10AsB6UbFIaFKgNe5AW7K145UK78=;
  b=e4WpmyqjTU0/un9WsP8FG2I5e3Zug3719SnchfrgJ8KPIL2fXoXsHBIN
   YxS1vTDdfKFTnmPL80sjursF2hWPdQ6WX97kzPhDij+M2CI+nGvK53KoM
   P/IsBvvd+fReWEBAV12jN97rjVSbMggqY2YAKpHljySAJp9KZWikb+xJZ
   ra92z+biDvHjEbglaxPl/GMS5CnzgqZzMB98soVdU0PDWOQSaw50JMT0M
   KAFZ+FMM/sKYJdwDTCvCSFBnSjOKyqEr/LBAQl/you7QWh1qaaxQqsd8m
   sl++bwLHZvBfV62zAozmKE/7LYQw0FCtoQCRlj7YRRWW3Q3fna8CeWzYp
   Q==;
X-CSE-ConnectionGUID: nxl/bf+nTn+2G6bfpZAYxQ==
X-CSE-MsgGUID: E85ZraKnSPig9yzr4jv4EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="109171030"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="109171030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:41:25 -0700
X-CSE-ConnectionGUID: Q7IG+ZUqREm79l5agWpV0g==
X-CSE-MsgGUID: HqWB41UgTlOXLlvgB7ZdRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263437417"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2026 01:35:27 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAcM-000000009QT-1cBs;
	Tue, 04 Aug 2026 08:35:22 +0000
Date: Tue, 4 Aug 2026 16:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mmc: cqhci: keep CQE enabled if halt times out
Message-ID: <202608041620.iAoTxeA4-lkp@intel.com>
References: <20260623140401.80963-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623140401.80963-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on riteshharjani/for-next v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/mmc-cqhci-keep-CQE-enabled-if-halt-times-out/20260804-080106
base:   linus/master
patch link:    https://lore.kernel.org/r/20260623140401.80963-1-pengpeng%40iscas.ac.cn
patch subject: [RFC PATCH] mmc: cqhci: keep CQE enabled if halt times out
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260804/202608041620.iAoTxeA4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041620.iAoTxeA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041620.iAoTxeA4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/cqhci-core.c:1136:20: error: initialization of 'void (*)(struct mmc_host *)' from incompatible pointer type 'bool (*)(struct mmc_host *)' {aka '_Bool (*)(struct mmc_host *)'} [-Wincompatible-pointer-types]
    1136 |         .cqe_off = cqhci_off,
         |                    ^~~~~~~~~
   drivers/mmc/host/cqhci-core.c:1136:20: note: (near initialization for 'cqhci_cqe_ops.cqe_off')
   drivers/mmc/host/cqhci-core.c:375:13: note: 'cqhci_off' declared here
     375 | static bool cqhci_off(struct mmc_host *mmc)
         |             ^~~~~~~~~


vim +1136 drivers/mmc/host/cqhci-core.c

a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1130  
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1131  static const struct mmc_cqe_ops cqhci_cqe_ops = {
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1132  	.cqe_enable = cqhci_enable,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1133  	.cqe_disable = cqhci_disable,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1134  	.cqe_request = cqhci_request,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1135  	.cqe_post_req = cqhci_post_req,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29 @1136  	.cqe_off = cqhci_off,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1137  	.cqe_wait_for_idle = cqhci_wait_for_idle,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1138  	.cqe_timeout = cqhci_timeout,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1139  	.cqe_recovery_start = cqhci_recovery_start,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1140  	.cqe_recovery_finish = cqhci_recovery_finish,
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1141  };
a4080225f51dce drivers/mmc/host/cqhci.c Venkat Gopalakrishnan 2017-11-29  1142  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
