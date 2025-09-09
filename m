Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A47554654
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 04:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391013; cv=none; b=oOt+GPBqWqAwgu08ebRrorv3EG7/CxR0sS5SRHdNJrXOiU+P5FDJMOEYcZPKzKGdrdkMwOjlth34em3vGxiIXtq0r/ZRTvNAmgf++fXNQI80iGT/iBKIp0d6iOzMPhoWZRzhplwvxLhPbHckeHN8FIWtaZqHJSeC2OqbYNkWVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391013; c=relaxed/simple;
	bh=kyjBtJcK2v0vjuP1nY0/INbwFDekbWsC9c/Zc0qpSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuiLMMcsq+nb752kb6PMqwHHhkeBN6N5C302iHob+TJSZyaNZnGmg5ie8b41D/JYJMuTcKZIudT/e8qVR+zCfd1OH1LDZJuf5vKyl2ZylQk9sqivT4SGgQrbo25T1OxbrLpLloJlpOyFEJ/5tPQOLXU5rj6Y08Y838FIqA/kn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBM9kW+L; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBM9kW+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757391012; x=1788927012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyjBtJcK2v0vjuP1nY0/INbwFDekbWsC9c/Zc0qpSdI=;
  b=JBM9kW+LcX4Du0cRgAfuqAsmEEHilugwqJrN0CtSlnmbjj1HA0HSo18k
   /GMHGmwpn/2as54IpnpJVR+lyZPMN68vpMpygrpC5QMvU+1QkhDMGK2MY
   ocTGoapbMHtdeF1TY1I63vhdQq7seniRyNJVHiaTUVR3oLI9F65eccn3+
   lFloKoVWV5P+9oGjYoVwHmLG0loWTxwcnjysyUbdmyQNphabLaM0Bh/ZZ
   8C9NanLFiwDtXvKZwmqKA4Pn/TJSt52GWqDTMsjeDjmkonoGLCz8dWRXi
   2fxwgJyn5F3LFbDNaC2WRiezgAyymZrDD63ZED5oyheFdFZK1VKt4BKGS
   w==;
X-CSE-ConnectionGUID: Yp4eXZfHQKeCtSkKM2XXoA==
X-CSE-MsgGUID: TQ8emnASSNmFgCdVRX4ruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="71084067"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="71084067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 21:10:11 -0700
X-CSE-ConnectionGUID: A/mFBx60RNq1yMk3+y8cMg==
X-CSE-MsgGUID: UJlBI7M4RoSyshdGpwku6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173436905"
Received: from unknown (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 21:10:11 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvpgG-0004j5-1t;
	Tue, 09 Sep 2025 04:10:08 +0000
Date: Tue, 9 Sep 2025 06:09:32 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dev-bitstruct 21/21] warning: unresolved link to
 `register`
Message-ID: <202509090615.e2m8Hgop-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dev-bitstruct
head:   354bc8b929b01ff2c5a095d0599346743c5cfa2d
commit: 354bc8b929b01ff2c5a095d0599346743c5cfa2d [21/21] rust: Move register and bitfield macros out of Nova
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250909/202509090615.e2m8Hgop-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090615.e2m8Hgop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090615.e2m8Hgop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `register`
   --> rust/kernel/bits/bitfield.rs:6:66
   |
   6 | //! structures. Also used from things that need bitfields like [`register!`] macro.
   |                                                                  ^^^^^^^^^ no item named `register` in scope
   |
   = note: `macro_rules` named `register` exists in this crate, but it is not in scope at this link's location
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `bitfield`
   --> rust/kernel/io/register.rs:59:26
   |
   59 | /// Please look at the [`bitfield`] macro for the complete syntax of fields definitions.
   |                          ^^^^^^^^ no item named `bitfield` in scope
   |
   = note: `macro_rules` named `bitfield` exists in this crate, but it is not in scope at this link's location
--
>> warning: unclosed HTML tag `type`
   --> rust/kernel/bits/bitfield.rs:29:60
   |
   29 | //! - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
   |                                                            ^^^^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
