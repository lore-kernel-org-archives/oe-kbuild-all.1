Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95BDDC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693943495; x=1725479495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFBbE9HzqQzshixjouQ4Gq9jsVJLPT5uB03U4EUQI+o=;
  b=DZf9CL5m4hAgEI2XfadJp5JVxdg50i7x1lSLrvu4eYPy/Xf83cYhkMix
   QTn4q6HFRnorCT6/hozaNT1gEcTznLX9DfUYsqS0hg+Ox7DUbi8EsE+o3
   SmnQssZPKyQWvbJ1Tu7W0aYJzHRSq043tpKFS4LhVyfNRr5FG3kr2g5ob
   qt4CqZsPHIlPyAhC0R49Bsn1WbZhYbEwL0LTvZQXV2kCr3g5ZDp8/Er/6
   7aO5Ae9J8FQIbgTQKSrsl8P1MOS03RvKKlG19z7gvpyR/2dfEFMwFUgGM
   NBmatYoXPQLziodHJSfQHmbajQb/USgRIyJtmYEs0ob4D8PDg1r128qSA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379607735"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="379607735"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 12:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="717981535"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="717981535"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 12:51:32 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdc56-000219-0i;
	Tue, 05 Sep 2023 19:51:25 +0000
Date: Wed, 6 Sep 2023 03:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 13629/13985] htmldocs:
 Documentation/loongarch/introduction.rst:362: WARNING: duplicate label
 loongarch-references, other instance in
 Documentation/arch/loongarch/introduction.rst
Message-ID: <202309060352.2ZuAeYVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c50216cfa084d5eb67dc10e646a3283da1595bb6
commit: 2bf3c0292f35e84a2111e6e83f023c2690b25a71 [13629/13985] Merge patch series "RISC-V: Probe for misaligned access speed"
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060352.2ZuAeYVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060352.2ZuAeYVF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/loongarch/introduction.rst:362: WARNING: duplicate label loongarch-references, other instance in Documentation/arch/loongarch/introduction.rst
>> Documentation/translations/zh_CN/loongarch/introduction.rst:325: WARNING: duplicate label loongarch-references-zh_cn, other instance in Documentation/translations/zh_CN/arch/loongarch/introduction.rst
>> Documentation/translations/zh_CN/mips/booting.rst:14: WARNING: duplicate label cn_booting, other instance in Documentation/translations/zh_CN/arch/mips/booting.rst
>> Documentation/translations/zh_CN/mips/ingenic-tcu.rst:15: WARNING: duplicate label cn_ingenic-tcu, other instance in Documentation/translations/zh_CN/arch/mips/ingenic-tcu.rst
>> Documentation/bpf/instruction-set.rst: WARNING: document isn't included in any toctree
>> Documentation/hwmon/smm665.rst: WARNING: document isn't included in any toctree
>> Documentation/loongarch/index.rst: WARNING: document isn't included in any toctree
>> Documentation/mips/index.rst: WARNING: document isn't included in any toctree
>> Documentation/mm/frontswap.rst: WARNING: document isn't included in any toctree
>> Documentation/networking/device_drivers/ethernet/mellanox/mlx5/devlink.rst: WARNING: document isn't included in any toctree
>> Documentation/s390/index.rst: WARNING: document isn't included in any toctree
>> Documentation/translations/zh_CN/mm/frontswap.rst: WARNING: document isn't included in any toctree

vim +362 Documentation/loongarch/introduction.rst

0ea8ce61cb2c48 Huacai Chen 2022-05-31  360  
0ea8ce61cb2c48 Huacai Chen 2022-05-31  361  References
0ea8ce61cb2c48 Huacai Chen 2022-05-31 @362  ==========
0ea8ce61cb2c48 Huacai Chen 2022-05-31  363  

:::::: The code at line 362 was first introduced by commit
:::::: 0ea8ce61cb2c487e818c515f91329fa9972a7155 Documentation: LoongArch: Add basic documentations

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
