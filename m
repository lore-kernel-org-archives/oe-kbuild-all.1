Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA92882CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 05:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764741322; cv=none; b=u0H9aCwKYeejqDXcypR0eEQ6njiTvUX6s6IfWj1AjkAiScsq9qpIQU4ccSLMkUuhr6ZUh2HP+zFj0InEuQbmpk6UtWz5yerYgCrPJOIZIMvFiDb66OrY1OOzqYn4GMUG6Ydc0otFIsmxM1Ef1DMxccWJUeWE/VmRM9yq6f8iUz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764741322; c=relaxed/simple;
	bh=U9cruv8p0jaO2ym/HzJO6H0i8CLbx9AQJ+UaaEtZpT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxTGEnFRwhLzllnQutC35Yes+P3cUfnYFuoReXdZdRC/GjBZoz5wZsSaXA4pFyNJGC4/MTM5xwFIEFEc+AmNytE2zZlPOwEmS1BKW6W8qKeD+TQbnSDXGOQlmGptBHi1sYdXjUi6J56M5cxw+0tyoLafdfMlccShn0jJa/r4o4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkx//xr3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkx//xr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764741320; x=1796277320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9cruv8p0jaO2ym/HzJO6H0i8CLbx9AQJ+UaaEtZpT4=;
  b=lkx//xr3YFBAYU+xdrKcaXqkYAXsp0lqmx9YUetzJMKDoCzLpJg/aKLD
   W3XYLL5G41Rpe7xJfRMF9ivNVwX+H0O8xwhaK4bp0Sptxh4iNyZrrTbE+
   TokHIw67GXvBZ+9x4BE9YqWDU0A3I5lhUly+9vaMVduclmoVwH9uPWWft
   gmKU+7JQOScRgwJy0HdW3sEaL+lqdRRZJVxkU7TQvahlBvr22X0NQ0k+O
   5NYuiliJ/Ablu85iIFUEhe4xSYwWmU/ntPgNISuhnsBtjrDUtp83DEdjK
   yJk10Qvz19cRG6c1A3ABp0SRf5KBlw9lUL15r1ypUnw8AUCApt+qvnK7T
   A==;
X-CSE-ConnectionGUID: G1SkPjQ8T+2OOMx5uB8MFw==
X-CSE-MsgGUID: dVbdVC3zS72wjD1GrwQz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66891577"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66891577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 21:55:20 -0800
X-CSE-ConnectionGUID: eKTMhSavS8ScsZUjGPmRvQ==
X-CSE-MsgGUID: ITaWRu3CTIW1a9MG70qPWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194680709"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Dec 2025 21:55:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQfpb-00000000Adi-26Og;
	Wed, 03 Dec 2025 05:55:15 +0000
Date: Wed, 3 Dec 2025 13:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jann Horn <jannh@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>
Subject: error[E0609]: no field `vm_mm` on type `bindings::vm_area_struct`
Message-ID: <202512031349.FAjXZLVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alice,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 040f404b731207935ed644b14bcc2bb8b8488d00 mm: rust: add vm_area_struct methods that require read access
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031349.FAjXZLVU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031349.FAjXZLVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031349.FAjXZLVU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `vm_mm` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:58:56
   |
   58 |         unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
   |                                                        ^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_2` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:68:35
   |
   68 |         unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:76:35
   |
   76 |         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_start }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::vm_area_struct`
   --> rust/kernel/mm/virt.rs:84:35
   |
   84 |         unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm_end }
   |                                   ^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
