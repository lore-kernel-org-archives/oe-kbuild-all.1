Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3936257448
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 01:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763602969; cv=none; b=hFnN/N7XXRB8UiNJM6RUqLH8seg/iZai11GZdySDQgzQTCBt7AR3vCKJzNpayXaJQVA9szIfuYc+2U2X4Fdf6tfE/jK7H3GCz4+eVlBAG8lprA4INdvaYC1AaoktIqwko40z/Ix+w8UeKjjFFqFv+AHImciW6Iu+WXE5wX1uOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763602969; c=relaxed/simple;
	bh=JgAoET0J8I9G43kpR23cPUCDbH/u86NZFWgD1ZigB0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZNJE5WXF/LQbI6zMgVFMwFE2MuRhQdvUfuHHfjDmghK26ooSrXrYgIQo51+nLc62JVw5UAf6jkG9WjM/4LOqdle1uTRuxZO767yqWQSOZqNXq6oNe7FKC3/2LDM6uJFl8HIYf0DeXRBAQK58bZj/KjHihk1bySM3fpaMOq1lmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aC4USE3g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aC4USE3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763602968; x=1795138968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgAoET0J8I9G43kpR23cPUCDbH/u86NZFWgD1ZigB0A=;
  b=aC4USE3gdixz2GmGChZ17I03LiHN44w2YzXrkIUpSkULEm7EHiBDair1
   Wltw6BXpBXBdL6fuzo7Zsi3SRRvdpTKOZ7+jNNwJlxNT7EPm5fG1TDpFf
   93fgm/K/DRr9Y0nHjJACgMUj7sNCHqIVO51NMGQ9CQiiJRdV1ZW/Lf29k
   FBeBrt89vZfDx5JF/oP864QiA4ak/gdFeCoNf8vIxOna0xkaRl7Oku5Sj
   YcmtMzGcXBDX8TtNp75s7GIsgMuT3O512ZyIXeAZH8VttU6jFwDEeZquO
   x23wnRhI83zh+MIjruN6lNwq45sI/ySQvELzIxUxre2AWiwz+J3rhMQAS
   w==;
X-CSE-ConnectionGUID: hPLyL4mmQS+97jCiIZ00Jw==
X-CSE-MsgGUID: JHfRodX/QpC7eH02pKWTFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76766292"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76766292"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:42:47 -0800
X-CSE-ConnectionGUID: hhInN85vQKeYI3mSJ/Tj5Q==
X-CSE-MsgGUID: Xr9/cJmWRDmEhp7N4QKg8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191655112"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2025 17:42:45 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLth5-000000001Kp-1jal;
	Thu, 20 Nov 2025 01:42:43 +0000
Date: Thu, 20 Nov 2025 02:42:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 7/7] warning: casts from `i32` to
 `i64` can be expressed infallibly using `From`
Message-ID: <202511200202.0I8Etl7M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   f57090bf463cc63e97e985228970a9947e1ea07d
commit: 3a7f0dc5a3927031d3c75fa605e38152d77e5d0e [7/7] ANDROID: rust: miscdevice: add llseek
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251120/202511200202.0I8Etl7M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200202.0I8Etl7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200202.0I8Etl7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casts from `i32` to `i64` can be expressed infallibly using `From`
   --> rust/kernel/miscdevice.rs:360:25
   |
   360 |             Err(err) => err.to_errno() as loff_t,
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless
   = note: requested on the command line with `-W clippy::cast-lossless`
   help: use `loff_t::from` instead
   |
   360 -             Err(err) => err.to_errno() as loff_t,
   360 +             Err(err) => loff_t::from(err.to_errno()),
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
