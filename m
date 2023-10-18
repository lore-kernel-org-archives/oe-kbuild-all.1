Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B76947348
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/4YDZWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697658144; x=1729194144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0LzV726fdVrL0k7KLW+ApC3rr1/NTaEs/ySkF4vnC4=;
  b=K/4YDZWFIieryIRiqhEZIiU/8EtZC7m44OVNDxVqFnGF41IIdreAN9gp
   dcyD6gEHDrNg8oCcdfIlsOvW3TslCxB2hMY7SJHb+3YAED3rwy7niKdz+
   X6+PygCtbs4m1Jl9iXZtgeSoATTxjlC5G4ueiNmytkUc4tqHskdQ+dejQ
   DznSFQatiuwNPkvYiCGMO6viIJAZltzV2jVuWMsIGll9Ts3AEH+22DHQ2
   zsRJf7CfeFXGOkfWFucQlZNjuMs531xBQAtbYqOD5OY6IHSYJ8OCaktQt
   fds6f/VB5s+l4jUIm++zxzwOtDnh3WLQC+lWcYouIU5YpbgwAIlDqeY6m
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452567180"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452567180"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 12:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003920940"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="1003920940"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 12:42:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtCQq-0000va-39;
	Wed, 18 Oct 2023 19:42:16 +0000
Date: Thu, 19 Oct 2023 03:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Maftei (amaftei)" <amaftei@solarflare.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/sfc/ethtool_common.c:170:32: warning: '%-24s'
 directive output may be truncated writing between 24 and 31 bytes into a
 region of size between 0 and 25
Message-ID: <202310190356.CiGFsxM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd72f9c7e512da377074d47d990564959b772643
commit: 3653954da498fc80c5da3642ae3f8d8168d7f820 sfc: move some ethtool code
date:   3 years, 9 months ago
config: sparc64-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190356.CiGFsxM8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190356.CiGFsxM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190356.CiGFsxM8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/sfc/ethtool_common.c:150:6: warning: no previous prototype for 'efx_fill_test' [-Wmissing-prototypes]
     150 | void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:192:5: warning: no previous prototype for 'efx_fill_loopback_test' [-Wmissing-prototypes]
     192 | int efx_fill_loopback_test(struct efx_nic *efx,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:296:8: warning: no previous prototype for 'efx_describe_per_queue_stats' [-Wmissing-prototypes]
     296 | size_t efx_describe_per_queue_stats(struct efx_nic *efx, u8 *strings)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c: In function 'efx_fill_test':
>> drivers/net/ethernet/sfc/ethtool_common.c:170:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size between 0 and 25 [-Wformat-truncation=]
     170 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:168:17: note: 'snprintf' output between 32 and 64 bytes into a destination of size 32
     168 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     169 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     170 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +170 drivers/net/ethernet/sfc/ethtool_common.c

   136	
   137	/**
   138	 * efx_fill_test - fill in an individual self-test entry
   139	 * @test_index:		Index of the test
   140	 * @strings:		Ethtool strings, or %NULL
   141	 * @data:		Ethtool test results, or %NULL
   142	 * @test:		Pointer to test result (used only if data != %NULL)
   143	 * @unit_format:	Unit name format (e.g. "chan\%d")
   144	 * @unit_id:		Unit id (e.g. 0 for "chan0")
   145	 * @test_format:	Test name format (e.g. "loopback.\%s.tx.sent")
   146	 * @test_id:		Test id (e.g. "PHYXS" for "loopback.PHYXS.tx_sent")
   147	 *
   148	 * Fill in an individual self-test entry.
   149	 */
   150	void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
   151			   int *test, const char *unit_format, int unit_id,
   152			   const char *test_format, const char *test_id)
   153	{
   154		char unit_str[ETH_GSTRING_LEN], test_str[ETH_GSTRING_LEN];
   155	
   156		/* Fill data value, if applicable */
   157		if (data)
   158			data[test_index] = *test;
   159	
   160		/* Fill string, if applicable */
   161		if (strings) {
   162			if (strchr(unit_format, '%'))
   163				snprintf(unit_str, sizeof(unit_str),
   164					 unit_format, unit_id);
   165			else
   166				strcpy(unit_str, unit_format);
   167			snprintf(test_str, sizeof(test_str), test_format, test_id);
   168			snprintf(strings + test_index * ETH_GSTRING_LEN,
   169				 ETH_GSTRING_LEN,
 > 170				 "%-6s %-24s", unit_str, test_str);
   171		}
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
