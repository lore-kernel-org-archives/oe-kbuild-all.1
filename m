Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90B3B42E7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377592; cv=none; b=DuAD+VNQj3KiO5P5LfYIY6QXGzUeEo/d9FPkoo5bdgvXT97hgJKggCxiqPHcT9F6AF8uJJyJen/c8qPWdkQEN767dAgHOhw1hLOjt74g2q6ApdYyAcIRlBiAMdv+Uy42SVDjPtCWwapzEST7KO4V2uxOA4aN/7cxtvB6FGmZu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377592; c=relaxed/simple;
	bh=cC48EZ4oNRa8o+hg07TOY7JFihpxTHz/c927f8JFoUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A/s71T+RtbFONQNOSSnPykc1tZRv0mP9Ola/RVnYnk+MVTshumldP9iftyuXIjOe0gBMuPVksfhwSVBpg3Xjhw+MksYO1tz6NNo+urki0KJDIA+L1dXzUJ9Dryk5JI+hYTOXigvh5KzI1wjnFunEkVvsKOUtNJ871eerrH3wTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp47s4zz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp47s4zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788377586; x=1819913586;
  h=date:from:to:cc:subject:message-id;
  bh=cC48EZ4oNRa8o+hg07TOY7JFihpxTHz/c927f8JFoUU=;
  b=Fp47s4zzNlw68iXq2hrZCcd+HYeXH82nd7tCAkgPJb00IoXErIhBrIMe
   piZ34iYuS31IoCCFCPfLOfYA5OKQPcItvHCkmKMXqWmrQsR6IjKe1URKg
   oac16n3Gmg+FkGL1fa9t59QP4a8nrsvoJ9Zn0xt9u/8XC+VnYiQ0YxK7O
   Piyi7YukbL4IT3CaevMVPYbt6R7X/MuRSeI5x5MLzI6OJCgOLja7PUTw9
   CueL72IypC3mRPlzoODNsnkDbEt3SZLJF3Dzf6GXHfxDwWOiZySfcHEpd
   pl28oyW+tzwozrOsTnIXduwCABSJGRTANV5RpjSiT2tmqlOUX6ozpYerp
   g==;
