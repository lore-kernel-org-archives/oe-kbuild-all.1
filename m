Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CFC8CE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767095097; cv=none; b=ib3WpNpJEIfZ3EA8yI3on1+rS2jLLfY8QxngNyDG+4Loeo3dkrho891DYOxTpWonxaswH2vFPzE4lm28xE5whYn9Xhct/mTfcSaxlZrFhjeDh0iHFizN4soMSXDIo7Ssp/24TmUnzeeSTiUC/5N0CO4e98bbKnpMKg0xJ5eOPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767095097; c=relaxed/simple;
	bh=5FE3fRqgF8V9MTDZUDB/ICGax841jrbL30a0kW/iKyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LuKw4LPxuuyzfk/DFT+ckErvhlyWHHHLJIXcwzYZ86UXyvXTHy0fEhlg6tvWE62x6Wc1wAG5KUEQf3gmC35ItmKKqJkAKsKI/vluVsCj5Cs9VjoojB3CBr5ljJD4g3G1ofbdopg0FhL0MxgYWoKar11rJZkWpS6AFhfxAsJyywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9x9Ky9u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9x9Ky9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767095096; x=1798631096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5FE3fRqgF8V9MTDZUDB/ICGax841jrbL30a0kW/iKyE=;
  b=Y9x9Ky9uRKcqjIshgrOiuPR4JwFcljdUrJnLOWe5VZfcjAxpTKpqlUjg
   WNxCF1oYOyXLaWx9FlhQui42v1/E8iDMyzjWZ3RGwDsF6hoMk0HzRG27a
   2bNPOARMF74v74gC6KwNGmN9M1QLxWeYklw6wBwwHG9mNVcMvuPb6flDf
   r79rMpvsTZFVkrVTXeMEMKma5YyNSpwekxQPHLGH0vC0132EPkTmQZkke
   qt3YnL77AuHY+6biq+zpLeYMcmtmWiqpXbL9KVbibKH2wIoN/3UcL6idH
   lezubUfAucCilTSX2qozf7ZPVdLzDDWonMGnzXwO8u1ZVxPIKyom8g2C6
   w==;
X-CSE-ConnectionGUID: eZ7IJh6JTTGkCM3427601g==
X-CSE-MsgGUID: 1QFYfP4VRny4noaYxWVWug==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91338667"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="91338667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:44:56 -0800
X-CSE-ConnectionGUID: UeFYGAJiTXqZsQXUV0Ryww==
X-CSE-MsgGUID: pixQp4NRRJurgOO99WPPiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200838902"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Dec 2025 03:44:53 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaY9j-000000000LL-1cOv;
	Tue, 30 Dec 2025 11:44:51 +0000
Date: Tue, 30 Dec 2025 19:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?utf-8?Q?"Bj=C3=B6rn?= =?utf-8?Q?_T=C3=B6pel"?= <bjorn@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: riscv32-linux-ld: init/main.o(__patchable_function_entries):
 error: need linked-to section for --gc-sections
Message-ID: <202512301903.wJiXZKa8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: d0262e907e2991ae09ca476281fc8cae3ec57850 riscv: ftrace: support PREEMPT
date:   7 months ago
config: riscv-randconfig-r132-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301903.wJiXZKa8-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301903.wJiXZKa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301903.wJiXZKa8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> riscv32-linux-ld: init/main.o(__patchable_function_entries): error: need linked-to section for --gc-sections

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
