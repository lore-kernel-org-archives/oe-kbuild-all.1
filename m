Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838231DF26B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768792987; cv=none; b=bd70uWEkUV50INEqtMuq+sl34u/anAQZZ1J4GI1CQKdG95tMQmcpW4dP3cMBp/aPgJlFj8iEVx/s2KhgCch78N9Cnqt6LRaS7rcWbDIPfkSYZLG53y4TJsZdjhKdI2IIJXR3NCpiLEbaGa1P/p8fCLsNG/r9aAyQcvrspc9iQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768792987; c=relaxed/simple;
	bh=P6h0E45uFBqL11kzxO1e8k0RC4qu4jl1aPNecox2z9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L4tbQipzAi42PgRqYnh32lPO3xXfCFSuSUSd8Uc3Alv0yKUSHiKKnBgFy6RoST6xgjqTTEcMVBDWFNZ0ZPSFF6j88GiFH/8BR4iwADyfNvzih/nXkAhndYRkldD0pjwoPvc8hQCtX04f0FgEhgLYSl/DQKyID3sH0udijCB9Ivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtKSW4Ax; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtKSW4Ax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768792986; x=1800328986;
  h=date:from:to:cc:subject:message-id;
  bh=P6h0E45uFBqL11kzxO1e8k0RC4qu4jl1aPNecox2z9k=;
  b=mtKSW4AxqTQrmaFydK+e41UFLWFCnWqZc9qE3otky8u+nTMAy4jePt2C
   GZcg6flJC2Wj/KMBf0gyaUonpJwAuSNKdYZQJxbpPGzLMmcRTKskfe2+Y
   O+HlUTijZxR+6UZ9iMOQybdNzBRFUaS+S8dpdsfohNOMDhKMR97wnRxAb
   Nw/tc5e88gNMoxa6PwxngoOhGHDxzzscwHbHKX4jPdtXyJTnxbkF35sHJ
   XkE0xe3ah7HlnbuXvI1RaWhvA4yyz14NwVv7zWs8tF67Zcv9zLEIpmEir
   0GgEcK3ZYd8jodcq6yCwy6t/3s8cD0BiYXp391YA5U5XlgUhvS3xttJro
   w==;
X-CSE-ConnectionGUID: 1uPLUs11Se2V7gXM70U/Tg==
X-CSE-MsgGUID: 7g/un9hdT8GcxtZHDCI8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69976977"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69976977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 19:23:05 -0800
X-CSE-ConnectionGUID: FxwB9cwGTo6DjTD+Pqa7xQ==
X-CSE-MsgGUID: 9HWtceOdSqaVH5h9OB4QQg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2026 19:23:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfr3-00000000NPj-2pg4;
	Mon, 19 Jan 2026 03:23:01 +0000
Date: Mon, 19 Jan 2026 11:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 drivers/usb/gadget/function/u_audio.c:971 g_audio_setup() warn: inconsistent
 indenting
Message-ID: <202601191156.Hv55cy14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 8430eb02434d2e3cd2230b320ff32f43c2a8a9b1 [196/196] UPSTREAM: usb: gadget: u_audio: add bi-directional volume and mute support
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601191156.Hv55cy14-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191156.Hv55cy14-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/u_audio.c:971 g_audio_setup() warn: inconsistent indenting

