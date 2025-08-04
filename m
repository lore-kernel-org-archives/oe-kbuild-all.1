Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84881FDD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754265626; cv=none; b=q6pTb2Jf7GJVDxpSwpknPqgwuQ2AHNo2HmA6xxGZ3WjXdxr8BL6Ax5v8TygWlO8lbdLgbWDz0c+dFqW0VRWEMH7gG2JVBZBt7jCY5CtDQCSSfPQ6SbKXJMEnffTx8G7JknI0yTobhqeMb7TaTkXm2vBBreUBbxaScPFux2DooMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754265626; c=relaxed/simple;
	bh=FqShYy/Fn+U38reg+ccNkY/MKGxYrXiAvghwiBwSaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyFOG6GSrGP5H1yeCzU52Z7prnAubxnRPrAmvJxiw+E7V8csZvMCz6oScGWM/VGoZ4b0TD4n5uH7CEzs9pgXgGueBMuXx8ILNpOs7o4eelCADo9kfAbzYtv2yHhq7t3UsR74uIDpQcKmsdgqJUlBEjT0WrgenY2fNkPgbxvolRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XG9pFOMF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XG9pFOMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754265625; x=1785801625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FqShYy/Fn+U38reg+ccNkY/MKGxYrXiAvghwiBwSaK0=;
  b=XG9pFOMFrGku1E/nspgcNwxPx8QX2iszquQN+TZRswlljd37t0xO+F9S
   qlZKft/UZYDMyG7O4yThTFZrJDTrTlvPqEKvKBJ+Eg9+PYHSIDH71nGyo
   8p2B33Ow2SRDStfwshJvpLfQKhcE4877yUO7y0DO4aEaB83x4mQhrGHAe
   Kd2d/MXM4IpKIW79OoYrIJCDa/ITkP5CUG9VaE+uhovD+rbPNIY+gsEBf
   6odryf7FT8KweDPkNY/tWxMLBohpeuqvwA5IPbtvXhqFPOS4U6VCC5Qzm
   GgvMp3k/bYTQtxQUPXXC0cvxqj4s8ULg7OBkb8hOLUneOtprJwPmQArjW
   A==;
X-CSE-ConnectionGUID: B2CAnP96Txmuy1PtspOHSw==
X-CSE-MsgGUID: SwRaBYQRTvWnxegQJ99Ubg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74107006"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74107006"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:00:24 -0700
X-CSE-ConnectionGUID: LqY1nYwcSpiBjlXBXa/Lgw==
X-CSE-MsgGUID: Ubp065dCQ5+guxQNtdFTHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194843499"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2025 17:00:23 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiicn-0001hj-0f;
	Mon, 04 Aug 2025 00:00:21 +0000
Date: Mon, 4 Aug 2025 02:00:18 +0200
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 851/987] warning: associated items `as_ref`
 and `as_raw` are never used
Message-ID: <202508040203.dsE7KsZq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 835791f8b49eaf3179ed9d8dd51f0efd00ab0648 [851/987] rust: Add dma_buf stub bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040203.dsE7KsZq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040203.dsE7KsZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040203.dsE7KsZq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `as_ref` and `as_raw` are never used
   --> rust/kernel/dma_buf.rs:31:26
   |
   23 | impl DmaBuf {
   | ----------- associated items in this implementation
   ...
   31 |     pub(crate) unsafe fn as_ref<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
   |                          ^^^^^^
   ...
   36 |     pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
