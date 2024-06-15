Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195723C482
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718464107; cv=none; b=hm+GxJK9+/vwvk8mQZoJaBlN5JsymtkGkghKKLfyJUtvhEDtHu0LJ2xhuYMtPO+1DqAiJfr9gcZx0K2R0ZlM5awcHQLgw8G7jni/rWA5vlzdUiqEI8SxVFQKkx7bfaaRRZEv9rzyGwmCwgTuNWkZ1SI2/jVpVOQKXs8l1/JzOLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718464107; c=relaxed/simple;
	bh=2W8Hy01GlhEPgqAUlXlE9zSODNm3C+Q3lKnLMiJApEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kgd8GQwJYIYsnbACXV8Lj0eFXesR5dnPddrErFhSMfvjhPP6rNoNw1Lq6TdAqcqmB9w8QXouT/NzMy+sX744Tkx0M2bahHs/vzaDZiKFIIy9DCar9YJmlPEkM8CGZrdD7AA3Bg6ndBpDsloXMB5ULP1cCdVBDeVxQ+U3p9YTtHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+6Pi4r2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+6Pi4r2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718464105; x=1750000105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2W8Hy01GlhEPgqAUlXlE9zSODNm3C+Q3lKnLMiJApEs=;
  b=N+6Pi4r2OTGHvK2Dc0nDeV56xydEwX1ee6/JU2HWRClenVYQ0tJKxM8e
   XUDrvIfQoEfNNafvXlpkEgik26yUzuJATCsmZm4otuNUsXpXCPlG9hJIt
   x54CMdws/vpgqu4BMnLeljps2WRJ2sUMQ3qDAG7hesC59KofGXPeY5g0w
   XU90McB9d/vMi1qJnC62devhe2ufjluT4GM8CkkLrWaO1yt7m0gFfMll7
   yUTVSkrWNeor7GLny/3CK4t4oLi97/M2QT/5GEkmSMF5fe9iJ5DcQUD7+
   zMK3k9zT+MLQDmTycTj3QSv+7Z08i5fbLX6Jy2FzYizNLUTtJGvbhtXIM
   A==;
X-CSE-ConnectionGUID: /PNH5H+UQmi+S8UJybuH9w==
X-CSE-MsgGUID: bjrWK8hGTXW6APpwuWlqYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="26027721"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="26027721"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 08:08:24 -0700
X-CSE-ConnectionGUID: vvnwtII4TyahQEW4X1kYtw==
X-CSE-MsgGUID: gyCRs7PtRQyYwyLvXh0lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45893149"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jun 2024 08:08:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIV0u-00009K-2H;
	Sat, 15 Jun 2024 15:08:20 +0000
Date: Sat, 15 Jun 2024 23:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Philipp Stanner <pstanner@redhat.com>
Subject: [rust:staging/dev 13/21] warning: unresolved link to `pci::Driver`
Message-ID: <202406152346.wSogiuwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/dev
head:   2e2592fb7d2165e68073020066789bd8860678d0
commit: ca6e0c933499b271314aa0568d930a6f048d1d41 [13/21] rust: pci: add basic PCI device / driver abstractions
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406152346.wSogiuwU-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152346.wSogiuwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152346.wSogiuwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `pci::Driver`
   --> rust/kernel/pci.rs:191:11
   |
   191 | /// See [`pci::Driver`]
   |           ^^^^^^^^^^^ no item named `pci` in scope

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
