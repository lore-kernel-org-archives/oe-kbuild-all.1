Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984C14AA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkTe+Jxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703891274; x=1735427274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WmYga6PVDX/2H9zIK97007k5sy15J3qHO/fqbS9/i8s=;
  b=fkTe+Jxi0vVml0xoRQ+f83LtyCxBkSGbe5n2iD/adJI/rD6Tmim39aPn
   1WKCqFSLnjgcFbg7SZSBQ1uXQ+UGhUAKYEEI+DmfYvDdgc2Mr2ytkH7qY
   toI0KD2uCn7sXZqiUlVoOxJmKnOvDZxKsgBEGM04uDS1a5B2jtFZW51HO
   wCACBdp3RmL+d/UTfdNNQkCSj8URZ0I1lshbDcoaH2f2j2rgrTSK6J2yB
   WJavq65g1HdvMGCONznGrrCSE9r8ts4yTLHqxKiJlNI4VFkbrikINiGgh
   t63YM6l2Qgp43h4WTORrsOmkyzQGqYHEvNzLrvrPfySyF2jB/GcGoeqhE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3987191"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3987191"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 15:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="27265399"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Dec 2023 15:07:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJLxD-000Hsh-27;
	Fri, 29 Dec 2023 23:07:48 +0000
Date: Sat, 30 Dec 2023 07:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Fuhai Wang <fuhaiwang@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, Kaixu Xia <kaixuxia@tencent.com>,
	brookxu <brookxu@tencent.com>
Subject: net/ipv4/sysctl_net_ipv4.c:495:21: warning: variable 'old_val' set
 but not used
Message-ID: <202312300711.TnwsaPP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 9b2083fc0d092784701f0c589e1c5cf0447828c0 net: change TCP_TIMEWAIT_LEN on runtime
date:   2 years, 10 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231230/202312300711.TnwsaPP7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300711.TnwsaPP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300711.TnwsaPP7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/sysctl_net_ipv4.c: In function 'proc_tcp_tw_timeout':
>> net/ipv4/sysctl_net_ipv4.c:495:21: warning: variable 'old_val' set but not used [-Wunused-but-set-variable]
     495 |                 int old_val;
         |                     ^~~~~~~


vim +/old_val +495 net/ipv4/sysctl_net_ipv4.c

   473	
   474	static int proc_tcp_tw_timeout(struct ctl_table *table, int write,
   475				       void __user *buffer,
   476				       size_t *lenp, loff_t *ppos)
   477	{
   478		int val, ret;
   479		struct ctl_table tmp = {
   480			.data = &val,
   481			.maxlen = sizeof(val),
   482			.extra1		= &tw_timeout_min,
   483			.extra2		= &tw_timeout_max
   484		};
   485	
   486		if (!write) {
   487			int tw_timeout = *((int *)table->data) / HZ;
   488			tmp.data = &tw_timeout;
   489	
   490			return proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
   491		}
   492	
   493		ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
   494		if (write && ret == 0) {
 > 495			int old_val;
   496			struct net *net;
   497	
   498			net = container_of(table->data, struct net,
   499					   ipv4.sysctl_tw_timeout);
   500			old_val = net->ipv4.sysctl_tw_timeout;
   501			net->ipv4.sysctl_tw_timeout = val * HZ;
   502		}
   503	
   504		return ret;
   505	}
   506	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
