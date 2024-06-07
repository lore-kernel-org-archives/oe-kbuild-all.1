Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E479DC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792664; cv=none; b=hhsoDhVOEhhYyES3LfB2Fl30/RRVf+Z5UuD6N/PEq1q+efjKbv6+ndvSdVgk9z8rI0qh7Gskg9NTn0T+taXUpO0SAK+lvNTSguTlmZHGqbaEd0452BPQr4/blNZRJj8cTdaPZTEVI3qPnrgJCLP+xCH5745mcm9lil+Y6el6ySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792664; c=relaxed/simple;
	bh=twK1kPCLi4emDm7KCmhVIUQhMSZcgakXXTFJJ2Aq8NM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9OgoKwAeLzmHfHWJoCyJpvBFpGkMVCX3oIgFZqND3pOLHiT0q27HkRTsPJJAO3A4PDlOP4jZIZKcJuV4XJs0wjfxua4zOwaHjgOiWrvfWVANmJMlZKv5W5KlMbJC5fgA5Kju/rx6IIdXtqeSyI4h922VyPIMez+dU3zpuCYYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzzS5ral; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzzS5ral"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717792663; x=1749328663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twK1kPCLi4emDm7KCmhVIUQhMSZcgakXXTFJJ2Aq8NM=;
  b=SzzS5ralLNt4hfeVqNGEIWIOMbxDJQnUgCgJgGpFwrFlX5xV/Lx3ia0o
   7ilQNn0PnLQwIHzXNH80YfwspGGn0/A7RfqE6kzySITj3sxSmxjc3ALFt
   jl0XG0vQKJiV2Q5RT89CAR1or9gL9b1lbOCTHn9R7BlX6dxywCEnmZOZq
   bs0ZNQoPRi1x7VHl79FpHcZgjZVwqnS+uZfoGP07DfjtAPJ/dSzvOfwbH
   CatdGQKA/t2DvPQzgUGp7Eimp9xkHN2JxwdrRssa/XArTs/GCdh/AlWDZ
   GETAbo9cFoGTd46FQPpIKRZYcW1BIbps+eg2OzFoAQXakFzCLzY/NCX4+
   Q==;
X-CSE-ConnectionGUID: Kr1FW4MURgOfFXIluq1U5w==
X-CSE-MsgGUID: qAvc0u6OQACLbbKazkDH5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14372620"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14372620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 13:37:42 -0700
X-CSE-ConnectionGUID: gBqPCWbeS/6WIMq/QV+mcg==
X-CSE-MsgGUID: sv3Sp8/dQLGrY/8E/tFMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="61623023"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jun 2024 13:37:41 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFgLD-0000Uc-0l;
	Fri, 07 Jun 2024 20:37:39 +0000
Date: Sat, 8 Jun 2024 04:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 6/25] warning: unused imports: `ARef`,
 `AlwaysRefCounted`, `CString`, `Opaque`, `device::Device`, `prelude::*`
Message-ID: <202406080425.MIduLkLN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   aca334cdc747f90b4a1051a3e570cbfa56f10a35
commit: 63449354e053b5d2f3e6a4a9502624312ce75ccc [6/25] rust: of: Implement property and device_node
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240608/202406080425.MIduLkLN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080425.MIduLkLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080425.MIduLkLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused imports: `ARef`, `AlwaysRefCounted`, `CString`, `Opaque`, `device::Device`, `prelude::*`
   --> rust/kernel/of.rs:9:5
   |
   9  |     device::Device,
   |     ^^^^^^^^^^^^^^
   10 |     driver::{self, RawDeviceId},
   11 |     prelude::*,
   |     ^^^^^^^^^^
   12 |     str::{BStr, CString},
   |                 ^^^^^^^
   13 |     types::{ARef, AlwaysRefCounted, Opaque},
   |             ^^^^  ^^^^^^^^^^^^^^^^  ^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `core::ptr`
   --> rust/kernel/of.rs:16:5
   |
   16 | use core::ptr;
   |     ^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
