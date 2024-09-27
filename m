Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05969188A31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423835; cv=none; b=UKCZktjXqkuF/hOJVOpL/bQf3e6OqHxeRnmPCVUwDQ5hG+nsWv1a+SC8MEqPFsQrIdrAn5VYskrLvBNvgDaKaHnH7bkoxEqzpg+TBEhYXRrBhKqX2Ljd7D3GNrrmY2xsjktQsSUuxHOBNF16d2aW6dkn3MeIe+dXV/qny+Farsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423835; c=relaxed/simple;
	bh=e8sxeKQArhsRlhyt3ykRBcDTTB7Xbq3VWz9enmo33gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTgG5c8CTGAQ9BdKd0QEdupn09Eii+tBBTtvDDiASQheB7xWPnnsWe/gUv650AFwpuJMMbiyh2fcmehIQ0e9sH4h00CeOySHLW2UcjEO7SV7KSJYLcfFfYoOJsTb9lkne7hQjQNP57axRa4W8JOw4n8Rq14gjOuacCMQbnJc5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBcPsgzx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBcPsgzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727423834; x=1758959834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8sxeKQArhsRlhyt3ykRBcDTTB7Xbq3VWz9enmo33gQ=;
  b=PBcPsgzx/7z6ywPzMJwsgk67bILw7YLcLmDpcU6Q0dD6fajaYHXVHGER
   8D6LKCOPHZFtoNsoZvJCC7tzdeRdlOkXDl6WVQIBaVkxGfuu6rZvlhzMh
   TgApuhKjt98nB7oj9R0iVE7S4S+nC+fbxF+yGy9y3Nclr5HZvalTSjtnF
   dh7S0xwHAnrX5+Lg5qNP1CzBA+HFIbsvVn2epTDlpgZmXxDARJj9+rbcC
   UH4Jq68//cyVJEWcIxW8sVk87iGIdyvq6a2KgdVmecvZ+teAjaL6ADre+
   1IPuTgB40/I2mohYTDeDYnOVQYYlQrFVy/hhwUKcVpRWcrUfDExw+BSt4
   A==;
X-CSE-ConnectionGUID: tfarse5hT/ubLk94x6PsFQ==
X-CSE-MsgGUID: Y3TKmzzHSRSbeyl2bikD9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="44028203"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="44028203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 00:57:05 -0700
X-CSE-ConnectionGUID: rxewMN/QR9qX4G/ohs2kEw==
X-CSE-MsgGUID: dKyJi0jwTR6jutYPyE87jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103241860"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 00:57:05 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su5qY-000LfX-09;
	Fri, 27 Sep 2024 07:57:02 +0000
Date: Fri, 27 Sep 2024 15:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 25/28] warning: unused import:
 `super::bindings_helper::*`
Message-ID: <202409271538.CT5dKV1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   4aa82618143fa088b509910cd96db7e0c47134f7
commit: 47cf4a69304211b874ca06b009787eaa97beea88 [25/28] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240927/202409271538.CT5dKV1O-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271538.CT5dKV1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271538.CT5dKV1O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `super::bindings_helper::*`
   --> rust/bindings/lib.rs:31:13
   |
   31 |     pub use super::bindings_helper::*;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `super::bindings_raw::*`
   --> rust/bindings/lib.rs:44:9
   |
   44 |     use super::bindings_raw::*;
   |         ^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
