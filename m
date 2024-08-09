Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C221166311
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723232880; cv=none; b=qav12QHJrLy59Qg7Ms68Xm/IWBLqWDQUArryOqwlA2YGwo3ZHQaa0ACoeXEJCMus6H8x6ZQHsGIg6ikG/am0C9tg3UWP+Jzc63oWrHIF50hEPYpjgcjxKfQLq8aEBFuQNIZQDxfFozC6Hewt05lmevBocLB/hPlFzxhXK5G9muM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723232880; c=relaxed/simple;
	bh=6DdJu/LyUA+usPixOtIrQhYQJt3UZr8kGpFRCSkweB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DIuPNZqIkF2XScgT9JkQMGIvMQ4aoM39j81VaSFuafSxYgHdBSN9JYozkY7A9Bpxr9swVKN4r+KI9bjt9nKObSCkzKWfbobQFKQ5c26I5BvE5o9lDwrm4Uf5Rkj9uefxpKGMsPWdCbPCO48zuMGUJ8ybEsfHzarjtqozjJ0TwN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROJHZaIr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROJHZaIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723232879; x=1754768879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6DdJu/LyUA+usPixOtIrQhYQJt3UZr8kGpFRCSkweB8=;
  b=ROJHZaIr9ItsGFq8rmjoLg9WQAm48fxEzMb4L+IJMsjJU3QWRfjzAfp3
   0QMRo6mFNfn7XxakdPX5wJQq3dSzcORdxUuaasgxwn4ygii+0suMRGW8M
   liXGGI4C6jPwyrj9tWnLmk7jJ/1TO7j+Ru4QtGi9nzO/0ACCj05E6ozvG
   zkWEAGPM4UBGUB6k+J6u2sjmgt/pp6Ijpqm1MGPZQ9an53PTOCAlsL3er
   5cYPOL6i5jGRWSiLFpQyCx9Z1AGzPKtyY4x2BaJ522q6Z0muKGbPfEPLK
   wwHNmlAmg1FY0HMbzzHlgjkZWfc+jamFnRqVlTNnR0KGr1jiZsnGjKxjt
   Q==;
X-CSE-ConnectionGUID: siRi0zc0QsWd2vpJSFkdCg==
X-CSE-MsgGUID: 0o0XYMz5R7ujOp28MYtfgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32570227"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="32570227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 12:47:57 -0700
X-CSE-ConnectionGUID: BY5yelfHTqWGmMMqbalQRw==
X-CSE-MsgGUID: UbuIQf/JSrenNl8iyDo9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="57571368"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2024 12:47:55 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scVab-0009DX-0f;
	Fri, 09 Aug 2024 19:47:53 +0000
Date: Sat, 10 Aug 2024 03:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1040 19/23] warning: unused import: `crate::i2c`
Message-ID: <202408100336.zTPGzHhh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   3e06c94630c103e38a3192358ed935cb927bbe38
commit: 0b946da807f65eba9c240290b74b195bdf4e85d2 [19/23] rust: Add new abstraction for regmap
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240810/202408100336.zTPGzHhh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100336.zTPGzHhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100336.zTPGzHhh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `crate::i2c`
   --> rust/kernel/regmap.rs:8:5
   |
   8 | use crate::i2c;
   |     ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
