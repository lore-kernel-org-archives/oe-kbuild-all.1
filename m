Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D740BCB7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005167; cv=none; b=llPO+qRuX0Xiv4usO2gpDXJABE2D2u6/3+EIj9KGlZ2GLKaKD+tuvFdAAmwndFa/1d2s5Ph+4erJPboRuqMwJfK35kV1f879IhQKvt0E31uQNT4OZlx0Qa9bC8myJ/PjPBkDdrL4rceSBz5jUJNn5fP8SiUrIxuzBQC0Ut5CpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005167; c=relaxed/simple;
	bh=3vFj33SJBvC3wpdlSEfvhimVbu5aZ0H3T87pILS6vbM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aE786n6RjbK6b8QTw+MqK2FmFiMpLyTnTobBf+tBZ/rhv+HxmegIjPgFlFIpbcA8PTLw8Wr2PtjcbZV/R17FDTIFiMlU8WmjsD+LDIoII/c5hLABt8D8PMeKyjld6VBQYvd7m/i+zpJ4ba1d/EcwWh/vyj7/q324f/YJXgRfZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbQVlOkw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbQVlOkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786005164; x=1817541164;
  h=date:from:to:cc:subject:message-id;
  bh=3vFj33SJBvC3wpdlSEfvhimVbu5aZ0H3T87pILS6vbM=;
  b=CbQVlOkwCSvNJxbZFTt+Qo1dV/8RS/RoMdsoaZwzHKxNcrNnRuzi3bJ8
   gE5iqCQxkDIvgKJ/hqTNVWC9s3VW2uHhmxE6B0ZwzzZB+8hnUUT33iOnW
   B4fBU8rdZp8RqHpHVrz/qiA3woNIJUV5ns/91x0WolexwvXHHP/jfYV0v
   YydBJ7KKOq3qBqRLBCK1al8optvNYvDYa/GcwAzX9IlIfSaEP1buNGe1E
   QRT/azs6vFdAk3TsjiRp4/bq/0T6ouI6OWqeKWiHh00+HQbPgQYIz+mZp
   izeJ89PhJY8296fWWpkDkpvXYmP4mkhxIHGwVsIbgQR45yRjpD/hL29ed
   Q==;
X-CSE-ConnectionGUID: Qbz2iHXiQhqpxLrFfnYsJA==
X-CSE-MsgGUID: OauXy4T3SrqTlte7pGfM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="103994106"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="103994106"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 01:32:44 -0700
X-CSE-ConnectionGUID: Hcdt1fpqRa+xAX1MP81cEw==
X-CSE-MsgGUID: U5pv66nyTiKpkgu6eFB44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260275516"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2026 01:32:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrtWq-000000004b4-1wfZ;
	Thu, 06 Aug 2026 08:32:40 +0000
Date: Thu, 06 Aug 2026 10:32:07 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 25/57] warning: empty line after
 doc comment
Message-ID: <202608061002.407QPTg6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   136397c31608440bafd64cf7ce72b6049b3ee4a6
commit: ff9a7b3dd630b558a7ddc32f5d1082c4150c51da [25/57] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260806/202608061002.407QPTg6-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061002.407QPTg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061002.407QPTg6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:450:1
   |
   450 | / /// into a &mut T.
   451 | |
   | |_^
   ...
   456 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   451 | ///
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
