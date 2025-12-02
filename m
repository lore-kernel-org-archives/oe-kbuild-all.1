Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA562FCC1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 05:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764654783; cv=none; b=eIGxUXPx1rjLdsFn2v4nHQy0dQ82lGhFx/cIJHjD+BnMzfKtPzSjl+j7q8rKLz5XkZheoYpAaWNVHH4nfBXVngIO6ei3DWPdC9JI7xGQnATXhj2XCNmDxl/9A+AWEvtbjwR+3tGTRaeoDFZjdq5AF2IgnpoSdo5RCM9SHNziuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764654783; c=relaxed/simple;
	bh=t31hWyjXdpERKl7lNcE51oMc3SSVa7rhwETpllOphxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rgXKrYyd275xPZXjXKBIaSHNM+L6KZjyclTgDoAgwqCBLU1Va2M+HCWNcFfJYm0vorCe1AFng7D3e9j8/dKF3o57mkMDwHF1GSy8oP1GJva6lcbPUjJT3I49u9MEfdzAa6iASDNTDwWV3HncvStyEudiMhFmEQJrVrIEzSzIsa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyWdoqpe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyWdoqpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764654782; x=1796190782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t31hWyjXdpERKl7lNcE51oMc3SSVa7rhwETpllOphxE=;
  b=SyWdoqpeSLHqtp1Sy3RRmX7HlNuZfrv1sN5kiXk8diPEN32NW7ZcsX5D
   9F2IoLwa4I0eE+yC9UnlGjVZsUBIhyynPrnjKsz/N0eD3U/4Hz6J+/o8x
   rhmk+EmJFCzApPZ6sOgqIm0TwVuhZbHZFNKnQ4qQI6tm7hnKfzsNHkaxB
   +PbR5/mKoDClkXvw+eUQ4vwbmbSCwFS0WISs0zusY9cuFcGZ+nK55+NVC
   r7AYajXAT77wBIFNUnpMIuGL2It+zcPQfGm8CC77i2bwS1+Fe/wJVb26Q
   YZZtcxTBgE08NTwSdwP3G7/Yil2S2rmQX9JsftEU6LjCiEXv+7gcKgDET
   w==;
X-CSE-ConnectionGUID: /ZlDY63lQnuaOeimV8PVJA==
X-CSE-MsgGUID: gFby3Wz/R7u7J/hDSWka1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84005501"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="84005501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 21:53:01 -0800
X-CSE-ConnectionGUID: 8cnG9qeeS2eF8gvnPucMwg==
X-CSE-MsgGUID: rdrD4j9MQ9q9FvAeG+Eyfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="199221415"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 21:52:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQJJp-000000009Rt-0PW0;
	Tue, 02 Dec 2025 05:52:57 +0000
Date: Tue, 2 Dec 2025 13:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lyude Paul <lyude@redhat.com>
Subject: error[E0560]: struct `drm_driver` has no field named `load`
Message-ID: <202512021332.9K0lgZb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b5dd29869b1e63f7e5c37d7552e2dcf22de3c26
commit: 1e4b8896c0f3cb305a32870e1d8624f1155072d5 rust: drm: add device abstraction
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251202/202512021332.9K0lgZb0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021332.9K0lgZb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021332.9K0lgZb0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `drm_driver` has no field named `load`
   --> rust/kernel/drm/device.rs:65:9
   |
   65 |         load: None,
   |         ^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `open`
   --> rust/kernel/drm/device.rs:66:9
   |
   66 |         open: None, // TODO: File abstraction
   |         ^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `postclose`
   --> rust/kernel/drm/device.rs:67:9
   |
   67 |         postclose: None, // TODO: File abstraction
   |         ^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `unload`
   --> rust/kernel/drm/device.rs:68:9
   |
   68 |         unload: None,
   |         ^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `release`
   --> rust/kernel/drm/device.rs:69:9
   |
   69 |         release: None,
   |         ^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `master_set`
   --> rust/kernel/drm/device.rs:70:9
   |
   70 |         master_set: None,
   |         ^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `master_drop`
   --> rust/kernel/drm/device.rs:71:9
   |
   71 |         master_drop: None,
   |         ^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `debugfs_init`
   --> rust/kernel/drm/device.rs:72:9
   |
   72 |         debugfs_init: None,
   |         ^^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `gem_create_object`
   --> rust/kernel/drm/device.rs:73:9
   |
   73 |         gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
   |         ^^^^^^^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `prime_handle_to_fd`
   --> rust/kernel/drm/device.rs:74:9
   |
   74 |         prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
   |         ^^^^^^^^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `drm_driver` has no field named `prime_fd_to_handle`
   --> rust/kernel/drm/device.rs:75:9
   |
   75 |         prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
   |         ^^^^^^^^^^^^^^^^^^ `drm_driver` does not have this field
   |
   = note: all struct fields are already assigned
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
