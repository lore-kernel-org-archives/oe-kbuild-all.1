Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3DE4C85
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260427; cv=none; b=WvjZrTFc+HkVqk85Wx3VJiGDCxZFpbdr8sg/hffm/sCEaWRqSWe6pYVrkF3i7Y93nFZyj6L0gRY4bbiRHzxnh3wLnv/LUUCZk1MWE7ivS0sD0cy5uKwg7uWcO01AGy53MT+y5a2wwiqMS2psxIvP2SzEwl3JSwUYX2bJciP0hg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260427; c=relaxed/simple;
	bh=ZP3pi+AFiHXZyYM8gUnDT8BnDuB+1bYXhqMWJTUc2Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfIqfGP9OZRIgW9MyIlT5TWkEF5H8eD54tNHxISVMvz/EcFjuzR77ztM4XMtJyeTEad7MtWs7cNsy8gnKJA8hSulZK5fDTBN1mi0Xqp6hnyaTOYwKFvdJBYEV9VdCxdHir9Fkoly0akhQ3QGYxwgdkM4RCuexaAtzFrUeleSKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+waKgjF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+waKgjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736260423; x=1767796423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZP3pi+AFiHXZyYM8gUnDT8BnDuB+1bYXhqMWJTUc2Cc=;
  b=b+waKgjF8x9kfAV0k7ue9toLr/LL/TIBqu7EPx8AN6wi1Mk2QScJAO+B
   MluojrCYpvlGSXBg6p9igAsIgX5Cl4hIbafclIwLHYqDP0ESiqfoaI0ED
   zueBh3jhJpVAwNMH6fSIUGppG1MA4rg9aIsZGrnD48LwyQP0hJYO2JJXm
   kjP/plQ+UY7wvYtsD2I3E3FAQSw3FrekgG3mkaCCZhRsa3r+woLMaECrN
   6cBTig/xo2f1EYP9Y1/S7k+JN+eS5noJBd/fZ2OWSrWS0U7WMVr/99PIs
   g8x31cEB8E8eqcHhGbuyNJz+mJ17mcgpUtLvGqIAR5j7kWvBaogKSvGMm
   Q==;
X-CSE-ConnectionGUID: 9iZJwuwWSW2G2W/2mgFLJw==
X-CSE-MsgGUID: y00biKfnTX27ZGvd8F7Acg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61826821"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="61826821"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 06:33:42 -0800
X-CSE-ConnectionGUID: qeHm6Gt0S+uh6SObIJ7jkw==
X-CSE-MsgGUID: kosezaIgSsm0M6uF/pbu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="102851094"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jan 2025 06:33:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVAeI-000EpC-2T;
	Tue, 07 Jan 2025 14:33:38 +0000
Date: Tue, 7 Jan 2025 22:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:x86/boot 7/22] Absolute reference to symbol '.data' not
 permitted in .head.text
Message-ID: <202501072244.zZrx9864-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
head:   893930143440eb5e3ea8f69cb51ab2e61e15c4e1
commit: faf0ed487415f76fe4acf7980ce360901f5e1698 [7/22] x86/boot: Reject absolute references in .head.text
config: x86_64-randconfig-103-20250107 (https://download.01.org/0day-ci/archive/20250107/202501072244.zZrx9864-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072244.zZrx9864-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501072244.zZrx9864-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Absolute reference to symbol '.data' not permitted in .head.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
