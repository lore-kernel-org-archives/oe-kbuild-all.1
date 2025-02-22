Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7E13E40F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740246050; cv=none; b=ikXpu43SxmCQbBKFV3mkxYWwTIz/U6HSNCoU4vL3BMOS5kFfpFFGxHUVD9raZnrl3HeiOymQWIN2slysWtjwnwu3FClvIaRo8W8qtNqhLQuXI9JTX9AQvCmS+8g5Ylw6ffzCjOq7qyWPbCZc/x53U0sc1GTeiXbq/Dlk5GkFbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740246050; c=relaxed/simple;
	bh=+GEJ52FsVlPGyURGdyJnnYtikHw92rWshGm+z6Jzl1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apfqDE0V7F8+quCplQkUUp2ml37qmWXmO7EXRFSKpA8t7F0Lv0ltgkFkvzFipY/cpLZv1zNSB76OJHRxvu2RBSAg+1Y1wjFoYH8djsOckuN0vXsJ6H6XgyYdpQVpS8IBhe1Fp4b6x8dyglPi6GpkNNtJ6Yb2Dx9orcDoAQznVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llD7ig1e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llD7ig1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740246049; x=1771782049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+GEJ52FsVlPGyURGdyJnnYtikHw92rWshGm+z6Jzl1o=;
  b=llD7ig1ezil+DF0Qp40/OfGVTag7SE7OA0CLNPrQd8IMagEKF7s7uV1F
   xFta1xF7IRp95rX2W340b/qeAnVrwZ6dECYUWeLhqW5hnwyui8rPhoCL0
   bdcYIkW+DBq8flUKzNq8M6FWPJsteW9fCyvelzofyXQK11CSWGPCH1O4X
   wO9enkSUbbQNLVC3EM8o7qENighGtcKUws9ByqyKPyYMk3EAMHkYI7VyF
   WacxnlTv1gRrn8EIUinqOCqoTM4R/DvIUcAeyhCAXw6WNrQrf20+3e0LJ
   NEETisiYkIW94xUOiA9sxMUCe9tbXTwvFkiSOOFDebpCssriil7pW0vmm
   g==;
X-CSE-ConnectionGUID: WgVRY9XOQt+z/DvByQrI8Q==
X-CSE-MsgGUID: fMb7sqHbRvajlzWS608UpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40759365"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40759365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:40:48 -0800
X-CSE-ConnectionGUID: +HC5qAOoQJu1dW8SzwhtIA==
X-CSE-MsgGUID: ZCK24V/HR6iaITiYv8J+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="120624436"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2025 09:40:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tltUb-0006mR-13;
	Sat, 22 Feb 2025 17:40:45 +0000
Date: Sun, 23 Feb 2025 01:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:isolation 6/6] WARNING: modpost: vmlinux: section mismatch
 in reference: housekeeping_setup_type+0x36 (section:
 .text.housekeeping_setup_type) -> __memblock_alloc_or_panic (section:
 .init.text)
Message-ID: <202502230118.jpHLYN4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git isolation
head:   7f684a3f36349d046c74e1ba46afb096a0cc2463
commit: 7f684a3f36349d046c74e1ba46afb096a0cc2463 [6/6] add debug printks
config: i386-randconfig-053-20250221 (https://download.01.org/0day-ci/archive/20250223/202502230118.jpHLYN4Z-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230118.jpHLYN4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230118.jpHLYN4Z-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: reset_housekeeping+0xbb (section: .text.reset_housekeeping) -> __memblock_alloc_or_panic (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: housekeeping_setup_type+0x36 (section: .text.housekeeping_setup_type) -> __memblock_alloc_or_panic (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: alloc_bootmem_cpumask_var+0x16 (section: .text.alloc_bootmem_cpumask_var) -> __memblock_alloc_or_panic (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
