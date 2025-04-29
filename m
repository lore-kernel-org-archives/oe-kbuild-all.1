Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFC21D3E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939357; cv=none; b=cLwgnm+1mISIksZbjoUjEEMOkloGamrm6SPpYwUBiFYPbVQnTv2fNhZ+Ir0v6+87T6PfBSPnzwx9Rk3CeDfHLnAFehMmnW6yffT8A2fcLwPNPPN/yL6lX/tcvJ8km6Pa9rh/AaRfBTpr93WxwXahvaDnBSyg3ck8XYQ2dBLksSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939357; c=relaxed/simple;
	bh=MdLn2e8jkdsZBeaxq71YonoB7T1i0pomZtSk5qk78ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0NnjPjMmUjIX6yYG5gNfNguHVHoCzjVreI4/2qML7TCB5ykSK+fLzM8W6HYz5xVKrWYd7Unx4K7sv3TBtf8Ba0uZgJZhexaKxojk4m+iKhzIyc/4P+QvfFzwJWzhtxxI8R2reNtKoi1My9q92gBhScbSD6HbwfepEF8nqxJnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvcSwoAY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvcSwoAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939355; x=1777475355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdLn2e8jkdsZBeaxq71YonoB7T1i0pomZtSk5qk78ec=;
  b=MvcSwoAYNIQ+jflJSMmOuLqZ5XVuuHg4XQ7UzjG5mouvbWcnr4zmZvP4
   MD7bi6E+7lw0ob80PLalKIkt7HNiR3G15woxOBHTSWA3tmzW9Avss6wD1
   7bC2TBA0GkSiFoU7VoZKBWke9MUbxVlQOGovtJB9MgC4CiMeovRK5UrL+
   xo8UbSu1p4d+i1vLV9SEqkTr1cMKt6Hd4zaSWlfd7ZyN8lUzIuJcjIqcq
   hNeEQZqSmlCuTEOkLdVS+ojeuoqS6h/hy/7OeZufJUONC5x7FiuX7QE8M
   OG8agVMjAZU7ec7ohEZiEdMXhPRXQEMp8IoEWlSbqUwLZinQylsA9IGJv
   A==;
X-CSE-ConnectionGUID: Kpw7MPUaQiGWvxSj2+uM/A==
X-CSE-MsgGUID: XI1R9/sjR0GTO8vqzS6aJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228914"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:09 -0700
X-CSE-ConnectionGUID: m6IetbqpQiWuMsE78Exdmw==
X-CSE-MsgGUID: cd7E8uQURnuhppc9wTdw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133748425"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000oD-1G;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?L=E9o_Paill=E9?= <leo.paille@enseirb-matmeca.fr>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1142 6/13] warning: expression has unnecessary safety
 comment
Message-ID: <202504292315.CGnYtmJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1142
head:   577cf61b408a5196cda82c1cc670758fc8c5cb25
commit: 4a0a127d3af60d3f0492cce270304f3c79312d02 [6/13] merge irq patch series from https://lore.kernel.org/rust-for-linux/20250122163932.46697-1-daniel.almeida@collabora.com
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250429/202504292315.CGnYtmJR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292315.CGnYtmJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292315.CGnYtmJR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: expression has unnecessary safety comment
   --> rust/kernel/irq/request.rs:266:9
   |
   266 |         &self.handler
   |         ^^^^^^^^^^^^^
   |
   help: consider removing the safety comment
   --> rust/kernel/irq/request.rs:264:9
   |
   264 |         // SAFETY: `handler` is initialized in `register`, and we require that
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_comment
   = note: requested on the command line with `-W clippy::unnecessary-safety-comment`
--
>> warning: expression has unnecessary safety comment
   --> rust/kernel/irq/request.rs:463:9
   |
   463 |         &self.handler
   |         ^^^^^^^^^^^^^
   |
   help: consider removing the safety comment
   --> rust/kernel/irq/request.rs:461:9
   |
   461 |         // SAFETY: `handler` is initialized in `register`, and we require that
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_comment

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
