Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859015A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754268269; cv=none; b=mJhoM3tsTOSUvr/9/eiXtoaJv+RyoUlGP6WdDfJ70wuH+SAH0QOvT12HVCP1aURoP9eC33wCQl2s1cEbA3fbq4mM7z9spp12c5G6Gb40DLikvSbcZwssIHt9GFBDjkmrzeDuaMByR9/opn+gWVGTnYzc9Ac63nhpDMgkLzpNvAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754268269; c=relaxed/simple;
	bh=pr0vvc3jfLrH5RPPzTlTjaDeVDie9G8pSl62xJNF1ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LdQcIe6uhnEPGe5RlTIqvALzSM40iD8CUBa+AIG47E+MAWAcJq8m5H8Ef4ixBU7Rg21bYN2Y9o8ju4gguaEy9FBcSSuAAAsSA/P1FO686nCefaW+m2HzPwstYcXSkKGQKTuaxAl9zDJc3K9NsJtqTLVI3G9CwnLaKMwRyNNx9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRcfyvbM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRcfyvbM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754268267; x=1785804267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pr0vvc3jfLrH5RPPzTlTjaDeVDie9G8pSl62xJNF1ew=;
  b=VRcfyvbMAf7CZdzjObewTZN1WcOnGTQen5JRGGxXDonTKF7ilYRgRcFc
   QfrHf5hss5hGpjOrRZ64N0lggJlY1tbobSy0PhmQj2+cxVy4WXxOQBlSR
   7JL5fKI0Gf0EiPfEAmvK8NfxSbreNl8OFfDYGvhnMempinJpPGZkeR9ry
   6396pWgeZ2PVgYOw7Tsjaj6YV9Z3/cMuM44w4gvVUhj0ufKEl9t/8Lt2l
   5zRKIveIsa4quIjkmNA7C8JUXz3hZHAScWZ/AoM0cIrcLaf2esZi8bE9o
   EYncshYGLKXFxJeINThxvioYo+bJmb6F5IKJpvXVQ7/z3qt9E7Nq0uc3y
   Q==;
X-CSE-ConnectionGUID: BDBQFv8KRwqONUNg30Xqhg==
X-CSE-MsgGUID: a+uj+hhOTDepMgiQmnInIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67890127"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67890127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 17:44:26 -0700
X-CSE-ConnectionGUID: i1wnU0T4S6iu/a1AeaPqTA==
X-CSE-MsgGUID: ZUFqnEJ8QKW5bKkX1K1CUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164413259"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 03 Aug 2025 17:44:25 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uijJP-0001i3-2G;
	Mon, 04 Aug 2025 00:44:23 +0000
Date: Mon, 4 Aug 2025 02:44:20 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 61/85] warning: unclosed HTML tag `T`
Message-ID: <202508040205.yWwvrkVR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: ea31ac7d8e10fe7081cd02d78e233c2178d36019 [61/85] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040205.yWwvrkVR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040205.yWwvrkVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040205.yWwvrkVR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:588:53
   |
   588 | /// A subtrait of Ownable that asserts that an Owned<T> Rust reference is not only unique
   |                                                     ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   588 | /// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
   |                                                +        +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/types.rs:592:71
   |
   592 | /// When this type is implemented for an Ownable type, it allows Owned<T> to be dereferenced
   |                                                                       ^^^
   |
   help: try marking as source code
   |
   592 | /// When this type is implemented for an Ownable type, it allows `Owned<T>` to be dereferenced
   |                                                                  +        +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
