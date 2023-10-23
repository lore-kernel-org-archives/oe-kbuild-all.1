Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7611B26D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QB1jiwlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091955; x=1729627955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLuHoN6gMVDaa5vbeBRP6Y6qiepJN/SKBJOYzIw8SvQ=;
  b=QB1jiwltsoPwIq5mW8wj9sq+3fFhWcrii41D+26IYxRMFySKAgnft7T/
   DyhK5JXxAwRtG5De6uQ+/ELhjjgknlXwrPNNJoJvezp7q53iMjc2p6+X+
   N4oZ7xm41QMVNKh55pENm+QUcEfJnBGmTD92LKwOsSJpOckgd3W+3LhB3
   bGPq3p95XyvLRiLTcaps65aXdFntW0vK8hy7zH0p7AeEsz11AlrD66vYb
   tncybOQQ8eHtZlrt/906k0EOJShaCC7tGohIl3/FBjbh80DwhhSWbr1EX
   jzZtcS+A3Pdcwm+i65+ma2DXOXs9A9uf0+guMAnED8tLnH9cCTvHgJ0mZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="8475441"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="8475441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="931802813"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="931802813"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Oct 2023 13:12:15 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv1HY-0007FJ-02;
	Mon, 23 Oct 2023 20:12:12 +0000
Date: Tue, 24 Oct 2023 04:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-next 17/49] arch/mips/sibyte/swarm/setup.c:146:9: error:
 implicit declaration of function 'vgacon_register_screen'
Message-ID: <202310240429.UqeQ2Cpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-next
head:   936323f8de4139c9f6ebc0d08e20f1fe200b78a8
commit: 555624c0d10bf09c62c45a86a47e752013f86fb5 [17/49] vgacon: clean up global screen_info instances
config: mips-randconfig-r004-20230118 (https://download.01.org/0day-ci/archive/20231024/202310240429.UqeQ2Cpr-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310240429.UqeQ2Cpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240429.UqeQ2Cpr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/sibyte/swarm/setup.c:58:5: warning: no previous prototype for 'swarm_be_handler' [-Wmissing-prototypes]
      58 | int swarm_be_handler(struct pt_regs *regs, int is_fixup)
         |     ^~~~~~~~~~~~~~~~
   arch/mips/sibyte/swarm/setup.c: In function 'plat_mem_setup':
>> arch/mips/sibyte/swarm/setup.c:146:9: error: implicit declaration of function 'vgacon_register_screen' [-Werror=implicit-function-declaration]
     146 |         vgacon_register_screen(&vgacon_screen_info);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vgacon_register_screen +146 arch/mips/sibyte/swarm/setup.c

   137	
   138		mips_set_be_handler(swarm_be_handler);
   139	
   140		if (xicor_probe())
   141			swarm_rtc_type = RTC_XICOR;
   142		if (m41t81_probe())
   143			swarm_rtc_type = RTC_M41T81;
   144	
   145	#ifdef CONFIG_VGA_CONSOLE
 > 146		vgacon_register_screen(&vgacon_screen_info);
   147	       /* XXXKW for CFE, get lines/cols from environment */
   148	#endif
   149	}
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
