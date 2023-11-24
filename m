Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F62FE17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWkm2gy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840608; x=1732376608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2AJ3RPONUjxKteaUJkB9c25JQtSMiJkrbJYXCPZ5xZY=;
  b=AWkm2gy33rcrkGenWuA0JHtOIgyOyrsm/LOjPmnBTuDmt4/tgioOyvi0
   1OQr4E0GPrgt+XoNksw+xe2PeTv647U4abQFE3GP800gLQIX+sJqNVdjx
   Oen2eT73x4B6GxztfTotXRR9oRlYbP5IdfL3f8Ay0wDXf2GBL18mG1sU9
   Qh5rT6SODI3a8vTfdx2pMLCNBpk1FWoNj7reMZhzLJtfx1vnTmJICbwj+
   RVGeCQgt8exdw2LJtj15crDRLbtXO3zNnpFbiXa0wi6UYAma1bqpdABq7
   W6F9RwinfAvZoYUdYbukeIznSt1IlpvQtElh1e2Bb80dcGau6Q1Ow2uee
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="392205345"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="392205345"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767511024"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="767511024"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2023 07:43:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YKy-0002yy-2V;
	Fri, 24 Nov 2023 15:43:24 +0000
Date: Fri, 24 Nov 2023 23:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/26]
 drivers/usb/gadget/function/u_audio.c:971 g_audio_setup() warn: inconsistent
 indenting
Message-ID: <202311242219.M9Zc7X36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   e6278ff4b708984f059d838b9c1a42b4cf739323
commit: 8430eb02434d2e3cd2230b320ff32f43c2a8a9b1 [2/26] UPSTREAM: usb: gadget: u_audio: add bi-directional volume and mute support
config: x86_64-randconfig-161-20231122 (https://download.01.org/0day-ci/archive/20231124/202311242219.M9Zc7X36-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311242219.M9Zc7X36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242219.M9Zc7X36-lkp@intel.com/

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
