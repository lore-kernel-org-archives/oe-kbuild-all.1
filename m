Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102543AC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711427152; cv=none; b=o75GK4nti57NFVHoqPzL+GPjWzZtP8gbLVF5YU8Gt02s9KtO/FtBhQIfueJpWGaj5qiud7tQUew+cM3eHWQBVrh+KJm3jvGsOdFQy/KQ2fc8yZVSCJSDdDdeW0cX1KtBhpV9KihnjX62vQxiVgorP3ec0ccbVLq1pBMtfJigJtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711427152; c=relaxed/simple;
	bh=Tn0BWdDyq6ghPbyrOHZc6p7jjiX4/eMlmCrCV1vrk+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQau1EPEV5yAuMNiyEwsgupOQcO0hXgshmu20CSqYMcm9o7uAX5RJZvBWMpyClydwBcnT5WO+a5b1M3kSchkrmYpai7zLvNj1uF/aE73auxWFyfnyuncRUUKAoer5HcelvSrDTY2PEwanbmrDEvXSq6BfuwE4i6tH57FB1HLQrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeL7Gxw0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeL7Gxw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711427150; x=1742963150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn0BWdDyq6ghPbyrOHZc6p7jjiX4/eMlmCrCV1vrk+c=;
  b=QeL7Gxw0WxLIyJiynLGPHnx68mvo3H2wgUTTUZeOpgZj5ziMNUj7PtaY
   QIIZV/YKSq3ekXZxD/5mm4gBWPloRhLvKexum920YeaB0orWtDRINnLNe
   0m/7XD/ESyuvrFmjwBZVxdFB8V5bQkmh7d78DHZu8kvcbuVosvnBaO/Pr
   JJCqltPd8KoDzmwcTBp1nqZNS6IZZRZ1FnYsMfJNmC3Rgs11vX3joBveA
   lYef2pNeSNNfbaQVzu4XVoZa9aaaGP67LZpw/8FKG2Uk6+YCctYtMdr7o
   zKZTTUKKu77azfE0V3obsCpo4IruFUbtLu0lLbBb6JG/0w+OM9yRClWpD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6326952"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6326952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 21:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="15741530"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Mar 2024 21:25:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1royNd-000N7a-2m;
	Tue, 26 Mar 2024 04:25:45 +0000
Date: Tue, 26 Mar 2024 12:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megi@xff.cz>
Subject: [broonie-ci:v3_20240302_megi_add_support_for_jack_detection_to_codec_present_in_a64_soc
 4/4] sound/soc/sunxi/sun8i-codec.c:1355:43: error: 'struct snd_jack' has no
 member named 'type'
Message-ID: <202403261243.kcXCPAYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20240302_megi_add_support_for_jack_detection_to_codec_present_in_a64_soc
head:   21fa98f4197bb3365dda1417708b318f403c13c1
commit: 21fa98f4197bb3365dda1417708b318f403c13c1 [4/4] ASoC: sun8i-codec: Implement jack and accessory detection
config: arc-randconfig-r052-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261243.kcXCPAYs-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261243.kcXCPAYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261243.kcXCPAYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sunxi/sun8i-codec.c: In function 'sun8i_codec_jack_work':
>> sound/soc/sunxi/sun8i-codec.c:1355:43: error: 'struct snd_jack' has no member named 'type'
    1355 |         int type_mask = scodec->jack->jack->type;
         |                                           ^~
   sound/soc/sunxi/sun8i-codec.c: In function 'sun8i_codec_jack_irq':
   sound/soc/sunxi/sun8i-codec.c:1494:63: error: 'struct snd_jack' has no member named 'type'
    1494 |                                             scodec->jack->jack->type);
         |                                                               ^~


