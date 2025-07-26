Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CD242D92
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753525593; cv=none; b=Fd9SGatjfy0DRABvA265RWnxxywmiduXw+pvVFnvsdS8JBjsTS0idOl1z6vUXwb3vWbeuSi0dBP0AFkv8UQH/SJ1+TLajpPoua+/sbjpzb5lgnaXU95+MPp3fCIlNqFYeHIUVBc007LEcx/K7QKYlgWwubXRbImM2/GbUveF+AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753525593; c=relaxed/simple;
	bh=0t2t5gOaH4FT/nkKwfR5kcbQmx/FGJLG1SNJAyN3m2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3l7P4zvwZvm3GpK2hJTFkYQZNkdTvCEByQNJ2eQx48z3F8mGVjPRfTpPkGec5CpQol0KZZpP1qnBome0L0p/f0iuw9H9bLLK0z99uci3HskbKkUqsmem8S1MHUXCLr3dUf7PTNKpDanLXjq2RHypqjDkNAkkv8gsqUlDAiSll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kI75EkgM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kI75EkgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753525592; x=1785061592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0t2t5gOaH4FT/nkKwfR5kcbQmx/FGJLG1SNJAyN3m2w=;
  b=kI75EkgMA4kS1I1DeFUB81AEaD0/D+gPmNJWwgf+8eTE2PU8Dn35I5Ej
   uIE5Rcpe1xuP4BnFTUqDyRw6B8Z4WIko/50FQDe6yM/ze3uq/TtHrM1np
   iXWbHlDDVmthbcmwpXNJHAjpZlUfMGUAnxcCV2aADRdeZHk3e7o9qjMTf
   93o3fjVqFwjrChDhKA34jlRMRLaRFXyicIYso65GFzNgSF5tIXTlSh6v6
   E5oZ2GToDA8l1wvtqXfsyJTyROjqoBbW7atbmkwRYJfvL8gSSOU5SXygc
   6iv6mculhnJb2oDDryXjw9NDwiEEqy4uq5KYiEmZ4N15QHo3FMA6ylXTM
   A==;
X-CSE-ConnectionGUID: xrXk+EeUSWqSyQny+d9yog==
X-CSE-MsgGUID: rYYBzm2tQ2mfxaLO4C6rmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55996074"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55996074"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:26:32 -0700
X-CSE-ConnectionGUID: MSiKk5w8SaOgVodEbqULPQ==
X-CSE-MsgGUID: 1oGAlqsQQqezTwykz+547w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192406726"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 03:26:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufc6h-000LsF-32;
	Sat, 26 Jul 2025 10:26:23 +0000
Date: Sat, 26 Jul 2025 18:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Joris Verhaegen <verhaegen@google.com>,
	kernel-team@android.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v3 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
Message-ID: <202507261801.Ma45NLlT-lkp@intel.com>
References: <20250725114249.2086974-2-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725114249.2086974-2-verhaegen@google.com>

Hi Joris,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16-rc7 next-20250725]
[cannot apply to broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joris-Verhaegen/ALSA-compress_offload-Add-64-bit-safe-timestamp-infrastructure/20250725-194613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20250725114249.2086974-2-verhaegen%40google.com
patch subject: [PATCH v3 1/3] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
config: loongarch-randconfig-001-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261801.Ma45NLlT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261801.Ma45NLlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261801.Ma45NLlT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/sof-client-probes.c:156:20: error: initialization of 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp64 *, struct snd_soc_dai *)' from incompatible pointer type 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
     156 |         .pointer = sof_probes_compr_pointer,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/sof-client-probes.c:156:20: note: (near initialization for 'sof_probes_compr_ops.pointer')
   sound/soc/sof/sof-client-probes.c:139:12: note: 'sof_probes_compr_pointer' declared here
     139 | static int sof_probes_compr_pointer(struct snd_compr_stream *cstream,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/intel/avs/probes.c:260:20: error: initialization of 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp64 *, struct snd_soc_dai *)' from incompatible pointer type 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
     260 |         .pointer = avs_probe_compr_pointer,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/probes.c:260:20: note: (near initialization for 'avs_probe_cdai_ops.pointer')
   sound/soc/intel/avs/probes.c:215:12: note: 'avs_probe_compr_pointer' declared here
     215 | static int avs_probe_compr_pointer(struct snd_compr_stream *cstream,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +156 sound/soc/sof/sof-client-probes.c

3dc0d709177828 Peter Ujfalusi 2022-02-10  150  
3dc0d709177828 Peter Ujfalusi 2022-02-10  151  static const struct snd_soc_cdai_ops sof_probes_compr_ops = {
3dc0d709177828 Peter Ujfalusi 2022-02-10  152  	.startup = sof_probes_compr_startup,
3dc0d709177828 Peter Ujfalusi 2022-02-10  153  	.shutdown = sof_probes_compr_shutdown,
3dc0d709177828 Peter Ujfalusi 2022-02-10  154  	.set_params = sof_probes_compr_set_params,
3dc0d709177828 Peter Ujfalusi 2022-02-10  155  	.trigger = sof_probes_compr_trigger,
3dc0d709177828 Peter Ujfalusi 2022-02-10 @156  	.pointer = sof_probes_compr_pointer,
3dc0d709177828 Peter Ujfalusi 2022-02-10  157  };
3dc0d709177828 Peter Ujfalusi 2022-02-10  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
