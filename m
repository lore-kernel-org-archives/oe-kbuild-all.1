Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB4375ACD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613151; cv=none; b=idH2TUK6r6ogb9C4KDzpZAoGpZo8323FGtm7p5i04V3bQPywcd/6BFy0sfchmHprxrWE61Hu86KwQ1prv8zMFPtuHew2rS1L6r7hZmpoPXhaWpBj9E4iWNb7Q9F6h30j72Tn+XrWBtdlYH5ac7kEOq8872fJa10rmtI5JM/iVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613151; c=relaxed/simple;
	bh=03WHOz0w69ObpOajFTezDZ3bis7FB1lsm1qHZWDK8us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peKsjYsoJobLcUbgefYds5aN2kTpA4dPwfFKB4wnqqsHhXm8OG5kxnaDDuXSrhCNqFYfGKvNgyyEgzC9EvgvJOHyN+gPbrTXA1l/HgWqQfwYv5kyVCW3x5BOghdiY/LOHp/1HW7KkPGEctBlzSIaJUkbq45bkt0553JS1+x1zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUUroZFd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUUroZFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772613148; x=1804149148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=03WHOz0w69ObpOajFTezDZ3bis7FB1lsm1qHZWDK8us=;
  b=IUUroZFdvYQ77BmJAUvn0dYoBptLbWAeEXVyFC2KHzjtfOwjd622Wotg
   cSxNYWifrcAyHBr7+loYrTfIyMzzOYxs7SSQ5blf7lU+Z7PrEl5RBcWhO
   xCaHp4xPk/zpgEwU7fcuDPGhwKCdO/rZgq6lG/wv+nCZZMwVWbRqsvOc9
   0ddVEa1jqBjZff8yRk1bBdNWYqTmDXVI+kcZfIHGL8Uq6d3tcbeSUpJMT
   P7bsntGyn4511NPZAhkwf84W/2oOGnGGrgkxu2GjfOBvO+uru7CULDLTx
   ryBCy4EPTGyADLVVHB0PvlR90EWWl6+U9mzkxZKCUNyZ7bQ0D4raCdlMy
   Q==;
X-CSE-ConnectionGUID: 5W0bMUGrQBSlXK0clzAxBg==
X-CSE-MsgGUID: BP93mArbSTSb05hwzAT1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72692683"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="72692683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 00:32:28 -0800
X-CSE-ConnectionGUID: vCJsu6WJRna4KuFZtAMP3w==
X-CSE-MsgGUID: gI3wjldzSKyS+2rFd8kCGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="216123342"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 00:32:26 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxhea-000000001eb-3LZx;
	Wed, 04 Mar 2026 08:32:24 +0000
Date: Wed, 4 Mar 2026 09:31:52 +0100
From: kernel test robot <lkp@intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, W_Armin@gmx.de,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
Message-ID: <202603040907.lbf7S5qp-lkp@intel.com>
References: <20260303225440.504358-6-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303225440.504358-6-wse@tuxedocomputers.com>

Hi Werner,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260303]
[cannot apply to linus/master v7.0-rc2 v7.0-rc1 v6.19 v7.0-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Werner-Sembach/platform-x86-uniwill-uniwill-laptop-Rework-hwmon-feature-defines/20260304-065827
base:   next-20260303
patch link:    https://lore.kernel.org/r/20260303225440.504358-6-wse%40tuxedocomputers.com
patch subject: [PATCH v4 5/5] Documentation: laptops: Update documentation for uniwill laptops
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603040907.lbf7S5qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603040907.lbf7S5qp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/admin-guide/laptops/uniwill-laptop.rst:67: WARNING: Title underline too short.


vim +67 Documentation/admin-guide/laptops/uniwill-laptop.rst

    65	
    66	Configurable TGP
  > 67	--------
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
