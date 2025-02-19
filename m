Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F962199E80
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972910; cv=none; b=BupS2dN0xWyI/QWgCiHUuSeabEZuHCqZePS8TzzDyeIu9HSOEe/ytRiDmZsu0KfoxWcVFLmPCwpz0uTVXy4W9bje7XT0O0TZNRU9HeAq0EMtrd3qeahE3n5ZBJYY+kADWu9LdIzPexHtUa67mC3BrAOXGUopagJQ1IOJJyEmCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972910; c=relaxed/simple;
	bh=tIK7kFza3sL0D9wNlcKtEu4i0wEtVs8EtIGXPflSyKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k9dI9P/CwJRNZc3+Fc3INjFuO413hwGoqGdaXUc6Hm2S6G0/8xP0A9NfzSEJRxPbOTw5i1OBaXShzdkVSpmA6rgnALmiVSS1Yl3mbBWgX7lk80l/qWvVpm0yzxFhRX/Q6g9vWPcib1pSAuAKeYnjS+bAJawAXC5GOTu6lHILUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTZlN0GV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTZlN0GV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739972909; x=1771508909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tIK7kFza3sL0D9wNlcKtEu4i0wEtVs8EtIGXPflSyKk=;
  b=mTZlN0GVLtPSoklJUKgycOaaC94+T3GhBV3zUzkj2tkEDGp666BgTSoJ
   ZntQ20kfxRTFZWxtcZpiv0+wxAXdrBsChfOijvpbl3vGkXEz4ejnyAxb/
   sY2K5qZhza2gU68pYCrpt3Lf1HrLWJyNmRE2r+TTV33hefbfsFvKWGWlZ
   mp6plt80q0BUDy3rnR9bU06ApbU2C14q0qJH58UQWmf+SVIZIK34YnCTD
   FA1ftfwOqyXoHbpO/r9GkemPlD0QaY8crmhGtNvQEQhKsrr2gur7Av2dk
   N1qHcte00/vsvaBna+O9pdlIvNOEcZlSPT/O6ulERo4HqtWaLqEr3cJqb
   A==;
X-CSE-ConnectionGUID: Aw/B9zM+Tjy6178PED0HXg==
X-CSE-MsgGUID: 3fx1h7/uT8SHBtNBYZZThQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44475504"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44475504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 05:48:28 -0800
X-CSE-ConnectionGUID: bl1KTwy5RAGt7T8wZHwiFQ==
X-CSE-MsgGUID: R/yV5wcVQW2PuEjeMZ1Biw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114569055"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 05:48:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkkQ1-00030r-0T;
	Wed, 19 Feb 2025 13:47:34 +0000
Date: Wed, 19 Feb 2025 21:46:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Keyon Jie <yang.jie@linux.intel.com>
Subject: [intel-lts:pr/59 1/1] sound/soc/sof/topology.c:592:8: warning: this
 statement may fall through
Message-ID: <202502192135.3TN3m38m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: a063b0a4ca6affa206cbcde529f557edb5fdf5c2 [1/1] ASoC: SOF: topology: fix logic for parsing dmic pdm tokens
config: sparc-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192135.3TN3m38m-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192135.3TN3m38m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192135.3TN3m38m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sof/topology.c: In function 'sof_control_load_volume':
   sound/soc/sof/topology.c:244:28: warning: variable 'cdata' set but not used [-Wunused-but-set-variable]
     struct sof_ipc_ctrl_data *cdata;
                               ^~~~~
   sound/soc/sof/topology.c: In function 'snd_sof_load_topology':
   sound/soc/sof/topology.c:2001:27: warning: variable 'hdr' set but not used [-Wunused-but-set-variable]
     struct snd_soc_tplg_hdr *hdr;
                              ^~~
   sound/soc/sof/topology.c: In function 'sof_parse_word_tokens':
>> sound/soc/sof/topology.c:592:8: warning: this statement may fall through [-Wimplicit-fallthrough=]
        if (index)
           ^
   sound/soc/sof/topology.c:594:4: note: here
       case SOF_TKN_INTEL_DMIC_PDM_MIC_A_Enable:
       ^~~~


vim +592 sound/soc/sof/topology.c

   554	
   555	static void sof_parse_word_tokens(struct snd_soc_component *scomp,
   556					  void *object,
   557					  const struct sof_topology_token *tokens,
   558					  int count,
   559					  struct snd_soc_tplg_vendor_array *array)
   560	{
   561		struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
   562		struct snd_soc_tplg_vendor_value_elem *elem;
   563		size_t size = sizeof(struct sof_ipc_dai_dmic_pdm_ctrl);
   564		int i, j;
   565		u32 offset;
   566		u32 *index = NULL;
   567	
   568		/* parse element by element */
   569		for (i = 0; i < array->num_elems; i++) {
   570			elem = &array->value[i];
   571	
   572			/* search for token */
   573			for (j = 0; j < count; j++) {
   574				/* match token type */
   575				if (!(tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_WORD ||
   576				      tokens[j].type == SND_SOC_TPLG_TUPLE_TYPE_SHORT))
   577					continue;
   578	
   579				/* match token id */
   580				if (tokens[j].token != elem->token)
   581					continue;
   582	
   583				/* pdm config array index */
   584				if (sdev->private)
   585					index = (u32 *)sdev->private;
   586	
   587				/* matched - determine offset */
   588				switch (tokens[j].token) {
   589				case SOF_TKN_INTEL_DMIC_PDM_CTRL_ID:
   590	
   591					/* inc number of pdm array index */
 > 592					if (index)
   593						++(*index);
   594				case SOF_TKN_INTEL_DMIC_PDM_MIC_A_Enable:
   595				case SOF_TKN_INTEL_DMIC_PDM_MIC_B_Enable:
   596				case SOF_TKN_INTEL_DMIC_PDM_POLARITY_A:
   597				case SOF_TKN_INTEL_DMIC_PDM_POLARITY_B:
   598				case SOF_TKN_INTEL_DMIC_PDM_CLK_EDGE:
   599				case SOF_TKN_INTEL_DMIC_PDM_SKEW:
   600	
   601					/* check if array index is valid */
   602					if (!index || *index == 0) {
   603						dev_err(sdev->dev,
   604							"error: invalid array offset\n");
   605						continue;
   606					} else {
   607						/* offset within the pdm config array */
   608						offset = size * (*index - 1);
   609					}
   610					break;
   611				default:
   612					offset = 0;
   613					break;
   614				}
   615	
   616				/* load token */
   617				tokens[j].get_token(elem, object,
   618						    offset + tokens[j].offset,
   619						    tokens[j].size);
   620			}
   621		}
   622	}
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
