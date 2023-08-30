Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01961136F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 05:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693371642; x=1724907642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oq6MfmfVlCCL20lYc/THdOkZKACVKFfrKgNoFO0ZD3A=;
  b=T0xpvkLZQsHG7PsOjMd4+UnvaX8QwTclhZ1QtHq92PGi3jmoYomdAvkQ
   gSq/C5ZuUvUI2s80h+PV1aRIXryjFY7727a+z8VJqXmdKf3VsuJSD0KWa
   xvmLidqGfNSWrDldkiUxjPZ1Gc08afV1JVLcpwJ98KtwgwNSVXnjmz9C8
   P2UAG6zCRSU7vBdxD2H5b6uvwmOJm5r/g2xCaSc5WNree+CYMyUhUGk+C
   GoiB7t0/NNoaPniJ7dnPvc8sQM4mWoC4iJ9bkJX+98FAOZKp5hL9lu0kl
   m6rXlsHtVt7NZgILT4dluNXJkb1oKzmP/BoDb5jFfhPdXDwPt7P5q1IMK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372955205"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="372955205"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 22:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732460731"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="732460731"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 22:00:39 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbDJb-0009Rb-0j;
	Wed, 30 Aug 2023 05:00:29 +0000
Date: Wed, 30 Aug 2023 13:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13135/13297]
 drivers/net/ethernet/sfc/ethtool_common.c:278:32: warning: '%-24s' directive
 output may be truncated writing between 24 and 31 bytes into a region of
 size 25
Message-ID: <202308301211.2HHbgs2N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae782d4e2bf53b0b642ae860794f7a39470f995a
commit: e8103642f34d340f8c9fc3c56108a9b25cd22a7e [13135/13297] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
config: loongarch-randconfig-r016-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301211.2HHbgs2N-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301211.2HHbgs2N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301211.2HHbgs2N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/sfc/ethtool_common.c: In function 'efx_fill_test':
>> drivers/net/ethernet/sfc/ethtool_common.c:278:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
     278 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:276:17: note: 'snprintf' output 32 or more bytes (assuming 39) into a destination of size 32
     276 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     277 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     278 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/sfc/siena/ethtool_common.c: In function 'efx_fill_test':
>> drivers/net/ethernet/sfc/siena/ethtool_common.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/siena/ethtool_common.c:227:17: note: 'snprintf' output 32 or more bytes (assuming 39) into a destination of size 32
     227 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     228 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/sfc/falcon/ethtool.c: In function 'ef4_fill_test':
>> drivers/net/ethernet/sfc/falcon/ethtool.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/falcon/ethtool.c:227:17: note: 'snprintf' output 32 or more bytes (assuming 39) into a destination of size 32
     227 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     228 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     229 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +278 drivers/net/ethernet/sfc/ethtool_common.c

bdccfd2d4ea7a0 Edward Cree           2020-06-29  244  
3653954da498fc Alex Maftei (amaftei  2020-01-10  245) /**
3653954da498fc Alex Maftei (amaftei  2020-01-10  246)  * efx_fill_test - fill in an individual self-test entry
3653954da498fc Alex Maftei (amaftei  2020-01-10  247)  * @test_index:		Index of the test
3653954da498fc Alex Maftei (amaftei  2020-01-10  248)  * @strings:		Ethtool strings, or %NULL
3653954da498fc Alex Maftei (amaftei  2020-01-10  249)  * @data:		Ethtool test results, or %NULL
3653954da498fc Alex Maftei (amaftei  2020-01-10  250)  * @test:		Pointer to test result (used only if data != %NULL)
3653954da498fc Alex Maftei (amaftei  2020-01-10  251)  * @unit_format:	Unit name format (e.g. "chan\%d")
3653954da498fc Alex Maftei (amaftei  2020-01-10  252)  * @unit_id:		Unit id (e.g. 0 for "chan0")
3653954da498fc Alex Maftei (amaftei  2020-01-10  253)  * @test_format:	Test name format (e.g. "loopback.\%s.tx.sent")
3653954da498fc Alex Maftei (amaftei  2020-01-10  254)  * @test_id:		Test id (e.g. "PHYXS" for "loopback.PHYXS.tx_sent")
3653954da498fc Alex Maftei (amaftei  2020-01-10  255)  *
3653954da498fc Alex Maftei (amaftei  2020-01-10  256)  * Fill in an individual self-test entry.
3653954da498fc Alex Maftei (amaftei  2020-01-10  257)  */
428cd523248286 Zhang Xiaoxu          2020-01-13  258  static void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
3653954da498fc Alex Maftei (amaftei  2020-01-10  259) 			  int *test, const char *unit_format, int unit_id,
3653954da498fc Alex Maftei (amaftei  2020-01-10  260) 			  const char *test_format, const char *test_id)
3653954da498fc Alex Maftei (amaftei  2020-01-10  261) {
3653954da498fc Alex Maftei (amaftei  2020-01-10  262) 	char unit_str[ETH_GSTRING_LEN], test_str[ETH_GSTRING_LEN];
3653954da498fc Alex Maftei (amaftei  2020-01-10  263) 
3653954da498fc Alex Maftei (amaftei  2020-01-10  264) 	/* Fill data value, if applicable */
3653954da498fc Alex Maftei (amaftei  2020-01-10  265) 	if (data)
3653954da498fc Alex Maftei (amaftei  2020-01-10  266) 		data[test_index] = *test;
3653954da498fc Alex Maftei (amaftei  2020-01-10  267) 
3653954da498fc Alex Maftei (amaftei  2020-01-10  268) 	/* Fill string, if applicable */
3653954da498fc Alex Maftei (amaftei  2020-01-10  269) 	if (strings) {
3653954da498fc Alex Maftei (amaftei  2020-01-10  270) 		if (strchr(unit_format, '%'))
3653954da498fc Alex Maftei (amaftei  2020-01-10  271) 			snprintf(unit_str, sizeof(unit_str),
3653954da498fc Alex Maftei (amaftei  2020-01-10  272) 				 unit_format, unit_id);
3653954da498fc Alex Maftei (amaftei  2020-01-10  273) 		else
3653954da498fc Alex Maftei (amaftei  2020-01-10  274) 			strcpy(unit_str, unit_format);
3653954da498fc Alex Maftei (amaftei  2020-01-10  275) 		snprintf(test_str, sizeof(test_str), test_format, test_id);
3653954da498fc Alex Maftei (amaftei  2020-01-10  276) 		snprintf(strings + test_index * ETH_GSTRING_LEN,
3653954da498fc Alex Maftei (amaftei  2020-01-10  277) 			 ETH_GSTRING_LEN,
3653954da498fc Alex Maftei (amaftei  2020-01-10 @278) 			 "%-6s %-24s", unit_str, test_str);
3653954da498fc Alex Maftei (amaftei  2020-01-10  279) 	}
3653954da498fc Alex Maftei (amaftei  2020-01-10  280) }
3653954da498fc Alex Maftei (amaftei  2020-01-10  281) 

:::::: The code at line 278 was first introduced by commit
:::::: 3653954da498fc80c5da3642ae3f8d8168d7f820 sfc: move some ethtool code

:::::: TO: Alex Maftei (amaftei) <amaftei@solarflare.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
