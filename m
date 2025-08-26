Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C230CD9E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756237458; cv=none; b=sw2DaVCq7IdLfk+zIx0xuTJS9uapdbvizzkGeWE5gfvHS0pF8oPlisVL8+y5tJbGdr7SX0sZXhvOHPJ36RZzQaJX+K5bsOhOV3vIzcwXsbWbl1kRsIv49KVA0RWmOE/Wm6xulROFFG1BdWv4x7hvR00Ll2jkQoqhyFkcebMIhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756237458; c=relaxed/simple;
	bh=ffWemVV5z6p3rwmFwUAyaGRh9zHtNLEBLzkFCVwQ/wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVv/wLCAbV2MmjbVt+UP6Va/NsoF6h+kp1CcAk3fKCF7grKK0QbyWu46DaOKYgoCV3MmSiQOvVIgMOCTG28EBoWapkqRGOIwpd3DNHY3yG16TsqNXVebTa/Yk1FMpHDNV1hykX4mOK8CRpcM2ikPZVibhAejhggksm5dWm4DDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hsw14Agy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hsw14Agy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756237456; x=1787773456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ffWemVV5z6p3rwmFwUAyaGRh9zHtNLEBLzkFCVwQ/wo=;
  b=Hsw14AgyZNw+fwUY4aWi564wifPCECaZIxkdfVszhPNRUwBmKPTkyszz
   KkVl369KXzuDAh4BWepAmGSeGxOA0qCvraMhZ3tiwdK3CX34RLL89qCel
   XNTL165wKA2geed8TbcMX+yA1wX31WkxA2KR1zjJINIdU3VpO3Wh/c3o9
   UZtlRQaaHXYsDTrqnbl2lq3GreLksFNxxJ4SEQO8MIb8RByNPHhIjADEx
   GohadBRcSPVxVHV8e2O8FkLO9ZmmoQnw5tnL08t4Wfm+kaPPZDbelCIA6
   ZLU59eWY00ZgySzNwVy8uqqrC68/T5OwX2DYrLeRs7najhaKZ7DS4STh1
   g==;
X-CSE-ConnectionGUID: B8dJcmV6QGeaYARIj3N9kA==
X-CSE-MsgGUID: JstIiO2+Tnq7PBg/WHBqkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58545127"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58545127"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 12:44:15 -0700
X-CSE-ConnectionGUID: nG2T2oqKQKC0+JaAy/ucCw==
X-CSE-MsgGUID: oQFMJDXHRXOUrXb3pH5Y9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200549297"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2025 12:44:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqzZm-000SL5-3A;
	Tue, 26 Aug 2025 19:43:43 +0000
Date: Wed, 27 Aug 2025 03:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core-v2 33/35] Warning:
 kernel/kthread.c:915 function parameter 'mask' not described in
 'kthread_affine_preferred_update'
Message-ID: <202508270306.mDy0jZOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core-v2
head:   6bcb15d1aebd50828a313a2ec927dea9d0ab9b8f
commit: 6365e0ca8b5387309efcfedabeeec97e064e2034 [33/35] kthread: Add API to update preferred affinity on kthread runtime
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20250827/202508270306.mDy0jZOZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508270306.mDy0jZOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508270306.mDy0jZOZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/kthread.c:915 function parameter 'mask' not described in 'kthread_affine_preferred_update'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