vim +971 drivers/usb/gadget/function/u_audio.c

   943	
   944	int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
   945						const char *card_name)
   946	{
   947		struct snd_uac_chip *uac;
   948		struct snd_card *card;
   949		struct snd_pcm *pcm;
   950		struct snd_kcontrol *kctl;
   951		struct uac_params *params;
   952		int p_chmask, c_chmask;
   953		int i, err;
   954	
   955		if (!g_audio)
   956			return -EINVAL;
   957	
   958		uac = kzalloc(sizeof(*uac), GFP_KERNEL);
   959		if (!uac)
   960			return -ENOMEM;
   961		g_audio->uac = uac;
   962		uac->audio_dev = g_audio;
   963	
   964		params = &g_audio->params;
   965		p_chmask = params->p_chmask;
   966		c_chmask = params->c_chmask;
   967	
   968		if (c_chmask) {
   969			struct uac_rtd_params *prm = &uac->c_prm;
   970	
 > 971	    spin_lock_init(&prm->lock);
   972	    uac->c_prm.uac = uac;
   973			prm->max_psize = g_audio->out_ep_maxpsize;
   974	
   975			prm->reqs = kcalloc(params->req_number,
   976					    sizeof(struct usb_request *),
   977					    GFP_KERNEL);
   978			if (!prm->reqs) {
   979				err = -ENOMEM;
   980				goto fail;
   981			}
   982	
   983			prm->rbuf = kcalloc(params->req_number, prm->max_psize,
   984					GFP_KERNEL);
   985			if (!prm->rbuf) {
   986				prm->max_psize = 0;
   987				err = -ENOMEM;
   988				goto fail;
   989			}
   990		}
   991	
   992		if (p_chmask) {
   993			struct uac_rtd_params *prm = &uac->p_prm;
   994	
   995			spin_lock_init(&prm->lock);
   996			uac->p_prm.uac = uac;
   997			prm->max_psize = g_audio->in_ep_maxpsize;
   998	
   999			prm->reqs = kcalloc(params->req_number,
  1000					    sizeof(struct usb_request *),
  1001					    GFP_KERNEL);
  1002			if (!prm->reqs) {
  1003				err = -ENOMEM;
  1004				goto fail;
  1005			}
  1006	
  1007			prm->rbuf = kcalloc(params->req_number, prm->max_psize,
  1008					GFP_KERNEL);
  1009			if (!prm->rbuf) {
  1010				prm->max_psize = 0;
  1011				err = -ENOMEM;
  1012				goto fail;
  1013			}
  1014		}
  1015	
  1016		/* Choose any slot, with no id */
  1017		err = snd_card_new(&g_audio->gadget->dev,
  1018				-1, NULL, THIS_MODULE, 0, &card);
  1019		if (err < 0)
  1020			goto fail;
  1021	
  1022		uac->card = card;
  1023	
  1024		/*
  1025		 * Create first PCM device
  1026		 * Create a substream only for non-zero channel streams
  1027		 */
  1028		err = snd_pcm_new(uac->card, pcm_name, 0,
  1029				       p_chmask ? 1 : 0, c_chmask ? 1 : 0, &pcm);
  1030		if (err < 0)
  1031			goto snd_fail;
  1032	
  1033		strscpy(pcm->name, pcm_name, sizeof(pcm->name));
  1034		pcm->private_data = uac;
  1035		uac->pcm = pcm;
  1036	
  1037		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &uac_pcm_ops);
  1038		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &uac_pcm_ops);
  1039	
  1040		/*
  1041		 * Create mixer and controls
  1042		 * Create only if it's required on USB side
  1043		 */
  1044		if ((c_chmask && g_audio->in_ep_fback)
  1045				|| (p_chmask && params->p_fu.id)
  1046				|| (c_chmask && params->c_fu.id))
  1047			strscpy(card->mixername, card_name, sizeof(card->driver));
  1048	
  1049		if (c_chmask && g_audio->in_ep_fback) {
  1050			kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
  1051					    &uac->c_prm);
  1052			if (!kctl) {
  1053				err = -ENOMEM;
  1054				goto snd_fail;
  1055			}
  1056	
  1057			kctl->id.device = pcm->device;
  1058			kctl->id.subdevice = 0;
  1059	
  1060			err = snd_ctl_add(card, kctl);
  1061			if (err < 0)
  1062				goto snd_fail;
  1063		}
  1064	
  1065		for (i = 0; i <= SNDRV_PCM_STREAM_LAST; i++) {
  1066			struct uac_rtd_params *prm;
  1067			struct uac_fu_params *fu;
  1068			char ctrl_name[24];
  1069			char *direction;
  1070	
  1071			if (!pcm->streams[i].substream_count)
  1072				continue;
  1073	
  1074			if (i == SNDRV_PCM_STREAM_PLAYBACK) {
  1075				prm = &uac->p_prm;
  1076				fu = &params->p_fu;
  1077				direction = "Playback";
  1078			} else {
  1079				prm = &uac->c_prm;
  1080				fu = &params->c_fu;
  1081				direction = "Capture";
  1082			}
  1083	
  1084			prm->fu_id = fu->id;
  1085	
  1086			if (fu->mute_present) {
  1087				snprintf(ctrl_name, sizeof(ctrl_name),
  1088						"PCM %s Switch", direction);
  1089	
  1090				u_audio_controls[UAC_MUTE_CTRL].name = ctrl_name;
  1091	
  1092				kctl = snd_ctl_new1(&u_audio_controls[UAC_MUTE_CTRL],
  1093						    prm);
  1094				if (!kctl) {
  1095					err = -ENOMEM;
  1096					goto snd_fail;
  1097				}
  1098	
  1099				kctl->id.device = pcm->device;
  1100				kctl->id.subdevice = i;
  1101	
  1102				err = snd_ctl_add(card, kctl);
  1103				if (err < 0)
  1104					goto snd_fail;
  1105				prm->snd_kctl_mute = kctl;
  1106				prm->mute = 0;
  1107			}
  1108	
  1109			if (fu->volume_present) {
  1110				snprintf(ctrl_name, sizeof(ctrl_name),
  1111						"PCM %s Volume", direction);
  1112	
  1113				u_audio_controls[UAC_VOLUME_CTRL].name = ctrl_name;
  1114	
  1115				kctl = snd_ctl_new1(&u_audio_controls[UAC_VOLUME_CTRL],
  1116						    prm);
  1117				if (!kctl) {
  1118					err = -ENOMEM;
  1119					goto snd_fail;
  1120				}
  1121	
  1122				kctl->id.device = pcm->device;
  1123				kctl->id.subdevice = i;
  1124	
  1125	
  1126				kctl->tlv.c = u_audio_volume_tlv;
  1127				kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ |
  1128						SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
  1129	
  1130				err = snd_ctl_add(card, kctl);
  1131				if (err < 0)
  1132					goto snd_fail;
  1133				prm->snd_kctl_volume = kctl;
  1134				prm->volume = fu->volume_max;
  1135				prm->volume_max = fu->volume_max;
  1136				prm->volume_min = fu->volume_min;
  1137				prm->volume_res = fu->volume_res;
  1138			}
  1139		}
  1140	
  1141		strscpy(card->driver, card_name, sizeof(card->driver));
  1142		strscpy(card->shortname, card_name, sizeof(card->shortname));
  1143		sprintf(card->longname, "%s %i", card_name, card->dev->id);
  1144	
  1145		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
  1146					       NULL, 0, BUFF_SIZE_MAX);
  1147	
  1148		err = snd_card_register(card);
  1149	
  1150		if (!err)
  1151			return 0;
  1152	
  1153	snd_fail:
  1154		snd_card_free(card);
  1155	fail:
  1156		kfree(uac->p_prm.reqs);
  1157		kfree(uac->c_prm.reqs);
  1158		kfree(uac->p_prm.rbuf);
  1159		kfree(uac->c_prm.rbuf);
  1160		kfree(uac);
  1161	
  1162		return err;
  1163	}
  1164	EXPORT_SYMBOL_GPL(g_audio_setup);
  1165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
