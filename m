Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454D3164B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819257; cv=none; b=Q0QynkFNjLe+GUs1iTUVON1uAa8roZppzwEgbCLK3Va3cCk0bU/QwDhq7c0km0cVK4PCOtxizqRq210Oa/wc5xURf6Y/m6kSLCj98uMMihf8w0B/zo2/WugtillvFnXhLfKIOJzZvbr3gmL8cj9m4UVbLOewMT43tgOoZ4lZPuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819257; c=relaxed/simple;
	bh=GuvmT8mt6VaDh/h/HFk9xor7G9QrEfJarV/L3aR+Is8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FYnG0dripVm1rInzwrm3Odc2U+FgcEDQZ+cJf9cRyzWtc9MyT2N7SjAsPiAvvLd9kPgixTENzcia70fyFNQTkV434Qhzp6X1HSgTIo2/+DBu7zHsjUfBMZoSHfz1fnaWasw5+T7tIBVy186XZCN4DP87LhjotKorH46/gbDLjlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNgxxxd/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNgxxxd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761819256; x=1793355256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GuvmT8mt6VaDh/h/HFk9xor7G9QrEfJarV/L3aR+Is8=;
  b=BNgxxxd/T5oCasdKr2gUeTEK+SI1TflXQrOb109+ebwTQLILSGHC5Pri
   CPY5LYFD+0lU4b5GRIT94Y1e4QgjoWshnzjfPfiuPenO9PIrtqlzr1bZw
   0847LFt6QghhCbK533oo1h6xmP+mhAXqzjNcGcIQTaYtvqYlAtF5PbAuX
   yKGi2l1tyFwp35ORCEbgfCGdOFrtVmxaJf/36KMcuFbPgxaFztY8wYLaN
   7DG3kfdZZpjp+IbsURZSXfkPxH0cKGuQrgLdrXP+XjRQrOtXcJdYnOY3L
   OCf/QTL5uSGk1jDt4skLvad0ZZIv1HmssUwQxkPVR4aa/G/VYgI0U2Nde
   A==;
X-CSE-ConnectionGUID: tCLzuI0kSKyIQ7K6ZTcdFw==
X-CSE-MsgGUID: 9yUMwtpUQRChdS4DSZiyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63841697"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63841697"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 03:14:15 -0700
X-CSE-ConnectionGUID: +yCStCFdRpCf41RzB8px2A==
X-CSE-MsgGUID: 12qpTA2MR/uNwO7FFz9a7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185851486"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2025 03:14:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEPfY-000LoS-0X;
	Thu, 30 Oct 2025 10:14:12 +0000
Date: Thu, 30 Oct 2025 18:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 22/22]
 arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier
 'STRUCT_HYP_BUFFER_PAGE_SIZE'
Message-ID: <202510301821.4aTz18tC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   9eddaf6198dd154a6563d1ed1701c46372ad997d
commit: 575dd1da644e642dd122a5af1e81c4171af0f842 [22/22] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-004-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301821.4aTz18tC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301821.4aTz18tC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301821.4aTz18tC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:38:17: error: use of undeclared identifier 'STRUCT_HYP_BUFFER_PAGE_SIZE'
      38 |         backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c:488:5: warning: no previous prototype for function 'hyp_trace_release' [-Wmissing-prototypes]
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         |     ^
   arch/arm64/kvm/hyp_trace.c:488:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     488 | int hyp_trace_release(struct inode *inode, struct file *file)
         | ^
         | static 
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/STRUCT_HYP_BUFFER_PAGE_SIZE +38 arch/arm64/kvm/hyp_trace.c

    29	
    30	static int bpage_backing_setup(struct hyp_trace_pack *pack)
    31	{
    32		size_t backing_size;
    33		void *start;
    34	
    35		if (hyp_buffer_pages_backing.start)
    36			return -EBUSY;
    37	
  > 38		backing_size = STRUCT_HYP_BUFFER_PAGE_SIZE *
    39			       pack->trace_buffer_pack.total_pages;
    40		backing_size = PAGE_ALIGN(backing_size);
    41	
    42		start = alloc_pages_exact(backing_size, GFP_KERNEL_ACCOUNT);
    43		if (!start)
    44			return -ENOMEM;
    45	
    46		hyp_buffer_pages_backing.start = (unsigned long)start;
    47		hyp_buffer_pages_backing.size = backing_size;
    48		pack->backing.start = (unsigned long)start;
    49		pack->backing.size = backing_size;
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
