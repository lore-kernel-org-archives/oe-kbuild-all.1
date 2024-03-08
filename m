Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB72E3E4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881909; cv=none; b=ZEvQduIKtnI0UMztSG5opVZr1EgZHdu4maF/4u+7MsPKnLZFrWNyeLEMBmRmvAD4HdPPYAgTxZATSbX53d+LfyyHeWrB2Tk+e4roM5lvJcW04PNrfC1eX0z23oOyxJmErFqi3Wrlz2B7N4Hx6G7EkkzILEMkcBair0aq87MBVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881909; c=relaxed/simple;
	bh=wE027DAEH+CU5mcCyyxEkKjZ5BUqt1CO1B0VG9SQLg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oc5Z5Nii65lopqSdD3/ajhUWBtrJPEI6KMR+Dn6tw7kb5GOZQF3wyAlSQK9wievM91NWT201mdhSM3y0ogLtGMVGZy2EWPCyVFy/gi1bHm7XiFMmXOZEcYJrSlu+mf+fxH/9Ut7MQQ2dY380al9zEllRffUxPhBKUtfyp69BF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIchZh7X; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIchZh7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709881907; x=1741417907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wE027DAEH+CU5mcCyyxEkKjZ5BUqt1CO1B0VG9SQLg4=;
  b=SIchZh7XqLIhY/DefvpoVcsm/uX8u2e69OeRChL0CiOco/Ip6ybnY0kW
   4fLS6ApwqJJtaGYnQraYEFdkyYpn+PK5fmhJAxlrTFDRK4MPUTICLum+L
   xs2N5FtAZQ4O7zbjSbEmnawbaUWcqw+8cOTza2k5bUv71UCNfAQO79Gn3
   o7j0ItSVg/SxPZJDF1U2n11PPVHFB6xRyFQJw1c6LculmYjRB3wAF3NKc
   DQ5A5pCnxBft5qIaKsQNyryWz3xr8/O5Bx2caxXwmxZkkJoqfcdDXA116
   q7ZdP9/pxcrihNoHAwEE1NsGJwtFvpsj64AIYphXq7fsCQzjwg8VFpDl3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8402944"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="8402944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 23:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="14964267"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Mar 2024 23:11:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riUOJ-00068d-2G;
	Fri, 08 Mar 2024 07:11:39 +0000
Date: Fri, 8 Mar 2024 15:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26625/27434]
 net/core/netclassid_cgroup.c:518:5: warning: no previous prototype for
 'bps_limit_dump'
Message-ID: <202403081500.7S9EgAQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 81c4728adcdbe8b9ea56a81590b66a3ee249512d [26625/27434] rue/net: add rx && tx rate limit for per cgroup
config: arm64-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240308/202403081500.7S9EgAQ0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081500.7S9EgAQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081500.7S9EgAQ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:122:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     122 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:151:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     151 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_bps_limit':
   net/core/netclassid_cgroup.c:318:51: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     318 |                 if (!strcmp(tok, "rx_bps") && val >= 0)
         |                                                   ^~
   net/core/netclassid_cgroup.c:320:56: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     320 |                 else if (!strcmp(tok, "tx_bps") && val >= 0)
         |                                                        ^~
   net/core/netclassid_cgroup.c: At top level:
   net/core/netclassid_cgroup.c:340:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     340 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
   net/core/netclassid_cgroup.c:407:26: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     407 |                 if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
         |                          ^
   net/core/netclassid_cgroup.c:407:53: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     407 |                 if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
         |                                                     ^
   net/core/netclassid_cgroup.c: At top level:
   net/core/netclassid_cgroup.c:492:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     492 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:504:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     504 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:511:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     511 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
>> net/core/netclassid_cgroup.c:518:5: warning: no previous prototype for 'bps_limit_dump' [-Wmissing-prototypes]
     518 | int bps_limit_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/processor.h:28,
                    from include/asm-generic/qrwlock.h:14,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:8,
                    from include/linux/spinlock.h:89,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from net/core/netclassid_cgroup.c:8:
   In function 'strncpy',
       inlined from 'write_dev_bps_config' at net/core/netclassid_cgroup.c:414:3:
   include/linux/string.h:294:33: warning: '__builtin_strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     294 | #define __underlying_strncpy    __builtin_strncpy
         |                                 ^
   include/linux/string.h:304:16: note: in expansion of macro '__underlying_strncpy'
     304 |         return __underlying_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~
   In function 'strlen',
       inlined from 'write_dev_bps_config' at net/core/netclassid_cgroup.c:414:3:
   include/linux/string.h:292:33: note: length computed here
     292 | #define __underlying_strlen     __builtin_strlen
         |                                 ^
   include/linux/string.h:325:24: note: in expansion of macro '__underlying_strlen'
     325 |                 return __underlying_strlen(p);
         |                        ^~~~~~~~~~~~~~~~~~~


vim +/bps_limit_dump +518 net/core/netclassid_cgroup.c

   517	
 > 518	int bps_limit_dump(struct seq_file *sf, void *v)
   519	{
   520		struct cgroup_subsys_state *css = seq_css(sf);
   521	
   522		if (READ_ONCE(netcls_modfunc.dump_rx_bps_limit_tb) &&
   523		    READ_ONCE(netcls_modfunc.dump_tx_bps_limit_tb)) {
   524			netcls_modfunc.dump_rx_bps_limit_tb(css, sf);
   525			netcls_modfunc.dump_tx_bps_limit_tb(css, sf);
   526		}
   527		return 0;
   528	}
   529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
