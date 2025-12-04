Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C2E2D3A70
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848347; cv=none; b=gyfdF+x0lwx6nxYshi8Ti887sfhAFHPxTiHXJdN1pbDYFFa58g10SPp8bcuvf/kTC7mgUkpOMehnZkjJ+p7ZFZtb8ph6weRLevBowHggRFuXbHPJReZy0EOcjOe6aGj5jDMlkqlD3kbMNWZBnYfmIOyFxB5tz44ffek8sMcmw/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848347; c=relaxed/simple;
	bh=YpXvwbmqNJSWlhV1/qs20g9tj9HlmYTXN0vqrLL9tZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCuBbWNiQGJRKMgtYmBF2EMaex98uIQj668cIEiDTVzZU5Ixt56a6FjxwgYGi4f/HqNTQHCyGRC7/kf0kx9GuFSzQxe+4D409XMZQcwqEsCSDgJK3IRUi1v5RjnpDtVLhBPLZ33B5S0ATKoQNg9lQFVgpxiNnKw8FqpM743Ric0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXepf+z1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXepf+z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764848346; x=1796384346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YpXvwbmqNJSWlhV1/qs20g9tj9HlmYTXN0vqrLL9tZA=;
  b=WXepf+z1nbBUjeczZocsbL1cYdkFDEXur8hqLadBFmxam5USuJ2Uqxo/
   EsLlm4TWHT1NVcqX18M/kocbnGonsdtwKLL/jb4ibuecEHoFHejWrR+Lx
   bDfF4DKIVMNLVvSMaLB1xYJEBXdRddhkQ3qpgjlfp9mZHggsNWutkiOvX
   dU/L2zxgkZ4GvlM60f7MQzxcADBh8XqGtpIphdQ/+epySIlRoUe3CcXUf
   WngPh0eEeOq4lpZuUQuq1zwa4xnWmtXBM6yzxzK28AXDNhDguIc+8yGK6
   oGUnqk5iZ1cV+G2R7hXSEj3hcluF2VVjhwB4I7p9qqan9RpLRA76F2jLv
   g==;
X-CSE-ConnectionGUID: QebKq8/yS6CIsanqzgR1nQ==
X-CSE-MsgGUID: qlk+NJNoQcephMEEQs78rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66750260"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66750260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 03:39:06 -0800
X-CSE-ConnectionGUID: ptQBn+uDS2Ku4GyYiDVO4g==
X-CSE-MsgGUID: 8BjkRc32QymrzXLNdNiJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="225917726"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2025 03:39:04 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR7fq-00000000Dkr-01zw;
	Thu, 04 Dec 2025 11:39:02 +0000
Date: Thu, 4 Dec 2025 19:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 22/23] Warning: kernel/sysctl.c:370
 function parameter 'u_ptr' not described in 'proc_uint_u2k_conv_uop'
Message-ID: <202512041919.82FGS2oX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   dba3c8237954a60d0245367f9110dbe6bb264531
commit: 4531cacd0cd2a8f46181e4aa6f8fa4964ee4953b [22/23] sysctl: Replace macros with UINT converter functions
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512041919.82FGS2oX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512041919.82FGS2oX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512041919.82FGS2oX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sysctl.c:370 function parameter 'u_ptr' not described in 'proc_uint_u2k_conv_uop'
>> Warning: kernel/sysctl.c:370 function parameter 'k_ptr' not described in 'proc_uint_u2k_conv_uop'
>> Warning: kernel/sysctl.c:370 function parameter 'u_ptr_op' not described in 'proc_uint_u2k_conv_uop'
>> Warning: kernel/sysctl.c:388 function parameter 'u_ptr' not described in 'proc_uint_k2u_conv'
>> Warning: kernel/sysctl.c:388 function parameter 'k_ptr' not described in 'proc_uint_k2u_conv'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
