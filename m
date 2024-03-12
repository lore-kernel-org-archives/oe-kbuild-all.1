Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B916FF59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 02:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710210613; cv=none; b=A1tWY26jlCnmh0MOCoWcTeIFQ5kCc5t8isEoqyboUBAY2ERhVVgmAiu75uzdpbzbVxU8u9e2rgjEBUtcTXMPi7L4SQaL484GEGN+S0mpnFQpXye1gvvkHzV8yIPOpl7nFCdbJodN+zo2RgSPcUOShcFifaqtfTZJZhoF1h+s498=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710210613; c=relaxed/simple;
	bh=yEnH/acpM541agRe7qHU1yFlavkSJr3HsbepFl8mdmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fz/1yzK8K9qEr6IWiUQTHk/+2FamHh6vTR0o4yIpnWXO8/bNM3JX10hfUTEQm+At4yCCyVF0Nhjd92oByVcEkVhcCX2VGrRkmeQ+xqTiQoRy7k7XzHJqm2mRQXgnipIEBn+PpDTsHAGZbwtJ/pNyfEcHjVum3d0S6NIxwW1gQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS+Moj3z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS+Moj3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710210610; x=1741746610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEnH/acpM541agRe7qHU1yFlavkSJr3HsbepFl8mdmI=;
  b=VS+Moj3z+7+riMZuPaxlpQncHCZPvz4k79J0LSKC2jdhIkenU9LmppW0
   sY2Otsm1DQDnl94a2PpZHCb99rd+bcv/pLdh/cS8trToliEkbV/fIQ37F
   qPcy5FLzBSMbSqOf5VYxdXr1bXzfi5TH1dMQP8MFOwd5aaGjTR6kFnFNv
   lVdBGL1n1rhWGgB6iW31tip3iVmwiSvw6EwVq8T2G9eopb+0Y7eLpE8qZ
   JhzFNXcnaGdh0WEn8rVxPw1DwDxkjQL0+pnNYlCk7WABJyFqj6Jxm49JX
   JojamZasigliB0++l25qkcx2ZEoaOC8KVR41/w0PXgCYreTh5P9Th2uUr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="16344362"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="16344362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 19:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42290517"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2024 19:30:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjru0-0009fB-1i;
	Tue, 12 Mar 2024 02:30:04 +0000
Date: Tue, 12 Mar 2024 10:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [net-next:main 4/19] WARNING: modpost: vmlinux: section mismatch in
 reference: bitmap_copy_clear_tail+0x58 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <202403121032.WDY8ftKq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   f095fefacdd35b4ea97dc6d88d054f2749a73d07
commit: de5f84338970815b9fdd3497a975fb572d11e0b5 [4/19] lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers
config: xtensa-randconfig-001-20240311 (https://download.01.org/0day-ci/archive/20240312/202403121032.WDY8ftKq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403121032.WDY8ftKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403121032.WDY8ftKq-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: put_page+0x58 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_copy_clear_tail+0x58 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
