Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8880E26AEC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740152148; cv=none; b=tg89CAHIEwmcDe3O4IFdqnK584oLp/SOwfk5xD0aW558iwCl/TfvFJ9IJunlMzhZlrJ0qQ88Bb2wm4pqimXYLboISBv5iBVASO6krrCi3fAm09gGToqn1r4YyA3osGH1zjwHI01KV5+vqqu6yiQYBW0kKwjusiEtthiWn3TtFbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740152148; c=relaxed/simple;
	bh=4sevlbjlLEpgNae5fl+DrTQzKOQEcEv7ZFU17BMMMAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ddUnCBq4cFNyg+UbWnF3mapR3Qw1Cprx+urDbHQ3avRwDBa7l8fR3Oe7ITqoK/3ISohlCjxK9hGqmPb7sMo2sz8FldKD05DQ+Ag1J0p8BCekEXsNeDyuQRCAbegAjH+7FYNMrvyubxtcGNWT+kN8W2rW+TjkP0f/HbkJjCOh7ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbopWj09; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbopWj09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740152147; x=1771688147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sevlbjlLEpgNae5fl+DrTQzKOQEcEv7ZFU17BMMMAI=;
  b=lbopWj09UNFtJDvjNDF4TjXyk5+gH/gfNG5HCzy8oTx2+Bp0RUq1FncQ
   EmctdEwWftQNDZ0QLSlDfcuMolIoc1qvSTLNCMcFwuWxjlup6ySPxVBRc
   8jfkDS1L2E3XaEIJGVzif3vp4MhMTuIlBm/PcjKp/D1bR/MvZeB8T9RFx
   DvUep/HPVlILL6XkX5baY47IakTxtiah7Xz0zfNVOtugQrrs96nhot+P4
   8xHuNr7Na2zaFRz+4YgvedFS/DJHwtVrymS9Jlz+PaXdXd/m81603NM2/
   HdMuT9oM9RXlTLwvRmQpVWqYQucT+KDqEnH7TdNGBLhaKXU9K4G0ng6J8
   w==;
X-CSE-ConnectionGUID: jCn1TL1kQUW9e09OER6exA==
X-CSE-MsgGUID: /bMEjOu2TFyLgKqXeOSzog==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44758357"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44758357"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:35:46 -0800
X-CSE-ConnectionGUID: aS/zFnKLRdubxxx9JM2MkQ==
X-CSE-MsgGUID: 5TztbLHhRkW6JMWkp6jOeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="115115277"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2025 07:35:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlV42-0005fe-0d;
	Fri, 21 Feb 2025 15:35:42 +0000
Date: Fri, 21 Feb 2025 23:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Livingood <jacklivingood@comcast.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.de>
Subject: [thesofproject:topic/sof-dev 7769/7771]
 sound/firewire/isight.c:647:9: error: implicit declaration of function
 'strspy'; did you mean 'strspn'?
Message-ID: <202502212301.Ftkz0mbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   05477f184fc6188b402a7ccaf6702c479eb169f4
commit: d63fe2848faae2c75ebd805565799a69654b8c1c [7769/7771] ALSA: firewire: isight: changed strcpy to strscpy
config: s390-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250221/202502212301.Ftkz0mbY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212301.Ftkz0mbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212301.Ftkz0mbY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/firewire/isight.c: In function 'isight_probe':
>> sound/firewire/isight.c:647:9: error: implicit declaration of function 'strspy'; did you mean 'strspn'? [-Wimplicit-function-declaration]
     647 |         strspy(card->mixername, "iSight");
         |         ^~~~~~
         |         strspn


vim +647 sound/firewire/isight.c

   612	
   613	static int isight_probe(struct fw_unit *unit,
   614				const struct ieee1394_device_id *id)
   615	{
   616		struct fw_device *fw_dev = fw_parent_device(unit);
   617		struct snd_card *card;
   618		struct isight *isight;
   619		int err;
   620	
   621		err = snd_card_new(&unit->device, -1, NULL, THIS_MODULE,
   622				   sizeof(*isight), &card);
   623		if (err < 0)
   624			return err;
   625	
   626		isight = card->private_data;
   627		isight->card = card;
   628		mutex_init(&isight->mutex);
   629		isight->unit = fw_unit_get(unit);
   630		isight->device = fw_dev;
   631		isight->audio_base = get_unit_base(unit);
   632		if (!isight->audio_base) {
   633			dev_err(&unit->device, "audio unit base not found\n");
   634			err = -ENXIO;
   635			goto error;
   636		}
   637		fw_iso_resources_init(&isight->resources, unit);
   638	
   639		card->private_free = isight_card_free;
   640	
   641		strscpy(card->driver, "iSight");
   642		strscpy(card->shortname, "Apple iSight");
   643		snprintf(card->longname, sizeof(card->longname),
   644			 "Apple iSight (GUID %08x%08x) at %s, S%d",
   645			 fw_dev->config_rom[3], fw_dev->config_rom[4],
   646			 dev_name(&unit->device), 100 << fw_dev->max_speed);
 > 647		strspy(card->mixername, "iSight");
   648	
   649		err = isight_create_pcm(isight);
   650		if (err < 0)
   651			goto error;
   652	
   653		err = isight_create_mixer(isight);
   654		if (err < 0)
   655			goto error;
   656	
   657		err = snd_card_register(card);
   658		if (err < 0)
   659			goto error;
   660	
   661		dev_set_drvdata(&unit->device, isight);
   662	
   663		return 0;
   664	error:
   665		snd_card_free(card);
   666	
   667		mutex_destroy(&isight->mutex);
   668		fw_unit_put(isight->unit);
   669	
   670		return err;
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
