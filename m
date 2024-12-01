Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DFA31
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 01:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733015318; cv=none; b=UrmaeGVuW5W/1du9St3fhI+czXBNoYB8RXOcuXnUglWX1/7l5LVV2zmT4Pcb1wmCJrRc+NZCEX19I6y6UALEIHBCQKZlu9BZl/EhA8lSawBg8IBXfp860bp1myLmZX/e6n11LaJMkgD6G8TXhvljq7K1p4kmT4n6bdAUB/6LKK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733015318; c=relaxed/simple;
	bh=FRbysXdIXg2Dks6rQ8XzahfJC3fU92YogoM6LlIZ2ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EpEPE+GhosZvIKeXHhVn58iH/Shs0DgxkLUPpl1VBbBaFr0Yl5cKgeVbXDWQVDwruR9bMK0PXhlFpiQpxR9EZG0BsxMW5jhHgxgEiuIQA4yNRYKUDd1VML1VF6uIpAq3gF1qQKzxp9YA5XXNjesb/8WguQoupLUQQ3EIIl9IMXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0KX423U; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0KX423U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733015315; x=1764551315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FRbysXdIXg2Dks6rQ8XzahfJC3fU92YogoM6LlIZ2ds=;
  b=e0KX423URpMQ9oWcD92Pg/suyGzi2fZwymS7MhZU94bYhpRN1QlNthDB
   KppdXQJ+v/GYbEzhHNsETZ5FLunCqz+aZBPTNQO4/jc71pSDd9VYWG032
   EF5A1eaPnXG64vS4Aqu93LI3tbWsuH4bTdD5tp+p6mdQDVNgZHzLHuE5f
   3RsAwPV+2rbGWRjMZeF14erIFPt9uRKJagpllOcXwXKgtkVM6sd8I1kuB
   iimWL3UIvEWNa8ed/jYhm2GoWWd0O+ZA7i96+S5nL+Gvv9OjH1IF7MVDg
   +urBzJcfWiN96QschjxnPga21ncBSdUSsdAoykjYSghIQ6bmyS6UzpgE1
   w==;
X-CSE-ConnectionGUID: tEcsrHzzR/u2dRnS2ybhSA==
X-CSE-MsgGUID: +v+90//7RBma7363oerEQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36864701"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36864701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:08:34 -0800
X-CSE-ConnectionGUID: io/txYeUR7qbCfhxAK1a9g==
X-CSE-MsgGUID: eRB61oQ1RjSNdWESdx8NNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97538013"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2024 17:08:33 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYRr-00015n-1B;
	Sun, 01 Dec 2024 01:08:31 +0000
Date: Sun, 1 Dec 2024 09:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1312/1312]
 net/netfilter/.tmp_nft_chain_filter.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202412010909.5LqP6AbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: d209df3e7f7002d9099fdb0f6df0f972b4386a63 [1312/1312] netfilter: nf_tables: fix register ordering
config: x86_64-buildonly-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241201/202412010909.5LqP6AbS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010909.5LqP6AbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010909.5LqP6AbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/.tmp_nft_chain_filter.o: warning: objtool: missing symbol for section .text

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_BACKLIGHT
   Depends on [n]: HAS_IOMEM [=y] && FB [=n]
   Selected by [m]:
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && DRM_NOUVEAU_BACKLIGHT [=y]
   WARNING: unmet direct dependencies detected for FB_BACKLIGHT
   Depends on [n]: HAS_IOMEM [=y] && FB [=n]
   Selected by [m]:
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && MMU [=y] && DRM_NOUVEAU_BACKLIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
