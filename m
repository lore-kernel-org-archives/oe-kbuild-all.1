Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD252609C5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611222; cv=none; b=dgOo9uFBCkuaOt2R4yVi5cYaEwyojPqihudZK6rfj0P4QIVb/rWFBTe2q/XoP/tMghbEursdXZi16Pucj5NWiorquIF++GKUWt7YTEwJpcI/egyOk5/KSYVBgFt8YmtvauPsHlj1VRWtQXtnXhhk23e97RAKda6TMpNFW2R3Ah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611222; c=relaxed/simple;
	bh=nVG3QuhIqVNdinG5EEi6Gw+2DwHLblxLxuqbgCaXKvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYi+88q9UOOXWizj7wFPHpsZpbheqQ+oqnGURvbSii0UptSHDemeY/ZtMg5eMA6UTOxXbxS63ELu0JNavyKJVgNNxlWEtZZi7puz1hrwR5PCtmyuONKL7nM1uZEXgtNM0qKxJcGJudHAsXScS25riPyNQ37boFGRe3sZmznNqWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgsPNobf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgsPNobf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751611220; x=1783147220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVG3QuhIqVNdinG5EEi6Gw+2DwHLblxLxuqbgCaXKvc=;
  b=QgsPNobfT6N6SdhuUYU7NPTAYK4Ve8qPeNGxn7cu4I/MZFII94oamzIu
   6uNCTpDVXnMMKLF/U3NuJwlQn5pyuxizL8UPs83AI8mM+qHf7CBbCbH3h
   qp1EoQQHwHuNpl7jmkZb1qMi/KnG8O2sSdy1uD+YA3+ZpT58zil1gO0GW
   BPgE9Hg1YGuyOwcKUx49FboICLERgV2mKSSfGoaAc/5ClPOveuoNeX1PM
   nQEGRVD67nMTVYFBiSm7AUmUc7zHDSXrdMwRbCJVoT/ipbs+Bjhksgiq7
   UabjGJ8MqyQvEFumbMEwF+IB5Jq0PTdR9TxN3nrvfzds1j+b8nDdTLflF
   w==;
X-CSE-ConnectionGUID: JO6ma1ZFQ6GaClVrnNCq7A==
X-CSE-MsgGUID: xkC8P0uuS6ukqyu9Fdtncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="65393723"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="65393723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 23:40:18 -0700
X-CSE-ConnectionGUID: +rRVooAzRw+jqC24crOWOg==
X-CSE-MsgGUID: I6KFIwocQl+Ae+sj+5RTfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158602285"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2025 23:40:17 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXa5m-0003Pb-2n;
	Fri, 04 Jul 2025 06:40:14 +0000
Date: Fri, 4 Jul 2025 14:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 12/12] kismet: WARNING: unmet direct
 dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
Message-ID: <202507041448.BLQAYb50-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3ccff695ec5dcfc5a0c7553952fc15b884bcf790
commit: 09f6a7bcc18d8ef3f558da6a12d1345cdbcc507b [12/12] anolis: Add mediated ccp driver support for hygon crypto technology.
config: x86_64-kismet-CONFIG_VFIO_MDEV-CONFIG_CRYPTO_DEV_HCT-0-0 (https://download.01.org/0day-ci/archive/20250704/202507041448.BLQAYb50-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250704/202507041448.BLQAYb50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041448.BLQAYb50-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for VFIO_MDEV when selected by CRYPTO_DEV_HCT
   WARNING: unmet direct dependencies detected for VFIO_MDEV
     Depends on [n]: VFIO [=n]
     Selected by [y]:
     - CRYPTO_DEV_HCT [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && CRYPTO_DEV_CCP [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
