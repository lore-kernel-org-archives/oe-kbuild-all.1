Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C8AD27
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736080481; cv=none; b=df/HHHXSw6Uroat1FphnZ6X+g+O6v8R5CNSkGUk1CwVKGRz+UrXlyl2/ECciDag/lVX+qZeMZy8cMsJx4SY40buem1CHEA+NME4HLPgWr7O/CYuAgeGIplRsSsAVTyIRYTOXVKCugpB1XUat7hrwhspO2JTcPQp6lw7ePsJT3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736080481; c=relaxed/simple;
	bh=hmL/BzZ8PVf7bUn2I4nApgMwn4DEDg7DEc0YD+/Jj7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgMGiZ8fbeHbqfVnr3nmt1Dz7ifZipa+5ZJTGJ0WbjAhYAoPJ0CH/xhDowUX0Rhlprtacai3fRog+hiTitAOvpxSZmmvWa04vDcXZAm17bDfzcr1oTk3zsq9YNLrtvmUtgPP3EB2X3b0H7DFyOeibMstn+ZgQybAc8zDgKaFbtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYTEaoYw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYTEaoYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736080480; x=1767616480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmL/BzZ8PVf7bUn2I4nApgMwn4DEDg7DEc0YD+/Jj7c=;
  b=mYTEaoYwt+HC6PDtxQCfUmjCoD8hQAEyzvDobYkT7zXvcgQD6DG5R7SX
   EZGGRH+rfL4034jJiplvaPTHd28DDjfdQpRlnZJt1L7wjfS+eZt+xXIMV
   zeuV6DV+4uMINKBJTNereeo5h5yHwo4JlfYw1nS/qeqixxTlpZLc8q0J5
   /tuwAFkURVwTzGgrad5qqWqZLC0+JAc8wnhJP0nv60LIkq9KEULCJwAMY
   KCq5pEwBZTrF/UX7/92KmX83eex/YkefVeXBJJVQzEoo+E4ucFuOE3FAH
   4qvX0hC9ax8KyIhT3vHAaQa4i3OZsS9LM1w4vryGfRyUp4UGFoXg8qBvi
   Q==;
X-CSE-ConnectionGUID: UoA8cfbaT7OwpginYsr8AQ==
X-CSE-MsgGUID: grWcMFAyT0u3W0cxHOKIoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46826899"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="46826899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 04:34:39 -0800
X-CSE-ConnectionGUID: lfylq/3JQe2HY2WVHDLtAQ==
X-CSE-MsgGUID: OzR55tF4T6qy/T9pFkuqwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139533998"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Jan 2025 04:34:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUPq0-000Bfv-0A;
	Sun, 05 Jan 2025 12:34:36 +0000
Date: Sun, 5 Jan 2025 20:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Maftei (amaftei)" <amaftei@solarflare.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/sfc/ethtool_common.c:170:32: warning: '%-24s'
 directive output may be truncated writing between 24 and 31 bytes into a
 region of size between 0 and 25
Message-ID: <202501052024.nsfCdH7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 3653954da498fc80c5da3642ae3f8d8168d7f820 sfc: move some ethtool code
date:   5 years ago
config: alpha-randconfig-p001-20211207 (https://download.01.org/0day-ci/archive/20250105/202501052024.nsfCdH7V-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501052024.nsfCdH7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501052024.nsfCdH7V-lkp@intel.com/

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
   174	#define EFX_CHANNEL_NAME(_channel) "chan%d", _channel->channel
   175	#define EFX_TX_QUEUE_NAME(_tx_queue) "txq%d", _tx_queue->queue
   176	#define EFX_RX_QUEUE_NAME(_rx_queue) "rxq%d", _rx_queue->queue
   177	#define EFX_LOOPBACK_NAME(_mode, _counter)			\
   178		"loopback.%s." _counter, STRING_TABLE_LOOKUP(_mode, efx_loopback_mode)
   179	
   180	/**
   181	 * efx_fill_loopback_test - fill in a block of loopback self-test entries
   182	 * @efx:		Efx NIC
   183	 * @lb_tests:		Efx loopback self-test results structure
   184	 * @mode:		Loopback test mode
   185	 * @test_index:		Starting index of the test
   186	 * @strings:		Ethtool strings, or %NULL
   187	 * @data:		Ethtool test results, or %NULL
   188	 *
   189	 * Fill in a block of loopback self-test entries.  Return new test
   190	 * index.
   191	 */
 > 192	int efx_fill_loopback_test(struct efx_nic *efx,
   193				   struct efx_loopback_self_tests *lb_tests,
   194				   enum efx_loopback_mode mode,
   195				   unsigned int test_index, u8 *strings, u64 *data)
   196	{
   197		struct efx_channel *channel =
   198			efx_get_channel(efx, efx->tx_channel_offset);
   199		struct efx_tx_queue *tx_queue;
   200	
   201		efx_for_each_channel_tx_queue(tx_queue, channel) {
   202			efx_fill_test(test_index++, strings, data,
   203				      &lb_tests->tx_sent[tx_queue->queue],
   204				      EFX_TX_QUEUE_NAME(tx_queue),
   205				      EFX_LOOPBACK_NAME(mode, "tx_sent"));
   206			efx_fill_test(test_index++, strings, data,
   207				      &lb_tests->tx_done[tx_queue->queue],
   208				      EFX_TX_QUEUE_NAME(tx_queue),
   209				      EFX_LOOPBACK_NAME(mode, "tx_done"));
   210		}
   211		efx_fill_test(test_index++, strings, data,
   212			      &lb_tests->rx_good,
   213			      "rx", 0,
   214			      EFX_LOOPBACK_NAME(mode, "rx_good"));
   215		efx_fill_test(test_index++, strings, data,
   216			      &lb_tests->rx_bad,
   217			      "rx", 0,
   218			      EFX_LOOPBACK_NAME(mode, "rx_bad"));
   219	
   220		return test_index;
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
