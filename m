Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442D191F75
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732748794; cv=none; b=q2yFvQvHoHN6ELbdgxHiWvQqvoVWwVEzWF2Qodxw6RD8BmMkvFUahsQRhfbJz8spByrRQwv6JhoLA3VjjrE5BeuwAHZOu8e6D4FY2PZkwJcQrJo3e2TECbX2nSxXEHHW7Wz03ztrx1js5bywByhzwOMSO4t4PYDY9gIPcExdnY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732748794; c=relaxed/simple;
	bh=cmy4NUl8wWcwK2UOF7kRs4bC87i0+jK5U0eKQP99cuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjuO++WFU+L8omvJD/YJLMh/9DxMNRMTu0DMUPi023vCpvMUBnp70qndOKz8BCdFzFP38MPasL5trgaGNrx6yDeOPEhMrPOMfcOM+ld7BBBZJsegMaomTmN0WjGn8aAm9gM92GykyVhbMGTIKdikLQrjnxdvgSZq+yyJKjcV2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAUgKvbb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAUgKvbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732748793; x=1764284793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmy4NUl8wWcwK2UOF7kRs4bC87i0+jK5U0eKQP99cuI=;
  b=SAUgKvbbm6SY34VqttqdaCps2yHCy2m2+z3AwhWImEXrVKCMqanFQ0n5
   afW0mCWv7hbzrrA5zL3BAZyfPTjWZ/QNf2qidejsGuNRUQ14RMQUTKYVg
   bobN0aOXRP+YBmoqihhCU9DvJHTaCc3AOmimdbinO4ew/A22smjZy8Wmc
   V4vB+WpC6sUiWRPuAVZC203v3fjgD6sEVKUvTiGVH17GTZwE46qFB8a+3
   XIIO52L7V+ZXyhRvjfYPROFQ2szFNfHn5NL8DeueIW5uzj1/vQhIhextp
   iCN/mYMSE9CxFE2FykzsqtdulaTldn9qNtFf9ZIsyH7ubqLMdYvq+Epmb
   g==;
X-CSE-ConnectionGUID: qWuaF93eRqWNSANf0VohjA==
X-CSE-MsgGUID: mcF2WjB6QHKXR8uVZorLZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="58377706"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="58377706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:06:32 -0800
X-CSE-ConnectionGUID: l4/wNdkSQyyiufQRoi83Xg==
X-CSE-MsgGUID: XNn13QZgQRynH95S30mqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="96161377"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2024 15:06:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGR77-0008Qc-0U;
	Wed, 27 Nov 2024 23:06:29 +0000
Date: Thu, 28 Nov 2024 07:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/selftests_arch 1/3]
 tools/testing/selftests/kvm/Makefile.kvm: warning: ignored by one of the
 .gitignore files
Message-ID: <202411280713.d6ePFCVb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/selftests_arch
head:   e631163e2d3efa0aa7224a132f8faf3cda66f1c4
commit: 4d885622ba764bcb09306194ee090f1867b6e318 [1/3] KVM: selftests: Provide empty 'all' and 'clean' targets for unsupported ARCHs
config: sh-rsk7201_defconfig (https://download.01.org/0day-ci/archive/20241128/202411280713.d6ePFCVb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280713.d6ePFCVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280713.d6ePFCVb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/kvm/Makefile.kvm: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
