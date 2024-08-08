Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4A15C124
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723158524; cv=none; b=thPhVeWwUWBXvmycDq2apzt2nAuE3srZLoYzCOyV2zwMhM0GkrLsJyBlW9nQphOwUNcP0NhREiVWVWJb9vWC/uUShTE979h7mLA77g/vv4i10+RhKAknEwYaFUw0PwSV/ZunVxME/zozH/hpOEv2DASg+pQqIvIi0VrICutQ7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723158524; c=relaxed/simple;
	bh=EMkbpbdcGXFVdRSm05TR0btkyymIRtT6Ima8IuWYjWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPQA9zXu3f9FjcGI3gE/FHIH29uXbifHWBtPMV2Hp2nK0bIXzVwSd1kZmnVZ14wQGEtOTau2RtJtTVaRgO+qrNME+mC8nmR3wdKNa08awATKnVzA84gK1ixJa66AnmpjgKaP4Mw6USoKQR4T3qhe59nRNNEsWfFlyZzr6B59J/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQ7oYHk3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQ7oYHk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723158523; x=1754694523;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EMkbpbdcGXFVdRSm05TR0btkyymIRtT6Ima8IuWYjWY=;
  b=AQ7oYHk3+6ZhTvuTVgij6Pl5R8I8nw5xlNTlzw3xLfmT+eYrcNvhT+Wu
   UlCEYIZJx+kkbJBzP/e6pvjiTYoTqUrA416fbrn9C0GzU/CfRv9i6viCE
   WHlg1pdUPmzCxAQWslmVo9wmsneKHEg3RKD0HeOxXMXdN9MOVBkkG9Ljt
   NxmgaCuyT9fetB5uNFxInF9l7gs5Y30MPLvm0lAP9j0ramCBljEcCtyxG
   5ay+UT8ndQPfYSqOJR/+FQ63TlX0ayfpWAW1TJsDpCt4cFrPUqhWl55j1
   YJ7nKj2U4CgMFGptoqtbqh2M0JjeVRNQqUZ52KBeb527nqROIjz2lmxaU
   w==;
X-CSE-ConnectionGUID: KzLdYvvMRV+e9/5SKzqYUA==
X-CSE-MsgGUID: BXjwbwBDQYmIoPnMepCpdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20977156"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="20977156"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 16:08:42 -0700
X-CSE-ConnectionGUID: W+qZcjgnSP2/U/s2nj6B0Q==
X-CSE-MsgGUID: 7UOAS+kqRg+Xbicq2mOWuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62015804"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2024 16:08:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scCFK-0006bY-24;
	Thu, 08 Aug 2024 23:08:38 +0000
Date: Fri, 9 Aug 2024 07:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [linux-next:master 3286/3636]
 drivers/cpufreq/mediatek-cpufreq.c:741:34: warning: 'mtk_cpufreq_machines'
 defined but not used
Message-ID: <202408090714.wcrqU6Pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Rob,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   222a3380f92b8791d4eeedf7cd750513ff428adf
commit: c7582ec853427c895d990e0244f19fe22b44a366 [3286/3636] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: sh-randconfig-r123-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090714.wcrqU6Pk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240809/202408090714.wcrqU6Pk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090714.wcrqU6Pk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/mediatek-cpufreq.c:741:34: warning: 'mtk_cpufreq_machines' defined but not used [-Wunused-const-variable=]
     741 | static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/mtk_cpufreq_machines +741 drivers/cpufreq/mediatek-cpufreq.c

d3296bb4cafd4b drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang              2023-03-24  739  
cf9a2438257da2 drivers/cpufreq/mt8173-cpufreq.c   Daniel Kurtz               2017-03-02  740  /* List of machines supported by this driver */
862e0104f4d1a4 drivers/cpufreq/mediatek-cpufreq.c Sean Wang                  2017-08-09 @741  static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  742  	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  743  	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
0883426fd07e39 drivers/cpufreq/mediatek-cpufreq.c AngeloGioacchino Del Regno 2023-03-24  744  	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
f85534113f5ae9 drivers/cpufreq/mediatek-cpufreq.c Daniel Golle               2023-06-05  745  	{ .compatible = "mediatek,mt7623", .data = &mt7623_platform_data },
b69ec356db1a7c drivers/cpufreq/mediatek-cpufreq.c Sam Shih                   2024-04-19  746  	{ .compatible = "mediatek,mt7988a", .data = &mt7988_platform_data },
d3296bb4cafd4b drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang              2023-03-24  747  	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  748  	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  749  	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  750  	{ .compatible = "mediatek,mt8176", .data = &mt2701_platform_data },
0daa47325baee6 drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  751  	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
39b360102f3ac6 drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang              2022-05-05  752  	{ .compatible = "mediatek,mt8186", .data = &mt8186_platform_data },
ead858bd128d4e drivers/cpufreq/mediatek-cpufreq.c Rex-BC Chen                2022-05-05  753  	{ .compatible = "mediatek,mt8365", .data = &mt2701_platform_data },
d3296bb4cafd4b drivers/cpufreq/mediatek-cpufreq.c Jia-Wei Chang              2023-03-24  754  	{ .compatible = "mediatek,mt8516", .data = &mt8516_platform_data },
cf9a2438257da2 drivers/cpufreq/mt8173-cpufreq.c   Daniel Kurtz               2017-03-02  755  	{ }
cf9a2438257da2 drivers/cpufreq/mt8173-cpufreq.c   Daniel Kurtz               2017-03-02  756  };
af6eca06501118 drivers/cpufreq/mediatek-cpufreq.c Pali Rohár                 2020-11-03  757  MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
cf9a2438257da2 drivers/cpufreq/mt8173-cpufreq.c   Daniel Kurtz               2017-03-02  758  

:::::: The code at line 741 was first introduced by commit
:::::: 862e0104f4d1a489517cb1075ce974c0a1fd5a97 cpufreq: mediatek: add cleanups with the more generic naming

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
