Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF252AE7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 21:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735767552; cv=none; b=GJ7I5z/n/lUg7PYDjH6DM+K0Cp8inod520h5c9Lrmbv822fguILATtm2tDpItjRdiCtQxOT0CO1mW4KdhqncHqCjDF6vIRXiKrZyX8GgpNj8dIG6doWXQueNdq78b3p4FI1T7J5YbnE15O+TTagj291W/LLffD3Tm2QLboNeq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735767552; c=relaxed/simple;
	bh=2n2oPEoVDNBErZ10RyCRaudqRgZZmQOE11LggDlT03E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMT7H5/7hDpYtFQ+x4TIteRrSuMXgmN7NVYjNooVPp/lEH5/51Em8JSED/UpsYERJxh4Gmnha3BzZiEpltCqcDB/foij6I5M/nJ3gD1Tr6rQ7+/QpGQhwHqqkSAOmuExlpInF2N1nOmAfBb5EIRQxexTU0/WbNfhDR47Rp+fIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K90bXS2z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K90bXS2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735767550; x=1767303550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2n2oPEoVDNBErZ10RyCRaudqRgZZmQOE11LggDlT03E=;
  b=K90bXS2zDeHvF7j1vig1oqIBUVU8WzNVdOLUFeoDBV5RWZ/svoBM8a9q
   AoKJbYIR18652Wu+cmgtVm3YREMyXfnNzst5I0qAkp7WoKkhMcy8Kg9KC
   cRg47z5m4FuVVQAjsCkd4l3sYQ2k3AfgQw5cI0aqer+R55j6t2KjAaYA9
   JBfnwJaajzuB7ZR59vJckLKApBrEHwJJuIxL4H1Gr4yoEVbUj99Mgg/8i
   4pFvbhlMTKxA1ockvrHfhsysy5T+dkCLpiF+gDLP5V9X0KDXK76YE9KGc
   JBAInDULo0yg5qlqNZAWiZbNc5tQapkWsjAEYnsSgtBfNXZ6sMSOvIYfw
   A==;
X-CSE-ConnectionGUID: 5puCekYpRk2/jdUV4eXsNA==
X-CSE-MsgGUID: i/iUOlglSVi1QdoGAtC7bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35712310"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; 
   d="scan'208";a="35712310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 13:39:09 -0800
X-CSE-ConnectionGUID: 5/C7k40TSlSy1jxv3XffLw==
X-CSE-MsgGUID: nWwmHCJYTtW025pOEFM+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101823708"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jan 2025 13:39:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT6Qk-00085j-2B;
	Wed, 01 Jan 2025 21:39:06 +0000
Date: Thu, 2 Jan 2025 05:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-08 0/1] WARNING: modpost:
 vmlinux: section mismatch in reference: __apply_fineibt+0x1306 (section:
 .text) -> poison_endbr (section: .init.text)
Message-ID: <202501020552.YBdN7BKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-08
head:   5e3272bc3ed8c598af7c028d443f3271abfb8e21
commit: 04505bbbbb15da950ea0239e328a76a3ad2376e0 [0/1] x86/fineibt: Poison ENDBR at +0
config: x86_64-buildonly-randconfig-005-20241231 (https://download.01.org/0day-ci/archive/20250102/202501020552.YBdN7BKC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020552.YBdN7BKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020552.YBdN7BKC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x31d (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x60b (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x811 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0xacd (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0xb66 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0xd93 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x10dc (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x1161 (section: .text) -> text_poke_early (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x1306 (section: .text) -> poison_endbr (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
