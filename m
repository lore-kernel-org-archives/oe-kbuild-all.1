Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087C32862A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603282; cv=none; b=flMV73iou9giQGMpseJr24C30aFqpqMbTXQsU2xFGhWN5w7PCPXDcU/yp1NAw1hVaBnbQ3rFV0jpxINXg6BRLIIsATZbLFAvkFVDD+aE4ytUZU7t7/exXIMPN5pIl7sv/QbrEE9IQ/Q1/yHXJbfY7GeBWQs4j8yLopH3nZBkCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603282; c=relaxed/simple;
	bh=IBgeiqjD+YfzbtPylWUYJC8vxnTWqTOYbiWcJoPUcCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qCGoHnbXUlucqiX6o//b3ZRGwh3rJK3VL3HaU7wfyXodQN4m1YWkFaONM5flCf+Jm3rfqIbrgOpWtO0XRskUHhQfOgHB2+nZDS6msmkjde6MBGXzlrEjXUAcfCl5wYs4S4t0MaAHceIQroPMKmghUhAiy89sKa7b7vE6cs4gA5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP2mMmrV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP2mMmrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767603279; x=1799139279;
  h=date:from:to:cc:subject:message-id;
  bh=IBgeiqjD+YfzbtPylWUYJC8vxnTWqTOYbiWcJoPUcCo=;
  b=UP2mMmrVSU3q+j/L3cItXlOGaltT2/yoS7WTQKXoFwGGzpqfSSOkNt2w
   6ATRuF05KEewNBlSMqKIW3OU3QeDiZ+iY5eo6nyPirR9bWbbpqOZyPwT4
   mtTraW8cLeKeWLH5xWczbnopykxVs25gJ+YnJNcGZNNZcZ26ZK8Rmnt7W
   6hByYxqGGaSknQpuGqks64YFLVUiCUmg76s5ICK3RVmBYp+jkzq5WQdD/
   zc3dQ9NIV+WJluje215dC7K8ZP8XUPCTYwem3E7hi+LKlGiTy9bhosx0f
   5ZmQfQX+SZwhxqK8/ij9krHHp4KowhSZTQkXtIFBwxz8eZkUP7OvtZpea
   Q==;
X-CSE-ConnectionGUID: xNC2G7GURROEVP/ZcYrCIQ==
X-CSE-MsgGUID: laFKOPU8RgG65NiP70zHDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68874098"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68874098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 00:54:37 -0800
X-CSE-ConnectionGUID: 4Tn1/wAMT9iqy9f5R5A+rg==
X-CSE-MsgGUID: yYyb13mPRHysbnm6cZbJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202813288"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jan 2026 00:54:36 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcgME-0000000016j-1eY5;
	Mon, 05 Jan 2026 08:54:34 +0000
Date: Mon, 05 Jan 2026 09:54:08 +0100
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-field 1/6] warning: unresolved link to
 `raw_get_field`
Message-ID: <202601050938.xcsZEzTf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-field
head:   7ad2b8fc23ca4a64fe32125201ddc49e56ebd5ec
commit: bd1bf04ee82cb46bf0caa9a22afcffc9d6643067 [1/6] rust: types: Introduce HasField and has_field
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260105/202601050938.xcsZEzTf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050938.xcsZEzTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601050938.xcsZEzTf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `raw_get_field`
   --> rust/kernel/types.rs:453:19
   |
   453 | /// The methods [`raw_get_field`] and [`field_container_of`] must return valid pointers and must be
   |                   ^^^^^^^^^^^^^ no item named `raw_get_field` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `field_container_of`
   --> rust/kernel/types.rs:453:41
   |
   453 | /// The methods [`raw_get_field`] and [`field_container_of`] must return valid pointers and must be
   |                                         ^^^^^^^^^^^^^^^^^^ no item named `field_container_of` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
