Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6005818A6AD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 01:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764723961; cv=none; b=SDgwIkxAFmE6BU5TllEVHEP7JMdzNTXiyPwR9cv9fCpmiZlwgg/9Q3OhX1WDcqs03cSWVZ/VWZb+y2+im/xxZCZ3pGMRkHRaGZ3yaZ5O6eiVqr/LsT8IQWcWg/dezpIoe1SHS/iXukQ6j4uaEuTRJPq3fa0xplf0YMnUcnREJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764723961; c=relaxed/simple;
	bh=GiWOWdjTe0lnSXm8NVRy/xT8MfBBqf2CPF27MvwaFrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=luQbkyUtHDGaUu7FS6cmoOszvZOzhZt36YhYKwwU1jiHU5xpT4Uvav2OdfMEyXXAUB27TCt3LQgvfXYgu+NvNqdSU2gtQx3c2ELncwS20jYPgrR5tY9bClQkUpUpaiFv0sMXamaXQE108LsbD2RLid4ncsp9VwjQdxJBOl7plP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKxK9keE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKxK9keE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764723961; x=1796259961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GiWOWdjTe0lnSXm8NVRy/xT8MfBBqf2CPF27MvwaFrk=;
  b=gKxK9keE34+737ntN/2UWj6lxhhsO/EoDyuqYVZ98yop3CNYtVgSiLsK
   kME7jEll7xaDowUjY47Df6CJ7CGps12FGlCN5Ar6gGDG7Wh5h4+LOvpoA
   ny83hAJKS5fMD6iG3kSzwJYnuipY4wWPoaD5Yuh8+yfLFvN9/Eih7uUW8
   EV2y+bQQBqkpqxWNTGYse/UXmFMOo4taC/q2mtp5L9Nw3D6bnyakazUYG
   yZNV4pRNTiyqNCiTO3P7JHWuNC8ak0pGqyhDkZQEPcgf6hhi3CllUOmZa
   mSpXPnWK5lxaKjS2LSFPHbQC1tXRcF2Wai6ekdj97s8+5Bz4xjnupsXdD
   g==;
X-CSE-ConnectionGUID: x2miwJXZRayJ38GiBt35rw==
X-CSE-MsgGUID: g2HHyRmuQN6noUQFO+MYUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65712814"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="65712814"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 17:06:00 -0800
X-CSE-ConnectionGUID: yxkuUTHgRPCvi6he0TiJ/A==
X-CSE-MsgGUID: ZGxerOuvTbyXCeRi/iBtlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194953250"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 17:05:58 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQbJb-00000000ALi-3yKh;
	Wed, 03 Dec 2025 01:05:55 +0000
Date: Wed, 3 Dec 2025 09:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lyude Paul <lyude@redhat.com>
Subject: error[E0609]: no field `vma_node` on type `drm_gem_object`
Message-ID: <202512030945.2O1kegv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d61f1cc5db799f4e44a63418b2dc19396787427b
commit: c284d3e423382be3591d5b1e402e330e6c3f726c rust: drm: gem: Add GEM object abstraction
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512030945.2O1kegv5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030945.2O1kegv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030945.2O1kegv5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `size` on type `drm_gem_object`
   --> rust/kernel/drm/gem/mod.rs:119:47
   |
   119 |         unsafe { (*self.into_gem_obj().get()).size }
   |                                               ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `vma_node` on type `drm_gem_object`
   --> rust/kernel/drm/gem/mod.rs:162:46
   |
   162 |                 (*self.into_gem_obj().get()).vma_node
   |                                              ^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `funcs` on type `drm_gem_object`
   --> rust/kernel/drm/gem/mod.rs:221:34
   |
   221 |         unsafe { (*obj.as_raw()).funcs = &Self::OBJECT_FUNCS };
   |                                  ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `owner` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:305:10
   |
   305 |     fops.owner = core::ptr::null_mut();
   |          ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `open` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:306:10
   |
   306 |     fops.open = Some(bindings::drm_open);
   |          ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `release` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:307:10
   |
   307 |     fops.release = Some(bindings::drm_release);
   |          ^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `unlocked_ioctl` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:308:10
   |
   308 |     fops.unlocked_ioctl = Some(bindings::drm_ioctl);
   |          ^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `poll` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:313:10
   |
   313 |     fops.poll = Some(bindings::drm_poll);
   |          ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `read` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:314:10
   |
   314 |     fops.read = Some(bindings::drm_read);
   |          ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `llseek` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:315:10
   |
   315 |     fops.llseek = Some(bindings::noop_llseek);
   |          ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `mmap` on type `bindings::file_operations`
   --> rust/kernel/drm/gem/mod.rs:316:10
   |
   316 |     fops.mmap = Some(bindings::drm_gem_mmap);
   |          ^^^^ unknown field
   |
   = note: available field is: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
