Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729207;
	b=4uc9vGf/QWo3tShqkXbDzlmwJGKYHzXNxjBgTtq4WNrKe1gFIC2xaoisGxKsN9OdsWjB
	 CwJwwEcNEy2wtG4Q1gB1DGSsWcyHRCul9I3xVT61QKApRZmW9dhJLWdYu78Zy9QYIN8I2
	 OTjqIK1ub97rpJNuKbbjNk0F6CKnAg4YrWZhhqeFwqXTx8IH7SbZD7uh04I7OXO0a8N84
	 ZmRJhNph4WDeAsAAOvOD9mTasTkgMnhcso6UQmyGGO6OwlsI/I1SLoRacAxjrHbqAUDuZ
	 QlqHi6noj1Bsa0MJMuahAhSE5QuEAhO8DeEkAavxPzsYJnPNolNKvTDXDArdqYn1klA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=e1kpzDNpSwLwy0sFrDaJ6uodvlC/LZP1KC6zZVVIISU=;
	b=2ffSkUfFVU9ShfxbuF6SYcWdMho78EnqAfvzA4T2CseiCKxaKvSMeaHA85lN/Qfm9Fu4
	 gMgO04MjJTAxAi4YgN/vTzU6Fmf+wdQSxxF34DTEH4lKfnvoXXheEQRlR/aQFy/MU2Zqr
	 W1eTVJSZscWwSHR29kLqFZ7Wu6KOj0GgL5CakwnPz9caJsdKsvZylT7XXd140XX+f4+LB
	 uAiRpe8E6JktNG+ETXvItwx4RKAuqM0B3tTdt9QLb1JYAjV/9W2RhDR9mJboXizVd00E6
	 1XpeToHIgBgOvCLhdpELhXf1a6aSwWPkFfMV+khuoZbZDz2WMz+0qWH543DNnjxjI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdu8WwPp;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434DC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 21:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hdu8WwPp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795729206; x=1827265206;
  h=date:from:to:cc:subject:message-id;
  bh=2f88cWe5lwlslU7BIvvO0szOvZCL5muEFLEb3SqDc3U=;
  b=hdu8WwPpjXibAI7n1M/KJO2aPay7gCruNJ6bcan+TlI0XAjdlZsBQBS+
   Z1NrwzrTtVX44r88jz4jseiSYNjKC3LHPbAB5ST49mTjfqX1ZCL9wsFJf
   tD0Zp62wdlZvTc0hi2yeu+5ph1667Z6o4swPpEK9weajiwg4y3UJ4irIT
   9VbMcIgTRQkXy/UGm/5RiowwdanbnQjZIYTWjPaDYUoS6M+K2a2zV8nLo
   9m/rrT6kCnZcXtXgxb8YZ5FeZtuH1W/3LpBy/MtahLddEyQVK0clddFOp
   Z67AjxajiPC1hdu1FEQ8W9APAXOpxw1eoEaZcLPyXpDqY5I3vJrhQd3cV
   g==;
X-CSE-ConnectionGUID: W2Eu62vgRda4DpbwXzA3qg==
X-CSE-MsgGUID: veNoUHiZQQe0lH3y5Mk3DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4642151"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4642151"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 13:40:05 -0800
X-CSE-ConnectionGUID: xhuW02iLS82zbDD4l1fDWw==
X-CSE-MsgGUID: BfXck/hJS7GTpZeNnMawnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12141196"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 13:40:04 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWhCE-000000000CI-08sa;
	Thu, 26 Nov 2026 21:40:02 +0000
Date: Thu, 26 Nov 2026 22:39:13 +0100
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 19/50] warning: unused import:
 `crate::error::to_result`
Message-ID: <20261126223148.4dF4hSh9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fc24f7e1a3f10a336872c79b3772930633b0205c
commit: 546597bebe363b65904233afc69ea24b1983bca0 [19/50] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261126/20261126223148.4dF4hSh9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126223148.4dF4hSh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126223148.4dF4hSh9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `crate::error::to_result`
   --> rust/kernel/of.rs:19:5
   |
   19 | use crate::error::to_result;
   |     ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
