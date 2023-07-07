Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B723C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688711335; x=1720247335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25fPdRQua/DOZwwULf2bN20wy1jt/7SfUnl/iJGk9JU=;
  b=miR2CF9OzalK0Mj7KuAsfrBQr0oUY6+fWvJbfvWTQUoxXUQyB0M9GKYP
   1hBt4HGiL5/REs2r8VfinwWv9ulAfxn+fga/O+L3nbnVFahxiTkEaDO+j
   RBjGi5rKX6PXhuSGZzHGYsAkDkC3n7jcGCAUzmx51T6IJgaIy/bbGS10y
   hpySSip2bbpauZj4ZQFSOnXhwxT4Q3wnRNccROYOwFzA+PTTHDsxnMyb3
   kMhO9wb9eIiHTZGgX+VZRuN4ulEntNnRlBR14nqRw77SGU+uXfWfsQj3X
   rJ9K9sU6VFDgiga+KKzP7IqyNWf0vlIm4LcbzB9oFgUkjheNZTpIgyfjq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="366401843"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="366401843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 23:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="749428877"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="749428877"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2023 23:28:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHexY-0001qA-2L;
	Fri, 07 Jul 2023 06:28:52 +0000
Date: Fri, 7 Jul 2023 14:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 211/377] Error:
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:121.1-5 Label or path gpu
 not found
Message-ID: <202307071411.vuIFlsww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   91da1079a24840825fccc4b320c4a08b4b66fcdd
commit: 26ca887fc1fe5edbcb1065604bcae9fa7a69488c [211/377] arm64: dts: mediatek: mt8192-asurada: Enable GPU
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071411.vuIFlsww-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071411.vuIFlsww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071411.vuIFlsww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi:121.1-5 Label or path gpu not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
