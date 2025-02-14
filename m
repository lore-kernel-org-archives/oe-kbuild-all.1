Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8F8158870
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739567899; cv=none; b=uMzboMO5UIJRqDrF2zMzWAA5i5eYhW0wOz73+D97MHxjs3Sag1sdfmBs+ygRWk05kcQQEH83gZkyDu6lgFnyUXxow/CJnwe68UeXcBU1p8WJZy55B6aLoC07qsg4wJj2mNpplqTj5ytul/XUti9++NBHbArhGU9gQYV9/XS5qnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739567899; c=relaxed/simple;
	bh=9P7hvZ+XVnUMNxZa+uLg9PJDTMMH2AltvsC3Hdlerzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qpaUgCVcpUKxuoaeJ3CDZobTQ2oslW9Yzk0o23RQK29nn/FlYNT48tnKq/fi3hYb9IvYoGZb1SScKkGdJUyndj2YAFaw55Pd0/1JdMACS099ERc930RI0E1wkWFn2KZxhLaRmF1o+wCQbQWgQTldehtNu5a8H1Btx7M/uzvfgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4zoq0Vx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4zoq0Vx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739567898; x=1771103898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9P7hvZ+XVnUMNxZa+uLg9PJDTMMH2AltvsC3Hdlerzs=;
  b=n4zoq0Vxu7dRyBzmRIdJwePh7OpoLNNecuAsbLNGPqpbXeeuWt0JO+zU
   xf7UcSFtx2CBDAq3/CsPil6L1yhX0eKB7JmKQTKnPQHkM5r6rTSgxusd7
   5Tum9/YlpAiTsECvVPxHwS5CbkIjjV711x/hwGi3bKcolC0Na8NjEH3vo
   LEoV4U/MUiyj4gQkF+qj2aZwLo+Yaj9UVtkVGRtPaoG6Fk9EWiFKGaOqQ
   S+hy3DSkrUmYpal84e4QHngx3QPGKc4uT/AQesdAgMtECFLHG+jiGu2Fe
   LIp39suJtnlpHPUJhGyY+jF+slFWzNEQXPnsbHDbxS/3rOn8OCjhHSAay
   w==;
X-CSE-ConnectionGUID: CtTWK5pQSRqb3+0hkWJFMw==
X-CSE-MsgGUID: v/R+bBwlQp6Uxm18cTPqJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44093866"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="44093866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 13:18:17 -0800
X-CSE-ConnectionGUID: cIeRREomRWCk0ovswZ3gbQ==
X-CSE-MsgGUID: VoJ3sZLERYafB5D4ewKzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="118664605"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Feb 2025 13:18:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj34g-001AAx-1n;
	Fri, 14 Feb 2025 21:18:14 +0000
Date: Sat, 15 Feb 2025 05:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2] error[E0425]: cannot
 find function `security_binder_set_context_mgr` in crate `bindings`
Message-ID: <202502150501.EzyH9y3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3d453f122cb3f0ad443ccbfc7731195c21aec746
commit: d5fd4e90e7bd5918b81b7b1ddf57fff18d551e6a [0/2] ANDROID: rust: add security::binder_* methods
config: x86_64-buildonly-randconfig-004-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150501.EzyH9y3k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150501.EzyH9y3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150501.EzyH9y3k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `security_binder_set_context_mgr` in crate `bindings`
   --> rust/kernel/security.rs:20:34
   |
   20 |     to_result(unsafe { bindings::security_binder_set_context_mgr(mgr.as_ptr()) })
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `security_binder_transaction` in crate `bindings`
   --> rust/kernel/security.rs:27:34
   |
   27 |     to_result(unsafe { bindings::security_binder_transaction(from.as_ptr(), to.as_ptr()) })
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `security_binder_transfer_binder` in crate `bindings`
   --> rust/kernel/security.rs:34:34
   |
   34 |     to_result(unsafe { bindings::security_binder_transfer_binder(from.as_ptr(), to.as_ptr()) })
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `security_binder_transfer_file` in crate `bindings`
   --> rust/kernel/security.rs:43:19
   |
   43 |         bindings::security_binder_transfer_file(from.as_ptr(), to.as_ptr(), file.as_ptr())
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
