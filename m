Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFE354AF6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947756; cv=none; b=jN84TXo5PN203WQAj8Xwbi6NDC70yBbSxK3gA9PTiQ4PNFVfuXoRMdvt3gkKWT0Z7flq644IKt3Z70r44T8LxWlJvkK+g0OePlqeJETUZ8Ixf71+3a4d/yis05kZm8CuESQV+2t+d0xsPM83CZ/ulSBfjx1sIuGHXwQuq8pLDT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947756; c=relaxed/simple;
	bh=308x9t9lk7qD4/Hv4icjZUMekAYnnA9eeUzw5OpfVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lrqk5mZuACIxb9CxEGgwwuLvtIUx3VKFrgK0Ergq2scxYr9cp6uUxmNEnXjDYKDinIUWq/oLb08/sgy+5JRifEOzCjlBNFFYUWvbze/SRq+mirWGKRO6PsicLz1FPO46cV9qXDPmS4Ztkff5xeEprPETz7gXiTQ925Puz198bFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQGWFISt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQGWFISt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764947754; x=1796483754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=308x9t9lk7qD4/Hv4icjZUMekAYnnA9eeUzw5OpfVOw=;
  b=MQGWFIStoxAw8y4Y6eTKYC07tnL7eenXYX+WAOxFmXqrBsNIcdrR4uZn
   uoJ6pbxGZ2kRGF98PGZWgig8YprtMJ1m0Ny+RJi4NXsiyoWmsc6pJDmW2
   /OgigvamgfX271EOECS8zDnHy4Gtn4ooMhDi15hcEXtc29/knUFn8tzRP
   DIQygYZ5ae74hBZosEDJV0CxPXXAmiJZFRnhKzloOUMhS9NIxMJ/gMvdW
   xtcRF7Tar0hK22bFk/IUw5U1NTPml9NTqMYFoVXl/eqB1yUrWsU5E7ZBU
   lNRXJ6nyI1gTm8U/8gJnxjgoDiZuMZrkYreGd4TbppmsT7Z/IrfRUnrwJ
   Q==;
X-CSE-ConnectionGUID: 3pxyY3j/T2S4WqwjjTP5tA==
X-CSE-MsgGUID: 6UCtT52vQxKzInegiSlbNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89633804"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="89633804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:15:54 -0800
X-CSE-ConnectionGUID: 16MXqLxeTVei8biD4POjkQ==
X-CSE-MsgGUID: fbxO3HR0Q9CjEy5rNfO0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="226310300"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2025 07:15:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRXXC-00000000F7l-117t;
	Fri, 05 Dec 2025 15:15:50 +0000
Date: Fri, 5 Dec 2025 23:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2-session 13/18] Warning:
 security/keys/trusted-keys/trusted_tpm2.c:386 function parameter
 'parent_name_size' not described in 'tpm2_load_cmd'
Message-ID: <202512052335.vFDlR5do-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   f0dd70917ecd9d3ab6f1a69b11659c62509f8b52
commit: c779b2a64b9d34cf93dc39b022330262e947369b [13/18] KEYS: trusted: Re-orchestrate tpm2_read_public() calls
config: i386-randconfig-141-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052335.vFDlR5do-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052335.vFDlR5do-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052335.vFDlR5do-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/keys/trusted-keys/trusted_tpm2.c:386 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:485 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
