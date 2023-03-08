Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC479E1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678291469; x=1709827469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6nq8Kr3Jb9wuaAsuaBGOE0/UnXvlgmiC6WsraoXHcQ=;
  b=kZYjUxYPQk2jr1Q03JrwMtT7aV/+Z88N/XG/9E7uxSV0uAS3H3uwVPjA
   XgjYF/WbeYJg7v+4ly4Cf9y9TjgeU1NFnZgMTOdYQGaC2wX5PROdlku48
   BjcuU0AC5Xi1n0Bezkf927IfbIB5IlA46Tbu38bc1rZkuetXgdG7Pr2kF
   rHlrNfukyN7LZPWqWX0ThjLn84z0GqNjhoigoYPlr693q4zJ2nrPK27bf
   GJzPagroveYClNIgw+dBgj1zSMRuxSYlI+gYTSX75DYSHiikBSESQIuSo
   aFwOATUvngbvE3NMdhMOCNqNpWo6mO+g1L6wBzBFpeEpnQjxW5sHLC4vn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398773081"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="398773081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745956168"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="745956168"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 08:03:50 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZwGb-0002FD-0e;
	Wed, 08 Mar 2023 16:03:49 +0000
Date: Thu, 9 Mar 2023 00:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 5/24] arch/x86/mm/ident_map.c:102:7: sparse:
 sparse: symbol 'ident_split_large_pud' was not declared. Should it be
 static?
Message-ID: <202303082354.uSelRyZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 26f02800cb89d842e554a5e030a40560adc7221b [5/24] x86/boot: Support 4KB pages for identity mapping
config: x86_64-randconfig-s023 (https://download.01.org/0day-ci/archive/20230308/202303082354.uSelRyZd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=26f02800cb89d842e554a5e030a40560adc7221b
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout 26f02800cb89d842e554a5e030a40560adc7221b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082354.uSelRyZd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/mm/init_64.c: note: in included file:
>> arch/x86/mm/ident_map.c:102:7: sparse: sparse: symbol 'ident_split_large_pud' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
