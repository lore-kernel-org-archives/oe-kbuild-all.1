Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC0320F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 17:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709140674; cv=none; b=CvyNZDu+6UrvrE0X/0LWCl5cWbZErXwRP20ZdVbM7e8W1Ej5Ob9NFNrYrNPgcPpnhMUIKp+Zo98N1zQ05FQsDDzoMJiU0pDG5szQEYHSiiH6Vwz6tX35Gr9QkuvPZsefQDTa3QwheiMyPWxjq/QULZMoIU2WPjNBxWmtTWZJQD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709140674; c=relaxed/simple;
	bh=AtdBJ+s84xkHkddOs/7oC5o5SMK4Wjsa9WjmoN9vsw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HIdvnltmbjXBWH5qkebG/IcoweVip+HvTk1LbFmM1WBW884USq5V7eGFGzFJKY14oQaat2NFFXBhqpnvPzqeS8ZcQxxlVUTBClqlXH6TjhyXfI+k2exJAnil4DXTORB25Dh2yXe5XTnkZyC3utSxe9l9sbCfugjYB/Mum3PjEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPxkC1YK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPxkC1YK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709140672; x=1740676672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AtdBJ+s84xkHkddOs/7oC5o5SMK4Wjsa9WjmoN9vsw0=;
  b=WPxkC1YKwfrAM1ANeIR95m+9tHGWXJ10z1RpNHLf/wnHWU+Zc5ClNnN2
   gxFqePosS3TWbyo3cdIQnerZizvvVQoMvyYSwDrns2QQdteBNzTcAWAN7
   DbS/fZfvJaWAOg3jpmySRRw++qrwbYpJ+u/p+jrTN8PCELS1Lwmy3nxj3
   zkY0KVqRcK4FnnN7Zf+DggKvyrcwa24z/VhXyuC8e44feGffynLmAfh7I
   HkmcA3XSgnUxxUlc04345o5keXgE0C0qlyMTfohkY7ahVW+DvuphC9Xb1
   VECLeovOsdECuzaLzLoh4bvN97NDATkN/XUg93pJ9woUvn/e4a6tqQxyx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3475175"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3475175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 09:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="12070683"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2024 09:17:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfNYy-000CGd-0G;
	Wed, 28 Feb 2024 17:17:48 +0000
Date: Thu, 29 Feb 2024 01:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [linux-next:master 9574/10830]
 drivers/power/supply/power_supply_core.c:1630:9: error: too few arguments to
 function 'power_supply_init_attrs'
Message-ID: <202402290152.FpUEAK3i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 7b46b60944d77e361a727cd8ce46aec31c146e26 [9574/10830] power: supply: core: constify the struct device_type usage
config: alpha-randconfig-r016-20220129 (https://download.01.org/0day-ci/archive/20240229/202402290152.FpUEAK3i-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290152.FpUEAK3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290152.FpUEAK3i-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/power/supply/power_supply_core.c: In function 'power_supply_class_init':
>> drivers/power/supply/power_supply_core.c:1630:9: error: too few arguments to function 'power_supply_init_attrs'
    1630 |         power_supply_init_attrs();
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/power/supply/power_supply_core.c:25:
   drivers/power/supply/power_supply.h:25:20: note: declared here
      25 | static inline void power_supply_init_attrs(struct device_type *dev_type) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/power_supply_init_attrs +1630 drivers/power/supply/power_supply_core.c

  1621	
  1622	static int __init power_supply_class_init(void)
  1623	{
  1624		power_supply_class = class_create("power_supply");
  1625	
  1626		if (IS_ERR(power_supply_class))
  1627			return PTR_ERR(power_supply_class);
  1628	
  1629		power_supply_class->dev_uevent = power_supply_uevent;
> 1630		power_supply_init_attrs();
  1631	
  1632		return 0;
  1633	}
  1634	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
