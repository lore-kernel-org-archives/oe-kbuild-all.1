Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E817C7DC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718106142; cv=none; b=qQHqwFWv2cXUAn8azSHkh2ERvQnplDl1veRyNU3nn+45YMnpxYioJy/mpevphhw2lxVdyWPjwFuOSO0IG09Eo1VG8CKoPIVj81w5i2KZNeLnBlpJFbj9rtKR161fNqESlY6a6bECJo8wyTvw0XhJz/aWDjSHnV4PJrKQE5cbUmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718106142; c=relaxed/simple;
	bh=+eZ/orHRlNNKJzhLHKrlBGKnMkLzui0y8AfPPqyl0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syaKpHEnZOTu+nxER1AIdzHJ0Ukt/Q+ipB1kr+Bj5uRaK7u/jy183RI0urD6j/U+USjgrl+TeXwM45crS7r4Kuc+0978FkLEsLpKziOYNkkHe9Vh2hz5CTdJ9Gu7nfypYRsEAspfxGEXkveXXHqRJAYQZo8Ax9EJ7YsnHFqQaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6BpwXyY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6BpwXyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718106140; x=1749642140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+eZ/orHRlNNKJzhLHKrlBGKnMkLzui0y8AfPPqyl0P4=;
  b=A6BpwXyY/OF3CAmSmrD6WzEFwkR+ZNdz/nUyP8uUkEAD5+4qqVCbLqtI
   36q5dS0TAfrWy44zs3VbdOPB2xr23Mgca6vBYFj9NOLCszoSzSGRogr/o
   XTQRXo1SWAUsyQ+HX0BdjLUm1gngb3HoK/dKgrsAg5hCUpu5cc9KAra7G
   mSPxqtqzeOr0fc7eAKuBTdc0Sp2vaKRTy6OjwyzFPd0AK1ucrpw1d9ykl
   sLcQSTRfIaA/+Qcw+Ru43KCdaDh9qD+uvq4tiziEgbAcUISRU3wWVNAd8
   433qVxsQ4kCEEcJjUBnm4Aj7QgRI941VkJFqeIgQqhgyrMsnl7cSQaLbw
   g==;
X-CSE-ConnectionGUID: sEd/UG6tRpiaOIHg03dy4A==
X-CSE-MsgGUID: 1kxAurSJSp+aKw06EVcP9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14763015"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14763015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 04:42:19 -0700
X-CSE-ConnectionGUID: a23YGMf2Ti2nV1J0Ar124A==
X-CSE-MsgGUID: fPK1JBykRA2Zg4IwteLRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="44360231"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 04:42:19 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGztI-0000NI-0E;
	Tue, 11 Jun 2024 11:42:16 +0000
Date: Tue, 11 Jun 2024 19:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mohan Kumar <mkumard@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [linux-next:master 1544/4860] tegra210_i2s.c:undefined reference to
 `simple_util_parse_convert'
Message-ID: <202406111949.9WfZTbkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a957267fa7e9159d3d2ee1421359ebf228570c68
commit: 2502f8dd8c30edbca9253d5999294f58211039b1 [1544/4860] ASoC: tegra: I2S client convert formats handling
config: powerpc-randconfig-c003-20220322 (https://download.01.org/0day-ci/archive/20240611/202406111949.9WfZTbkM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111949.9WfZTbkM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111949.9WfZTbkM-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: sound/soc/tegra/tegra210_i2s.o: in function `tegra210_i2s_probe':
>> tegra210_i2s.c:(.text+0x538): undefined reference to `simple_util_parse_convert'
>> powerpc-linux-ld: tegra210_i2s.c:(.text+0x56c): undefined reference to `simple_util_get_sample_fmt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
