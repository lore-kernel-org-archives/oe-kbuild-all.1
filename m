Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152733;
	b=d10raEy2Rp/AIUVYuKxy5Pxa4ZsNVIpxiQZmtcZ8w546hoJZxMmIb74/GLvPrmwcYs9t
	 KIW3Rm4gCiwvSsCqw2kzOBFs/uS3zTUT5Y98sid7ycaKTT4LUL+RVDTcPlkqVPpulaeJo
	 Yo4nuJHP6cy/Iz9p2RlrbxIpGKT62w/w5dw6JzAZfBDKCOiUlYUG8gZNgu1YeT0WZUF+9
	 jM94OLsxSzW8Qo9xbN9HwkxjATAOAYdJ3ZG8swOTBokM/kuqTtRCK1YUJi+dsT3e7idZp
	 c4Rqp17rQYLNUD6Q0TwqY/1CEdMTv5ODKKvrd/WBYis/sF9I99fqIl5Ju0LKAdegzew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152733;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xuZ4unwGxxIaiGNKm1qsZVkRiCh5AdzP9moj3AWzi8A=;
	b=YyYG7ZPPMdUENAxnQkIr1vHoiDH9L75oYmtjWHz4vLZyDjyzuv8MzNy52ptB2eyp3Y4W
	 9apL8zQ5Oqm0+1kRHXoKauMYZcSvTJTJLf9zyUQ1t2lIKCvGKB1kSP13xRmgbG0NqV5Qq
	 cvPZPyjvKtrVdc0UDWxkNFwHuLmOcIqRs1T526NcqdYVRjL7aX5Q9O39nfzCbu9ON4cHe
	 QnHilnAwvHHUMQT24WXU8Xjyubm8CiQj2vQfsVKSEjikZGRqgMv/2Ah91ZIQCWW3tb+EU
	 9/SBtt00y6xA61qdSt1buIXh5c24yGhsKWGCevzy2CbnZAYYml/Z6GuUznISaL5n2qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BNVlUU+W;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FEC606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 05:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0FEC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BNVlUU+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795152734; x=1826688734;
  h=date:from:to:cc:subject:message-id;
  bh=E2ybeHpSdHAkzZPE6CvWNj2rsddZF5LDWCz/EYaOuUk=;
  b=BNVlUU+WJAjzmGM/VMtIHtBG3fGab+pWA+eivPAZVqfqZBBmAnVAkKTM
   qAoe+nwxU8Y8KwTugspzDSdqzoW6eNr2XcLJOJ3Zt9rTmkj2QBaJzWrE8
   IYapM2LdTGzJhBvrq42V+P5LDryOlCzRJ4Gv18+2X1azt6PlfiOgHJgNw
   5V9tCCdQ5yauUho3FY+o+3GkHgUMoGm98dwwdny43KAGdlW2VR4aDjfEI
   IncqdOhVvDTETdBe7vO+BjGPdIlVafYq/nA4+HwLqPZIgPha67baveBX5
   PB8tXip19vkkM5Ok/nQZS7YfkUaDfG2OMJkIkXboIIo4x/DHah8v7E+6m
   g==;
X-CSE-ConnectionGUID: TTIjs4k7Rsatk2lAHyKhaw==
X-CSE-MsgGUID: 6SzTYJCaSZ2NWxOj/dHucA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3925879"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3925879"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 21:32:13 -0800
X-CSE-ConnectionGUID: gSaSBecKR7OUkVyV8SaU0Q==
X-CSE-MsgGUID: tmzTVKfDShmSeBT1C96unQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12613390"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 21:32:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUHEG-00000001HAG-2GSr;
	Fri, 20 Nov 2026 05:32:08 +0000
Date: Fri, 20 Nov 2026 13:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-11-13 351/351]
 sound/soc/soc-compress.c:294:1: error: duplicate label 'out'
Message-ID: <202611201339.RBc3OaHu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-11-13
head:   437686bf7c08c92113908bda25c90a3a7761459c
commit: 431c6c3e838b47c7c7ff9927e38e9cb46521b08e [351/351] ASoC: soc-compress: use guard(pcm_mutex)
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261120/202611201339.RBc3OaHu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201339.RBc3OaHu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201339.RBc3OaHu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-compress.c: In function 'soc_compr_open_fe':
>> sound/soc/soc-compress.c:294:1: error: duplicate label 'out'
     294 | out:
         | ^~~
   sound/soc/soc-compress.c:290:9: note: previous definition of 'out' with type 'void'
     290 |         out:
         |         ^~~


vim +/out +294 sound/soc/soc-compress.c

   223	
   224	static int soc_compr_open_fe(struct snd_compr_stream *cstream)
   225	{
   226		struct snd_soc_pcm_runtime *fe = cstream->private_data;
   227		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
   228		struct snd_soc_dpcm *dpcm;
   229		struct snd_soc_dapm_widget_list *list;
   230		int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
   231		int ret;
   232	
   233		snd_soc_card_mutex_lock(fe->card);
   234	
   235		ret = soc_compr_alloc_fe_runtime(fe, stream);
   236		if (ret < 0)
   237			goto be_err;
   238	
   239		ret = dpcm_path_get(fe, stream, &list);
   240		if (ret < 0)
   241			goto be_err;
   242	
   243		{
   244			/* avoid scoped_guard() to allow goto */
   245			guard(pcm_mutex)(fe->card);
   246	
   247			/* calculate valid and active FE <-> BE dpcms */
   248			dpcm_add_paths(fe, stream, &list);
   249	
   250			fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
   251	
   252			ret = dpcm_be_dai_startup(fe, stream);
   253			if (ret < 0) {
   254				/* clean up all links */
   255				for_each_dpcm_be(fe, stream, dpcm)
   256					dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
   257	
   258				dpcm_be_disconnect(fe, stream);
   259				goto out;
   260			}
   261	
   262			ret = snd_soc_dai_compr_startup(cpu_dai, cstream);
   263			if (ret < 0)
   264				goto out;
   265	
   266			ret = snd_soc_compr_components_open(cstream);
   267			if (ret < 0)
   268				goto open_err;
   269	
   270			ret = snd_soc_link_compr_startup(cstream);
   271			if (ret < 0)
   272				goto machine_err;
   273	
   274			dpcm_clear_pending_state(fe, stream);
   275			dpcm_path_put(&list);
   276	
   277			fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
   278			fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
   279	
   280			snd_soc_runtime_stream_user_update(fe, stream, 1);
   281	
   282			/* success */
   283			goto out;
   284	
   285			/* error handling in guard() */
   286		machine_err:
   287			snd_soc_compr_components_free(cstream, 1);
   288		open_err:
   289			snd_soc_dai_compr_shutdown(cpu_dai, cstream, 1);
   290		out:
   291			dpcm_path_put(&list);
   292			goto be_err;
   293		}
 > 294	out:
   295		snd_soc_card_mutex_unlock(fe->card);
   296	
   297		return 0;
   298	
   299	be_err:
   300		soc_compr_free_fe_runtime(fe, stream);
   301		fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
   302		snd_soc_card_mutex_unlock(fe->card);
   303	
   304		return soc_compr_ret(fe, ret);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
