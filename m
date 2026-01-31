Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492A2139C9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769852045; cv=none; b=P8kHp5W4ZiY9wZ6PszSvLDf6I+hYmX9nNPxnKP11VlXPcMkAv1rUStU6xH6QpUaM9Fay9GhgCLhaMNxByKN2cy0YHSd5QNIeXTQLGpe6GCNbxt6A5SG2RioAjUl1Xitn/b1F0vHrmmUCXC9dDk8WYnK2L5chiLcp5/yZRct4AA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769852045; c=relaxed/simple;
	bh=MOK5KELkEdNMj7/DAErMkwNt0p3P/4OKafq2pr81fxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoCJJFYVbYTWHIY1D9tG+m6O+Tx9zZHp6um+GGNV5vZj+ZFOAuxqmvMAFvmJzuWXXTTVsmk1lOarWj1a5Ptq6oIrmhmnG+8yNpQF2B1wDfl7/HcQwNg45rZleFOBj1nMeflQVt1/AaZYbx3lMgHA4xWh15vg1dHYcx0SCp01lgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhejUALI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhejUALI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769852043; x=1801388043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MOK5KELkEdNMj7/DAErMkwNt0p3P/4OKafq2pr81fxI=;
  b=FhejUALIKpMau5DEvSrvAKFqr0JN42fuvnbPPEDjskM9WtctDdLnubFO
   rxQfhA8xP177uZF/xO6YHa0fxHCJtOkdBtfhYPOD0H6z3CgtFMc8EGAaz
   s6FeVHD/Y8GhDct4f0dHmrKWriayHxgJmmjoZfylywrEN6Z9rGnhx8pQ9
   b/KcA5aUx/dV19rBSnHSAdLnmb7lVEPWlRWG8azA8+R85XA4TeBuAnUeI
   38/yy2BNHQHZKsFc1CqSokbYPPBfR5uLSir3JUUCk3ULTG4FDV323T7m/
   gC+eeAd3kHFg7WhJTFVn4hK0HBfKIH+K88tzzKzmw2T9DSdiIceR1KJhf
   w==;
X-CSE-ConnectionGUID: 6kUwltsfRVeZoV3z0yPsNg==
X-CSE-MsgGUID: Gm8gAX0ZRQK4D86kaUbr2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="73693217"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="73693217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 01:34:02 -0800
X-CSE-ConnectionGUID: bnVF/D6TQkyFfkdfVnohCg==
X-CSE-MsgGUID: M0x3ExhIR+Sy1MOEgffxhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209413686"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 01:34:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm7Mc-00000000dsm-4ALG;
	Sat, 31 Jan 2026 09:33:58 +0000
Date: Sat, 31 Jan 2026 17:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] nvmem: =?utf-8?Q?Repla?=
 =?utf-8?Q?ce_the_Wii_and_Wii=E2=80=AFU?= OTP driver with a Rust one
Message-ID: <202601311703.Vw1M3xda-lkp@intel.com>
References: <20260128182925.13225-4-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128182925.13225-4-linkmauve@linkmauve.fr>

Hi Link,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Link-Mauve/nvmem-Document-enum-nvmem_type-and-its-variants/20260129-023240
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260128182925.13225-4-linkmauve%40linkmauve.fr
patch subject: [RFC PATCH 3/3] nvmem: Replace the Wii and Wii U OTP driver with a Rust one
config: powerpc64-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311703.Vw1M3xda-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311703.Vw1M3xda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311703.Vw1M3xda-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `core`
   |
   = note: the `x86_64-unknown-linux-gnu` target may not be installed
   = help: consider downloading the target with `rustup target add x86_64-unknown-linux-gnu`
   = help: consider building the standard library from source with `cargo build -Zbuild-std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
