Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AD328BB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cp+rTMQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697484135; x=1729020135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PV8cbqgPBJBENN06ACAnpgohPxRSy00Ze1MF1tkZTlk=;
  b=cp+rTMQGrTjd3yF3O3viZfOX0vxFbe7DHEfhiU02hwOjlGFp+H9bUmSg
   fOjBZ6zqtIWEo5xP7E5znymb+CLiSxFxs/Td3rSti3uyoyoDPuKeVVwEZ
   W/vVYdxcIPPRayFeDUldGmdmKKgmY1DzSesmSkwOCSTtGkifivodBVFoq
   5mVvoLW3BsddzmoUPwaEQJ04ZqkcVa8zCYOZv+RbZ5r3KeFGT7ymjZRBj
   GsE3cHSSGZHRXBcPwIc1vkXC2ETWwyXMe9/IU51pcU3I1XgMvBnr0Uv9y
   LZbmi2kfHS3uN4IwrlLt2Fs07CqczX7grVIbIEl4CwD4NVJWwIYethlF2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452101198"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="452101198"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="846523466"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="846523466"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2023 12:22:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsTAJ-0008cZ-1O;
	Mon, 16 Oct 2023 19:22:11 +0000
Date: Tue, 17 Oct 2023 03:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [aegl:resctrl2_patches_v6.6-rc5 15/102] checkpatch: ERROR: Macros
 with complex values should be enclosed in parentheses
Message-ID: <202310170350.vawYRYkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_patches_v6.6-rc5
head:   8de349ad7259c6a1a5a4f4999f4afa6ff097b171
commit: 25fba0ed6944e3cb7bc301c29b0202f499bdddd1 [15/102] resctrl2: Build domain lists for resources
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170350.vawYRYkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170350.vawYRYkU-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#206: FILE: fs/resctrl2/internal.h:21:
+#define for_each_resource_by_cap(r, capability)			\
+	for_each_resource(r)					\
+		if (r->capability)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
