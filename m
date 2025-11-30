Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A923C519
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764544991; cv=none; b=IleL+3m8I2y7caDqKYWri7HJSy2GmBYM8oRJ8AijP+Hlpylxin9/jrBBNU7C5hyA+5gru7aDkeIOBZ3laMPrpYeilaHSYRv1XKRAWIkRpYYJKbKWfW4QLOd2gaoxlMi8QSksB8hP9IF4u/jHZw7no5cN9jczLXAXK9tMJfmTZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764544991; c=relaxed/simple;
	bh=eoBLZ+2ZNCzGt957x2kAXgqkLUmQzw9SBu1Q9ZearFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILTddLI9UfpLYXKGr80mHNZa4B51dhwYghwuwOEI04MuOB+WExAUI3Oe4/fvp+Jvom0pGvAHfZI2RAV4CoQsTZCj6JoiCxyxcTq7R7t/x//Ly4C0MvqrHqA1y+LTjR5JvwSZGEd+RBoL9bAnzlMDU8e8Jm09a0wkx5RMPYdedpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WimWdUXa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WimWdUXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764544989; x=1796080989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoBLZ+2ZNCzGt957x2kAXgqkLUmQzw9SBu1Q9ZearFY=;
  b=WimWdUXa7Nspep/ZZWXX3kc/c/fy7cYiiR3uiYanCeytJ6RIrkJYdQ1I
   bD+H7l8eiKFmnQFWkEfaenQpd8/Eyo4wBjXKPSsyKfFMXJMad89DBF6Go
   jlne84/PLM/pjRU2NGT6RXJ57lI9mUR1ACCk7dNadHBvH/MuglZAFD4j4
   AAyVxHojjMAEiHAMrPhu78KHCwO3POsFMEnVdE4t1THx5dK02ZU5ZTBg9
   d+6wDvJK2oSrFquO4Vd2S16vVVLjVr6utzDY169L0I1r9WewmEym2/7aA
   o/HY84c714QHiqUUFM5q4U9P7Mm6t8UUyLcO+tCjGoBCX8bZ5fGbYPFE9
   w==;
X-CSE-ConnectionGUID: drg+4OZbSj+O5LTqdcpPAw==
X-CSE-MsgGUID: QwnAO+e7QgirFk6V0hkCXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77164435"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="77164435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 15:23:09 -0800
X-CSE-ConnectionGUID: iR+hEzovSlCLmYvDYEEeuA==
X-CSE-MsgGUID: XXKIU8B6TZOZr+cLWwFc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="193168010"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Nov 2025 15:23:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPqky-000000008Ej-39KY;
	Sun, 30 Nov 2025 23:23:04 +0000
Date: Mon, 1 Dec 2025 07:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: error[E0425]: cannot find function `dma_map_sgtable` in crate
 `bindings`
Message-ID: <202512010734.GAsaWH7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e69c7c175115c51c7f95394fc55425a395b3af59
commit: 05aa6fb1c21d7fb9df735da24096d793223789d5 rust: scatterlist: Add abstraction for sg_table
date:   3 months ago
config: um-randconfig-r054-20251201 (https://download.01.org/0day-ci/archive/20251201/202512010734.GAsaWH7b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010734.GAsaWH7b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010734.GAsaWH7b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
   --> rust/kernel/scatterlist.rs:212:23
   |
   212 |               bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0)
   |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_unmap_sgtable`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:465:5
   |
   465 | /     pub fn dma_unmap_sgtable(
   466 | |         dev: *mut device,
   467 | |         sgt: *mut sg_table,
   468 | |         dir: dma_data_direction,
   469 | |         attrs: ffi::c_ulong,
   470 | |     );
   | |______- similarly named function `dma_unmap_sgtable` defined here
--
>> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindings`
   --> rust/kernel/scatterlist.rs:356:52
   |
   356 |         let max_segment = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
   |                                                    ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
