Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62453416102
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405276; cv=none; b=FDHUFn7tIa2YvqcQ9dD1/++3AmbKW9/bXJT0S/2782r1xsa3+JCQxg4HoA535gRIkJFFuiKvJwRhiFo0QG9PSkVCmEj3rrx5xESagFs+ZFqrZUE98TPfgMau+ZnKmQKigwWOTL/eyVvrxEg5AuL0N3S23v/wwjrKgfROMIdNWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405276; c=relaxed/simple;
	bh=Bhn8Re5mCLwcZjUZPnrhWsdedcCYJKFiAh/y7MaSRN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bIDjsizg+e6ZZJJxXyaPliIEUR7IJnxT/9RN1Q3Mh3QFiS5U9mdpto1dCuCJFfvvI2LfcvtFxYSXykonizhGhtsN84kUfhF+aURQHEKdOA7p1+rvDRre3n78CDLnlGGAiKjtsLs8HwCZRPBvFUrGu9YrR3H2zsZ2bFl52o5QRbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vkh73AHK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vkh73AHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785405274; x=1816941274;
  h=date:from:to:cc:subject:message-id;
  bh=Bhn8Re5mCLwcZjUZPnrhWsdedcCYJKFiAh/y7MaSRN0=;
  b=Vkh73AHKFaRoAidTMr5oHs8h8Py+WHlVMrUWHJiPg8hC9Mi1/CwpQMbb
   p9Op6BGpQeBg0HT58KRq11T9mjQzurBmBmKoQA5F06s0XwbDimGmw3UDx
   e20x8oc3/MvUyl8N4TumQeLcn5Do3mwwYaL0OdAEaJ7uWhAampGRjzv8q
   ENNg165GOCUmVIrUbW4m8XMlh6GIp5973EdJ+iPuOtaAGIyclKtphUlvw
   eAFf5XzLSmb/zxHHo3M4KXtiEL4WPTu97BmmMwW6w6Gd1LgjLU4cCdOIX
   G7xAhrCcRZy/e678JTNdW5UUxXuALP+J3sNEuEJ8m0kCX8Bfncs42pUS2
   g==;
X-CSE-ConnectionGUID: KmgCYtyKRC6M0ME93xkoJg==
X-CSE-MsgGUID: AFIRHGyKTxWP+LtGYGOEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86211176"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86211176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:54:34 -0700
X-CSE-ConnectionGUID: teI3RC6RRFmdDMKaOEPxhw==
X-CSE-MsgGUID: kEZ2wvs4Qy690gFOPDpStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="257575569"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2026 02:54:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpNT9-00000000gNx-2goQ;
	Thu, 30 Jul 2026 09:54:28 +0000
Date: Thu, 30 Jul 2026 17:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Woradorn Laodhanadhaworn <woradorn.laon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>
Subject: [trace:trace/core 16/16] WARNING: modpost: vmlinux: section
 mismatch in reference: __list_add+0x7c (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202607301724.FWw4uuO3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/core
head:   c33330b2ec170dd38b3284a72bc6a07a49cc9a65
commit: c33330b2ec170dd38b3284a72bc6a07a49cc9a65 [16/16] tracing: Use seq_buf for string concatenation
config: xtensa-randconfig-r072-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301724.FWw4uuO3-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301724.FWw4uuO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301724.FWw4uuO3-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __list_add+0x7c (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
