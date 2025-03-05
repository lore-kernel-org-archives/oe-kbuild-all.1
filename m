Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA72D7BF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741135392; cv=none; b=eZm0EIpq7XVaWEaafSuUl/9tbKN7bof7rCChGiHYiRAvs8NZXHAvs3XMLWQFEsaqoRcH+l7wMvsAsUaCpA3WHqjQX+fJmR/JYIThGAdecGUr5igekToIIsEYpmK4gIrrQXeppyvvqYRbHvflP51qaYp9vaLHa051+m6TtslCodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741135392; c=relaxed/simple;
	bh=LlL/RvmZHqMJOnL1aHXvXdxjxYikKPofvi6J4CwIVbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OUQFYdEjvkRPvWu9Okn+CLTP05iA7HdcWqnd6pHv9+taFA6dacaxhun04SyNslWR7AjO5XAHSH98WHFmBOUswO1CU3EVP9HodXSQQdhtXbS1PxSXogsHT8tSUEEsRSnGUocGkMOf6xZc7qIGa5Moqmn6YXxBMV1F8uwp+hFWkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIOE3LKr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIOE3LKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741135391; x=1772671391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlL/RvmZHqMJOnL1aHXvXdxjxYikKPofvi6J4CwIVbQ=;
  b=eIOE3LKrT85olvk+bfcBmrfbl1d90IB198cqi6cSGIoJp5gbj+kd+rEt
   pO36x1fVQfrv2ffoQyvSwPPwmN5yITAarRsSSwUZTSLloZeJPYvRokhNU
   vcTwWGyHJMkXw6Y/Eg3UmcaVVYgorp/S0f2HS17AGMSfFR939mUsEl2GJ
   twb0Vab32Q+XYBJjt9w7V4kfVFYC1EeXL3ZqBT2X4u9UqQz/T+kXD7lnm
   GWMMwbyMk0HXhy0HAzHUfUdaXtTP/lrKu8LcZZM/n52L6SCWLl7wJ/wnv
   KVejY2fKVFPgc99HKXd0NqhTRuV2EVUtPc+sJX5qcqABHhOqbEfKFhZzx
   w==;
X-CSE-ConnectionGUID: pYGxRlsaSHyGjHYdlRX7LQ==
X-CSE-MsgGUID: 4g9jJ4+0QTmqbm1G6dUitg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53480788"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="53480788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:43:08 -0800
X-CSE-ConnectionGUID: GhsYqKPaS1ahrib1p3zO4w==
X-CSE-MsgGUID: deyCAY8WRci9Knbtgee+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119428727"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2025 16:43:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpcqn-000KQQ-0L;
	Wed, 05 Mar 2025 00:43:05 +0000
Date: Wed, 5 Mar 2025 08:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs.all 205/231] WARNING: modpost: vmlinux: section
 mismatch in reference: initramfs_test_cases+0x0 (section: .data) ->
 set_reset_devices (section: .init.text)
Message-ID: <202503050805.QokzmqHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   ea47e99a3a234837d5fea0d1a20bb2ad1eaa6dd4
commit: b6736cfccb582b7c016cba6cd484fbcf30d499af [205/231] initramfs_test: kunit tests for initramfs unpacking
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250305/202503050805.QokzmqHW-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050805.QokzmqHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050805.QokzmqHW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x0 (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x1c (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x38 (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x54 (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x70 (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: initramfs_test_cases+0x8c (section: .data) -> set_reset_devices (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
