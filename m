Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBD12BD00C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Sep 2026 04:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533322; cv=none; b=QICgPca/JKT+f3z9uMMJjVMqOZYOaXmCGX8RrwxbeaMGapoG3KHrLD3Pm6urq61aZxGav/ZvHgWDJy/tKy/ExXUwiVazgHktaEa8SBjZhj1TMWsePcvt9/5LAUImzNwph4+Mug0WY72TBQBpXTsIYk5OHbndsCYa2L1RCvfPlHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533322; c=relaxed/simple;
	bh=Qf5RHlGP+5/dbO5W8opxX9YfyZ+mCqlFwH7c1yvqoYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p9is/bz//ZQ2PtRaUCd30uSOxUFoqYoWw4pueJ0lCJVh3Osvc8vyxscfZ5HlINf5djdOAbXcTHsMWZ2jS3aFcStIcg7Z0GFql8T6L8c99lctZjU2hrJ5kNTS9RAJU5tTrQxTo3suWzV1F6lYMugAZh9DXOyE0Dh4TcFxV4XHjVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgM9LpT5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgM9LpT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789533320; x=1821069320;
  h=date:from:to:cc:subject:message-id;
  bh=Qf5RHlGP+5/dbO5W8opxX9YfyZ+mCqlFwH7c1yvqoYU=;
  b=IgM9LpT5gxx7QwYp4i/iIv4igpnNOTM4UtbLZ+ue/b/LlnC6ovZN61tC
   y/f/TF1KWnrJ5tc7m7tAVB/9a0UIsKz+V0T+tKq1vsn83+lz4GiPW5OlX
   ynFc900p1+6ZawUGikNHUuqqpFFZRZhTLGNKcXDBt+mpOAVIJIPNB5dBx
   F3ZMCEspJRtYedKKBg2aqmN6abyo/GTMINnxi4yBYQvVineJ8ZduaLMGI
   jgguEFHCP03O2gLuzQBQbohtC0mLT8pFjr916S39C+66hCzyTBXDr2nEO
   r5c8oEBTpcjNZej5SHY06yYO9YAHTGeG9MPd9uaq57VIAqftO9fwJFgYL
   g==;
X-CSE-ConnectionGUID: XgKrhvDySu2MkXizms/fHw==
X-CSE-MsgGUID: BvrMEn5fTwi84O4qyKNdcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115444598"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115444598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:35:19 -0700
X-CSE-ConnectionGUID: NIDe2Vo0Tm6eELGKsnu1Hw==
X-CSE-MsgGUID: FjtHl/8fTL+eIe9Ep3SMSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311487460"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 21:35:18 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6hMZ-000000000vn-3464;
	Wed, 16 Sep 2026 04:35:15 +0000
Date: Wed, 16 Sep 2026 06:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.4 5/23]
 sound/soc/codecs/es9356.c:1124:12: warning: suggest explicit braces to avoid
 ambiguous 'else'
Message-ID: <202609160652.5njTpCaF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.4
head:   323637a0aa19e59490a4449f2ab149d97fc5272d
commit: 31a7178425356d459bf7397941a3fbeff1782122 [5/23] ASoC: es9356: Publish IRQ readiness after cache replay
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260916/202609160652.5njTpCaF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160652.5njTpCaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160652.5njTpCaF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/es9356.c: In function 'es9356_sdca_dev_resume':
>> sound/soc/codecs/es9356.c:1124:12: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
    1124 |         if (!slave->unattach_request)
         |            ^


vim +/else +1124 sound/soc/codecs/es9356.c

  1103	
  1104	static int es9356_sdca_dev_resume(struct device *dev)
  1105	{
  1106		struct sdw_slave *slave = dev_to_sdw_dev(dev);
  1107		struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
  1108		int ret;
  1109	
  1110		ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
  1111		if (ret) {
  1112			sdw_show_ping_status(slave->bus, true);
  1113			return ret;
  1114		}
  1115	
  1116		regcache_cache_only(es9356->regmap, false);
  1117		ret = regcache_sync(es9356->regmap);
  1118		if (ret) {
  1119			regcache_cache_only(es9356->regmap, true);
  1120			regcache_mark_dirty(es9356->regmap);
  1121			return ret;
  1122		}
  1123	
> 1124		if (!slave->unattach_request)
  1125			scoped_guard(mutex, &es9356->disable_irq_lock)
  1126				es9356->disable_irq = false;
  1127		return 0;
  1128	}
  1129	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
