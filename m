Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26B121378
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lx0m2Quo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704981014; x=1736517014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4VzptQAvBNWiUykbxzpF5O4WyKcf3D5eyE6LDk8p4dw=;
  b=lx0m2QuoNxoN2Hn+utw3BNJahAx7ZX09PdmkRuszbuCRm83294x/sZNo
   GzmXfNpzPGfPmErqfpjGTWg+bmXuwhKVq2EE6NpU38zpNDJOtrVv/3Bds
   pvP76lf/FMSon4Lcx4reLFOfR4dGoBUsJd0Rm9lqzf7r/MZqOZh2bsCZL
   xjG9q7uhBgsbsNQ0NDo17WzNDdnolnLloF40xVKDycIiqZyfNlGM5nAkL
   hR75gd9b3bFixzpwx3Ls7OL4FSK6sqmzRN9C3by5XdW06B1n0grf8a9YS
   USCexn27Kv+d7eNE3H1H+WqMi2hwY+jUTHL5YvAo3754g3bNjjSiUK9+T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5929630"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5929630"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 05:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="926018929"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="926018929"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2024 05:50:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNvRh-0008Ji-2X;
	Thu, 11 Jan 2024 13:50:09 +0000
Date: Thu, 11 Jan 2024 21:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 6/10] include/linux/netdevice.h:3324:13:
 warning: 'netif_tx_schedule_bpf_timer' defined but not used
Message-ID: <202401112108.k2UCVx8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   a801331da854bdfc87394ef0fabf53af6f881599
commit: a70a4b469e9e0224fbeb40f9ace659bb483c748f [6/10] bpf: Support running timer callbacks in NET_TX_SOFTIRQ
config: i386-buildonly-randconfig-002-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112108.k2UCVx8q-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112108.k2UCVx8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112108.k2UCVx8q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/sock.h:46,
                    from lib/kobject_uevent.c:28:
>> include/linux/netdevice.h:3324:13: warning: 'netif_tx_schedule_bpf_timer' defined but not used [-Wunused-function]
    3324 | static void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:2: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1682 |  buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |  ^~~
   In file included from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:95,
                    from include/net/addrconf.h:52,
                    from lib/vsprintf.c:41:
   At top level:
>> include/linux/netdevice.h:3324:13: warning: 'netif_tx_schedule_bpf_timer' defined but not used [-Wunused-function]
    3324 | static void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/netif_tx_schedule_bpf_timer +3324 include/linux/netdevice.h

  3321	
  3322	void netif_tx_wake_queue(struct netdev_queue *dev_queue);
  3323	#ifndef CONFIG_NET
> 3324	static void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer)
  3325	{
  3326	}
  3327	#else
  3328	void netif_tx_schedule_bpf_timer(struct bpf_timer_nettx *timer);
  3329	#endif
  3330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
