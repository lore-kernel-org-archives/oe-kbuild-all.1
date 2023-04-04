Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3265C964
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 20:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680639227; x=1712175227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6Ls6+hqp6JAqB6CGq8/CI/AAXB1h/skmsygulDvE1s=;
  b=SOFmBScSNpS8um/a6JovfE+VKpi/r9b7LR5AHEke2oY9N6f5BzEjQRfi
   TORIf/bYvRfrnc5E3UKiqigqFuR8io6Fs80xnyNxgjp2b2keqhkaF9mzB
   vX/7h3G7oXuQw/h0bA1yObC6O+e1o8Wi+jqW1zGaFlJmDZgP4jGC/cJxr
   yfzQP7nMbqkWzFBRmgWN/552VyL2ugnUnjh0STOR7j3tX1YjpXUs0vPNb
   gnSToN3pXlzmXPX1Ykr2iSVnubH3U3jmjf4MUkwvmmqm3PbsC8iTD8H9D
   IrrfeB16qmS5usAmOieXySBPIR1P8jqEPtUFqSE27EgrRtTgTri8aq+Vc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="326326254"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="326326254"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 13:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="663758226"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="663758226"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 13:13:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjn2G-000Q10-1s;
	Tue, 04 Apr 2023 20:13:44 +0000
Date: Wed, 5 Apr 2023 04:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 5/5] drivers/net/gtp.c:1224:27: error: 'struct
 udp_port_cfg' has no member named 'local_ip6'; did you mean 'local_ip'?
Message-ID: <202304050430.ri86w6zz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
commit: 8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4 [5/5] gtp: add IPv6 support
config: csky-randconfig-r006-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050430.ri86w6zz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git/commit/?id=8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
        git remote add pablo-gtp https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
        git fetch --no-tags pablo-gtp main
        git checkout 8257a77aa7bbdcdbc7cb8bf48e4b065dccbb8ec4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050430.ri86w6zz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/gtp.c: In function 'gtp_sock_udp_config':
>> drivers/net/gtp.c:1224:27: error: 'struct udp_port_cfg' has no member named 'local_ip6'; did you mean 'local_ip'?
    1224 |                 udp_conf->local_ip6 = nla_get_in6_addr(nla);
         |                           ^~~~~~~~~
         |                           local_ip


vim +1224 drivers/net/gtp.c

  1213	
  1214	static int gtp_sock_udp_config(struct udp_port_cfg *udp_conf,
  1215				       const struct nlattr *nla, int family)
  1216	{
  1217		udp_conf->family = family;
  1218	
  1219		switch (udp_conf->family) {
  1220		case AF_INET:
  1221			udp_conf->local_ip.s_addr = nla_get_be32(nla);
  1222			break;
  1223		case AF_INET6:
> 1224			udp_conf->local_ip6 = nla_get_in6_addr(nla);
  1225			break;
  1226		default:
  1227			return -EOPNOTSUPP;
  1228		}
  1229	
  1230		return 0;
  1231	}
  1232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
