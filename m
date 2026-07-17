Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971DE344DB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 19:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784316122; cv=none; b=hvu2i/JlbJivFdpW5Y9FbfJbH+qwLKtho7oSfWYqzDKTiMkugexZTvptWcCiSjqubHl23T3fl50PTnItxLMgznRx+3jBHMXr8uKKMCVv7CLtbbjqwrjMV7Oy+V434UtyxxEohcnw3JNfDVNxYdTA1bereD2HCzKxVtJcFuCy4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784316122; c=relaxed/simple;
	bh=GEF5v8wpe4oMM6uLzAcAc2ecq2JP2o2TkuZnS5O2/Zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JJtypKpi7lDpNDrNedUXAvfe9EeD7xSsmZZLHIkVVA1BzawJnLV3Yqn2VdHBOcHu/FnlMFpWGdik3yHT1pKTTf5+LiL0IoVCNNkuc8kZLOC1sBezWJQ65379Ts8XE1PKWgatskhJnzHjCPZBaBigvxmqcR8lgtQ6jWb9oX6J4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEwAsSZ1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEwAsSZ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784316120; x=1815852120;
  h=date:from:to:cc:subject:message-id;
  bh=GEF5v8wpe4oMM6uLzAcAc2ecq2JP2o2TkuZnS5O2/Zw=;
  b=iEwAsSZ13jyElHcYndVJND0lRvX1zMZL7qBvSKC2wf9Gjdd0Xdn8NiPi
   XTEazx0UxeMCM0VTLTSnD4/tCjv4/4WrxZKCKUBtYnn8VvHROfNvnCZnd
   A/BjtuS8xe3jWzt5feI0iSOzBak5j3DIOx+ooWp51SU74HHjBE+fNHhFc
   2kxi+xdadP8WHEkL/VtMvqxRza9BlCpaUvEuKn/U2kgZGIC2ZeVkpPHY1
   Z69JYE5p337lULmOE9U73Ra/zUckPe75x1fJF3x8ZrlAfqlrSGtd3Td3+
   ug2BJmZNDj213YCbfbm8UOCjm4E+VRoWFTpFOOCOvDnwylwsMkutDkHuM
   g==;
X-CSE-ConnectionGUID: LAoQqunCR4GSRvWoIKr4+A==
X-CSE-MsgGUID: L9xqYBi+TYu689z1OdyKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88669833"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="88669833"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 12:22:00 -0700
X-CSE-ConnectionGUID: 0+LWW33sRXemS2NfU8Z5Ww==
X-CSE-MsgGUID: OpXx2G7eQHq2Rp+chS7iIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="250511458"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 12:21:58 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wko8B-000000005d3-46Qu;
	Fri, 17 Jul 2026 19:21:55 +0000
Date: Fri, 17 Jul 2026 21:21:12 +0200
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 78/90] warning: unescaped
 backtick
Message-ID: <202607172113.hLDQgD4l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   25acf039a5dbb40b6865d9392e05be8e713a39f3
commit: ee9fffbaafedd22ab336aea1047bec1fc7f298ec [78/90] rust: add basic serial device bus abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260717/202607172113.hLDQgD4l-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172113.hLDQgD4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172113.hLDQgD4l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unescaped backtick
   --> rust/kernel/serdev.rs:518:34
   |
   518 |     /// [ Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |                                  ^
   |
   = note: requested on the command line with `-W rustdoc::unescaped-backticks`
   help: the opening backtick of an inline code may be missing
   |
   518 |     /// [ `Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |           +
   help: if you meant to use a literal backtick, escape it
   |
   518 |     /// [ Device::wait_until_sent\`] to make sure the controller write buffer has actually been
   |                                  +

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
