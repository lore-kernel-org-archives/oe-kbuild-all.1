Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33615B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675561928; x=1707097928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5jEDVEv4E/ZUk3vxpTGpGFpHD2IGhqHXHaQI/TeKqo=;
  b=jI4nNFWe0H7VE0VI9xsF09iz48vMMihJzf8XtUfOiJAmtlGzDsV8trD/
   CiGlt6tqKEhqTMwFBU+SVABtVLAK692OHluRv1cmssleYs/VFGqlv1kf/
   57m2C7mVklzWXNHklY9wHa1b8YY7UPAy5wIFXjmyTD5Y6HM9gx5o6TbCe
   5XtYVTdQlgy0cr7pufSMwVhqphxp0QX63Lchcx32NYjW0vgA4IT7FfjEE
   NvOq89E/3gpqy+Ifrdg9OYPxr+Sy0uPChpOhZ+pslYHmZtJ2A2Y5/PcOG
   bGpJoE3qiHyKg/uYUt4IiIMxcOLs9XXZAFpAvtPP0DmwCPKJYoQTvWr5f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330303277"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="330303277"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="666132622"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="666132622"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Feb 2023 17:52:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOUCJ-0001eS-1V;
	Sun, 05 Feb 2023 01:52:03 +0000
Date: Sun, 5 Feb 2023 09:51:50 +0800
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
Subject: Re: [PATCH net-next 2/5] net: extract nf_ct_skb_network_trim
 function to nf_conntrack_ovs
Message-ID: <202302050931.ExDjYqcf-lkp@intel.com>
References: <c47c8808a2e46776ed38218ed6c8ddd59ced59d6.1675548023.git.lucien.xin@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c47c8808a2e46776ed38218ed6c8ddd59ced59d6.1675548023.git.lucien.xin@gmail.com>

Hi Xin,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
patch link:    https://lore.kernel.org/r/c47c8808a2e46776ed38218ed6c8ddd59ced59d6.1675548023.git.lucien.xin%40gmail.com
patch subject: [PATCH net-next 2/5] net: extract nf_ct_skb_network_trim function to nf_conntrack_ovs
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230205/202302050931.ExDjYqcf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e5c757094190576b1a59afee53d39b90bfbdd5f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xin-Long/net-create-nf_conntrack_ovs-for-ovs-and-tc-use/20230205-060514
        git checkout e5c757094190576b1a59afee53d39b90bfbdd5f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "nf_ct_helper" [net/openvswitch/openvswitch.ko] undefined!
ERROR: modpost: "nf_ct_add_helper" [net/openvswitch/openvswitch.ko] undefined!
>> ERROR: modpost: "nf_ct_skb_network_trim" [net/openvswitch/openvswitch.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
