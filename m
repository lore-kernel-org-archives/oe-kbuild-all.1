Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35BC1FA1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 05:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692682423; x=1724218423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEFAKEg84MAafH64os46gVhqqr0El7kKhC8QJAGjXNI=;
  b=P9ZHydVO0LqUHSU5Pk7yYfOe9MHy0nddelSoTgItnJK2WiGlttWjAd8z
   C9MVCwFbOkJQMlBgBHQAi+BYBaaEGoMOxUywh6i0whIqpb12WS56bVX+w
   t3ch7n4lH8CrRc/qiIVrLspmcUE5H8mRJ/W2VYYjKP6nEjvuYVmOw3aB4
   U7MUo3hsNpkMD+IriAHcQlq0vDcwtEsOVtyCPkSaTRA70H8BnqD176VZG
   Uk3C56eF4cmX1W+3NymX0Y1A0JUcChJccIhAZDY8S61NxYnx1oYZsn8zx
   z7C2/3y7DG9QvavHoERqQZ+F839S0R8O9IihSFPsGosrY0c3fEceQYrQ1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354114580"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="354114580"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 22:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859764105"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="859764105"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Aug 2023 22:33:41 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYK0J-0001P2-11;
	Tue, 22 Aug 2023 05:33:10 +0000
Date: Tue, 22 Aug 2023 13:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 262/27479] net/socket.c:1110:
 undefined reference to `wext_handle_ioctl'
Message-ID: <202308221346.2FJ1iFNs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   0b89add3a32b77a9c7d68570de0ae6c67daae047
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/27479] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: i386-randconfig-r036-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221346.2FJ1iFNs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221346.2FJ1iFNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221346.2FJ1iFNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: net/socket.o: in function `sock_ioctl':
>> net/socket.c:1110: undefined reference to `wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net/core/net-procfs.c:305: undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net/core/net-procfs.c:289: undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +1110 net/socket.c

c62cce2caee558 Andrey Vagin        2016-10-24  1086  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1087  static long sock_ioctl(struct file *file, unsigned cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1088  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1089  	struct socket *sock;
881d966b48b035 Eric W. Biederman   2007-09-17  1090  	struct sock *sk;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1091  	void __user *argp = (void __user *)arg;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1092  	int pid, err;
881d966b48b035 Eric W. Biederman   2007-09-17  1093  	struct net *net;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1094  
b69aee04fbfc02 Eric Dumazet        2005-09-06  1095  	sock = file->private_data;
881d966b48b035 Eric W. Biederman   2007-09-17  1096  	sk = sock->sk;
3b1e0a655f8eba YOSHIFUJI Hideaki   2008-03-26  1097  	net = sock_net(sk);
44c02a2c3dc558 Al Viro             2017-10-05  1098  	if (unlikely(cmd >= SIOCDEVPRIVATE && cmd <= (SIOCDEVPRIVATE + 15))) {
44c02a2c3dc558 Al Viro             2017-10-05  1099  		struct ifreq ifr;
44c02a2c3dc558 Al Viro             2017-10-05  1100  		bool need_copyout;
44c02a2c3dc558 Al Viro             2017-10-05  1101  		if (copy_from_user(&ifr, argp, sizeof(struct ifreq)))
44c02a2c3dc558 Al Viro             2017-10-05  1102  			return -EFAULT;
44c02a2c3dc558 Al Viro             2017-10-05  1103  		err = dev_ioctl(net, cmd, &ifr, &need_copyout);
44c02a2c3dc558 Al Viro             2017-10-05  1104  		if (!err && need_copyout)
44c02a2c3dc558 Al Viro             2017-10-05  1105  			if (copy_to_user(argp, &ifr, sizeof(struct ifreq)))
44c02a2c3dc558 Al Viro             2017-10-05  1106  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1107  	} else
3d23e349d80717 Johannes Berg       2009-09-29  1108  #ifdef CONFIG_WEXT_CORE
^1da177e4c3f41 Linus Torvalds      2005-04-16  1109  	if (cmd >= SIOCIWFIRST && cmd <= SIOCIWLAST) {
b1b0c245067268 Al Viro             2017-10-01 @1110  		err = wext_handle_ioctl(net, cmd, argp);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1111  	} else
3d23e349d80717 Johannes Berg       2009-09-29  1112  #endif
^1da177e4c3f41 Linus Torvalds      2005-04-16  1113  		switch (cmd) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  1114  		case FIOSETOWN:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1115  		case SIOCSPGRP:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1116  			err = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1117  			if (get_user(pid, (int __user *)argp))
^1da177e4c3f41 Linus Torvalds      2005-04-16  1118  				break;
393cc3f51135ea Jiri Slaby          2017-06-13  1119  			err = f_setown(sock->file, pid, 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1120  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1121  		case FIOGETOWN:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1122  		case SIOCGPGRP:
609d7fa9565c75 Eric W. Biederman   2006-10-02  1123  			err = put_user(f_getown(sock->file),
89bddce58e85bb Stephen Hemminger   2006-09-01  1124  				       (int __user *)argp);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1125  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1126  		case SIOCGIFBR:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1127  		case SIOCSIFBR:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1128  		case SIOCBRADDBR:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1129  		case SIOCBRDELBR:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1130  			err = -ENOPKG;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1131  			if (!br_ioctl_hook)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1132  				request_module("bridge");
^1da177e4c3f41 Linus Torvalds      2005-04-16  1133  
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1134  			mutex_lock(&br_ioctl_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1135  			if (br_ioctl_hook)
881d966b48b035 Eric W. Biederman   2007-09-17  1136  				err = br_ioctl_hook(net, cmd, argp);
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1137  			mutex_unlock(&br_ioctl_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1138  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1139  		case SIOCGIFVLAN:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1140  		case SIOCSIFVLAN:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1141  			err = -ENOPKG;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1142  			if (!vlan_ioctl_hook)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1143  				request_module("8021q");
^1da177e4c3f41 Linus Torvalds      2005-04-16  1144  
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1145  			mutex_lock(&vlan_ioctl_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1146  			if (vlan_ioctl_hook)
881d966b48b035 Eric W. Biederman   2007-09-17  1147  				err = vlan_ioctl_hook(net, argp);
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1148  			mutex_unlock(&vlan_ioctl_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1149  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1150  		case SIOCADDDLCI:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1151  		case SIOCDELDLCI:
^1da177e4c3f41 Linus Torvalds      2005-04-16  1152  			err = -ENOPKG;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1153  			if (!dlci_ioctl_hook)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1154  				request_module("dlci");
^1da177e4c3f41 Linus Torvalds      2005-04-16  1155  
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1156  			mutex_lock(&dlci_ioctl_mutex);
7512cbf6efc976 Pavel Emelyanov     2008-03-21  1157  			if (dlci_ioctl_hook)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1158  				err = dlci_ioctl_hook(cmd, argp);
4a3e2f711a00a1 Arjan van de Ven    2006-03-20  1159  			mutex_unlock(&dlci_ioctl_mutex);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1160  			break;
c62cce2caee558 Andrey Vagin        2016-10-24  1161  		case SIOCGSKNS:
c62cce2caee558 Andrey Vagin        2016-10-24  1162  			err = -EPERM;
c62cce2caee558 Andrey Vagin        2016-10-24  1163  			if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
c62cce2caee558 Andrey Vagin        2016-10-24  1164  				break;
c62cce2caee558 Andrey Vagin        2016-10-24  1165  
c62cce2caee558 Andrey Vagin        2016-10-24  1166  			err = open_related_ns(&net->ns, get_net_ns);
c62cce2caee558 Andrey Vagin        2016-10-24  1167  			break;
0768e17073dc52 Arnd Bergmann       2019-04-17  1168  		case SIOCGSTAMP_OLD:
0768e17073dc52 Arnd Bergmann       2019-04-17  1169  		case SIOCGSTAMPNS_OLD:
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1170  			if (!sock->ops->gettstamp) {
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1171  				err = -ENOIOCTLCMD;
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1172  				break;
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1173  			}
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1174  			err = sock->ops->gettstamp(sock, argp,
0768e17073dc52 Arnd Bergmann       2019-04-17  1175  						   cmd == SIOCGSTAMP_OLD,
0768e17073dc52 Arnd Bergmann       2019-04-17  1176  						   !IS_ENABLED(CONFIG_64BIT));
60747828eac288 Gustavo A. R. Silva 2019-04-24  1177  			break;
0768e17073dc52 Arnd Bergmann       2019-04-17  1178  		case SIOCGSTAMP_NEW:
0768e17073dc52 Arnd Bergmann       2019-04-17  1179  		case SIOCGSTAMPNS_NEW:
0768e17073dc52 Arnd Bergmann       2019-04-17  1180  			if (!sock->ops->gettstamp) {
0768e17073dc52 Arnd Bergmann       2019-04-17  1181  				err = -ENOIOCTLCMD;
0768e17073dc52 Arnd Bergmann       2019-04-17  1182  				break;
0768e17073dc52 Arnd Bergmann       2019-04-17  1183  			}
0768e17073dc52 Arnd Bergmann       2019-04-17  1184  			err = sock->ops->gettstamp(sock, argp,
0768e17073dc52 Arnd Bergmann       2019-04-17  1185  						   cmd == SIOCGSTAMP_NEW,
0768e17073dc52 Arnd Bergmann       2019-04-17  1186  						   false);
c7cbdbf29f488a Arnd Bergmann       2019-04-17  1187  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1188  		default:
63ff03ab786ab1 Johannes Berg       2019-01-25  1189  			err = sock_do_ioctl(net, sock, cmd, arg);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1190  			break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1191  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  1192  	return err;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1193  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  1194  

:::::: The code at line 1110 was first introduced by commit
:::::: b1b0c245067268043e0e832432f3d537a5cae33b lift handling of SIOCIW... out of dev_ioctl()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
