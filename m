Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F148E1CD2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734181777; cv=none; b=X0h+XagJDkujaqscztIrXGeI+aGQvuaR+oLOpLimlJtgUKkgfqsCCv00TuCkyHcJpk5pGuA8Grub4v1IuHWylrgqLEXlQu/Qp6V3aYoxJRBaQAxHeGNSwp4p9rSXJL5E+QtqbYkjlSrWfMLb4O6tvOLtLksBnU1WWdT0mEE/Weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734181777; c=relaxed/simple;
	bh=BFBC9bgLymTblvzTUIPN4DpLB8Y8d1DiCOYacHej91s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T72oIJc39dhY7jDX3x97CoAUVEdE0TXma3VeDbipPrZ7puOvqYn7WVNXCg1QzRdaJ8Dyh88Fq/paIXaIDvADFd4GRMpGKqP3PNT/y3zbNTqtUhOgYh+q77nOqeo8Y6kgNaa366e7ouyXp7+wxkcs33f85YdSYVdyEpqN9peHrFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad89dfb7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad89dfb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734181775; x=1765717775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFBC9bgLymTblvzTUIPN4DpLB8Y8d1DiCOYacHej91s=;
  b=ad89dfb7Au5bjHPcI8K+BnDVkUW4B8N9XeeJMT3RfhPRzovsBNvTWomZ
   Z+x72Gp66RvoANHDNfsXsRfkZJYIbcFR+ICeXBJM7xjJ3RHh2F22ChVr1
   p6madmXdXAIRqj5ihM1sAc7lbdC97E/lZ8QtM/e22RRuNfkmE+QBuAO4O
   3TKz/1A4iIGwmf1wX8n+37ZgstLgrHWIJ/FUo2e9mqeQKYHgB5QhKqe0e
   DyDI20f2yc2gZzOIBxZrynOy5UaUasrUw+/kH8YkBtmC59+xw39kcirGH
   VyTtBy+sloq/sPLa+bdP/9ZbURbb3hArVx0PZEZoBORlXlyW42Q0J+9KO
   g==;
X-CSE-ConnectionGUID: cJ5/lLI1SG+VBolK4TxRcw==
X-CSE-MsgGUID: QbB29vZCT6SD4C77RIRFIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34771610"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34771610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 05:09:34 -0800
X-CSE-ConnectionGUID: spC9rXqHTra5/VaWxkfXCw==
X-CSE-MsgGUID: 0cpPGjVpSb2a9pXqt5YbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="97016320"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Dec 2024 05:09:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMRtj-000Cwf-1m;
	Sat, 14 Dec 2024 13:09:31 +0000
Date: Sat, 14 Dec 2024 21:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 38/40] drivers/hid/hid-himax.c:5345:35:
 warning: 'himax_spi_id' defined but not used
Message-ID: <202412142013.0V3kFuCJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   dccc901bd5fe4dba6ee0f15af2be9ed3bd78a8ff
commit: 95761e94632784b706c0af113dfe08ab97f85e7e [38/40] CHROMIUM: HID: hid-himax: Add spi_device_id
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241214/202412142013.0V3kFuCJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412142013.0V3kFuCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412142013.0V3kFuCJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-himax.c:5345:35: warning: 'himax_spi_id' defined but not used [-Wunused-const-variable=]
    5345 | static const struct spi_device_id himax_spi_id[] = {
         |                                   ^~~~~~~~~~~~


vim +/himax_spi_id +5345 drivers/hid/hid-himax.c

  5344	
> 5345	static const struct spi_device_id himax_spi_id[] = {
  5346		{ "hx83102j" },
  5347		{ },
  5348	};
  5349	MODULE_DEVICE_TABLE(spi, himax_spi_id);
  5350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
