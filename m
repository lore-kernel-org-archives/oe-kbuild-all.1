Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD384EBAFF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836148; cv=none; b=t7ujG6GhbT8/kmGIG+FcOblaOXpXz+iTg4c9GSs8r5skZI+a/jVr3f5Q6kMEjucHnQTMAo3qN6qqst2+WZNKUrvaSfuPj7RaMkO+AhAvuNEUCLWmhjyeb6YPx1cAAOB3prqh2SUvlWMjVv3cAFwnvrLZ//dKfu526h6N9lHo9xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836148; c=relaxed/simple;
	bh=maf8Vn6rxgQwO1NFDOTmLHkhQCh/AILRl8Rm36EQE1U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epg+CoEjYGzzt9YArLSehrW2p66h/TYOY9azK6ezxUc1/+pcJbdD1z3lLEePUDeL2b3FUtrNeu9uTUNoIERwB7b4UKYNIqINX8lcHYYSUot61O/JcXeWnOC10VDPvrUlNqOhrRWbDkwWJ0zlqSfsrvuLbLG1Up99v90L/6K46go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftjDvve8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftjDvve8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791836145; x=1823372145;
  h=date:from:to:cc:subject:message-id;
  bh=maf8Vn6rxgQwO1NFDOTmLHkhQCh/AILRl8Rm36EQE1U=;
  b=ftjDvve8MuF3u4DVduHapYE7dPYiWosqTHX4EVqU5F5AD2kIRp92lGIY
   Q+5aq+HapkJRAQ6/FGdBoHLMtMy6qktdSDvEt2HD5YDMmQZFdiEFopeeR
   LJsdDCcQuJYZOd/6kduDQa5hD0oiubqRDYFMADnrI/vRbLIY/uDQXanZl
   bVs7YEDUFSbo+fG41roSU0W3VXSSmG+wzGvuv/BRVp23bjtbOj3rWncNr
   BgYz/J+wuRLz8NDaz5iHKg6oVFhqTLh+vnFlU7t0KygHPJRP4wl9ClbIj
   u2v58q07ob9qN4SfFRIoWUyX1xA1B0LV6DLbg/1SZXXxB0vxaJeh07lOL
   A==;
X-CSE-ConnectionGUID: oCK4w4khQaqhdUQ98BPywA==
X-CSE-MsgGUID: EX4m1gSDSbakbSyqOfuM6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="569620"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="569620"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:15:44 -0700
X-CSE-ConnectionGUID: 3ihT2vkNQs65kOCV6YA72A==
X-CSE-MsgGUID: xFkPhfkxRuiIH5yAPBSUDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="885113"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 13:15:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGMQt-00000000ABN-2PmH;
	Mon, 12 Oct 2026 20:15:39 +0000
Date: Mon, 12 Oct 2026 22:15:03 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 50/88] warning: field assignment
 outside of initializer for an instance created with Default::default()
Message-ID: <202610122208.FxEkR1A7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fd6a83d0d7b4aba0032f93ea9c03613a0ba09a19
commit: c7b5ecf217781c3f1b1f66cb5613240aa421b563 [50/88] rust: net: Own UDP tunnels through namespace registrations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261012/202610122208.FxEkR1A7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122208.FxEkR1A7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122208.FxEkR1A7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field assignment outside of initializer for an instance created with Default::default()
   --> rust/kernel/net/udp_tunnel.rs:250:9
   |
   250 |         callbacks.encap_type = 1;
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   note: consider initializing the variable with `bindings::udp_tunnel_sock_cfg { encap_type: 1, encap_rcv: Some(Self::receive), ..Default::default() }` and removing relevant reassignments
   --> rust/kernel/net/udp_tunnel.rs:249:9
   |
   249 |         let mut callbacks = bindings::udp_tunnel_sock_cfg::default();
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#field_reassign_with_default
   = note: `-W clippy::field-reassign-with-default` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::field_reassign_with_default)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
