Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20DD11C8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651737; x=1727187737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFBkREyUEOoJo/7sr+HgtlYEdliPsXp958T+5A/8gS4=;
  b=V97mhSGOtym1onplTCvWvpF2Do5i1u0bwZzhDZbNgO1zCYkT0ueXKS4y
   j4I6jBAdckdt/s8iVLbA/tXBVdIUOpqLHNm+CRTLr5DCWvCZee+/zazD4
   Ytq25ViYW9rrYJ1FC+T+Sk0dq/6mHTcFEkLHABnKSbL7CeFZI2GUWlQm4
   FEsAlSAjev7p614q6xKywdJ0U/BOvmZyzg0wWmNokPqQH6wk5fSjEnH0s
   qiuoK8a+zsYeMpdLLQu11peoKw8snO0erbJOmeefX06+2+YDDYgVpoz0P
   SE/gVkTiIXLvzyyeIheZSGt2jluiwnmUVs9plr84/TmVK4MO3QKKlyOAT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371583813"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="371583813"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 07:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777664327"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="777664327"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2023 07:22:14 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkmTU-0001Zj-08;
	Mon, 25 Sep 2023 14:22:12 +0000
Date: Mon, 25 Sep 2023 22:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 2/4] ALSA: hda: Introduce HOST stream setup mechanism
Message-ID: <202309252200.gnjksNmD-lkp@intel.com>
References: <20230925115844.18795-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925115844.18795-3-cezary.rojewski@intel.com>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-hda-Poll-SDxFIFOS-after-programming-SDxFMT/20230925-200351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230925115844.18795-3-cezary.rojewski%40intel.com
patch subject: [PATCH 2/4] ALSA: hda: Introduce HOST stream setup mechanism
config: x86_64-buildonly-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252200.gnjksNmD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252200.gnjksNmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252200.gnjksNmD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/ext/hdac_ext_stream.c:28: warning: Function parameter or member 'hext_stream' not described in 'snd_hdac_ext_host_stream_setup'
>> sound/hda/ext/hdac_ext_stream.c:41: warning: Function parameter or member 'hstream' not described in 'snd_hdac_apl_host_stream_setup'


vim +28 sound/hda/ext/hdac_ext_stream.c

    20	
    21	/**
    22	 * snd_hdac_ext_host_stream_setup - Setup a HOST stream.
    23	 * @hext_stream - HDAudio stream to set up.
    24	 *
    25	 * Return: Zero on success or negative error code.
    26	 */
    27	int snd_hdac_ext_host_stream_setup(struct hdac_ext_stream *hext_stream)
  > 28	{
    29		return hext_stream->host_setup(hdac_stream(hext_stream));
    30	}
    31	EXPORT_SYMBOL_GPL(snd_hdac_ext_host_stream_setup);
    32	
    33	/**
    34	 * snd_hdac_apl_host_stream_setup - Setup a HOST stream following procedure
    35	 *                                  recommended for ApolloLake devices.
    36	 * @hstream - HDAudio stream to set up.
    37	 *
    38	 * Return: Zero on success or negative error code.
    39	 */
    40	static int snd_hdac_apl_host_stream_setup(struct hdac_stream *hstream)
  > 41	{
    42		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
    43		int ret;
    44	
    45		snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, false);
    46		ret = snd_hdac_stream_setup(hstream);
    47		snd_hdac_ext_stream_decouple(hstream->bus, hext_stream, true);
    48	
    49		return ret;
    50	}
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
