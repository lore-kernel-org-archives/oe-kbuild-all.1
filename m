Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9255CDF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324039; cv=none; b=bRVfSoto4BPb7h2RzebYl1EOgXAuSZ83uX40qvUAin9xvZ50Pu8yMzPC3XiMcGgesmIqRYeInsnDQNA2/eQe7xaM/k/SLkcYFZhT8KxQ5LhYiBZqd9dY1npTg38N2RwSHfMR6js/ZyZpTCp01cFnS1POT6BecABKJUZ6rlxlYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324039; c=relaxed/simple;
	bh=2sywbXpyrVl8jrKVWV4TrM0H9Oh89NIb2ItcJH8Y/YE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JHokwim4gI2HND1nmEfEyARvR0/XfZfzG1P7n00uaN+7ufyP2tkWPG5nSKjvLstpxqWMxsNUrPoQB9w6r9qGwj335BvOBk5MUDp0Nqd6xpAwkMEBGD4c+h5oRk2wVxeg7GCr/O8I/qliDl1UiKElbm2GwDEfMSkx4hA3Jf13FZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUR1Nduy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUR1Nduy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776324037; x=1807860037;
  h=date:from:to:cc:subject:message-id;
  bh=2sywbXpyrVl8jrKVWV4TrM0H9Oh89NIb2ItcJH8Y/YE=;
  b=HUR1Nduy9ykkDcIMyhYMGJGqrTsvvFHMu44enFJWJnc9iPA5+ykOve+7
   9JnBUuSXVZzFYmE06LEFcqIipFATqcko75Xpf0VttowUMSRCVVWxzhFNj
   LZvbeJBkcXCw+YXcw2BarJ8TSPpb6xOKqqdmIescjzpdJfdmtb68AgbMU
   r8r1CLY4TzywrdF9Aj2iDn+FSnWQNDF+hyRIlJse/OXO9QzlX5Roz+8cr
   1Pn/AuFR97uV7Qe7AVv2w2rIe/qGxxD5Ju+zefXhmBlgfBzBJI4c/MTis
   xXe699tNWZtg7jcbFZvFzMk5WiV31K3APj6dme1VComPDhv1CiK3a0ave
   Q==;
X-CSE-ConnectionGUID: NqDwUCnaTqi/M5jDulG8BA==
X-CSE-MsgGUID: cZgleyz1Tia/vkqQYiuBvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94720816"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94720816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 00:20:36 -0700
X-CSE-ConnectionGUID: jdgqwia2Rf2UmP7YDgB2yg==
X-CSE-MsgGUID: bxbxpUZ2T5GEaG5nhCVa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230585540"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2026 00:20:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDH1d-000000000zz-1Lxz;
	Thu, 16 Apr 2026 07:20:33 +0000
Date: Thu, 16 Apr 2026 09:19:35 +0200
From: kernel test robot <lkp@intel.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: warning: unescaped backtick
Message-ID: <202604160935.iIEV9pJp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Markus-Probst-via-B4-Relay/rust-devres-return-reference-in-devres-register/20260416-015454
head:   4f34e66333c4ba5792f770580bb3bd854788ef32
commit: 041688f8605d8a60620fc4f6d232dfd4363d5a73 rust: add basic serial device bus abstractions
date:   13 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260416/202604160935.iIEV9pJp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160935.iIEV9pJp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160935.iIEV9pJp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unescaped backtick
   --> rust/kernel/serdev.rs:433:34
   |
   433 |     /// [ Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |                                  ^
   |
   = note: requested on the command line with `-W rustdoc::unescaped-backticks`
   help: the opening backtick of an inline code may be missing
   |
   433 |     /// [ `Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |           +
   help: if you meant to use a literal backtick, escape it
   |
   433 |     /// [ Device::wait_until_sent\`] to make sure the controller write buffer has actually been
   |                                  +
--
>> warning: unescaped backtick
   --> rust/kernel/serdev.rs:463:34
   |
   463 |     /// [ Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |                                  ^
   |
   help: the opening backtick of an inline code may be missing
   |
   463 |     /// [ `Device::wait_until_sent`] to make sure the controller write buffer has actually been
   |           +
   help: if you meant to use a literal backtick, escape it
   |
   463 |     /// [ Device::wait_until_sent\`] to make sure the controller write buffer has actually been
   |                                  +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
