Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479673;
	b=4lGyscWWaD379vhcA1xr+9PObKUypRIWp8UUHnNQ2K89SQSQo7Ht+OaW1XEficJSbeyp
	 KPUUZTK5ym8gT3GE4uXWAHvKNnOXrIwnGPNfzn4OBxJGG8PFrDkfJJVfgjwIZNxdcw1wk
	 dNyIx1mgPOjKfCho1L+BpuRxyZbfgFD/v95fKeD7Oy9RE3lS6Ns2WAa/4KQoW5zUXVyS1
	 7/qK+owt5ivW5yHZ31geTfhrMF13npUitSqklcDfNELaxr7m4C1h7gcQ1xPLYXzH5+3Gd
	 h0TL4Ml4G8uxYrDPH6SQz57CUTnf/fYYzEWCPcvzC08oGajWDq8KBvTYoLaWISDorZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479673;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dEJrsE1NQXlrT+DJ8iAlKjkWGcllSI9yU7sOSTNP/9w=;
	b=fRbrnr0j42JcHWMzMByv/otpY9xC6nTUVfzOVuNi4YbqzdOtMO2b1i5DBaNgVRmu9KXZ
	 eCJppIOq80sXkNhOBkW34z6OJqFOUW+y0/X5Eu3tR0uwSP+81ei8WHe7u4nS0hno+NEmv
	 G+DbiNBc+a6tog3sVFHAP7DoDgeKdkvI5IyESFxFX4+IYXshZDsm+2MZsn7PI1vKYLdZx
	 qG25kjQkF7E5AZdTxuCPY5b7O3p65Hj4BOTCp4VCTDgy1b2Y5Tvq5/8L8GPJD2y8dvc3S
	 BLvkLKCNjp5eWgXR3Sm/WfIOctbKRzERCjsLk2FO+c2A2qbSjrRfYACM62tfFaCuJPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E7Ua7utJ;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBF606A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 07:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFDBF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E7Ua7utJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792479672; x=1824015672;
  h=date:from:to:cc:subject:message-id;
  bh=AwbFEihedSlIVCoVFCoDwaqVfEeKhCxS/jlauSPJoRU=;
  b=E7Ua7utJoaL7tEflDOuCnqs/L5YWHZdr0/2JjkycMvqSUGdtCu+OKBsb
   3+shf86w/Wl3VgpsZLiw53DRbQMymPJHPJzKRo9lEpRFXdMeGItZqJWAS
   wTB/yObr7N5396/6BtO76XH5vtIZuHUgLHf2SoIgZQhqs+u2Nag79GbA7
   sSiOdtKd9WNxHO8g3FjgUWbEDUXVOFxJO9l2GFn0u1eNdMV9LnwKVo3Ew
   L/ZcXD7HLOmxMWpmL0NUe2UA5yZr01MWKJ4T86B41VBe/w/jT2jEbcBxX
   MurpL/yDfSlfCAHGkwOmMR2A5mWtkcMMEJlatTpsaMzNrRGiCrKqp2ysY
   Q==;
X-CSE-ConnectionGUID: FWlijGRLSSeC1HxAWCqRVg==
X-CSE-MsgGUID: z8HBj8fzRn69MxruCho08g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1175197"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1175197"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 00:01:07 -0700
X-CSE-ConnectionGUID: Gy03hwwgSVuaGxO3D+ZBnw==
X-CSE-MsgGUID: 1RlVY5jFTEa7GDv7e0Kqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2707439"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2026 00:01:06 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ3qJ-00000000695-12Tj;
	Tue, 20 Oct 2026 07:01:03 +0000
Date: Tue, 20 Oct 2026 09:00:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 291/291]
 drivers/usb/gadget/function/u_audio.c:971 g_audio_setup() warn: inconsistent
 indenting
Message-ID: <202610200838.dUaz9qgi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   aaa0cf06ed53d6805dfa9099535f6fc052c49086
commit: 8430eb02434d2e3cd2230b320ff32f43c2a8a9b1 [291/291] UPSTREAM: usb: gadget: u_audio: add bi-directional volume and mute support
config: i386-randconfig-2200-20261020 (https://download.01.org/0day-ci/archive/20261020/202610200838.dUaz9qgi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200838.dUaz9qgi-lkp@intel.com/

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