X-CSE-ConnectionGUID: JiQqbZvCR8SKYYn6Y8UVcQ==
X-CSE-MsgGUID: 5xq4CpGoQyKNd3JuDkbY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92667703"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92667703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:32:57 -0700
X-CSE-ConnectionGUID: 6sSTbZkORR6lwYlvk4c9aw==
X-CSE-MsgGUID: yB9Dq8HrSZGBlXHmqtIFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265182465"
Received: from igk-lkp-server01.igk.intel.com (HELO 05545efcfdd3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Sep 2026 12:32:56 -0700
Received: from kbuild by 05545efcfdd3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1qhZ-000000000KJ-3NE5;
	Wed, 02 Sep 2026 19:32:54 +0000
Date: Wed, 02 Sep 2026 21:32:31 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>
Subject: [cel:nfsd-testing 106/120] include/linux/netlink.h:116:13:
 warning: ' listener; rpcbind did not a...' directive output truncated writing
 79 bytes into a region of size 66
Message-ID: <202609022140.suMcguXp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   ac579868af0c900d8fd9c8cfe9e10db46ccc5a75
commit: ce39bbabbe205b50b66ac935bd54036d86d86ba3 [106/120] NFSD: stop registering with rpcbind after a failure in listener_set
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260902/202609022140.suMcguXp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609022140.suMcguXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609022140.suMcguXp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:103,
                    from include/net/ipv6.h:12,
                    from include/linux/sunrpc/clnt.h:29,
                    from include/linux/sunrpc/svcauth.h:17,
                    from include/linux/sunrpc/svc.h:19,
                    from include/linux/sunrpc/svcsock.h:13,
                    from fs/nfsd/nfsctl.c:14:
   fs/nfsd/nfsctl.c: In function 'nfsd_nl_listener_set_doit':
>> include/linux/netlink.h:116:13: warning: ' listener; rpcbind did not a...' directive output truncated writing 79 bytes into a region of size 66 [-Wformat-truncation=]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:2253:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
    2253 |                         NL_SET_ERR_MSG_FMT(info->extack,
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: 'snprintf' output 94 or more bytes into a destination of size 80
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/nfsctl.c:2253:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
    2253 |                         NL_SET_ERR_MSG_FMT(info->extack,
         |                         ^~~~~~~~~~~~~~~~~~
--
   In file included from include/uapi/linux/neighbour.h:6,
                    from include/linux/netdevice.h:44,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:103,
                    from include/net/ipv6.h:12,
                    from include/linux/sunrpc/clnt.h:29,
                    from include/linux/sunrpc/svcauth.h:17,
                    from include/linux/sunrpc/svc.h:19,
                    from include/linux/sunrpc/svcsock.h:13,
                    from nfsctl.c:14:
   nfsctl.c: In function 'nfsd_nl_listener_set_doit':
>> include/linux/netlink.h:116:13: warning: ' listener; rpcbind did not a...' directive output truncated writing 79 bytes into a region of size 66 [-Wformat-truncation=]
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   nfsctl.c:2253:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
    2253 |                         NL_SET_ERR_MSG_FMT(info->extack,
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:116:13: note: 'snprintf' output 94 or more bytes into a destination of size 80
     116 |         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,               \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     117 |                      "%s" fmt "%s", "", ##args, "") >=                         \
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   nfsctl.c:2253:25: note: in expansion of macro 'NL_SET_ERR_MSG_FMT'
    2253 |                         NL_SET_ERR_MSG_FMT(info->extack,
         |                         ^~~~~~~~~~~~~~~~~~


vim +116 include/linux/netlink.h

2d4bc93368f5a0 Johannes Berg 2017-04-12  107  
51c352bdbcd23d Edward Cree   2022-10-18  108  /* We splice fmt with %s at each end even in the snprintf so that both calls
51c352bdbcd23d Edward Cree   2022-10-18  109   * can use the same string constant, avoiding its duplication in .ro
51c352bdbcd23d Edward Cree   2022-10-18  110   */
51c352bdbcd23d Edward Cree   2022-10-18  111  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {			       \
51c352bdbcd23d Edward Cree   2022-10-18  112  	struct netlink_ext_ack *__extack = (extack);			       \
51c352bdbcd23d Edward Cree   2022-10-18  113  									       \
51c352bdbcd23d Edward Cree   2022-10-18  114  	if (!__extack)							       \
51c352bdbcd23d Edward Cree   2022-10-18  115  		break;							       \
51c352bdbcd23d Edward Cree   2022-10-18 @116  	if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,	       \
51c352bdbcd23d Edward Cree   2022-10-18  117  		     "%s" fmt "%s", "", ##args, "") >=			       \
51c352bdbcd23d Edward Cree   2022-10-18  118  	    NETLINK_MAX_FMTMSG_LEN)					       \
51c352bdbcd23d Edward Cree   2022-10-18  119  		net_warn_ratelimited("%s" fmt "%s", "truncated extack: ",      \
51c352bdbcd23d Edward Cree   2022-10-18  120  				     ##args, "\n");			       \
51c352bdbcd23d Edward Cree   2022-10-18  121  									       \
51c352bdbcd23d Edward Cree   2022-10-18  122  	do_trace_netlink_extack(__extack->_msg_buf);			       \
51c352bdbcd23d Edward Cree   2022-10-18  123  									       \
51c352bdbcd23d Edward Cree   2022-10-18  124  	__extack->_msg = __extack->_msg_buf;				       \
51c352bdbcd23d Edward Cree   2022-10-18  125  } while (0)
51c352bdbcd23d Edward Cree   2022-10-18  126  

:::::: The code at line 116 was first introduced by commit
:::::: 51c352bdbcd23d7ce46b06c1e64c82754dc44044 netlink: add support for formatted extack messages

:::::: TO: Edward Cree <ecree.xilinx@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
