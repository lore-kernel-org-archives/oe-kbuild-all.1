Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508AF3DD522
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002345; cv=none; b=mQS/M4sU9Tk5f6WMnlcjz/nHRP0b4Pdj92Y7F39Z97E1QtGvbV4K0TsWLw8cEbAZErz4hjM03L9Pgl2Z68A33xuN14TUMRyhIqkGx+CLcAeQkP8jjBRHJ4eHlhTB6cHw79YdNuswm/nhPxHm3zyAWl2zauFGWrw2Jg6lbp6bu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002345; c=relaxed/simple;
	bh=VJRc6dZMJ2raKOCCKyFovGeUlgc1thhH2tEHfjtpD7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XDkpOznG5eZC6HjtXP4vEenRhCFfbFlXUignhwZWxq6bHeOPoHr3XqTLdIOX6WZEzH/54YIaFD57ZIS4Y/lwh7WlqNalQyzJcQ3bh/XLz2Nq3fG7kwEl1mRoBQvoR4tT3+nFaprHzvtUuNuUKpCzzHzGbO9FZOLR7oZPqMbhJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbZMAio+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbZMAio+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002344; x=1817538344;
  h=date:from:to:cc:subject:message-id;
  bh=VJRc6dZMJ2raKOCCKyFovGeUlgc1thhH2tEHfjtpD7w=;
  b=DbZMAio+UnLBVRsXDJNpUqgZd9cGOhT2M39KAEYDbxhoxsSf85IQalr6
   Xx9PUCUT2q7kNoglP8TVFffjbj6fpmiNWBkm1XkochPcNWLO9FZ/WW/8W
   eKRhbv1pVlp6BZ4s+3Ae4j5O+RAW1uvIWf/xVUTSh0+OAXzFoZFN7Y3wt
   f3UyIXdrQZIJRXlT7hcDiMSELcbMdAcCpoZhg0LRCMQRfT8/B6eze2Fgy
   6euFwH+3VDgCiyC2aqVeRDH4ebQcs4PKzCXaHlrErT1Hw5KaGph1EkQ8Y
   JoSHAlJN0W49rCOhMBNQyr94gg4eZ0EMJ9A0cWlXJZPHplZYwFGgYJ/F7
   g==;
X-CSE-ConnectionGUID: 7BQbwUe5SC6dZzP9DVbdTA==
X-CSE-MsgGUID: COaLOh7KQbm0DbHUCNGWvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86441568"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86441568"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:45:43 -0700
X-CSE-ConnectionGUID: iLm0H4iGSWm2M+2gDGfgGw==
X-CSE-MsgGUID: qvwfnuuaSx6CFhl/NoHBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260776080"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2026 00:45:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsnL-000000004aU-2rEh;
	Thu, 06 Aug 2026 07:45:39 +0000
Date: Thu, 06 Aug 2026 09:45:29 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 23/57] warning: unused import:
 `crate::error::to_result`
Message-ID: <202608060947.V0P0U69v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   136397c31608440bafd64cf7ce72b6049b3ee4a6
commit: 57649d57d35c6eb5bc9fbea38c366de01a36c44b [23/57] rust: of: Add reserved_mem_region_to_resource_byname()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260806/202608060947.V0P0U69v-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060947.V0P0U69v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608060947.V0P0U69v-lkp@intel.com/

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
