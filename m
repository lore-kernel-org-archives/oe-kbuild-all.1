Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9967C1D8A10
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737699601; cv=none; b=WbrzjfyNCd59CcdyjBcMqaXy6WlN3B1xYfln5Esj94QrnDCOsIgPoIiLMPHES5QQyQHn0ZiCr+WJMOuOCgwrj+C4LCdWHe/w1MTVxcGEld+VIbo3qqlhabJUhI7R0p1hGdtxkGXB6VhkZgah1qw6kCRBXpCjRBbcy7a6uSWWaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737699601; c=relaxed/simple;
	bh=23Rn4APbS7vpkN+lz6ihtZqNRys8yZicKNYI4oVTLAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MIJFrxQeiQF1diInXNU3HoAdUHP7MArKgE218H91EtGGsLkCtGK/bfi/F9PRIGptPEniWxlXoczIlMElesGVAtcxpuYj3vTsuJeBItP55z9OoWga66PinyZO2bI2xGiyjMQcZMkC4/ATPQ459+HCLTa6lUUtGezU6rmE9H1CjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Odms5Y7W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Odms5Y7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737699600; x=1769235600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23Rn4APbS7vpkN+lz6ihtZqNRys8yZicKNYI4oVTLAQ=;
  b=Odms5Y7WhztV3G/4d3d2XE6GuXsHxl4xndb9y+7t7lJHNi1EMtwR4Gs9
   khBIWRBRO2jxqDfsDy4Eae5HsAf39lZ9lH+HmX3m08uqgzBuMXv7ohkEa
   EGkrdGO1iG6+ZforPlsSnJm2ejOgst6TAve+BmXiUeAKP1d20738UGgtb
   JD9rffbWLeGaRmrkx2KCyAAxoQEBByGnFI4hOPi4VqOj6aDmWztqncUER
   9wxVNwyieRqaqd4DNdd6eE4xQoltMIawApuB6B8q4sCSsxp0h8jMVUPwg
   mbO0XcrcsCjMmPJ7zcj1j6fj7v9/5MRNnkd+nS64ncxdfYCLMdZtMssQV
   Q==;
X-CSE-ConnectionGUID: oc9JQUXwTaybGqPu4kXPYQ==
X-CSE-MsgGUID: deflsR5RQPGXD9XHZUKXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63580392"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="63580392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 22:19:57 -0800
X-CSE-ConnectionGUID: 6LJ8mDYNTzqn5ZNagz+yxQ==
X-CSE-MsgGUID: RYVH5BdEQJixyJvmynjqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107685415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2025 22:19:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbD2n-000cGb-1r;
	Fri, 24 Jan 2025 06:19:53 +0000
Date: Fri, 24 Jan 2025 14:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 1/1] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by
 VIDEO_SUN8I_A83T_MIPI_CSI2
Message-ID: <202501241417.Deb0Nk2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   3da680f5f6bdcaab02a60f017134c28cde22a8eb
commit: 582d4ad468cbc6ef2db4689ff3bd5868d95402c9 [1/1] media: tc358746: select CONFIG_GENERIC_PHY
config: x86_64-kismet-CONFIG_GENERIC_PHY_MIPI_DPHY-CONFIG_VIDEO_SUN8I_A83T_MIPI_CSI2-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241417.Deb0Nk2B-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241417.Deb0Nk2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241417.Deb0Nk2B-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by VIDEO_SUN8I_A83T_MIPI_CSI2
   WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
     Depends on [n]: GENERIC_PHY [=n]
     Selected by [y]:
     - VIDEO_SUN8I_A83T_MIPI_CSI2 [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y] && (ARCH_SUNXI || COMPILE_TEST [=y]) && PM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