vim +1355 sound/soc/sunxi/sun8i-codec.c

  1349	
  1350	static void sun8i_codec_jack_work(struct work_struct *work)
  1351	{
  1352		struct sun8i_codec *scodec = container_of(work, struct sun8i_codec,
  1353							  jack_work.work);
  1354		unsigned int mdata;
> 1355		int type_mask = scodec->jack->jack->type;
  1356		int type;
  1357	
  1358		guard(mutex)(&scodec->jack_mutex);
  1359	
  1360		if (scodec->jack_status == SUN8I_JACK_STATUS_DISCONNECTED) {
  1361			if (scodec->last_hmic_irq != SUN8I_HMIC_STS_JACK_IN_IRQ_ST)
  1362				return;
  1363	
  1364			scodec->jack_last_sample = -1;
  1365	
  1366			if (type_mask & SND_JACK_MICROPHONE) {
  1367				/*
  1368				 * If we were in disconnected state, we enable HBIAS and
  1369				 * wait 600ms before reading initial HDATA value.
  1370				 */
  1371				scodec->jack_hbias_ready = ktime_add_ms(ktime_get(), 600);
  1372				sun8i_codec_set_hmic_bias(scodec, true);
  1373				queue_delayed_work(system_power_efficient_wq,
  1374						   &scodec->jack_work,
  1375						   msecs_to_jiffies(610));
  1376				scodec->jack_status = SUN8I_JACK_STATUS_WAITING_HBIAS;
  1377			} else {
  1378				snd_soc_jack_report(scodec->jack, SND_JACK_HEADPHONE,
  1379						    type_mask);
  1380				scodec->jack_status = SUN8I_JACK_STATUS_CONNECTED;
  1381			}
  1382		} else if (scodec->jack_status == SUN8I_JACK_STATUS_WAITING_HBIAS) {
  1383			/*
  1384			 * If we're waiting for HBIAS to stabilize, and we get plug-out
  1385			 * interrupt and nothing more for > 100ms, just cancel the
  1386			 * initialization.
  1387			 */
  1388			if (scodec->last_hmic_irq == SUN8I_HMIC_STS_JACK_OUT_IRQ_ST) {
  1389				scodec->jack_status = SUN8I_JACK_STATUS_DISCONNECTED;
  1390				sun8i_codec_set_hmic_bias(scodec, false);
  1391				return;
  1392			}
  1393	
  1394			/*
  1395			 * If we're not done waiting for HBIAS to stabilize, wait more.
  1396			 */
  1397			if (!ktime_after(ktime_get(), scodec->jack_hbias_ready)) {
  1398				s64 msecs = ktime_ms_delta(scodec->jack_hbias_ready,
  1399							   ktime_get());
  1400	
  1401				queue_delayed_work(system_power_efficient_wq,
  1402						   &scodec->jack_work,
  1403						   msecs_to_jiffies(msecs + 10));
  1404				return;
  1405			}
  1406	
  1407			/*
  1408			 * Everything is stabilized, determine jack type and report it.
  1409			 */
  1410			regmap_read(scodec->regmap, SUN8I_HMIC_STS, &mdata);
  1411			mdata &= SUN8I_HMIC_STS_HMIC_DATA_MASK;
  1412			mdata >>= SUN8I_HMIC_STS_HMIC_DATA;
  1413	
  1414			regmap_write(scodec->regmap, SUN8I_HMIC_STS, 0);
  1415	
  1416			type = mdata < 16 ? SND_JACK_HEADPHONE : SND_JACK_HEADSET;
  1417			if (type == SND_JACK_HEADPHONE)
  1418				sun8i_codec_set_hmic_bias(scodec, false);
  1419	
  1420			snd_soc_jack_report(scodec->jack, type, type_mask);
  1421			scodec->jack_status = SUN8I_JACK_STATUS_CONNECTED;
  1422		} else if (scodec->jack_status == SUN8I_JACK_STATUS_CONNECTED) {
  1423			if (scodec->last_hmic_irq != SUN8I_HMIC_STS_JACK_OUT_IRQ_ST)
  1424				return;
  1425	
  1426			scodec->jack_status = SUN8I_JACK_STATUS_DISCONNECTED;
  1427			if (type_mask & SND_JACK_MICROPHONE)
  1428				sun8i_codec_set_hmic_bias(scodec, false);
  1429	
  1430			snd_soc_jack_report(scodec->jack, 0, type_mask);
  1431		}
  1432	}
  1433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
