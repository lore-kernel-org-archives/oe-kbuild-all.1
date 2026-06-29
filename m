Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95870358360
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 22:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771974; cv=none; b=O9bhTjXsjfgAy74CT8ZdxHhvjc2Ma1lsege3H3VmIdEZNn3kABulN16cj+KVSiqcga2wGK2eMAZ8xm7yIMdszP/LKiEy2FLB7Hs8ylpmM11tZQejKBiTHTdJURtluBuJUMpQ6rCiakalbYEpPJ6nvpLNvOCc/FpzGR2AQM5FFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771974; c=relaxed/simple;
	bh=9UIoeiVY7BohXrTykD4I09edKdwMRkr6J9pQRrVQCnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F84TcE663vWRxeAhWXfEGuvnejgne5sJ1jQrtPdX8koakKPODIjlw4Ocm76lR+1aS/LeGq8ppeNihwVokK3VgTg1HO6xuL78gUjvTOIF99G4u8THfQfeVJ7D5/F2Hb7QwhoTlkpUc5SSmrvzAHJPajh1ivQexb9Ohs2O5NQqb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/GuhMXp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/GuhMXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782771973; x=1814307973;
  h=date:from:to:cc:subject:message-id;
  bh=9UIoeiVY7BohXrTykD4I09edKdwMRkr6J9pQRrVQCnA=;
  b=l/GuhMXpVvcp9uSgsKwZr5qCuougElfC9PJlldQg2k1FYBT4/5H5M5ht
   +9DXChy9ZJ05QlgjJZbrWxSEhNmHVLlH7Dsk5Mhj+f4H8aKqWP6LQcPlr
   YcbcrV4PSGtOmKX/0ljdyYqxzh2qYhsPoJ6/jEAaxiS4FvKeJY8+3eTL7
   /PY5obzvKsP+lvYxY2gabe9YGNLkSSO6iJHIdzFkfM3wxEy6UVzh3bSvr
   O/R8bNklXqQjZlgz1hR3dLRBTLGSiN3jyDDZoU3lnO7DRldcewXcF5oo+
   BFnQ37AD7B7jsnqWCsqdDgHKOB5YC9AwiKTNaA5vEvrVQlj8+Ecr+HO2u
   g==;
X-CSE-ConnectionGUID: QveGU9SCRMaH8X0HEPofVA==
X-CSE-MsgGUID: LSOXVdM4Q4yAeYXw6L1A3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="93832684"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="93832684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 15:26:10 -0700
X-CSE-ConnectionGUID: W3OEP2Q1TX6NThEr1i5hNw==
X-CSE-MsgGUID: 70OteSj5TSy0KmW4A+J8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="275316941"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2026 15:26:08 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weKQY-000000000Fd-0ijZ;
	Mon, 29 Jun 2026 22:26:06 +0000
Date: Tue, 30 Jun 2026 00:25:30 +0200
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260626-1435 10/24]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202606300013.Zw0vlKsU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260626-1435
head:   5e303b90f40cfc84c2bcdb5ee07319ac63df48b2
commit: d9d7dbb3db9fe61c6a83b16de057be8ceabfee1d [10/24] RDMA/hfi2: Add in MAD handling related headers
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606300013.Zw0vlKsU-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#420: FILE: drivers/infiniband/hw/hfi2/mad.h:41:
+	0x08 /* Link Width Downgrade Enable
+					      * changed

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
