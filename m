Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9148125E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334716; cv=none; b=qI7lu1hg9a6SPjjGDjER51pq9lnQs62BjcU/WPaHzPTE6QpJ/2p19b3oviT0GWRIa0pjrqfV8k/XGRNNqbnx1H5DGIMgKTkaCJp9iVIvSx6XrK/H+iJg2EqzRkfqVoadq7dlLvZqp8KchenMG0KeS8+34qlhoKP+sZqqvhWDgO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334716; c=relaxed/simple;
	bh=L1iKqVKpSI4Q/25zwsA7+a29yY9OsmEt3fmM5/XNzbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FHo7afIZYb4ika+bzwImw/Ml0IVPS5YFU1HpOGoMQ0YfkOWAWQMLrHauFKuEdL9iDxGCuYeBDZ3ABT52wH+gLlPm1Rg3OTPobulNmEHrvYLG1gS8be4L8VmwNM1i1o8Kf5xenqJbLYdBprLACxSA0icJ5wRu/v4yjNSGjbmtjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8DRVUpk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8DRVUpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334715; x=1821870715;
  h=date:from:to:cc:subject:message-id;
  bh=L1iKqVKpSI4Q/25zwsA7+a29yY9OsmEt3fmM5/XNzbw=;
  b=g8DRVUpkjhsrkF7nY3Pks9YBnvWdVx8FwDyEwh5yJ1QCBS/UMUp7JhaP
   98xGn1X+JyJL77hbcV7F2dOuVX3c4R0CYBGECXFR6nnw0yWyCKb3wJH3A
   NELwEwbM/DSVn8imPdjLMVN+4JbuDcAmUqNWcIML2BXBbvRgwFm/a1U5X
   u6ExQCXZsfNhiFy0LwDUSAQ3h5HDyzHdcL6OLqUZfqhDpkY5Q4KUwIGXG
   crp4Fi+a01+Sxjqa0HNSUL8+EJhPNN8UviI6pnU7t849ztrjdf9li8CWu
   inWqXj1n9mO6hvZAoLjgfI3d3ZMasq0d+AFb0jcY19mLgdsKq2mL6UYAH
   Q==;
X-CSE-ConnectionGUID: B7njn63qTUGpKSER11WXtQ==
X-CSE-MsgGUID: YS48j4T1QhyLZXgZdxtfpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90025776"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90025776"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:11:54 -0700
X-CSE-ConnectionGUID: eaoDzsjBQ2O9PpKCGTsi7g==
X-CSE-MsgGUID: /4vS1kMuRgCOFaynrcZjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273803661"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 04:11:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3qI-00000000KVM-3Z1c;
	Fri, 25 Sep 2026 11:11:50 +0000
Date: Fri, 25 Sep 2026 19:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:arm64_drtm 5/16] ld.lld: error: EFI image-info
 offset does not fit in u32
Message-ID: <202609251922.70jn3Zk8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux arm64_drtm
head:   f74a1d086340aa6849273803595e354c174edc4b
commit: e2ce9e9cd04c8cf7d55de758ff3e44e12e8c75a2 [5/16] arm64/efi: Use CONFIG_EFI_STUB_IMAGE_INFO for code_size
config: arm64-randconfig-r1300-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251922.70jn3Zk8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251922.70jn3Zk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251922.70jn3Zk8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: EFI image-info offset does not fit in u32
>> ld.lld: error: EFI image-info offset does not fit in u32
>> ld.lld: error: EFI image-info offset does not fit in u32

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
