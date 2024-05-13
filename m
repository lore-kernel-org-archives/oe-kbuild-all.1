Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576057CAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715616584; cv=none; b=HJBA4Yh/K9KlJGRpAFX/FNxx5wzXLUgcHEoH//BoBusgeSj5nuTpb6FzFNa3kG6FTCbHyYfdChpDxnui279Zf1HU0V5Tpa5CubmiqzPwK08Xwc4AXtq+6+tI7nryDZuZ8bkSoyqgCTjyL8YAsjJ/HMblxGM8wibWWF9n0RskkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715616584; c=relaxed/simple;
	bh=ZIjbQjJmI11wJEe10phCWXgAcGDJtxtb9qK7NNELx1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncTzMOw6u8Wv5BE7paM0NOHur2WhundUehLmOHrNdxnS0SfGWtMdOZdVggSfVUlaxO0x1e4UmzzMCXmbSFnRP70BpF2BHoxXLVimwsjg000dMk4K8LptYSbWgx1uwI2uwYxC7tHN0JLwAC+BaqDKueXY3rKcVhbAMZKzoDCugZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KS8+hvcn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KS8+hvcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715616583; x=1747152583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIjbQjJmI11wJEe10phCWXgAcGDJtxtb9qK7NNELx1s=;
  b=KS8+hvcnundKmArdwNu1K2L1LU9Yd/LKDLMyz/uwcDG1GZDu4ImQmnPB
   hzDUSvwdpBBL5sdmw7fCmb3xsgP4oga1oLLpF62ox6qZVslJfigmggfQu
   tbuBK5k79mz9/Ye5Fs+hHX2Y9NdXlVP1z8azaSz1ZKJ6Ch5KcEsnF+2Yl
   +Th9ZQYzItjKzypA9Mk5fFCwEta0lw09mIpXL+n6QmvzGQW2Ojhqlh0s6
   i6kTiPHNxhvtlVqVHhJ+yq1ptzENdPfX8i8VLhWEn4YgpkhUCZ444bBwm
   PGrtlzSmF4j32UBJxRyCdrqnxvBx2WoryLA1GaGmmYMb/T/5q4waU6EhG
   g==;
X-CSE-ConnectionGUID: EP/1RfYCQCS1Xss3xYxMjQ==
X-CSE-MsgGUID: ce8oWrM9SaGY/CHefZLcvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22964551"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22964551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 09:09:42 -0700
X-CSE-ConnectionGUID: GYXoW/kRTeWUagRu5RFLfQ==
X-CSE-MsgGUID: +bkFaY0FR2iBztq9O+XUDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35132943"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2024 09:09:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6YF8-000AQe-35;
	Mon, 13 May 2024 16:09:38 +0000
Date: Tue, 14 May 2024 00:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key 39/39] aarch64-linux-ld:
 drivers/char/tpm/tpm2_key.c:124:undefined reference to `asn1_encode_integer'
Message-ID: <202405140042.N6NrHnyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key
head:   c9b223b1ac3db418fc3ab49d007b5a12f8b091aa
commit: c9b223b1ac3db418fc3ab49d007b5a12f8b091aa [39/39] crypto: Add foundations for TPM2 asymmetric keys
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240514/202405140042.N6NrHnyj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140042.N6NrHnyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140042.N6NrHnyj-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_encode':
   drivers/char/tpm/tpm2_key.c:102:(.text+0x98): undefined reference to `asn1_encode_oid'
>> aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:124:(.text+0xc8): undefined reference to `asn1_encode_integer'
>> aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:125:(.text+0xd8): undefined reference to `asn1_encode_octet_string'
   aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:126:(.text+0xe8): undefined reference to `asn1_encode_octet_string'
>> aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:129:(.text+0xfc): undefined reference to `asn1_encode_sequence'
>> aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:108:(.text+0x164): undefined reference to `asn1_encode_boolean'
>> aarch64-linux-ld: drivers/char/tpm/tpm2_key.c:111:(.text+0x18c): undefined reference to `asn1_encode_tag'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
