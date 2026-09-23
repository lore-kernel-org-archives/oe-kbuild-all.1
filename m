Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F18F4D17B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166268; cv=none; b=CXFJiWrnf3ANWvmuy1o6dvFVa+1QPXFMgkO0DqKvRCwCfY6KB6rWnovIwUjZO50GTgItIKg8FmLBB4ok7KSacd4tsSZ5k9fF7C2qMu3SwK9JBv2chN/ff8/KspKGEyZOmQLcc4uFnKyoOSKLC5t4p23zMlhD5u3FpTrJc/xQxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166268; c=relaxed/simple;
	bh=TTTf1pzXqYS3YiVd1T+dx4m8vG0kR/G3+431UOsKMYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qoR5YWCCiP8AaJ2PX7f5KDCrQlohbzHfoX70jDXBuChWh+2uo1OCbdGVnZlWygVfLA7Jlvkx9E2nka0xKXFRsl9vC+G+ErdYw87QEuyPpmLJQi2JWHQq8FpT6eQwmR7UkO8GADff9ze+R5lKGTYUDARvHPzRbg6STsyXjogHr2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfYADc7L; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfYADc7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790166266; x=1821702266;
  h=date:from:to:cc:subject:message-id;
  bh=TTTf1pzXqYS3YiVd1T+dx4m8vG0kR/G3+431UOsKMYk=;
  b=PfYADc7LueUcvlPjoG79WdgzEwLwpyLGlkMoFyBOe3MooGRTACLpP1vw
   HUGbNGzpvEX7rcKq0Tx9K5s9lLCuzPwnOknG2BiqdvKWiujIMvRXIlP+P
   V729fJu51wD9TuPz/bemU2O4Eu15dFnYTSs9/QcF60EvhiZkO5/It+L4O
   LbjHnx1xhbBVEKXd8IvBoXcTtXYiOsJw3cSUIZrh5+LndHK2NMXMpLMCP
   pxia8JsXOIs9SfVA81I0XjQXYABaKTHPN9T5c/LqFtsSIO8/EQkaKrtNG
   MWd5K6gG+dS56NYfAytWeZlL4aZjDQMhvaj0hSBtjwKtJqmjTAHnGmz9m
   g==;
X-CSE-ConnectionGUID: 4j5OXMQYSDiDmaxrqsZtyg==
X-CSE-MsgGUID: /0KMcujwSCGQFUdG7qG8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90877835"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90877835"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:24:24 -0700
X-CSE-ConnectionGUID: gaODGk/aTrOUqtFvLqoVeg==
X-CSE-MsgGUID: B44auUMMTsqdAJD9reXicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="281660568"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2026 05:24:22 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9M1M-000000000fk-3POr;
	Wed, 23 Sep 2026 12:24:20 +0000
Date: Wed, 23 Sep 2026 14:23:58 +0200
From: kernel test robot <lkp@intel.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0463]: can't find crate for `syn`
Message-ID: <202609231457.9ssfBSKL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes-ARM/kbuild-do-not-allocate-modinfo-in-vmlinux/20260914-102200
head:   e4c41ad4c255b1ef4323410ddd136c5beff8ee3f
commit: 799dcd195cfbecb881a8100ad7fb075179b1b030 kbuild: build rust crates in parallel with the rest of the build
date:   9 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260923/202609231457.9ssfBSKL-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231457.9ssfBSKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231457.9ssfBSKL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `syn`
   --> rust/macros/concat_idents.rs:8:5
   |
   8 | use syn::{
   |     ^^^ can't find crate
--
>> error[E0463]: can't find crate for `syn`
   --> rust/pin-init/internal/src/lib.rs:13:5
   |
   13 | use syn::parse_macro_input;
   |     ^^^ can't find crate
--
>> error[E0463]: can't find crate for `syn`
   --> rust/zerocopy-derive/derive/from_bytes.rs:4:5
   |
   4 | use syn::{
   |     ^^^ can't find crate

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
