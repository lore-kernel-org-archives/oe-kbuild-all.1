Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D222CBE2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128584; cv=none; b=E69Dpww4bG2w8aTiXcXpd2BrqeU9Fs8CH/PNvMM/hlSSJOUB6GOTGxsA45VupV/mZZ2cQ20K//tbUwYxpBswXnltbuOjP8QomkclYYymp0Wu06dsOobCFOT9nnqT2EplZiByu9MHRrQFYoHwJmW1o407n6Cc5rOMHHsXxyX8NKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128584; c=relaxed/simple;
	bh=kzVIzJpPImDvtUaq3k9IfUyVyA/ZZpSzEr7ygSYATFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omX5YzWFlCHeaiAr2pW5yHG3Sw1oTanzNOKes798BKd3tFrSLWRZhB4gWXSXRHqLA1zSuC04GfaEgfWOSfItBxZ9jsBurFIxYFa5jsi6q5QrX+qZkVjHjrtCk3i6i1noc0sXEN2x3lGVkY0koQsLN3FVuA7adaUuF9uzuL7gisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaElb4PM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaElb4PM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744128581; x=1775664581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kzVIzJpPImDvtUaq3k9IfUyVyA/ZZpSzEr7ygSYATFg=;
  b=OaElb4PMpF9JVe6AXIkYdYxpDNB9ieU6Wn2cB+GNkdUTcOKhlnh+7AKs
   Uo7ZFLOXHjP/ILFI71KnUab5xel+ssR65WQn+N9w5x/u7YljmAsLa3J6l
   ru14kM8oOjG8JSx1l4/RfZ3G6qeGDhUmH00rIZOo5Z5gYVN3jhJf/Lq9z
   FBCdOgAUCBfI89a/E+tR4CLVxGy5h2rfqyo+B/HKFy6Sl1hDpvG4q/y5t
   H3KzEbbMDCKUCOFT2K5TY7RtWjLYV0oyV66uOyrdP5s2ra50GAoMKYlj9
   mc09xKeIGSTFm3CbHuR19SzcF44hZlo/c91QdDKteof5VR4LJZZGn1lTs
   A==;
X-CSE-ConnectionGUID: mQ9k8C7pQNSbp96/krBpLw==
X-CSE-MsgGUID: QU84TrNNTR6jo5/eb7AxLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45460225"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45460225"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:09:40 -0700
X-CSE-ConnectionGUID: raCcpS2SQLCRT2TQOk0bJw==
X-CSE-MsgGUID: +spXU+pkSASF1GpZ3zwD/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133457924"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 09:09:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2BVk-0007fb-3B;
	Tue, 08 Apr 2025 16:09:16 +0000
Date: Wed, 9 Apr 2025 00:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202504090008.W0dPKjxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [9/9] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20250409/202504090008.W0dPKjxV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250409/202504090008.W0dPKjxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090008.W0dPKjxV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
