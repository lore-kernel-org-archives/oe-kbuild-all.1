Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82B15B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 02:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675562590; x=1707098590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0vitMxx9UI0aEaOTDTV8/5KdlIx/caeyeekfZgZMTWs=;
  b=ey3SmcXhlcsi4Qkonzs6kELvgRORJmbQihkglBXg2I4ubfB7Q5nQM/5m
   Di1hVsuAHEAWhtpJFQFtgu1kCuSRTvxcRn4/s49nN/yrMUFTiN0+lw+8o
   J5LMVnqFpv52/LRRgU7uH/4oEspVk/xlHyHGwsdwa0AobaWwu9TNztnDh
   q18/GUKawZXpv/zBu+R9OSatlNSHMfpBwbijKnRkpjDSSKSAFvYPXLM37
   ubumUAeQz0EY1Y8l0huVy5OLxN32FdrBG9rAJtI/BzRp1q4tV2WHn2PE/
   UExqX8Ws7qv+17mQYOLBe1uj/8sn0Y9yX+zv69KE64zs6WG+e2gnRO+0m
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="308650297"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="308650297"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 18:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="643663526"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="643663526"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 18:03:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOUMx-0001eu-2a;
	Sun, 05 Feb 2023 02:03:03 +0000
Date: Sun, 5 Feb 2023 10:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Long <lucien.xin@gmail.com>, network dev <netdev@vger.kernel.org>,
	dev@openvswitch.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, kuba@kernel.org,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Pravin B Shelar <pshelar@ovn.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Aaron Conole <aconole@redhat.com>
Subject: Re: [PATCH net-next 5/5] net: extract nf_ct_handle_fragments to
 nf_conntrack_ovs
Message-ID: <202302050907.QhHYY6qZ-lkp@intel.com>
References: <658ca267b02decd564d52139274a0076d164e312.1675548023.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <658ca267b02decd564d52139274a0076d164e312.1675548023.git.lucien.xin@gmail.com>

Hi Xin,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
patch link:    https://lore.kernel.org/r/658ca267b02decd564d52139274a0076d164e312.1675548023.git.lucien.xin%40gmail.com
patch subject: [PATCH net-next 5/5] net: extract nf_ct_handle_fragments to nf_conntrack_ovs
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230205/202302050907.QhHYY6qZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a0329da66336f34ae6ec5db5b6e5224ffcf01d0c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
        git checkout a0329da66336f34ae6ec5db5b6e5224ffcf01d0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nf_ct_handle_fragments" [net/openvswitch/openvswitch.ko] undefined!
ERROR: modpost: "nf_ct_helper" [net/openvswitch/openvswitch.ko] undefined!
ERROR: modpost: "nf_ct_add_helper" [net/openvswitch/openvswitch.ko] undefined!
ERROR: modpost: "nf_ct_skb_network_trim" [net/openvswitch/openvswitch.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
