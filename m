Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF415663
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686819045; x=1718355045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nWbdsKddVwIpCAOOMMbnMki1dXf9SEQCMnruywUZfW8=;
  b=YOJ62f1TWjlvkwhRYhvTVEtJh4EoMqXrXBdAUmdLExcmXZP1UPNQM9Vs
   Oo1Qv1WfqizXKnn3WZr9+bED79ZYOMZ+1bjvU1KVpTr6QjC0fY0Fsr2i5
   IoMH4RziTNFM4chfKe1ZQVYivvHmLvzaMLdmwHpgx0Wvi0vYYgIpAeVUn
   nUNPSQbNew8lBVAlP7SV5liMEJflNNiI+Agcfhz3CC5q6jqAjj1idrVSG
   GlDaVRkbA+5grrSVMYh3pUIWCryr3tWuECLbkBXeU0ih9ttZ8ccKZAH0L
   XchJOdUXhwSADdXueJ/iAMyZkfXiVpRHKKA3Ao3mE/b6hgcG9Qf5iA0Tk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387285411"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="387285411"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 01:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="689715989"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="689715989"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Jun 2023 01:50:42 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9igj-0001g1-2e;
	Thu, 15 Jun 2023 08:50:41 +0000
Date: Thu, 15 Jun 2023 16:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <simon.horman@corigine.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>
Subject: [linux-next:master 8214/10326]
 drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to
 `ip_send_check'
Message-ID: <202306151656.yttECVTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: a1e82162af0b8ae9e65320ca405c6327edb99648 [8214/10326] sfc: generate encap headers for TC offload
config: riscv-buildonly-randconfig-r001-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151656.yttECVTP-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a1e82162af0b8ae9e65320ca405c6327edb99648
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a1e82162af0b8ae9e65320ca405c6327edb99648
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151656.yttECVTP-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
>> drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to `ip_send_check'
   riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
   include/linux/rhashtable.h:648: undefined reference to `arp_tbl'
   riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
   drivers/net/ethernet/sfc/tc_encap_actions.c:135: undefined reference to `ip_route_output_flow'


vim +277 drivers/net/ethernet/sfc/tc_encap_actions.c

   261	
   262	static void efx_gen_tun_header_ipv4(struct efx_tc_encap_action *encap, u8 ipproto, u8 len)
   263	{
   264		struct efx_neigh_binder *neigh = encap->neigh;
   265		struct ip_tunnel_key *key = &encap->key;
   266		struct iphdr *ip;
   267	
   268		ip = (struct iphdr *)(encap->encap_hdr + encap->encap_hdr_len);
   269		encap->encap_hdr_len += sizeof(*ip);
   270	
   271		ip->daddr = key->u.ipv4.dst;
   272		ip->saddr = key->u.ipv4.src;
   273		ip->ttl = neigh->ttl;
   274		ip->protocol = ipproto;
   275		ip->version = 0x4;
   276		ip->ihl = 0x5;
 > 277		ip->tot_len = cpu_to_be16(ip->ihl * 4 + len);
   278		ip_send_check(ip);
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
