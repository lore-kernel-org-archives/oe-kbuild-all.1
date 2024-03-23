Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4322942A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711204686; cv=none; b=qVKdbSx6CKtwErvDvj7l5V00qYy53BK1aNbkxbcSM0gLWqRrUUVJ8Tl5gSDoBSlshZ4HPW3N9PoBRQEthZX00JKIJrkOBpBb/nZe+ZkuZg12Ts+wbZvR6fpSBKGFlFJGhAI5lGUUoWoKEaTkff6OclTqHoOuOm82lrVv0YyUxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711204686; c=relaxed/simple;
	bh=CLQw6/V6k3KyRL4I+lJyNuTbI0EyYEgAOGQAsThb6Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AxzD9pWXqSENUqEPz9usVKmhgfkmMglSHGfVSgCxEf7z+OIVY1mVVtADdsN7x5BYmSGtf8aGfvKi/RuZes1/5/M0zprRuSgzbkLh498vhXN2Bgp7CS3RNyqZiWmxdEWvL8eaQBfnHCL4I3nOZyionwqDUKm1dd1CeQQzJkaF5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3hnr/rH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3hnr/rH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711204683; x=1742740683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLQw6/V6k3KyRL4I+lJyNuTbI0EyYEgAOGQAsThb6Tg=;
  b=n3hnr/rHOyyz0HDIx0QkfHnqUtlbXIH00YIfZbFXddsi3v7oQQcQihWz
   sKW8PCqhFV3eo/mWfBE1FN7hRe3KjmwBH1whvLm6q85l3Zk5I9tVJp4cx
   lp6hZ8lyolSShm4BopYXkwoZQH+uT6n3XzVzBscuk5jY5GULuz8PG3MBc
   gMZUDBJBm6vVBjxL9CDxACIhZNEC2KgdWSq2wo9+PzhyQs+y6K8a49a2Y
   A8USQa6EoNUMIdouUfLfTXaPaRF9lPK9XrBf42aYGVpV83rg+WP6/jbrb
   ktEnFVM29KIkqcFjGoS0R0qMu+041tYojQ4xxC05Wb0pMqfAv/2LEz2X+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="31684250"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="31684250"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 07:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="46180018"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2024 07:38:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro2VT-000LER-0Y;
	Sat, 23 Mar 2024 14:37:59 +0000
Date: Sat, 23 Mar 2024 22:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 10/11] arch/nios2/kernel/prom.c:24:39:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202403232201.JtbvWJxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   471566efaf17fc2be0b9be63bf04d2c44fbb3b20
commit: a1f82fe941b07e2ba651fd5ace75e88209adb8ba [10/11] nios2: Only use built-in devicetree blob if configured to do so
config: nios2-randconfig-r132-20240323 (https://download.01.org/0day-ci/archive/20240323/202403232201.JtbvWJxL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240323/202403232201.JtbvWJxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232201.JtbvWJxL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/nios2/kernel/prom.c:24:39: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __be32 [usertype] *[unused] dtb @@     got unsigned int [usertype] * @@
   arch/nios2/kernel/prom.c:24:39: sparse:     expected restricted __be32 [usertype] *[unused] dtb
   arch/nios2/kernel/prom.c:24:39: sparse:     got unsigned int [usertype] *

vim +24 arch/nios2/kernel/prom.c

    21	
    22	void __init early_init_devtree(void *params)
    23	{
  > 24		__be32 __maybe_unused *dtb = (u32 *)__dtb_start;
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
