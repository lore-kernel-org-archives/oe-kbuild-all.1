Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B63793DC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 22:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791411463; cv=none; b=BIpR3Vwaeq75Rg/bZ6/dxJKOv55dnoZYz16lZ1uZ87jcE/XeoA4hCHG8UiB1Fo7wUCk1eEduzplAalJXLVAnY9Q4rkYoMgcPUnCKo6akQRnvQBWWvfkt1m7OhtYnYYX0nYfhCSErHrnvjYR3Lpkn8u/AuB2xomjUjLfwb7w5UOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791411463; c=relaxed/simple;
	bh=7TN8q57FFL0AbXzT7RrNhV9Tt3NLUsMriWeDYvi7vq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MnQWJdXwV9qRsGHpI5L8Bgul+5EBZRRnm0SV2y3aP2hjVItKMB6WPd2LV0bW7lF1W3dxjPlcaHW7XX7CJcYtPlmN9xyMU5UBxwnDMkjcfgfdn47w5KdH5sKifZ4KKL/uPDxfKjvH2yJH5JIQSzmIBhmO7GZss+5/O1d6ky2CAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJrao2h2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJrao2h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791411461; x=1822947461;
  h=date:from:to:cc:subject:message-id;
  bh=7TN8q57FFL0AbXzT7RrNhV9Tt3NLUsMriWeDYvi7vq0=;
  b=OJrao2h2dlW1BpI8g8G2sRJh5GCXe7kDTFiYJUnUNY+clOv6gSU/rdco
   /MaT5BK8iZPUaN38IDV+T3kC/jyEdPtTnw3JQnBCMEfxeuNcT67F6vIOo
   HA439gpE989+7RMRbjf3l4suY+btfY234osFJqxB+TCPdi0irvwGvIf0n
   YkU8RjxZj885e102FZhHLoqmC5z8xDCimKl6bnB4KLBtkhl7HKFvPU6KE
   AUcfUVFK2p/I0+3bE1RAA9z5S7kndVlNtqjPKwVPaF2rdwnWAbi736hFc
   5plaA6mia/W3wOEJl49YqKTylNsRFWvlTrGobkRebXvZKOwVmL3WU2jP2
   A==;
X-CSE-ConnectionGUID: ABfgac4iTbOaVP+TIk/5mw==
X-CSE-MsgGUID: hBC2x5SIQuqJRyt6TzZAtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="84525"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="84525"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:17:40 -0700
X-CSE-ConnectionGUID: DdHI5W4oQgOu+50lrmatTg==
X-CSE-MsgGUID: qBcw2heWS8Sy//lnEMTguA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="295670"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 15:17:39 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEZxA-000000004AJ-06rp;
	Wed, 07 Oct 2026 22:17:36 +0000
Date: Thu, 08 Oct 2026 00:17:35 +0200
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-7.4 6/6]
 sound/soc/codecs/rt721-sdca.c:124 rt721_sdca_jack_detect_handler() warn:
 inconsistent indenting
Message-ID: <202610080041.JAcitVQd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
head:   e2eb4873b901290adc56b76f1d599005e620a6de
commit: e2eb4873b901290adc56b76f1d599005e620a6de [6/6] ASoC: rt721-sdca: Adjust blindwrite flow to fix type detection issue
config: alpha-randconfig-r2201-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080041.JAcitVQd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080041.JAcitVQd-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt721-sdca.c:124 rt721_sdca_jack_detect_handler() warn: inconsistent indenting

