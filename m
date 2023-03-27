Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E377EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679895376; x=1711431376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLyaA5HPU/ak/DpcDTzFEUCY1+fMXWY7NxUlrP/F8Mk=;
  b=Mpxp/W34zWAnssFevwhLlFf3VpR05FA66kU39t2aefBBNwG01UPtZ0yO
   +oEuZHQlsVS8QgZa1++G1tLW+QmE3EM6rPtYzW+jOnxvGag8oxD4qHvpa
   /b6SMwOaMEvMI5+DhKiYVsiUZtTvK5gFZ82gV0/v5PDQCe/F4ZPE3AnIT
   tKdMs9X7Y+gHAWUqXSqJ1iDB9HtAciJrzTjLzExxfJVeAZaL1TazFp/GV
   IXWQ1julELC6e0/9rG9ih0i6gUIxQvuzBGfU2oVtfNNiz4aX8TOxjakZo
   WG2401FEXwtOG+ntEloBlbDdNYWTgV3opIjOf1r4VJml/v5RzK4PT5k70
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="320583441"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="320583441"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 22:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="807354117"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="807354117"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Mar 2023 22:36:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgfWW-000HZP-1X;
	Mon, 27 Mar 2023 05:36:04 +0000
Date: Mon, 27 Mar 2023 13:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: net/netfilter/xt_qtaguid.c:1014:13: warning: variable 'addr_type'
 set but not used
Message-ID: <202303271339.R2tRsVuw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JP,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: dac2dd2be24d8fa1bc023a28affc0faf91bc62b9 ANDROID: netfilter: xt_qtaguid: add qtaguid matching module
date:   2 years, 3 months ago
config: nds32-buildonly-randconfig-r005-20230327 (https://download.01.org/0day-ci/archive/20230327/202303271339.R2tRsVuw-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=dac2dd2be24d8fa1bc023a28affc0faf91bc62b9
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout dac2dd2be24d8fa1bc023a28affc0faf91bc62b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303271339.R2tRsVuw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/netfilter/xt_qtaguid.c:424:22: warning: no previous prototype for 'get_uid_data' [-Wmissing-prototypes]
     424 | struct uid_tag_data *get_uid_data(uid_t uid, bool *found_res)
         |                      ^~~~~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'iface_stat_create_ipv6':
>> net/netfilter/xt_qtaguid.c:1014:13: warning: variable 'addr_type' set but not used [-Wunused-but-set-variable]
    1014 |         int addr_type;
         |             ^~~~~~~~~
   net/netfilter/xt_qtaguid.c: In function 'prdebug_full_state_locked':
   net/netfilter/xt_qtaguid.c:1821:27: warning: function 'prdebug_full_state_locked' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1821 |                           fmt_buff, args);
         |                           ^~~~~~~~


vim +/addr_type +1014 net/netfilter/xt_qtaguid.c

  1006	
  1007	static void iface_stat_create_ipv6(struct net_device *net_dev,
  1008					   struct inet6_ifaddr *ifa)
  1009	{
  1010		struct in_device *in_dev;
  1011		const char *ifname;
  1012		struct iface_stat *entry;
  1013		struct iface_stat *new_iface;
> 1014		int addr_type;
  1015	
  1016		IF_DEBUG("qtaguid: iface_stat: create6(): ifa=%p netdev=%p->name=%s\n",
  1017			 ifa, net_dev, net_dev ? net_dev->name : "");
  1018		if (!net_dev) {
  1019			pr_err("qtaguid: iface_stat: create6(): no net dev!\n");
  1020			return;
  1021		}
  1022		ifname = net_dev->name;
  1023	
  1024		in_dev = in_dev_get(net_dev);
  1025		if (!in_dev) {
  1026			pr_err("qtaguid: iface_stat: create6(%s): no inet dev\n",
  1027			       ifname);
  1028			return;
  1029		}
  1030	
  1031		IF_DEBUG("qtaguid: iface_stat: create6(%s): in_dev=%p\n",
  1032			 ifname, in_dev);
  1033	
  1034		if (!ifa) {
  1035			IF_DEBUG("qtaguid: iface_stat: create6(%s): no matching IP\n",
  1036				 ifname);
  1037			goto done_put;
  1038		}
  1039		addr_type = ipv6_addr_type(&ifa->addr);
  1040	
  1041		spin_lock_bh(&iface_stat_list_lock);
  1042		entry = get_iface_entry(ifname);
  1043		if (entry != NULL) {
  1044			IF_DEBUG("qtaguid: %s(%s): entry=%p\n", __func__,
  1045				 ifname, entry);
  1046			iface_check_stats_reset_and_adjust(net_dev, entry);
  1047			_iface_stat_set_active(entry, net_dev, true);
  1048			IF_DEBUG("qtaguid: %s(%s): "
  1049				 "tracking now %d on ip=%pI6c\n", __func__,
  1050				 entry->ifname, true, &ifa->addr);
  1051			goto done_unlock_put;
  1052		}
  1053	
  1054		new_iface = iface_alloc(net_dev);
  1055		IF_DEBUG("qtaguid: iface_stat: create6(%s): done "
  1056			 "entry=%p ip=%pI6c\n", ifname, new_iface, &ifa->addr);
  1057	
  1058	done_unlock_put:
  1059		spin_unlock_bh(&iface_stat_list_lock);
  1060	done_put:
  1061		in_dev_put(in_dev);
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
