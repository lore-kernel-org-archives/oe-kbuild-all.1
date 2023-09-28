Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858531A94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 22:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695940000; x=1727476000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4M/dahLhUbBKzNYghaLTW6oMoRm3cJLl1K9+PgdVjfw=;
  b=nrP+/WtA3MZh/KScrbkH72DbkwrF/Ihhc9/PR0D0r61imsfwkv6Mzm6y
   XH+6NGZHOMdLyQg9v5f9m9F1JArG4LYeDsIkWIVixfj7rampB8QXNNB0Y
   Ybv84UlNEcsEi+wsfzAOmSVbpfcTRcSgATbrgCHcFOJmWT8UXOsBclNgG
   UMpcJIlj6dQLm5s6eDev7AAwvWhjRzNwSyXfhBHXP7ZfY/WydtVKQB0hi
   wIAxewZQvxwa/G1p7q52DsQ5PlIg9s5Pp1mszHX1YlZd24RcNLbn0oK0X
   0T24xyr50+G8ZWAnG4VpCa9dk33zg0I4/I4sGXNc2iDZlUM1CshQuf70V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413098987"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="413098987"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 15:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699444311"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="699444311"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Sep 2023 15:26:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlzSs-00023y-1t;
	Thu, 28 Sep 2023 22:26:34 +0000
Date: Fri, 29 Sep 2023 06:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org,
	Vicki Pfau <vi@endrift.com>
Subject: [rafael-pm:bleeding-edge 86/94] drivers/acpi/utils.c:427: warning:
 Function parameter or member 'list2' not described in
 'acpi_handle_list_equal'
Message-ID: <202309290642.18zicoLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   2cff74feed4a2a3a1c220e0ee2838b85b08d4999
commit: 2f5042ef239e43d2b02f7724714673e5e604bd6f [86/94] ACPI: utils: Dynamically determine acpi_handle_list size
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309290642.18zicoLj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290642.18zicoLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290642.18zicoLj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/utils.c:427: warning: Function parameter or member 'list2' not described in 'acpi_handle_list_equal'
>> drivers/acpi/utils.c:427: warning: Excess function parameter 'List2' description in 'acpi_handle_list_equal'


vim +427 drivers/acpi/utils.c

   416	
   417	/**
   418	 * acpi_handle_list_equal - Check if two ACPI handle lists are the same
   419	 * @list1: First list to compare.
   420	 * @List2: Second list to compare.
   421	 *
   422	 * Return true if the given ACPI handle lists are of the same size and
   423	 * contain the same ACPI handles in the same order.  Otherwise, return false.
   424	 */
   425	bool acpi_handle_list_equal(struct acpi_handle_list *list1,
   426				    struct acpi_handle_list *list2)
 > 427	{
   428		return list1->count == list2->count &&
   429			!memcmp(list1->handles, list2->handles,
   430			        list1->count * sizeof(acpi_handle));
   431	}
   432	EXPORT_SYMBOL_GPL(acpi_handle_list_equal);
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
