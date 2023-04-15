Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F07EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 02:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681525026; x=1713061026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8gq9utA/sJb4QJM6FyofKDBfF4tqEpWEgruzfQamHcg=;
  b=ZBGNKUqNFgaoPiYG3j7AiAa0zQ8pDg2GZHKQySSjvPawA2TlwwnItV1k
   GRbkbvhXIWoL2BV0dWkiDAfmEgkSHAtz1iNE9kkdI/2LYryxM/liDaUGV
   tsZMMC1thzHhBsbr371H+SGWvFhQWT5PBawHSJ2NRvWNhvVaPYN5Dk/a0
   rAEcPcCsDPoAjaPR3SUvMWsckbtHguo4d8MAYTsdlUX8E3eanjRdYOarn
   grlPnVDH4AxEdSfNzIX5xBxVZ6IJi4K70qgWfD9SWhOocX+iXNdBRKIrE
   nWzfQ+Jj+BWy8PPK4ywzBTcmjSeyw97lCMN77Lm/pbVQh9+/MLOAthBq+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430899403"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="430899403"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 19:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="690023190"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="690023190"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Apr 2023 19:17:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnVTM-000aI3-0r;
	Sat, 15 Apr 2023 02:17:04 +0000
Date: Sat, 15 Apr 2023 10:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Colitti <lorenzo@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Amit Pundir <amit.pundir@linaro.org>,
	Hugo Benichi <hugobenichi@google.com>,
	Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14-rebase 2874/9999]
 net/ipv6/route.c:2623:5: warning: no previous declaration for
 'rt6_addrconf_purge'
Message-ID: <202304151006.oqFHcHoq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14-rebase
head:   18a233f3f676a98dde00947535d99ab1a54da340
commit: ba363662d10c7893123176454fed878d431c895e [2874/9999] ANDROID: net: ipv6: autoconf routes into per-device tables
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230415/202304151006.oqFHcHoq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/ba363662d10c7893123176454fed878d431c895e
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14-rebase
        git checkout ba363662d10c7893123176454fed878d431c895e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/gpu/drm/ lib/lzo/ net/ipv6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151006.oqFHcHoq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv6/route.c:2623:5: warning: no previous declaration for 'rt6_addrconf_purge' [-Wmissing-declarations]
    int rt6_addrconf_purge(struct rt6_info *rt, void *arg) {
        ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:97: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'


vim +/rt6_addrconf_purge +2623 net/ipv6/route.c

  2622	
> 2623	int rt6_addrconf_purge(struct rt6_info *rt, void *arg) {
  2624		if (rt->rt6i_flags & (RTF_DEFAULT | RTF_ADDRCONF) &&
  2625		    (!rt->rt6i_idev || rt->rt6i_idev->cnf.accept_ra != 2))
  2626			return -1;
  2627		return 0;
  2628	}
  2629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
