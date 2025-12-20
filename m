Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0219CC28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263191; cv=none; b=GlKTlxDrg70gBJlU/tCu8f3tx3rmp3gNWh8vmniNzcYKAz6Y4PVwv7NaYFzi34y6D49PdYnpUrVme2NQ3UbnuocWwmaZxSK/nnSa5EvJJRB5MCpo5cvmqGw2/uWzw06hoNF/X9iy4R4Y0nnHVJIdXIw/SIONMiweeqzg6tx6P2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263191; c=relaxed/simple;
	bh=/6kDcNEv8xDBfa3GrywsyZyMu7CFQv77eE8NomNqHV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgqMCEp7SXvqh0jdJndkWfsJJ/NHmBen5YsjPyMGPeWncbVsLx6fTydxv/343l7Ol5L2ufip3hnyOoPvcFVJYKcDLysh4f6T99LrSRbqRncSEWGQ0lC3TZN7ECBWpD6hESxZqRu9195N3vI+2SsUavI5Dqry0FrvxjFKdF4TS30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvVNm7SK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvVNm7SK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766263190; x=1797799190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/6kDcNEv8xDBfa3GrywsyZyMu7CFQv77eE8NomNqHV4=;
  b=JvVNm7SKzsxbF/J3JO3sEUB9H4FfHfJXswai57xoseNbGrR/61KFJnkG
   d/HOXrRZTloRtd8KfHYzoMDsS34O/se0mYNC7KeHtrA7QC6DAQ7slN0eZ
   rh9U+HtK0PEYoY+Po2wSP+RM2+IHpeuuEJDtx0wUdjr6y5YiQLR9Q/vzY
   skvwfZ8zrHIdcQJr3PbbBLeFGZxofp4dEwrBS7DG4uNilRT/xzJuMxmt8
   1EMnqa7vDkL+/LX/wmOLHOmBgYHyfWR7z2Fx23ztdIsr8YABhTjH7Gh6+
   RP1dcmt875rLbaDFuUhhGD+deHFWwbkP3DYNpyq0+/3cDSywm8+4FcTnE
   Q==;
X-CSE-ConnectionGUID: zdli6hNYRtC2ht57bH+KCQ==
X-CSE-MsgGUID: CgqiahAdTnKnA+EoqO8aDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90846270"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="90846270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:39:48 -0800
X-CSE-ConnectionGUID: y251XpoLSW67h5wKvPTBTg==
X-CSE-MsgGUID: fZg/mcPDQQajZFPUjwYEkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200038903"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 12:39:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX3jt-000000004mS-0lo1;
	Sat, 20 Dec 2025 20:39:45 +0000
Date: Sat, 20 Dec 2025 21:39:21 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v5 3/6] rust: gpu: Add GPU buddy allocator bindings
Message-ID: <202512202138.XipsbgYo-lkp@intel.com>
References: <20251219203805.1246586-4-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219203805.1246586-4-joelagnelf@nvidia.com>

Hi Joel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.19-rc1 next-20251219]
[cannot apply to rust/rust-next drm-nova/nova-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20251220-044108
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251219203805.1246586-4-joelagnelf%40nvidia.com
patch subject: [PATCH RFC v5 3/6] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251220/202512202138.XipsbgYo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202138.XipsbgYo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202138.XipsbgYo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `gpu_buddy_block_offset` in crate `bindings`
   --> rust/kernel/gpu/buddy.rs:474:28
   |
   474   |         unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `gpu_buddy_block_print`
   |
   ::: rust/bindings/bindings_generated.rs:61566:5
   |
   61566 |     pub fn gpu_buddy_block_print(mm: *mut gpu_buddy, block: *mut gpu_buddy_block);
   |     ------------------------------------------------------------------------------ similarly named function `gpu_buddy_block_print` defined here
--
>> error[E0425]: cannot find function `gpu_buddy_block_order` in crate `bindings`
   --> rust/kernel/gpu/buddy.rs:480:28
   |
   480   |         unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `gpu_buddy_block_print`
   |
   ::: rust/bindings/bindings_generated.rs:61566:5
   |
   61566 |     pub fn gpu_buddy_block_print(mm: *mut gpu_buddy, block: *mut gpu_buddy_block);
   |     ------------------------------------------------------------------------------ similarly named function `gpu_buddy_block_print` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
