Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A41B322C9A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756483183; cv=none; b=iR3/mgxLPgBnDATH5W0vy4fZ5IqxUc8kdhTS7M1ihfG33a0xMCtqCllbZn5yTspQRrmhM3V+C0ZyUmmJTktSMaXsW7EYPsUMXcTjb15n68mWTV0apE05lnnoCais/lgRNRa2SwLD97VM/qTUKqpAsc4/Q1gM+NIs5qgGoopW4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756483183; c=relaxed/simple;
	bh=sNSZs4C4fRRLsi0hjCgg3o1QkuuFdyo5rwrlh9sdg8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRT8g6r6BAt7x/Xx2hUUhDvIS/Xjj6DjM8NIgJIJAHQQ6fP5nh0kI3oXoGXczTJwRUHL8Lq+X3tJbWfKBRZWBlIJVuNG6bel+uVDu5bAUjXWttli91JtOkogWdqRsjXF5IjU6sL8a6Ql2y/ZcMfLbay9IH3J6ISghuBCcJXhX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IolpQ6Y7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IolpQ6Y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756483182; x=1788019182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNSZs4C4fRRLsi0hjCgg3o1QkuuFdyo5rwrlh9sdg8s=;
  b=IolpQ6Y7UJCFBGzQLZ0cWSESNq3jidppwsaC0IEU5fKIL3DQNn0lj+Ei
   Hbr1cNW99U1IyvaZsNbbWdfnduXrcBP8WOpZ7RHqsNbKmJf0V0wUOW1gA
   JWLzN4F1Q3MIbqihPgkLUsi5erTmzDf993tydeQtRd0oc7vZjyxdv/+X3
   1xhRr9ALq7t61KjTfFw2cJlJaeFjqWcvzUFzhKlJSbUzspC4VWmw0YdBL
   5h2Yko5zsa3HPxAbgP6JnwM/ZpL5ix5+GxUoq7G/HQbgmwpw7PZQAJ563
   JOQ2bnh253tRqf/90qKX/P1uylBdEStkhRBY/5m2qdhVXd0eohkj6GHyy
   w==;
X-CSE-ConnectionGUID: dl+IhKO3TyasTeFLV/Bm9g==
X-CSE-MsgGUID: qtV/FE/9S6S+7UuoLFkKAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76370625"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76370625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:59:41 -0700
X-CSE-ConnectionGUID: y57O7rkiSNGRl7Ep5AlJtQ==
X-CSE-MsgGUID: NHuL9bszRsOkLVa4TkYYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170802766"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 29 Aug 2025 08:59:40 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us1Vq-0002u7-2J;
	Fri, 29 Aug 2025 15:59:38 +0000
Date: Fri, 29 Aug 2025 17:58:57 +0200
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-6.18.rust 4/4] error[E0425]: cannot find function
 `to_result` in this scope
Message-ID: <202508291740.MyzqNwyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.18.rust
head:   bcd0b5f0199b33d65271c10859b414b4864aa1f2
commit: bcd0b5f0199b33d65271c10859b414b4864aa1f2 [4/4] rust: file: use to_result for error handling
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250829/202508291740.MyzqNwyg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291740.MyzqNwyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291740.MyzqNwyg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `to_result` in this scope
   --> rust/kernel/fs/file.rs:402:9
   |
   402 |         to_result(fd)?;
   |         ^^^^^^^^^ not found in this scope
   |
   help: consider importing this function
   |
   10  + use crate::error::to_result;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
