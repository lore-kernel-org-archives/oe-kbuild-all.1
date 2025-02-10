Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3B1898FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165253; cv=none; b=hHvhbiO1yedbeOKpldQIHQSlftSuzuk+LPP0ayVj11agVTD9kFOaE5uyETVrz4uE1vYJhVgmENUWulC6KWMYkBU/Wp3aOZFg0aQ9rYonNR5jYzLoespYIg3EXbvE7vvE/nzJs6noDy/DaeuCJIszHy123eTVdMlMBBSL/HcaTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165253; c=relaxed/simple;
	bh=J0cjHjbXfUGiin5UdKJagNbc6qQ1XpLqvahkHSVOXgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUj6LICX1g9gRdy+T8BJ949HZKgDgEOifwl9ObNqqy27KBMabeltfO9e9zIpuqYrcOa36JwdY2QxzYHMdx2FLZ+Sq/zpigRmT1AH8Ftcc5SsL/d8jDaK/i8ma4WbDOTMAe5v7zhkMObDOUQtseqjsDeKNGoP1lRU/niYVTcfGBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeGqMPvR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeGqMPvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739165251; x=1770701251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0cjHjbXfUGiin5UdKJagNbc6qQ1XpLqvahkHSVOXgc=;
  b=ZeGqMPvRuVAhmbqJHt4uhRXoYn1vpi60JD/uHo72jEbUjRUOzJr5TUfO
   7bgD66Oqwwc1UGLreKm6gmmtNgxyMtZF6VwUvYtfo8YNmCq2Ld1e+AsAQ
   Qj+FW7coFK55OfFbhkGTBNG0OX0VQ2WZZNbcJqEGOzJLljWiKiKQgWz3r
   hGYKojAzkd+k/Qek/vmx3Lc2ONU/AiupUz0PJ81xReXBLCJxEVWy1eZx2
   fzpIubBcqXrZog6J8QBV89FkP7qFlK82457W0ZaHPZqm4bm8H+JWelhDk
   ujE2j0SrQMxr2XQGK2saHY7pQhpEkoJls3BiHN6Df3QzVbXGIGYaKCDrn
   g==;
X-CSE-ConnectionGUID: vcQnHiUxQkS20dMKbhQwsg==
X-CSE-MsgGUID: CS73vGFFQmiuypBzW7CXaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50358567"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50358567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:27:30 -0800
X-CSE-ConnectionGUID: WItbYVmIRamo/Lihru9UoQ==
X-CSE-MsgGUID: SBuzACWeTnS2TKE8h4+rQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="111850209"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2025 21:27:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thMKL-0012Jr-2b;
	Mon, 10 Feb 2025 05:27:25 +0000
Date: Mon, 10 Feb 2025 13:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 163/165] WARNING: modpost: vmlinux: section
 mismatch in reference: kho_reserve_scratch+0x103 (section: .text) ->
 memblock_reserved_kern_size (section: .init.text)
Message-ID: <202502101353.e1mslsaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   8bf30f9d23eb5040d37e6e712789cee8e71e1577
commit: 201e73e42d5a164945f9c726d528156c32d336b4 [163/165] x86: add KHO support
config: x86_64-randconfig-006-20250210 (https://download.01.org/0day-ci/archive/20250210/202502101353.e1mslsaI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101353.e1mslsaI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101353.e1mslsaI-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x30 (section: .text) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x42 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x51 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x71 (section: .text) -> memblock_phys_alloc_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x8c (section: .text) -> memblock_free (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xaa (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xb9 (section: .text) -> scratch_size_pernode (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0xe2 (section: .text) -> memblock_alloc_range_nid (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x103 (section: .text) -> memblock_reserved_kern_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x109 (section: .text) -> scratch_size_global (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x140 (section: .text) -> memblock_phys_free (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x14c (section: .text) -> memblock_reserved_kern_size (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x152 (section: .text) -> scratch_size_global (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
