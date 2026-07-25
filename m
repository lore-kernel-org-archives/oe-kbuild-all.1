Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC282FE056
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996578; cv=none; b=jh6kbj+sL315RTkAHZfRjEd7PIBDItud+a5KgrlySr9WMpv23myprrWJbx1fDDLGk0U9fS6JwZK4mRkswGXWx5Ccsx3JOZDCXun5OpCmwP5PaafGR/cHlTFiqAUTkl2sidi9vVEs+OfSxEL1XP47luI4oAY0kQQpFEKdqqDAHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996578; c=relaxed/simple;
	bh=swmQZVIP48QHLx8mRvVmiul5PJ50m95GZQHuRdA4v4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gSV/2R6jIgmkyxyuqm2l3VjvuJXqtvjx+9eNBo3rcH7XcVevycH5DwZQT3dVwr3Ykd3wXYmXGD+Oayq8b1MyVfSHdjEL1xqIsFXG83x44pvc2vdDh3spQ6vZeb3QEHzXuTT0WBPkHsh1kpnZM0fhVsheFVIz17zY5Zpf9t+E0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyLg6V21; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyLg6V21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784996576; x=1816532576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swmQZVIP48QHLx8mRvVmiul5PJ50m95GZQHuRdA4v4s=;
  b=FyLg6V21ivHMZ8nqZbzQOrX3q2RieP0aUNlRxq/0rcGIODY5CL8hkOpN
   M2ldH9kUSMm9EgI1Pu26ViEranmdwPwz/jHkM3Nd7XQv7xiKBKI1V2a8p
   g6llwpP77WYV2yBp62F/q5vTeylV0viTbA6Cm51K8daQXVSjkowfX5fC+
   Gv/Y0XtrEfnKYe6/PBRfrEA1FOJXF699z3Mnsx2W58CP7sSY0j1Ccrf2o
   PABuqmVZhnHW9nDhHMC0vaCXFZ5I+WXbdYnDeWgmUbE2ZFaWwYyCrZsWH
   q8ilzRgFVU4om9AF8XVGeL1FWBfMoAfYGpVwfbdVxFBnkB/hS5s8pov58
   w==;
X-CSE-ConnectionGUID: o2pDSzJRTGeNtvfPjaHcjw==
X-CSE-MsgGUID: 6RsRfwxwQxCgHd5XuTkwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85501418"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="85501418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 09:22:55 -0700
X-CSE-ConnectionGUID: b7g0UnYpSumzdOe/pwKkOQ==
X-CSE-MsgGUID: BdlsjkbhTF++gOKkYenA6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="259051829"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Jul 2026 09:22:54 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnf9H-000000001Da-1L2X;
	Sat, 25 Jul 2026 16:22:51 +0000
Date: Sat, 25 Jul 2026 18:22:13 +0200
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
 "Onur =?utf-8?Q?=C3=96zkan"?= <work@onurozkan.dev>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [boqun:rust-sync 19/24] warning: unresolved link to
 `rcu::Guard`
Message-ID: <202607251809.JZpaswzZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   6f6629ab2185d27cbc65d7d85908159b1293c082
commit: f27758ba5f0adefa226d8fc91c73e2300cf97ca9 [19/24] rust: sync: Add abstraction for synchronize_rcu()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260725/202607251809.JZpaswzZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607251809.JZpaswzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607251809.JZpaswzZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `rcu::Guard`
   --> rust/kernel/sync/rcu.rs:57:9
   |
   57 | /// a [`rcu::Guard`]) at the moment of the function call to finish.
   |         ^^^^^^^^^^ no item named `rcu` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
