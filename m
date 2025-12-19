Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31A81CD2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 00:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766103520; cv=none; b=Icj6Ylfd4tSCrgj2gHMhMi7mLxrZIOx0DOV2WJStJuZwFav/7/3wOQxk5OgF/EZW9YvtIhuBsgZxozkkQk+pzHrVMat4vcfgD8/zVeZP3Go66O5lA/16tNmBL+XlYCOJiAm24m3gzZ44mVcxEAoeV3JKli4bI6jGXIzRPw13yyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766103520; c=relaxed/simple;
	bh=TJwfBPBR9U2pMeNLGIe4hYu3fG9d2M8kDxglyc/A62c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ms4/wPq3Hb2E6LFgIQnt01ZNzc87ptRKhrP6obRhM3kKIHhpEbaryXhZh5+YgHoLANMymsGJiudir5hGsLdAJy6iMtTby+aAu6bkjQGIHj/XiFblsBtyY2qt7hbjX0T81i/A+jlWPRN6Djsc1iSJSOJcQr2+0F5Vh1GS5oRa144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcSCC/QL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcSCC/QL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766103518; x=1797639518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TJwfBPBR9U2pMeNLGIe4hYu3fG9d2M8kDxglyc/A62c=;
  b=IcSCC/QLQ+a5EKFI0+Qzb4mivwJT7KscMTmuoRV3S1ccXKn9/zG9zODW
   vjoS5O0OjhU+aVmhF2hx/cM4dhPpywWnJ4AO3UItrSyaLeW4uqrfULT4f
   mDpXmxCg3kiWHkv6ipPuiZge4ltDApE3VjJWawXzrYnMR6HDVNxeJZni0
   S1KGBNGq1kCNQik1eUDYE5XZ55BDwgL3+/7dWGk8kovqew1U+zkakOIur
   JSjEuP/L1XfYkB7fBar+s971iDtdnJ/KF7uCPjAAdn1vCBCZlBvGjrLRM
   fPGlnQwRCpJxlIOg6YsQZNFSYhvAZ0hJ0SrgxEGlUNiwyA1f3k9ZJ6OSe
   A==;
X-CSE-ConnectionGUID: UE9LdQVTQMqyncn/yduMHQ==
X-CSE-MsgGUID: VEes6IuHQvCTG/8AVVWDuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79188514"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="79188514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 16:18:38 -0800
X-CSE-ConnectionGUID: 8ixR/FVvTWuPHRokLVfhWQ==
X-CSE-MsgGUID: dMa1eggoQj++SOmF1t4FIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198486712"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Dec 2025 16:18:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWOCY-000000002nZ-1IJO;
	Fri, 19 Dec 2025 00:18:34 +0000
Date: Fri, 19 Dec 2025 08:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944]
 drivers/net/bonding/bond_sysctl.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202512190947.4c8UaXQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 0397c33121652647d544d4bcdceb9f2d868146af [1944/1944] anolis: bond: broadcast ARP or ND messages to all slaves
config: x86_64-buildonly-randconfig-006-20251216 (https://download.01.org/0day-ci/archive/20251219/202512190947.4c8UaXQD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190947.4c8UaXQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190947.4c8UaXQD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/bonding/bond_sysctl.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