vim +124 sound/soc/codecs/rt721-sdca.c

   101	
   102	static void rt721_sdca_jack_detect_handler(struct work_struct *work)
   103	{
   104		struct rt721_sdca_priv *rt721 =
   105			container_of(work, struct rt721_sdca_priv, jack_detect_work.work);
   106		unsigned int sta_mode = 0;
   107		int btn_type = 0;
   108		int retry, retry_loop = 40;
   109		int real_JD;
   110	
   111		if (!rt721->hs_jack)
   112			return;
   113	
   114		if (!rt721->component->card || !rt721->component->card->instantiated)
   115			return;
   116	
   117		if (rt721->wf_id == RT721_S) {
   118			if (rt721->imp_sensing_ongoing) {
   119				dev_dbg(&rt721->slave->dev,
   120					"SKIP, imp_sensing_ongoing\n");
   121				return;
   122			}
   123	
 > 124				rt_sdca_index_read(rt721->mbq_regmap, RT721_JD_CTRL,
   125					RT721_JD_1PIN_GAT_STA1, &real_JD);
   126				real_JD &= 0x1;
   127			if (real_JD == 0x0)
   128				rt721_sdca_jack_reset_state(rt721);
   129	
   130			if ((rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) &&
   131				!(rt721->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8) &&
   132				real_JD == 0x1 && rt721->int_cnt == 0 &&
   133				!rt721->imp_sensing_done && rt721->jack_type != 0) {
   134				unsigned int cur_mode = 0;
   135				int cur_type = -1;
   136	
   137				for (retry = 0; retry < retry_loop; retry++) {
   138					regmap_read(rt721->regmap,
   139						SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC,
   140							RT721_SDCA_ENT_GE49,
   141							RT721_SDCA_CTL_DETECTED_MODE, 0),
   142						&cur_mode);
   143					if (cur_mode)
   144						break;
   145					usleep_range(20000, 21000);
   146				}
   147	
   148				switch (cur_mode) {
   149				case 0x03:
   150					cur_type = SND_JACK_HEADPHONE;
   151					break;
   152				case 0x05:
   153					cur_type = SND_JACK_HEADSET;
   154					break;
   155				default:
   156					cur_type = -1;
   157					break;
   158				}
   159	
   160				dev_info(&rt721->slave->dev,
   161					"%s: resume check, cur_mode=0x%x cur_type=%d retained jack_type=%d\n",
   162					__func__, cur_mode, cur_type, rt721->jack_type);
   163	
   164				if (cur_mode != 0 && cur_type == rt721->jack_type) {
   165					dev_info(&rt721->slave->dev,
   166						"%s: resume with same jack, reuse jack_type=%d\n",
   167						__func__, rt721->jack_type);
   168					rt721->imp_sensing_done = true;
   169					rt721->last_real_JD = real_JD;
   170					snd_soc_jack_report(rt721->hs_jack, rt721->jack_type,
   171						SND_JACK_HEADSET |
   172						SND_JACK_BTN_0 | SND_JACK_BTN_1 |
   173						SND_JACK_BTN_2 | SND_JACK_BTN_3);
   174					return;
   175				}
   176	
   177				dev_info(&rt721->slave->dev,
   178					"%s: resume jack changed/unsettled, redetect\n", __func__);
   179				rt721->jack_type = 0;
   180			}
   181	
   182			if ((rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) &&
   183				!(rt721->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8) &&
   184				real_JD == rt721->last_real_JD && real_JD == 0x1 &&
   185				rt721->int_cnt == 0 && rt721->imp_sensing_done &&
   186				rt721->jack_type != 0) {
   187				dev_info(&rt721->slave->dev,
   188					"%s: state settled (JD=%d), skip redetect\n",
   189					__func__, real_JD);
   190				rt721->last_real_JD = real_JD;
   191				return;
   192			}
   193			rt721->last_real_JD = real_JD;
   194	
   195			if ((rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) &&
   196				!(rt721->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8) &&
   197				rt721->int_cnt == 0 && real_JD == 0x1 &&
   198				!rt721->imp_sensing_done) {
   199				dev_info(&rt721->slave->dev,
   200					"%s: BRANCH impedance_sensing (SDCA_0 set, fresh pass)\n",
   201					__func__);
   202				rt721->imp_sensing_done = true;
   203				rt721_impedance_sensing(rt721);
   204				rt721->imp_sensing_ongoing = false;
   205				return;
   206			}
   207	
   208			/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
   209			if ((rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) &&
   210				(rt721->int_cnt == 1 || real_JD == 0x0)) {
   211				if (real_JD == 0x1) {
   212					for (retry = 0; retry < retry_loop; retry++) {
   213						regmap_read(rt721->regmap,
   214							SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC,
   215								RT721_SDCA_ENT_GE49,
   216								RT721_SDCA_CTL_DETECTED_MODE, 0),
   217							&sta_mode);
   218						if (sta_mode)
   219							break;
   220						usleep_range(20000, 21000);
   221					}
   222					dev_dbg(&rt721->slave->dev,
   223						"%s: detected_mode settled=0x%x, %d retries\n",
   224						__func__, sta_mode, retry);
   225				}
   226				rt721->jack_type = rt_sdca_headset_detect(rt721->regmap,
   227									RT721_SDCA_ENT_GE49);
   228				rt721->int_cnt = 0;
   229				if (rt721->jack_type < 0)
   230					return;
   231			}
   232			dev_info(&rt721->slave->dev,
   233				"%s: handler run stat1=0x%x stat2=0x%x (SDCA_8=%d)\n",
   234				__func__, rt721->scp_sdca_stat1, rt721->scp_sdca_stat2,
   235				!!(rt721->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8));
   236		} else {
   237			if (rt721->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
   238				rt721->jack_type = rt_sdca_headset_detect(rt721->regmap,
   239								RT721_SDCA_ENT_GE49);
   240				if (rt721->jack_type < 0)
   241					return;
   242			}
   243		}
   244	
   245		/* SDW_SCP_SDCA_INT_SDCA_8 is used for button detection */
   246		if (rt721->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
   247			btn_type = rt_sdca_button_detect(rt721->regmap,
   248						RT721_SDCA_ENT_HID01, RT721_BUF_ADDR_HID1,
   249						RT721_SDCA_HID_ID);
   250	
   251		if (rt721->jack_type == 0)
   252			btn_type = 0;
   253	
   254		dev_dbg(&rt721->slave->dev,
   255			"in %s, jack_type=%d\n", __func__, rt721->jack_type);
   256		dev_dbg(&rt721->slave->dev,
   257			"in %s, btn_type=0x%x\n", __func__, btn_type);
   258		dev_dbg(&rt721->slave->dev,
   259			"in %s, scp_sdca_stat1=0x%x, scp_sdca_stat2=0x%x\n", __func__,
   260			rt721->scp_sdca_stat1, rt721->scp_sdca_stat2);
   261	
   262		snd_soc_jack_report(rt721->hs_jack, rt721->jack_type | btn_type,
   263				SND_JACK_HEADSET |
   264				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
   265				SND_JACK_BTN_2 | SND_JACK_BTN_3);
   266	
   267		if (btn_type) {
   268			/* button released */
   269			snd_soc_jack_report(rt721->hs_jack, rt721->jack_type,
   270				SND_JACK_HEADSET |
   271				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
   272				SND_JACK_BTN_2 | SND_JACK_BTN_3);
   273	
   274			mod_delayed_work(system_power_efficient_wq,
   275				&rt721->jack_btn_check_work, msecs_to_jiffies(200));
   276		}
   277	}
   278	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
