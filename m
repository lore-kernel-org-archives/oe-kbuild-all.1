Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4A79CD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Oct 2025 23:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759707992; cv=none; b=mYqLZh7uxneoh81naVpLfyrqw6jcxFQP/J8kp6Ec/J0aG/70F54qXCNfUlmH7VBZRwOg1i9SFQRlORYddtncCAW9PGsXc7U35CL2XAjozmO/E/4n3/zUyPLwKfwyGZkhC/EvGE8CwmYGmHdm15RReEmPx5mUBKN51H4T8Ez5fS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759707992; c=relaxed/simple;
	bh=bWd+acx4FighV7OLpuFhAow2jBjh8y9ifOfxAY/RBhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b17eWp6Um/qMkZkwtgJePJk66GvojEuuX2cUTAE+9lECd4vH1P6unUGia5LXsBE2dBsKdCJurrFKd7RH8j2WL3C/L6hT8areSgy/RY5ZN1u+yRUHJwEV1TQtprriMmpLyKDx1GpEVC6Uu0p1US/oQS/4MKghKfz2EgD6CaQ5Dsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3YrCcp8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3YrCcp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759707991; x=1791243991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWd+acx4FighV7OLpuFhAow2jBjh8y9ifOfxAY/RBhM=;
  b=X3YrCcp8SXZ348achfXPIqlCDKSMTOINyfFo0YcC48vKbO1SY1yLIxY/
   YS+W4BUz+cyhGrLzUZRREMskgAkyM7awcfWwsEBbV5eJK7LDBumYdHd4z
   NUuP/B0k5cGNUsDrXU/19DotAdV1ZPm+dvn5Ztz+G2snQRi3YWOEEip9n
   h8Pf9sgHEiKjDV6NcctcPPy0FyGzPInkiRF22huVsFSCg7P2mPEPf6SvD
   VARYKUxkJbm8rFLiZbDVF4rIS4lmK+lJH5qjzCpHKvfvT396tmr4VlA6a
   OEHcUWheIQ5XdTmGlnT9y6LoXdfZMBTfza717jRdBvkrtC/8joVGAUGRR
   Q==;
X-CSE-ConnectionGUID: uEy/VWTzSVu+BySDztrhwQ==
X-CSE-MsgGUID: 4ZsPsC2nTlKclCLC2YgmVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61771064"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; 
   d="scan'208";a="61771064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2025 16:46:30 -0700
X-CSE-ConnectionGUID: 3Mrkr3mKR+yN4elDOllGqw==
X-CSE-MsgGUID: vz2AJXhbS7i3E9AOFgEtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; 
   d="scan'208";a="185042267"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2025 16:46:29 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v5YQs-000000007k1-3gRw;
	Sun, 05 Oct 2025 23:46:26 +0000
Date: Mon, 6 Oct 2025 01:45:41 +0200
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sj:damon/next 120/121] htmldocs:
 Documentation/admin-guide/mm/damon/stat.rst:13: WARNING: malformed hyperlink
 target. [docutils]
Message-ID: <202510060124.YaUaLfkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   d2a846a38c8b6e1f2473db076998642ea3bac918
commit: 94d350c7971494ad1967e5d04745401a08adbd83 [120/121] Docs/admin-guide/mm/damon/stat: document aggr_interval_us parameter
reproduce: (https://download.01.org/0day-ci/archive/20251006/202510060124.YaUaLfkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510060124.YaUaLfkH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pci.h
   ERROR: Cannot find file ./include/linux/mod_devicetable.h
   WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
   ERROR: Cannot find file ./include/linux/bootconfig.h
   WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>> Documentation/admin-guide/mm/damon/stat.rst:13: WARNING: malformed hyperlink target. [docutils]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
--
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/admin-guide/mm/damon/stat.rst:51: WARNING: undefined label: 'damon_stat_monitoring_accuracy_overhead' [ref.ref]


vim +13 Documentation/admin-guide/mm/damon/stat.rst

    12	
  > 13	.. _damon_stat_monitoring_accuracy_overhead
    14	
    15	Monitoring Accuracy and Overhead
    16	================================
    17	
    18	DAMON_STAT uses monitoring intervals :ref:`auto-tuning
    19	<damon_design_monitoring_intervals_autotuning>` to make its accuracy high and
    20	overhead minimum.  It auto-tunes the intervals aiming 4 % of observable access
    21	events to be captured in each snapshot, while limiting the resulting sampling
    22	events to be 5 milliseconds in minimum and 10 seconds in maximum.  On a few
    23	production server systems, it resulted in consuming only 0.x % single CPU time,
    24	while capturing reasonable quality of access patterns.
    25	
    26	Interface: Module Parameters
    27	============================
    28	
    29	To use this feature, you should first ensure your system is running on a kernel
    30	that is built with ``CONFIG_DAMON_STAT=y``.  The feature can be enabled by
    31	default at build time, by setting ``CONFIG_DAMON_STAT_ENABLED_DEFAULT`` true.
    32	
    33	To let sysadmins enable or disable it at boot and/or runtime, and read the
    34	monitoring results, DAMON_STAT provides module parameters.  Following
    35	sections are descriptions of the parameters.
    36	
    37	enabled
    38	-------
    39	
    40	Enable or disable DAMON_STAT.
    41	
    42	You can enable DAMON_STAT by setting the value of this parameter as ``Y``.
    43	Setting it as ``N`` disables DAMON_STAT.  The default value is set by
    44	``CONFIG_DAMON_STAT_ENABLED_DEFAULT`` build config option.
    45	
    46	aggr_interval_us
    47	----------------
    48	
    49	Auto-tuned time interval for the last snapshot in microseconds.
    50	
  > 51	The current aggregation interval of DAMON that :ref:`auto-tuned
    52	<damon_stat_monitoring_accuracy_overhead>`.
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
