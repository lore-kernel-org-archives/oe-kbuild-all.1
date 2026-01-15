Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B093A4F22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502596; cv=none; b=TwYG5pFRn4Q60fN9RrNerdjzvNGEmbVDx/chK08FPnHZDN64Ldlbkno2JXCNs+mSwaMDE/yfx8YXztbdSQgphCbIRJlWjiSegmswPNVeS8FB9g94wsofK/+HCZKxhVCCqSSzw9nzvyAawpVtEL5pkmM6wVNQMiZ7Lvp5rLi3mNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502596; c=relaxed/simple;
	bh=56pqUJh4sAtJBCUoN8pmAOFLBZg+vLjEO4x1dEopHq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dJfumITkTD2wlAACqbmT3yuSc1N+G5BauqEkC4ObrBAEYhaZuZc6hfmS149F8dZXealfIssp7HrASOP6ZTm+Dt+/fM7B/sIR7Bqq7xZMVRTV/gsRKMuZCku3CmuTDHG7JWe2CamSyG212umnlqvku16DRHH0xaXVvWDCaX6NKNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9YdguMb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9YdguMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768502590; x=1800038590;
  h=date:from:to:cc:subject:message-id;
  bh=56pqUJh4sAtJBCUoN8pmAOFLBZg+vLjEO4x1dEopHq0=;
  b=c9YdguMbe+NjGRaDoe9oBH+hUIvKv+G0jjPa8UMplkGh4j+RxkYkMNDz
   Gz0w45ymbIidF/eUC4F8ZkN73nhd2gvhRoaqATidMkNjNP+AlHVmxvSMG
   463HbHl5t9kriSdAUshOWIPh4AtLpkKt8wof+RaPiwX+assL9XkriaSDg
   dWc1dAnk5SmI8s8b5l6S8WI1aQVaDeLkZbJpgg/gS93LogFSPHhmJqP+Z
   XC/zTryb2AUbHspAolSUKxRbdoEb9hooMtQVM1vTBqa+hk1uzfJ3mY41X
   IEJy+gNN2uQIBbxSoSLUctmnq6qGkLCc+5uZxE4WE8FqEID/u5Lnt0tDw
   Q==;
X-CSE-ConnectionGUID: OttYRVeySiCzXlHf73/NGw==
X-CSE-MsgGUID: 2n0ilw1zRnaS79eaoygG1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69866381"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69866381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 10:43:08 -0800
X-CSE-ConnectionGUID: Xp6mXIEIS16KLZcBsJEMKg==
X-CSE-MsgGUID: BoeVQ5cNSqKDHV6/muCDlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209534121"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 10:43:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgSJE-00000000Jo4-0xQz;
	Thu, 15 Jan 2026 18:43:04 +0000
Date: Fri, 16 Jan 2026 02:42:12 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [broonie-sound:for-next 15/25]
 sound/soc/sdca/sdca_interrupts.c:212:40: error: 'struct dev_pm_info' has no
 member named 'completion'
Message-ID: <202601160246.Zt6bsnOG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   3360c59d45396dfbf0baf8bad2b2b516d7649098
commit: ffd7e8a101110cba86925a2906d925e0db7102f3 [15/25] ASoC: SDCA: Device boot into the system suspend process
config: x86_64-randconfig-123-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160246.Zt6bsnOG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160246.Zt6bsnOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160246.Zt6bsnOG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sdca/sdca_interrupts.c: In function 'fdl_owner_handler':
>> sound/soc/sdca/sdca_interrupts.c:212:40: error: 'struct dev_pm_info' has no member named 'completion'
     212 |         if (completion_done(&dev->power.completion)) {
         |                                        ^
   sound/soc/sdca/sdca_interrupts.c:226:40: error: 'struct dev_pm_info' has no member named 'completion'
     226 |         if (completion_done(&dev->power.completion))
         |                                        ^


vim +212 sound/soc/sdca/sdca_interrupts.c

   200	
   201	static irqreturn_t fdl_owner_handler(int irq, void *data)
   202	{
   203		struct sdca_interrupt *interrupt = data;
   204		struct device *dev = interrupt->dev;
   205		irqreturn_t irqret = IRQ_NONE;
   206		int ret;
   207	
   208		/*
   209		 * FDL has to run from the system resume handler, at which point
   210		 * we can't wait for the pm runtime.
   211		 */
 > 212		if (completion_done(&dev->power.completion)) {
   213			ret = pm_runtime_get_sync(dev);
   214			if (ret < 0) {
   215				dev_err(dev, "failed to resume for fdl: %d\n", ret);
   216				goto error;
   217			}
   218		}
   219	
   220		ret = sdca_fdl_process(interrupt);
   221		if (ret)
   222			goto error;
   223	
   224		irqret = IRQ_HANDLED;
   225	error:
   226		if (completion_done(&dev->power.completion))
   227			pm_runtime_put(dev);
   228		return irqret;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
