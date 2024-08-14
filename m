Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5E1AED3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723635409; cv=none; b=jsDg+rSXbVEgo4mZXOR79bYFeP7JtsqAUA1STuTYYQRv2XVPz20C5psIugSPhpdZxhcYD+9SA3Tu5w95q1gmxrqb025nbGYNYCNlRjVTNgN4h2WnaGEEs+YqPbx8hUNJ7q6bIM/oPBC0HyMMxtljdOP0RI4Xoci4xA0WtgQTtHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723635409; c=relaxed/simple;
	bh=15PMibqYnOhvqo/AuKGdGLqaANmNpBfwsebgZs57vTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+7pjyO+n10p+pfHVroGf2Aq24DMGCqJyeEJsgqx5H9TVu+6IyupSuEGCLCRWK0v/1BEd6hcjwBHYwKh3r/5sCFozzGriqfDU5A2/fDo3LfgjopV8cb1/B5UGGndBeJehb6+djJ6fTYkzBeJuybZxD8pRqnnFIXpfNXTfQe6S28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep4MUH5u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep4MUH5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723635407; x=1755171407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=15PMibqYnOhvqo/AuKGdGLqaANmNpBfwsebgZs57vTI=;
  b=ep4MUH5uKH3TJmc3S671gqHIvaw8lrJQyDkhgWJnYY9n29qi6r0Kemjw
   +YTlHgcFi8R8d68sIZ4FL3DjzD931rM3pLr+T9NGZ9sdZO96naMY+RnZF
   IjnKEo/LEpbKso43ebKTfLmvtnVju+W4yB+pKWhgRV9AA3cfKxhIwnqv3
   oIOTEpK2gGl8aeIsfj+S0oXeDWpclLKHxU5ywcc+G3r4FIhpM+wJccjGY
   iF+uvZZ+qDqH9yBr1kWF9XR7eo12yqXIE/MsykaJmiXMxo0ZG4xz3vAdV
   uZVlkKKzPNUSjBTEKbQIycj9Q8PVRy7NWCD31ulsR4HWuL0sjDGNz5/Ed
   Q==;
X-CSE-ConnectionGUID: 6TJ+hg+0Tc+EP7AgkE/keQ==
X-CSE-MsgGUID: J6qy5fUsT3G7eh8bV3/lrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="13006112"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="13006112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:36:47 -0700
X-CSE-ConnectionGUID: hQZ8dWiKTayuOoMPKKtW6A==
X-CSE-MsgGUID: UZWtUUfeRZ6j7Otn8U8TUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="63831682"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 04:36:45 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seCJ1-0001cq-1W;
	Wed, 14 Aug 2024 11:36:43 +0000
Date: Wed, 14 Aug 2024 19:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:asoc-6.12 43/43]
 sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:33: error: storage size
 of 'skl_dmic_data' isn't known
Message-ID: <202408141940.SwfIrXwI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-6.12
head:   19eb805d7644939feb4b5a7a5c0c30f014a9872a
commit: 19eb805d7644939feb4b5a7a5c0c30f014a9872a [43/43] ASoC: Intel: Remove skylake driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240814/202408141940.SwfIrXwI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141940.SwfIrXwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141940.SwfIrXwI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:33: error: storage size of 'skl_dmic_data' isn't known
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^~~~~~~~~~~~~
--
>> sound/soc/intel/common/soc-acpi-intel-kbl-match.c:12:33: error: storage size of 'skl_dmic_data' isn't known
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^~~~~~~~~~~~~
--
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:18:15: error: variable 'cnl_pdata' has initializer but incomplete type
      18 | static struct skl_machine_pdata cnl_pdata = {
         |               ^~~~~~~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:19:10: error: 'struct skl_machine_pdata' has no member named 'use_tplg_pcm'
      19 |         .use_tplg_pcm = true,
         |          ^~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:19:25: warning: excess elements in struct initializer
      19 |         .use_tplg_pcm = true,
         |                         ^~~~
   sound/soc/intel/common/soc-acpi-intel-cnl-match.c:19:25: note: (near initialization for 'cnl_pdata')
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:18:33: error: storage size of 'cnl_pdata' isn't known
      18 | static struct skl_machine_pdata cnl_pdata = {
         |                                 ^~~~~~~~~
--
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:17:15: error: variable 'icl_pdata' has initializer but incomplete type
      17 | static struct skl_machine_pdata icl_pdata = {
         |               ^~~~~~~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:18:10: error: 'struct skl_machine_pdata' has no member named 'use_tplg_pcm'
      18 |         .use_tplg_pcm = true,
         |          ^~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:18:25: warning: excess elements in struct initializer
      18 |         .use_tplg_pcm = true,
         |                         ^~~~
   sound/soc/intel/common/soc-acpi-intel-icl-match.c:18:25: note: (near initialization for 'icl_pdata')
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:17:33: error: storage size of 'icl_pdata' isn't known
      17 | static struct skl_machine_pdata icl_pdata = {
         |                                 ^~~~~~~~~
--
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:12:15: error: variable 'hda_pdata' has initializer but incomplete type
      12 | static struct skl_machine_pdata hda_pdata = {
         |               ^~~~~~~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:13:10: error: 'struct skl_machine_pdata' has no member named 'use_tplg_pcm'
      13 |         .use_tplg_pcm = true,
         |          ^~~~~~~~~~~~
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:13:25: warning: excess elements in struct initializer
      13 |         .use_tplg_pcm = true,
         |                         ^~~~
   sound/soc/intel/common/soc-acpi-intel-hda-match.c:13:25: note: (near initialization for 'hda_pdata')
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:12:33: error: storage size of 'hda_pdata' isn't known
      12 | static struct skl_machine_pdata hda_pdata = {
         |                                 ^~~~~~~~~


vim +12 sound/soc/intel/common/soc-acpi-intel-skl-match.c

cbaa7f0bdbee19 Pierre-Louis Bossart 2018-06-18  11  
cbaa7f0bdbee19 Pierre-Louis Bossart 2018-06-18 @12  static struct skl_machine_pdata skl_dmic_data;
cbaa7f0bdbee19 Pierre-Louis Bossart 2018-06-18  13  

:::::: The code at line 12 was first introduced by commit
:::::: cbaa7f0bdbee1969bb311c641abbd0d2af6ba861 ASoC: Intel: move SKL+ codec ACPI tables to common directory

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
