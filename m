Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F21D3195
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809230; cv=none; b=f1EYBQM3NMGOCBhpTaaiYzntPmxDTEQO7fVb9YsD3fIqX5WUJNoZxGcffv9PMjph0ML4KxJa1UJ1xTwPCF8okqtqGdMWw7kOWNXf2qPdl2p/ORDe0migtuJYrzEV2JYlj+Ozc5EYjWXGOlJzYhHyVRLS5iVoZIGNqLRPA0AzALs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809230; c=relaxed/simple;
	bh=10UppPsR6R82fQmpCENxUYVkOnYoQ6GPcxWe9uc50pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwDSJ+9xxn6hYGHqtTM4bg3iSeT59IrYVGZ2p0X01CaRvE56NP93eAjV71eag97yPSJp3650qYtBgsCbz9XizOmxlQK9dEK74XsBUvW9+IlTPs4m0mCxelSlGSHHZNDGeZ/OGlRceYvYRpdccUnoAQcYnHo284Muja/kzac60t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7ZzKppI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7ZzKppI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730809228; x=1762345228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10UppPsR6R82fQmpCENxUYVkOnYoQ6GPcxWe9uc50pU=;
  b=J7ZzKppI51vaywS8Q3GAMvVnonjP7Bki3p6AEvFTNWGNkJa63XikBnTc
   ohn+/3gis4I5Gwz5Ll56AKJJoknXQ5Fo7AB/fiRJ0BC7qtm4EZq0fcwZO
   hKVuBafzfzMooqspMryqhGyAVabioIfX2atB7S7UVz8a23uUfsqQsxzcV
   kUGCSajPOLl6Tw9r/kaSaGAPUmh5Dxa7Q69l95biHnPbIVk6t9uysSB7q
   EWR0PwcSwJcqiC76Rim20X8CPKhzq8GabUO4XClsZoOdVK8W9YdVt4Y7J
   0O1vBBOG3vR4AlwwRFx0fnorZL6bJjNWkablOIMVE+rGDpd2w3oznvJHi
   g==;
X-CSE-ConnectionGUID: kfnzhbVLTRyC79BPUzOmUw==
X-CSE-MsgGUID: 3c5OklBsQ1GEsHHSXewWqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30775299"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30775299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 04:20:28 -0800
X-CSE-ConnectionGUID: e0AMpQUiShCDGEwu+8RwrQ==
X-CSE-MsgGUID: cCXzgX7dTHWCfYqGKu1mCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84389140"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 04:20:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8IXo-000m29-1i;
	Tue, 05 Nov 2024 12:20:24 +0000
Date: Tue, 5 Nov 2024 20:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [rust:staging/dev 23/23] error[E0560]: struct `drm_gem_object_funcs`
 has no field named `vmap`
Message-ID: <202411052008.2JU3E9Jx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/dev
head:   cfd66f531af29e0616c58b4cd4c72770a5ac4081
commit: cfd66f531af29e0616c58b4cd4c72770a5ac4081 [23/23] rust: drm: gem: Add GEM object abstraction
config: um-randconfig-r061-20241105 (https://download.01.org/0day-ci/archive/20241105/202411052008.2JU3E9Jx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052008.2JU3E9Jx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052008.2JU3E9Jx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `drm_gem_object_funcs` has no field named `vmap`
   --> rust/kernel/drm/gem/mod.rs:225:9
   |
   225 |         vmap: None,
   |         ^^^^ `drm_gem_object_funcs` does not have this field
   |
   = note: available fields are: `kernel_vmap`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
