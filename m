Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643755887
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723614571; cv=none; b=gZSACwUj8Gos0mt/gaIznAjzD/bQSW8bFTcYB3AOmgMAnyH9H7dWH6iNS1ZLiV5CS3rh7PO2D5tzyblPjohkIxwQxCmzLespmxoHgsuwryIDsMWEOzlaxzzSis96kh7kz7581TObZmrz/zGEBkyxoIvT6QL+mUsumC9TGTGA3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723614571; c=relaxed/simple;
	bh=kHPU3ROaXaMl0Zwfp5aF4lDohALQD88pw92KXKgR/vI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FpX+Lvot1Ea0UZuSi0suxonGjkLZWERyp8Z1VXYSU1lXo24GlkGj/AnV8m9rGE8CSScmTtATBgN6vF/rPkHqJlNqr5ywIMXkC2VD+gapAMwD7SQoKahprUa0RXDTyoulO8N/gdFWMDrVp8zF5ydQrFu5M7RTDJRjGDZMCwihc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCSHYhaN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCSHYhaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723614570; x=1755150570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHPU3ROaXaMl0Zwfp5aF4lDohALQD88pw92KXKgR/vI=;
  b=YCSHYhaN4qlmAzYpgRw9ox6gX7IrwPJYx1fYXoSjChfROA4j2pLAZ8cW
   PQvByNJUqhBS1dLVwf3CNTDk4kzGITvru9FKHhP8TqODKgnaVR/oYRwqT
   3dbJ2oPxdqKY+Q9gvfZmeNfm6edK88HsDPg809NoAYmE38SqUlxnsNO/d
   8oZTyeZzy2VJ5a+yGiz/uEt4QWbeNigD9UqLc0T9gXcvq6B6Y26uQE15R
   BMWtJZSdtNrNLW8hmSJLpz7ndMvu+/VXukzSVqRUt4ASVSGsqsNpkgQBH
   F1o+U+0j/Qdy/cT1KaTDqzPscx8IEQeGlczfsNLFND2IwEHfqKLwRJbAw
   w==;
X-CSE-ConnectionGUID: SOPM7t52SZChSeHxFth10w==
X-CSE-MsgGUID: 8WdgwLryQSK8VqhBF8ElXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="24720267"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="24720267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 22:49:28 -0700
X-CSE-ConnectionGUID: QCMPB+9kR6COqKoBXUH3ow==
X-CSE-MsgGUID: ldqAv8L2SpCgnIbo9NMvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63559001"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2024 22:49:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se6sv-0001Fe-1Y;
	Wed, 14 Aug 2024 05:49:25 +0000
Date: Wed, 14 Aug 2024 13:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:asoc-6.12 43/43]
 sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:33: error: tentative
 definition has type 'struct skl_machine_pdata' that is never completed
Message-ID: <202408141323.pfWe2wEf-lkp@intel.com>
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
config: x86_64-randconfig-161-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141323.pfWe2wEf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141323.pfWe2wEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141323.pfWe2wEf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:33: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct skl_machine_pdata' [-Wtentative-definition-incomplete-type]
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:15: note: forward declaration of 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata skl_dmic_data;
         |               ^
>> sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:33: error: tentative definition has type 'struct skl_machine_pdata' that is never completed
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-skl-match.c:12:15: note: forward declaration of 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata skl_dmic_data;
         |               ^
   1 warning and 1 error generated.
--
>> sound/soc/intel/common/soc-acpi-intel-kbl-match.c:12:33: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct skl_machine_pdata' [-Wtentative-definition-incomplete-type]
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-kbl-match.c:12:15: note: forward declaration of 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata skl_dmic_data;
         |               ^
>> sound/soc/intel/common/soc-acpi-intel-kbl-match.c:12:33: error: tentative definition has type 'struct skl_machine_pdata' that is never completed
      12 | static struct skl_machine_pdata skl_dmic_data;
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-kbl-match.c:12:15: note: forward declaration of 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata skl_dmic_data;
         |               ^
   1 warning and 1 error generated.
--
>> sound/soc/intel/common/soc-acpi-intel-cnl-match.c:18:33: error: variable has incomplete type 'struct skl_machine_pdata'
      18 | static struct skl_machine_pdata cnl_pdata = {
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-cnl-match.c:18:15: note: forward declaration of 'struct skl_machine_pdata'
      18 | static struct skl_machine_pdata cnl_pdata = {
         |               ^
   1 error generated.
--
>> sound/soc/intel/common/soc-acpi-intel-icl-match.c:17:33: error: variable has incomplete type 'struct skl_machine_pdata'
      17 | static struct skl_machine_pdata icl_pdata = {
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-icl-match.c:17:15: note: forward declaration of 'struct skl_machine_pdata'
      17 | static struct skl_machine_pdata icl_pdata = {
         |               ^
   1 error generated.
--
>> sound/soc/intel/common/soc-acpi-intel-hda-match.c:12:33: error: variable has incomplete type 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata hda_pdata = {
         |                                 ^
   sound/soc/intel/common/soc-acpi-intel-hda-match.c:12:15: note: forward declaration of 'struct skl_machine_pdata'
      12 | static struct skl_machine_pdata hda_pdata = {
         |               ^
   1 error generated.


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
