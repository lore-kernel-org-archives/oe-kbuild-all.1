Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91788250E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 21:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706304702; cv=none; b=QDD5+artSvzc3+m+lnthwxZ1dXTag7IYBy48FSF5r8/2TmhbRW5G9uSZVxQphwElcDxGjWtOAU6075k4vMxzhgOOzKJElKSOJ6TADaFhMGddrxkc/pgm9t3f9qUDnHqQ//ZK8Ktz8DcNi2ZP2eHUB6zgf3yn5PHplaDEeJC0Jc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706304702; c=relaxed/simple;
	bh=xnkQIlq0tpvm24XTOXppC70/bj9Pc61XO+Kkob8P8m0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eX+YVvLmVDcwB/JlPrIEvVQDyaTP+xieDiRCbPiP7g1rEAlIOnhOiPpSiNDxh64PzQuFvPvLqasH71uznwEv/9mM5ps7tgJ+wgfMW+88soBU9VpgEzmjoae9yx+rZDNGZuGBj9LgPA8N0PJXvFN0Zk7jgsVdNfde2eoRAwzyCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbT08kOe; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbT08kOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706304699; x=1737840699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnkQIlq0tpvm24XTOXppC70/bj9Pc61XO+Kkob8P8m0=;
  b=XbT08kOeMupIrFNq0+GQ0GX+5Xp51nC7QPyajfy+J4xXUeo7e2QLNRM/
   lDCqofTka4dV65/dRkWMM7TAyIiWYTd3u/8IhZlCQp6ZVmmyhix0HBb86
   WPRSJ4KTk7CVlu60REcft8S62RPCVoK+y8XMaKhM8hLTLu1j3yX70WX1i
   KLTKK2i12VGsHVHGSxzgnUWgspoS22jhEMRBvkZ7KTSPSfmqJeSYusOFM
   Z16jnOiFr6ELInE76FnhUjFjCvsoJr/b3BY02hJB9gOa4eZPTS7hKLcrT
   0fZX9Y+NAgMM8rgcgvIjbMSOuUHX8FQrHB+pie3AuHyZQVloPHieNt4gg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466856077"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466856077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 13:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2785664"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2024 13:31:30 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTTnM-0001ME-0I;
	Fri, 26 Jan 2024 21:31:28 +0000
Date: Sat, 27 Jan 2024 05:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20469/21577] arch/x86/entry/entry_64.o:
 warning: objtool: If this is a retpoline, please patch it in with
 alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.
Message-ID: <202401270508.Gi2jxRRU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   992b5fc139d3aa14b25613b06adee4bb9c110b28
commit: 3acbac72baea337e0ac79801a8ba4b81e3b67014 [20469/21577] x86/speculation: Change FILL_RETURN_BUFFER to work with objtool
config: x86_64-randconfig-001-20240125 (https://download.01.org/0day-ci/archive/20240127/202401270508.Gi2jxRRU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270508.Gi2jxRRU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270508.Gi2jxRRU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .entry.text+0x1d2: unsupported intra-function call
>> arch/x86/entry/entry_64.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
