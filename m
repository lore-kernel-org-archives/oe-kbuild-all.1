Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666974068
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 May 2024 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141498; cv=none; b=cCUkduNj5YM1CbTHWmU6dbMGdKO74BHMBa7uki/X6hdvwbjQtBqeB6cHRaYiTFa89b+JGk6HgDddW8bAOcV1eblScU6BWJhnBOhxzlJi+rdvO3pN6nbD8G5Y233XTGOYaUgsOQNkhD/1Su7lDoFmmKHmsdDtnDiYIpqTsCOGlRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141498; c=relaxed/simple;
	bh=9ufZrtFy20NTR5Fbtwtt4q9XxF0qgzWOry64pbT4kWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgIqelAnQKZGHUrD31zwhQb6XOQzpBHCi2YdRjuJWb0y6W1UHmdWrUDSLioaeInTADKQSgZlRynWK2eeAYIKw6X6inlbQdLqBGZfmc+gG5NHEBYYa1hnRHw4AngCX7B/znvCtanYVDB8M5rzwdiyBL/Sdl/qleL6X00h3HU33JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4xqc4LU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4xqc4LU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717141497; x=1748677497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ufZrtFy20NTR5Fbtwtt4q9XxF0qgzWOry64pbT4kWw=;
  b=N4xqc4LUDt09EseAL/DABr8RNc6Kp/Fr87X54y2+K14pFA+m1PYsu648
   NtclCb0xQusQppGnzwppdyvyp0Si7ogN9vFa/9sUXRJKz2EsVSlBV+Klw
   nlnsGU8uQlUxa5qDk9lBnEbluhZ7swg4me6Q0t+K6n85v5+kvWStxuu93
   QJsgYFQvmR2NUf8CERl5vyOdmimuZKpOYmG7ee/aVaaMfVLzrDMdNJe+u
   5/mKBqRKPmvhJbTDviJ9+Po7V6Y/G1SaIOx0v3pVc3xSEXI2sz7gWyxuA
   bHoKAb3y0mNjJmavQ8G7uaP+ac+vsC1yzJWXlJPkEjdRa9FGj2zpyS9Tx
   Q==;
X-CSE-ConnectionGUID: E+8AvB0OSOat5ljzeruk0Q==
X-CSE-MsgGUID: cbwYk2L4QS+ppWFJ0zzJSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="39062303"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="39062303"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 00:44:56 -0700
X-CSE-ConnectionGUID: pakgzYBXSBKRxNnJu8UYfA==
X-CSE-MsgGUID: p4N0DhcCQ0KefPr7XdZ7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36707686"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2024 00:44:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCww6-000Ghn-2z;
	Fri, 31 May 2024 07:44:44 +0000
Date: Fri, 31 May 2024 15:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 220/292] fs/xfs/xfs_file.o: warning:
 objtool: __jump_table+0x0: special: can't find orig instruction
Message-ID: <202405311552.pFmbeIlJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   a8ca57320047c6e994ecc4bc1f0be07f3ab9d13b
commit: 5d774e18eba380405df46ca724f70f2da27223af [220/292] xfs: enable CoW when rt extent size is larger than 1 block
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240531/202405311552.pFmbeIlJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311552.pFmbeIlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311552.pFmbeIlJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_file.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction


objdump-func vmlinux.o __jump_table:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
