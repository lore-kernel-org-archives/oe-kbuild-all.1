Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550B63B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675264717; x=1706800717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4JRv8nyNKoPha8aIjwZ2KZ1kP577uTomNfk6/0Tmsfc=;
  b=Iv1c5hn2a6/e5US3SUllxCLAjVV+nEM2eEun7YuP+A7w66SGPd0U/wz+
   Y2/D5eUWFPR4CwTJAn0ePeAio1H5CS7sJE+/2sxjIEX2LpsaeKWxwoFLK
   Q851pn8TXzq2q919zynWSsGO2jEo/GWfxCkRDyxeiVa/CjkcbBBlYJU/l
   krFHQ/fGgBNI41DrMHYLOO/WCZKIRoSQj3hBHwBhHWXONgLq8oN3S0Eht
   UU/D0qKoaVl6mSVpVAjlMYCy1hAdnR2gZJy5LrFQVIpwIyx8xVIf/NWaV
   7+K1slgeAAgRGThM91loqsRMHvDEIl+FRPFgleVcWPn1ekKnV/6XOV4b6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="330300977"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="330300977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 07:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993729630"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="993729630"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 07:18:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNEsY-0005Wy-1w;
	Wed, 01 Feb 2023 15:18:30 +0000
Date: Wed, 1 Feb 2023 23:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
	andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
	srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, swboyd@chromium.org,
	judyhsiao@chromium.org, devicetree@vger.kernel.org,
	konrad.dybcio@linaro.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: Re: [PATCH 11/14] ASoC: q6dsp: q6apm-dai: Add compress set params
 and metadata DAI callbacks
Message-ID: <202302012348.LL8vhyj4-lkp@intel.com>
References: <20230201134947.1638197-12-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201134947.1638197-12-quic_mohs@quicinc.com>

Hi Mohammad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230201]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Rafi-Shaik/ALSA-compress-Update-compress-set-params-for-gapless-playback/20230201-215622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230201134947.1638197-12-quic_mohs%40quicinc.com
patch subject: [PATCH 11/14] ASoC: q6dsp: q6apm-dai: Add compress set params and metadata DAI callbacks
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302012348.LL8vhyj4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f6204693a956c267d6cdfd17f5c27da0f4594ca3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mohammad-Rafi-Shaik/ALSA-compress-Update-compress-set-params-for-gapless-playback/20230201-215622
        git checkout f6204693a956c267d6cdfd17f5c27da0f4594ca3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/qcom/qdsp6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/qcom/qdsp6/q6apm-dai.c:152:6: warning: no previous prototype for 'event_handler_compr' [-Wmissing-prototypes]
     152 | void event_handler_compr(uint32_t opcode, uint32_t token,
         |      ^~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/q6apm-dai.c:576:5: warning: no previous prototype for 'q6apm_dai_compr_trigger' [-Wmissing-prototypes]
     576 | int q6apm_dai_compr_trigger(struct snd_soc_component *component,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/q6apm-dai.c:610:5: warning: no previous prototype for 'q6apm_dai_compr_ack' [-Wmissing-prototypes]
     610 | int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_compr_stream *stream,
         |     ^~~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/q6apm-dai.c: In function '__q6apm_dai_compr_set_codec_params':
>> sound/soc/qcom/qdsp6/q6apm-dai.c:632:34: warning: variable 'codec_options' set but not used [-Wunused-but-set-variable]
     632 |         union snd_codec_options *codec_options;
         |                                  ^~~~~~~~~~~~~


vim +/codec_options +632 sound/soc/qcom/qdsp6/q6apm-dai.c

   623	
   624	static int __q6apm_dai_compr_set_codec_params(struct snd_soc_component *component,
   625						      struct snd_compr_stream *stream,
   626						      struct snd_codec *codec,
   627						      int stream_id)
   628	{
   629		struct snd_compr_runtime *runtime = stream->runtime;
   630		struct q6apm_dai_rtd *prtd = runtime->private_data;
   631		struct device *dev = component->dev;
 > 632		union snd_codec_options *codec_options;
   633	
   634		codec_options = &(prtd->codec.options);
   635	
   636		memcpy(&prtd->codec, codec, sizeof(*codec));
   637		q6apm_set_real_module_id(dev, prtd->graph, codec->id);
   638	
   639		return 0;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
