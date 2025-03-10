Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928E2F28
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741584589; cv=none; b=Fr+Yyo3uxsURA7AD+IVgnTDBurqu4FnVnjphDK47/TjMv7WjzVnby4vB+GGBq3+kYb8xMFx8KGk4AC2sSwQHq3VNXwoPB6Pz+uaIwGbzPN4aBt0TJEznw9xbNYBzTls3XvRadSeki6u+7iXCWyDAI12TydBitzsQnX+sJQkeQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741584589; c=relaxed/simple;
	bh=9TpJZU4IMxFlFq9rtNq9EpuRURaYQ9iymzogtbnkoNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJFhuwp3GCqdWvhA5er8vslKUKkucBvGuRc6pFOihwzaniqfA+PsLQ0luHewQk1zOSyatlVcMlvOsJRpUfa7r+P4G/L3hcWIC4FxFhNgFq+URLmis/Pw8bo9WiuS6EsJ/Tie3VKYfQd8bO38L4ojP7y8omG1TR6sQK7W6EAQHjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCmM9Iok; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCmM9Iok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741584587; x=1773120587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9TpJZU4IMxFlFq9rtNq9EpuRURaYQ9iymzogtbnkoNs=;
  b=VCmM9Iokl7KtNptEc9mdznB2JwIoAFfvnL4yLRqDPGqmhVzbJ6bhNiY6
   YXjjoQJvW/yRTPLrDjXDC91A0OwqLRuHSXYJ2ehqAHUt8tCNL4v21dsQ7
   eOqAf0JxRdHtj+jlwEYWDM/HJeX8FJb0ZjMMSVVxF8hw11RG6LajVjlPB
   Yu5YcghMTFqIs7aHPeMUvYJWLKPz2B3jaQStGpb1mLWmegG00AUKF0IEQ
   Uk9Mmm5cMERq99BGccyFFazUgsBX2SML71ZPecKWB4qpiDDqGf2dotoZx
   B4/t8Nmu21HR7pVPUV3aGhgcv8QKqo3zsWax3ODfbgC0BTlt66ia0DYgh
   Q==;
X-CSE-ConnectionGUID: 9dJZUfh4S0SfvvCm9/w/oQ==
X-CSE-MsgGUID: 5mmEJ8OOTAqO50hHPnNyqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46210654"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46210654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 22:29:46 -0700
X-CSE-ConnectionGUID: HKY+LWCOQX6ZXEdzbrUayw==
X-CSE-MsgGUID: XsuJdeP3R+WaBmOKAbQbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119605396"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Mar 2025 22:29:46 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trVhg-0003pw-2n;
	Mon, 10 Mar 2025 05:29:32 +0000
Date: Mon, 10 Mar 2025 13:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-03-07 17/40]
 sound/soc/soc-pcm.c:1635:22: error: implicit declaration of function
 'snd_soc_dpcm_can_be_update'; did you mean 'snd_soc_dpcm_can_be_params'?
Message-ID: <202503101325.i4b6ektq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kuninori,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/morimoto/linux sound-cleanup-2025-03-07
head:   609577579ecf4de9913d0d83a96d240bd935a4a1
commit: f6c0618b06d3285bd3ddd254ce62c5eb92c6e4f1 [17/40] ASoC: soc-pcm: tidyup function name to snd_soc_dpcm_be_can_xxx()
config: arm-randconfig-002-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101325.i4b6ektq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101325.i4b6ektq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101325.i4b6ektq-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-pcm.c: In function 'dpcm_be_dai_stop':
>> sound/soc/soc-pcm.c:1635:22: error: implicit declaration of function 'snd_soc_dpcm_can_be_update'; did you mean 'snd_soc_dpcm_can_be_params'? [-Wimplicit-function-declaration]
    1635 |                 if (!snd_soc_dpcm_can_be_update(fe, be, stream))
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      snd_soc_dpcm_can_be_params
   sound/soc/soc-pcm.c: At top level:
   sound/soc/soc-pcm.c:48:12: warning: 'snd_soc_dpcm_be_can_update' defined but not used [-Wunused-function]
      48 | static int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1635 sound/soc/soc-pcm.c

  1619	
  1620	void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
  1621			      int do_hw_free, struct snd_soc_dpcm *last)
  1622	{
  1623		struct snd_soc_dpcm *dpcm;
  1624	
  1625		/* disable any enabled and non active backends */
  1626		for_each_dpcm_be(fe, stream, dpcm) {
  1627			struct snd_soc_pcm_runtime *be = dpcm->be;
  1628			struct snd_pcm_substream *be_substream =
  1629				snd_soc_dpcm_get_substream(be, stream);
  1630	
  1631			if (dpcm == last)
  1632				return;
  1633	
  1634			/* is this op for this BE ? */
> 1635			if (!snd_soc_dpcm_can_be_update(fe, be, stream))
  1636				continue;
  1637	
  1638			if (be->dpcm[stream].users == 0) {
  1639				dev_err(be->dev, "ASoC: no users %s at close - state %d\n",
  1640					snd_pcm_direction_name(stream),
  1641					be->dpcm[stream].state);
  1642				continue;
  1643			}
  1644	
  1645			if (--be->dpcm[stream].users != 0)
  1646				continue;
  1647	
  1648			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) {
  1649				if (!do_hw_free)
  1650					continue;
  1651	
  1652				if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE) {
  1653					__soc_pcm_hw_free(be, be_substream);
  1654					be->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_FREE;
  1655				}
  1656			}
  1657	
  1658			__soc_pcm_close(be, be_substream);
  1659			be_substream->runtime = NULL;
  1660			be->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE;
  1661		}
  1662	}
  1663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
