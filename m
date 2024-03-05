Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4A637145
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709649470; cv=none; b=M2cJFGQxN9oS7WTdn8kdbVr4e23Sf9h08V8PwfASmzg8JgpxzYK0Stt187u4rg4RFwm1hJLIaGwp1F7CC7TEerUMJZFPuennJgXbQpY93S9YgZIKWMtHEgepozWBhpbXHDkBnFFAMuXNzO0zKp/EcIMkM8QaeVE1PyL3l6TqSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709649470; c=relaxed/simple;
	bh=BSV/h01YnMwAWNgNUuvrI+z73YLfACBI6i+U+zG8XYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGjSl45MQnQCQLVTgzYKCU5fSPc3pE8V7+KOkD5PIARacO0+I6ILdbcF8qm04V4V1XH7UQ0NSvsU3YlKXgAxJ1Qi6SbsV/i0OC1zpgw1ChZN8UkzBk64JC3ODWD7O6HCvVCYmxLdfqDh0mjkeg5JtQdv4pKsz07Pd/aH2U+G9XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyBLgEOx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyBLgEOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709649468; x=1741185468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BSV/h01YnMwAWNgNUuvrI+z73YLfACBI6i+U+zG8XYA=;
  b=cyBLgEOxuGSJRa501Yhg1+zAO5Sj+Vu3uQ+p9vzGaRMWMuwxACLK8j0g
   iY5ozVf5LtWTS3Sn+uDFqRbXCh67hqaqWdFCyYbNj+iW8gQwq1/bAN24+
   faxVovxXVsWy8ktoeGINuO/RhfQI5YhK6pKpy/3M1GwB2qvvrNnEhuImp
   1XSs3ZrzJtVKTPI143H3e+PUOxbsqlu4/iQMKnRvGVbVd3dqQka4Ko8KW
   tLDzxU4uv9WrlEMpEzG1cB3G8qJU+p4PHHXlRMxgwZG0hbQ/3QSL1uyM9
   PdCoTgqS+xZeQTGXPMLqPSuRmv9XS/Rm5dddrH5QyFBpJnB81yuXREg/g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21662400"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21662400"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13959707"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2024 06:37:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhVvL-0003Mv-0W;
	Tue, 05 Mar 2024 14:37:43 +0000
Date: Tue, 5 Mar 2024 22:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	David Bauer <mail@david-bauer.net>
Subject: [linux-next:master 10916/11963] hppa-linux-ld: undefined reference
 to `i2c_adapter_depth'
Message-ID: <202403052226.7Y80cqvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11afac187274a6177a7ac82997f8691c0f469e41
commit: bfa5aa367a8226004b548b13ff8409c3b356af68 [10916/11963] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403052226.7Y80cqvB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052226.7Y80cqvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052226.7Y80cqvB-lkp@intel.com/

Note: the linux-next/master HEAD 11afac187274a6177a7ac82997f8691c0f469e41 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_probe':
>> (.text+0x16b8): undefined reference to `__devm_regmap_init_i2c'
>> hppa-linux-ld: (.text+0x1730): undefined reference to `i2c_adapter_depth'
   hppa-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_driver_init':
>> (.init.text+0x2c): undefined reference to `i2c_register_driver'
   hppa-linux-ld: drivers/pinctrl/pinctrl-aw9523.o: in function `aw9523_driver_exit':
>> (.exit.text+0x18): undefined reference to `i2c_del_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
