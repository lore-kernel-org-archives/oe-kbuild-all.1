Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27D36FC5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 19:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678132233; x=1709668233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYn47ZjiJ6bWZZd13+g52PLJWbsojn/gfiMwoaZiqtU=;
  b=SzU7IWuSfObM6n207BlRHAc5rKKqxid1iadaeSFVcZqUYXyAPX/goyiQ
   CmVZ1VI7WpUfnJb8Ii7x/lNvoXO5al32vLaLChZ1AKJRvpqYg1EGltVQz
   oRiQ3ngGkTJrytwyFFfYa+ofJZsujsCTUfzOuLvtRoxQAj2uITS3JrHTJ
   mZB2T5PVtlLN2tAlXM44LySML6IHSHXfZESsVD6L9ytDY/NLXjhp8WRta
   xwu4Q8JiVnWmZO2y6n254A3RgBNrc9rCT+NFBGVc8mSFxc8bC5R0Arixe
   5EwLvnN/9NArCvwuFZ8m3N9d9RYo3xF6yLjPjKcuK2pbXKNmvcnR8XZBG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="333127957"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="333127957"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 11:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745183370"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="745183370"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 11:50:31 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZGqt-0000aJ-0S;
	Mon, 06 Mar 2023 19:50:31 +0000
Date: Tue, 7 Mar 2023 03:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Shuo Liu <shuo.a.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Fei Li <fei1.li@intel.com>,
	"Dutta, Ranjan" <ranjan.dutta@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>
Subject: [intel-lts:5.10/yocto 10560/30000] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist: Documentation/virt/acrn/
Message-ID: <202303070354.yJLLheSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shuo,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: e783866354576335284c6be7fe4121a97ecaa30d [10560/30000] virt: acrn: Introduce ACRN HSM basic driver
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/e783866354576335284c6be7fe4121a97ecaa30d
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout e783866354576335284c6be7fe4121a97ecaa30d
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070354.yJLLheSU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/virt/acrn/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
