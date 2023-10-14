Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B71862A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4r0blW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697302674; x=1728838674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KjSPPxWbgmZTkbStZTvas8qRYpUbCaqzOXX0oLDmoBc=;
  b=m4r0blW2gLhz7EvA46EqK14+Nk7IlV+ZU4mP+flmnGFLJ7o8uDnCQMVS
   he8syKp0ecFxMS72v3VHSSpfN05k93lNIBLKnmPstiIQt5qU1CjVo444t
   y1+AghVB3mWpQROKLp8E8DD4GlpVEu4bLcV2zCxitWYa2gSPS/XpEupMz
   HhEHQ5ZaQfypUTVrGK/V9awJd0FYAU2f3kIaIW68hr9Ka+cjm/xEq8JI6
   LM/TEnPxNHwL3MSqUFMAUDTp2k4nfKO15j13rLXyZGUYIOQU42YgRkqOF
   xs5VydqU526yquZmLPfC85I+FXpnB+zTLjQjR2F/axfVGfDHlxsIGyW/p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375688653"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="375688653"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825415650"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="825415650"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Oct 2023 09:57:53 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhxX-0006QH-09;
	Sat, 14 Oct 2023 16:57:51 +0000
Date: Sun, 15 Oct 2023 00:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 55/101] checkpatch: WARNING: sizeof
 *rmid_array should be sizeof(*rmid_array)
Message-ID: <202310150033.jZEaG8QH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   5923ca9112dd53a998ef4b986edcf65ee0b9065d
commit: 3109845b8d4b38e00f5c69a9dd497a1b68f943bd [55/101] resctrl2: Enumerate supported RMIDs and set up RMID allocator
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150033.jZEaG8QH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150033.jZEaG8QH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof *rmid_array should be sizeof(*rmid_array)
#122: FILE: fs/resctrl2/arch/x86/rdt_monitor.c:72:
+	rmid_array = kzalloc(sizeof *rmid_array * num_rmids, GFP_KERNEL);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
