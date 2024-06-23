Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD8D33EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151799; cv=none; b=stIyj+NdtR99jQHkTqUDiFVJeGZHDFWWDh5kEzJbKa0Mq9KefaFKz3Zy2inqud1gcqZJthDkcwzrBQkf05+R2EDDJMmzICN6pmPwoSZlYFIEppPEXlQK0r7F584AAu7tOoTMwRkVM/0zTAHw8xnouM+M/ZoP4VcFt+M4g7Ejhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151799; c=relaxed/simple;
	bh=ASzjppFPr+pDCMbXNEuJvV0kEqJ0bgbvhpDtfCRYU0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p0bul834JwCJFC7oRFPm3/cfyFh/J5IS5UuPZNwCOc1Qs84u3hqMus2Q2MFTGP8NEx6Q4twUkG61F5WLS9aHZnxCiSc8MezNahuagp/gJl/86+kK0jxRRYOVRwBmqxDXlQfO+mjs2j3Fmy+aM3RbwURRCq6BBODCiXd5+lhUyP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKMRSHgl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKMRSHgl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719151798; x=1750687798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASzjppFPr+pDCMbXNEuJvV0kEqJ0bgbvhpDtfCRYU0k=;
  b=MKMRSHglt6y4ZjdpYANxntkUAKJilb8y7oWqPRTlo2cAFOpagD7HA5Vo
   ZucDbjBhNR6kqLQQAuK2/VzDqbnJN24niE8LdZ+zOyDXKCN8wwIAQCOZj
   w5KTzPSfxODgNRXMa9tqOLC641tA/O0Oc9xlUOCCpg4W3X+gbJQzUPJnM
   97+eAMIDW7MxrkVGniNH6KNYACg/JjLwerv1fQiTH0AWFy/tpLm2gAR/b
   4nkffw+/6m809ElJQ+1+3umCO2lA0jNXI4VSmBEoDxRqa/7Z1rbjB5RdG
   fL6nkcm+qS0FcBT8+p6AlcYD8htqYhvzwGPcq+5zzOyDli8Cm3AX/LIKl
   g==;
X-CSE-ConnectionGUID: lZRqJOUAQyO8xETTiyZArQ==
X-CSE-MsgGUID: hkAbQ1prQNGvQYutAKafWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="33668212"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="33668212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 07:09:57 -0700
X-CSE-ConnectionGUID: PsN+86MESAKN0SgMgNrtiQ==
X-CSE-MsgGUID: entYpAeUQNGB24SILyf0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="43031057"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2024 07:09:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLNuk-000AXa-16;
	Sun, 23 Jun 2024 14:09:54 +0000
Date: Sun, 23 Jun 2024 22:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 5/6]
 aarch64-linux-ld:arch/arm64/kernel/vdso/vdso.lds:173: syntax error
Message-ID: <202406232215.NZcwM2sq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   0f0cdc98e2240e0599117fb18be73d618e51ee8e
commit: d732ff49ba9accdf2538de2fc804bc0701ba4933 [5/6] todo
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240623/202406232215.NZcwM2sq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406232215.NZcwM2sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406232215.NZcwM2sq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld:arch/arm64/kernel/vdso/vdso.lds:173: syntax error
   make[3]: *** [arch/arm64/kernel/vdso/Makefile:63: arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:198: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
