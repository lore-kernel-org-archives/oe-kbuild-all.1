Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5B1F9A95
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913418; cv=none; b=aDMzD0/iG8n+7NV+1u6YvEjPZdFHq+ojaMo+3xgLro6Vyik2pvb03ViqxF8DxE+7emd2hlWEp1rFOL8T5EPnHkJQrXpqC+DUvsTQz5g41oKV5mR6VsIESIju9Ae8YbK8ynkWPfdHA8HHOdRepD77YR64hzR0fc6LhnIfmH5Y87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913418; c=relaxed/simple;
	bh=EwIQD9kP84f35PEwfYfnpJUDeW7q8CdkdJDq758V05A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIb2LfuKagmHBJdstVrs0uZKy+vwRPzn1sWQUcHGIw4kzV/E7dkJWdu0Kb085khFmq+jCWOEghQHovZ/BK9Tx3DOpgyHhso2N9FqCZwbOn+R1Gigo4iudAzmQxWrE/D835F+lpLIQn5cgsy1OPBIF7+C8Riz1y3cE2Rx/G1Kj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABs7HD71; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABs7HD71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735913417; x=1767449417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwIQD9kP84f35PEwfYfnpJUDeW7q8CdkdJDq758V05A=;
  b=ABs7HD71zQLVJxV8IE3a4qstUHm6YFX0lKpd4Nv4B+hNGeUWbsAG99Cy
   8Ej10lZ1Usxp9b8tn67MtxRWVUdUHxX+5+29jzcywKra/SR3f3BCgww9V
   saxl23DUvF/bj5OAWccuI9XBcnzFC5B2aCYpgaaVIBnZlEg73cryvTw9d
   jGNL47YmD4LeYtmbqSpUfppteEmVhKcWfacrR+uPEuOqMjHDXCVgFK50L
   0ZWxJg4nV/u+07Vb3yxUL3qT4DPyQA69g6k288BEKD81vJnv5RzYpmTqh
   eCsdo6enNeO2h8OXkz98JyzvVVaU3Wyfn8ml70Ibl1+qkGpYEsrcjWryB
   Q==;
X-CSE-ConnectionGUID: BG1SezyzTfu12msJdCmBzg==
X-CSE-MsgGUID: YllvRsOpScyBP3y5gZ8LCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36180063"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36180063"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:10:15 -0800
X-CSE-ConnectionGUID: 2+JfP9tDRZSs+J7hEkYn8g==
X-CSE-MsgGUID: ZYZGox/aSJW/Ccg7QPOhog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101664569"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 06:10:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTiNP-0009oG-2P;
	Fri, 03 Jan 2025 14:10:11 +0000
Date: Fri, 3 Jan 2025 22:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1693/1693] fs/jffs2/jffs2.o: warning: objtool:
 .text.jffs2_erase_pending_blocks: unexpected end of section
Message-ID: <202501032202.oO79Fo9u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   604e996dd0189ddb0875f389b87fa2084b3a9424
commit: 349fde599db65d4827820ef6553e3f9ee75b8c7c [1693/1693] arch: enable HAS_LTO_CLANG with KASAN and KCOV
config: x86_64-randconfig-103-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032202.oO79Fo9u-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032202.oO79Fo9u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032202.oO79Fo9u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jffs2/jffs2.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
