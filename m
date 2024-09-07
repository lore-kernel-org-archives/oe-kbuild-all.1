Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA028F0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730026; cv=none; b=OIR02X+gEt26HXW8ygDzlg9LPc4eRi4tOxvuDxDRdCdByc5nmyhmbfROmpCOeXFfFLfC6fbI6FlUknUyJ7k2kiBmBbcon/7G/l+MS5eZryc+gjn11uvF5/Hx8IFzOvPnMyMwUOtT6vU/TimWhs8px6XfFjrEV7Dhzh4H+3TW07c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730026; c=relaxed/simple;
	bh=hDsC7Pa6/UoFWS4srfKK1DQL6bHDjYFxHYU+n+wTzP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bB6BL8Bay3lezO9qlEtCZSduUQyrk9svSXQqUx/ESHpfoOnli548NJCdrE/AxVLUWqPatxe00jN9FznKxyZmwJa9weD3sn067HkCOi/Foxe2cZQOcJO05XEekB7hTG5iMzYmy3bNL1gIJyn33wZtFWUKrlRtoHZ/LAt4GCqsvXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aprHNaVf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aprHNaVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730025; x=1757266025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDsC7Pa6/UoFWS4srfKK1DQL6bHDjYFxHYU+n+wTzP4=;
  b=aprHNaVf1lifcKTIn3xL+P2I3hwW9xyvvu+n0mIbx2vv1+m3Xj8KtiaI
   s6UmJWyZBzyX2WXPsIvVCSBPx73d8UwJ9OkIM4zbASttILlu+wKtYSxaw
   EexOH6BqLqxcdO9NdNUvCqvV7xrhBbD4L89Qst2/+dYOhm+rLfdp7wfvh
   a0rrW8VFZ1w0gXH3J8jBteKgZFVAsU3/xc4lZmUgjw3WqnxNP9YQvR6IN
   hwhIH+ZEppgUxzlMgBgB2j+YBjSJWIg9nfNzdChrYX8Ere+E0n/cnorz3
   Q1Rr1E+vgDJ/fvWAEBtMcKdPeb6b88uDfRc0jc46uswdpKYJhJLMzKxkH
   g==;
X-CSE-ConnectionGUID: jZtFZvA8QTyZVWb8Fl3T7Q==
X-CSE-MsgGUID: IZtKw+ZfSLyVoh+46aNdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="49881822"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="49881822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:27:04 -0700
X-CSE-ConnectionGUID: jR/CmZ3eQau2qQ8qF/ZqMQ==
X-CSE-MsgGUID: pkSppw4ZQ2W1O0Op8MCT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66976000"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Sep 2024 10:27:03 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzDA-000Cmc-1z;
	Sat, 07 Sep 2024 17:27:00 +0000
Date: Sun, 8 Sep 2024 01:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 149/155] kismet: WARNING: unmet direct
 dependencies detected for Z3FOLD when selected by ZSWAP_ZPOOL_DEFAULT_Z3FOLD
Message-ID: <202409080151.fMmh2yu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   e8d9739d326fade1f58bc90726d2f9ebe35ae708
commit: 4f6a358be27cd25e5e808031cc1715c2b6a0ef6f [149/155] mm: z3fold: deprecate CONFIG_Z3FOLD
config: x86_64-kismet-CONFIG_Z3FOLD-CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD-0-0 (https://download.01.org/0day-ci/archive/20240908/202409080151.fMmh2yu4-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240908/202409080151.fMmh2yu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080151.fMmh2yu4-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for Z3FOLD when selected by ZSWAP_ZPOOL_DEFAULT_Z3FOLD
   WARNING: unmet direct dependencies detected for Z3FOLD
     Depends on [n]: Z3FOLD_DEPRECATED [=n]
     Selected by [y]:
     - ZSWAP_ZPOOL_DEFAULT_Z3FOLD [=y] && ZSWAP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
