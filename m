Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E63336895
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 03:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728869; cv=none; b=UGFpIPvYPcwkzdZIcN59WHtStS9ysOqRf16lwkG0ewvpTPK2v5AKsFRfzCmHveUz8reI1hOv/L7fapukLboRUqrtPt+Th1tdCbCmQsrdmixDbLQIbxHe5/njP9um+NxrV8hLlPesmHieF4NcK2vLTTUVpJGeDmGE5tlHnwG/3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728869; c=relaxed/simple;
	bh=GqXn5iJeae1MCsJ5XclOP5BBppJe1s5moAeoQYe6Cos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+D93cJ1CaEL5rKS03UynhC9og7G3If6ffMrhKKHIZ45EQOzstajqOw+aSI/ECBOmPMSnn4JAomEhBw6yGDAtwXJM5tnlL+UF1iAxht6D4aBEHR9hNc2DlJ4xoeUvzmc9vyPR/7nyk7qGKXHIcmKCMo4m97ssqxuGep7F1nOhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZNjAxeB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZNjAxeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778728862; x=1810264862;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GqXn5iJeae1MCsJ5XclOP5BBppJe1s5moAeoQYe6Cos=;
  b=HZNjAxeBa3Ud0sQ/jZCipKEUl1OD4laBOdd3TUrVGGEZ+6fs9lQTfI/s
   2K+S7XX0S+8RYwjjB5rZPxzZs0/tN4Jt9/qPQ+ca+lRVrYRVKWUUvt2TL
   4caOMZnpVPze9LBupqhBTwv1AVzMaLto+PId0T3l0uJd92PmuwZ8Ny5u0
   jetFjqKyf6xh+f8aych4osktsjVJELJeErXA5Sg53HgYhQdTkR7Z4TuI9
   edGPeFLWsahtd4G9tUXKkqAFRD6tqthH9zTgdTXeKxELuqPKHLVUn/XE0
   C3cRChC6molZ9+GxonDtGSV23wdsx/btmVg0U5ZDudapzn3qDcnzt/NXS
   Q==;
X-CSE-ConnectionGUID: iY5ZKSyDQfGR3/vJ5xs+lQ==
X-CSE-MsgGUID: RlOsWoiyRG6h0+6dHhimrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105124464"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105124464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:20:55 -0700
X-CSE-ConnectionGUID: QMw8c259RLCu2gvxy9OW/A==
X-CSE-MsgGUID: VIzUg/hoTSijziQ097CxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243245987"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 May 2026 20:20:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMd0-000000008jx-47V5;
	Thu, 14 May 2026 03:20:50 +0000
Date: Thu, 14 May 2026 05:19:54 +0200
From: kernel test robot <lkp@intel.com>
To: Donjuanplatinum <donplat@barrensea.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] rust: hwmon: add basic hwmon abstractions
Message-ID: <202605140550.6k70Rrdm-lkp@intel.com>
References: <20260512155747.10136-1-donplat@barrensea.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512155747.10136-1-donplat@barrensea.org>

Hi Donjuanplatinum,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on groeck-staging/hwmon groeck-staging/hwmon-next groeck-staging/watchdog groeck-staging/watchdog-next linus/master v7.1-rc3 next-20260508]
[cannot apply to ah-configfs/configfs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donjuanplatinum/rust-hwmon-add-basic-hwmon-abstractions/20260514-050322
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260512155747.10136-1-donplat%40barrensea.org
patch subject: [RFC PATCH] rust: hwmon: add basic hwmon abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260514/202605140550.6k70Rrdm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140550.6k70Rrdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140550.6k70Rrdm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: statement has unnecessary safety comment
   --> rust/kernel/hwmon.rs:196:9
   |
   196 |         let inner_ptr: *mut HwmonInner<T> = &raw mut *boxed;
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   help: consider removing the safety comment
   --> rust/kernel/hwmon.rs:194:9
   |
   194 |         // SAFETY: `boxed` is exclusively owned. We write only to C-struct fields meant
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_comment
   = note: requested on the command line with `-W clippy::unnecessary-safety-comment`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
