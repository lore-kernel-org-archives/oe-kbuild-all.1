Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E458288DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 19:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834147; cv=none; b=nDTQ5sEWbXlGC+GquFmrN/l9xziPzB/HCMkSpvSf6pUFhRrb66kqRfN7xxLihoJA6sMfCEG4lSV7dljxJ+/PIRWsIT2GbaQqffzVjJP3b5dkw7GdRVxzHx918Hjn/1KgraANJJ1IS2/nNujkix4GbOWbul3vg36r/1H78maMik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834147; c=relaxed/simple;
	bh=8cSiDd4UTMndUZytGhHCzhdtxwKyObIlol9/PaVca1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RevKP0czqO5ef4nlJxGaUrE0BWCiYDCEg0/zoW1aow6K5Y4XhLXkwW3NWgLAKJ7lb9XhTfPkXdpaWa5Q+xQrz3WWcBaPEzQaYJR5kyQTPK9cgmqh9JbJQKedbZs/MVJo8up+AShYuWvpGcxKnLPR8Nn17Cntz2fwcLQcuo6Yivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caArBu/2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caArBu/2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730834146; x=1762370146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8cSiDd4UTMndUZytGhHCzhdtxwKyObIlol9/PaVca1Q=;
  b=caArBu/2kYGHWhcCblEhYagWHc1VAV2OklMrSrPM+1anGm3WscBA/Vos
   ZcQHLOn9lHxtMPvVBkPaGknL/EtguBnTGLysIiypsF32/FOLYpNzE/abW
   7i3+EiMx7DmmZpMG9AowDiZ4OJ8gPlF8I7rqlTaz+bjCk+VzsLrMSFeFj
   GAwYEyuC+V3vmQrWLGWvXlcwaaTm7yV29m2WhXoZF2fR4J1qcuJkbc91Y
   AdMPdVhB0728FG89WDfoTf91gFOHan8BtOg19vD6txoEijmzZJwSfXn57
   kM7Q7J4o/P9NR/55u4f8rVgy70jbubT88sQlTRXvDO0oqjBwNxeKjidnP
   w==;
X-CSE-ConnectionGUID: rK0dK+rxS/CM5YQXRd3QTA==
X-CSE-MsgGUID: 3Y6h7lGGQX++QmpWmJ5sUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="42001991"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="42001991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 11:15:45 -0800
X-CSE-ConnectionGUID: C8o/Tc0dR9+vXOSl+1LTfA==
X-CSE-MsgGUID: nBXgxUNUTJ+3yYxsbcMd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84248497"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2024 11:15:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8P1h-000mNL-2E;
	Tue, 05 Nov 2024 19:15:41 +0000
Date: Wed, 6 Nov 2024 03:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1219/1219]
 drivers/crypto/hisilicon/sec/sec_drv.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202411060503.rYM2XmVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 915e4e8413dacc086efcef4de04fdfdca57e8b1c [1219/1219] crypto: hisilicon - SEC security accelerator driver
config: x86_64-buildonly-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241106/202411060503.rYM2XmVn-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060503.rYM2XmVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060503.rYM2XmVn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/hisilicon/sec/sec_drv.c:843: warning: Function parameter or member 'queue' not described in 'sec_queue_empty'
>> drivers/crypto/hisilicon/sec/sec_drv.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
