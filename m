Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C2E2080C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742182939; cv=none; b=YXb7soIdv1BdQg9YQoshHXvLT6grFn7lpZ2aBxOW02BZPdrWE0yFMS6gCsUfYDoriHq/ZGmIjmgTK9jEyVZ4OnQ8CHPMrMY/hTGkypJiJF5MRaecOIlH/lf/MeqUqSbpO8YER0PDAmQpQMpindsrzs9n9yuQu9GjmrN2fxlyLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742182939; c=relaxed/simple;
	bh=SN1bNrpzlU7TSHABID9T9Q0IN2dT93nyQ2zY5z4QNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8NKiOflatB8xJv253+neuLkpDN+UIAeSSNoA2oVaKLx312O8crqDJcUGxJnwkxAholTMPBg0k6Gg4IvfrmIYlIqJsakTFRf+iM9kcQxURBGncjG1WByvL5GO7n5KWOVJTIqL8jLSPubQVf0tf9ImCXrletnPAXO5Mi9tQy+T+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8XsTGjJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8XsTGjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742182938; x=1773718938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SN1bNrpzlU7TSHABID9T9Q0IN2dT93nyQ2zY5z4QNUU=;
  b=O8XsTGjJAzeWL/k43ZpGfTepMD1X4/GwtomW84QA5oifP1ZU/IL1zp/S
   0fCxRkGTMBs3UlLp51T/rHQuYrKFRD4I3hOFNV70UtO4e6mXGmvVw/+HP
   kyQrmYxdliS3IsLWcNIyLm0tDuh9pQlCrozalSk+QdDXpwi4tMR6NBgqb
   jaQcPgJ545Vic6vsIIPS8wmtDq3Wmc1CXBaD4KBbJdQ5wv73o2DqPuHnK
   NfUUHUzz8zCniCh9PswXIjpwQbwwUePB7MDv7k5vfkm5nOZft87vCOMpu
   DdqExhk7YlqzXYOqSH1XgDbQ5y9vchWWVOLrCqs0YTcrAhRUYrONVfepe
   w==;
X-CSE-ConnectionGUID: BhDJcmCMSo6/K+RQlS7I4w==
X-CSE-MsgGUID: D1wQQCC0R/qFt2oA0lEKzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="42440932"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="42440932"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 20:42:17 -0700
X-CSE-ConnectionGUID: 28o7AG1FTb2mNFT09kyIDg==
X-CSE-MsgGUID: nMoo+rt3TpKd5VZhJYyanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121534265"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2025 20:42:15 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu1Mj-000CQz-16;
	Mon, 17 Mar 2025 03:42:13 +0000
Date: Mon, 17 Mar 2025 11:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 113/194]
 sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi'
 defined but not used
Message-ID: <202503171139.HSG8dCAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
commit: 87d228cc39db9625da9b75daaed25be23ec0a667 [113/194] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()
config: csky-randconfig-001-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171139.HSG8dCAn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171139.HSG8dCAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503171139.HSG8dCAn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used [-Wunused-function]
     949 | static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/cs35l56.c:942:12: warning: 'cs35l56_runtime_suspend_i2c_spi' defined but not used [-Wunused-function]
     942 | static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cs35l56_runtime_resume_i2c_spi +949 sound/soc/codecs/cs35l56.c

   941	
 > 942	static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
   943	{
   944		struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
   945	
   946		return cs35l56_runtime_suspend_common(&cs35l56->base);
   947	}
   948	
 > 949	static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
   950	{
   951		struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
   952	
   953		return cs35l56_runtime_resume_common(&cs35l56->base, false);
   954	}
   955	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
