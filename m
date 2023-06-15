Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B323125DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686829662; x=1718365662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3RJds68CeRUAh9CjCeooHStP2ZZs8S1f7llk301nLC4=;
  b=BWm+M2IN9ZbtA/mtCDU566gDdiyE1VrFhrozK1HBIuqEzVF5UiY1OFzq
   bgi5tfCAIihdTyB5QDPfkDbOTVFmwH5tynbLSL5ZQ1kDo0JNAoCmIskNo
   fEApHVTOhVstCEhkn9EQ67315MvEHQGtmiAJDb+JMYLF4S84At9SbAJL3
   OyfJHSbHZPgJa57eNnl49NGqP4qxuRFS49XiBDnKHW/6Ofl7LTg3DMGdA
   q0odCBYyhvv4vVWD9hgcEwYnYTEWZbCFKMbtKV1vz/ZUlUyY0vclu81ek
   Gp1DBbmrwYaT50OkZyLn1aPIqgYjm3t+XprDHiJ5iKlbWGRs8SKG9veHX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362272397"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="362272397"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="959164073"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="959164073"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 04:47:33 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9lRs-0001pa-1g;
	Thu, 15 Jun 2023 11:47:32 +0000
Date: Thu, 15 Jun 2023 19:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	David Bradil <dbrazdil@google.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>,
	Willix Yeh <chi-shen.yeh@mediatek.com>
Subject: Re: [PATCH v4 1/9] docs: geniezone: Introduce GenieZone hypervisor
Message-ID: <202306151938.M7471qHi-lkp@intel.com>
References: <20230609085214.31071-2-yi-de.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609085214.31071-2-yi-de.wu@mediatek.com>

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arnd-asm-generic/master lwn/docs-next linus/master v6.4-rc6 next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230609-165552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230609085214.31071-2-yi-de.wu%40mediatek.com
patch subject: [PATCH v4 1/9] docs: geniezone: Introduce GenieZone hypervisor
reproduce:
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch arm64 for-next/core
        git checkout arm64/for-next/core
        b4 shazam https://lore.kernel.org/r/20230609085214.31071-2-yi-de.wu@mediatek.com
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151938.M7471qHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/virt/geniezone/introduction.rst:28: WARNING: Bullet list ends without a blank line; unexpected unindent.
>> Documentation/virt/geniezone/introduction.rst: WARNING: document isn't included in any toctree

vim +28 Documentation/virt/geniezone/introduction.rst

    26	
    27	- vCPU Management
  > 28	VM manager aims to provide vCPUs on the basis of time sharing on physical CPUs.
    29	It requires Linux kernel in host VM for vCPU scheduling and VM power management.
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
