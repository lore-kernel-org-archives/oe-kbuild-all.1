Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9823C163
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 00:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691712866; x=1723248866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nWN01ffOqfMXoyjd+QfHEB/YrmCjYDGKbQyy+xMiyDg=;
  b=XKLaI6ugNhVHc0PMy9MGQmgJucvTKRtWKVPw6QHHs9kkcjDA4jHwQF/D
   uXHEphYdeoT48UPGPdXxxM3nOUtGDJ4t7ZoSqcy7MlBSmlq9UWE7H2Zz1
   7Xnj1yLR8x7xDHZDOq7rPux3X99cCvzIdW1F3APSAmWYTkCnZgrwo423f
   bw7VTl3/LDWCUzvwTFLwAAvxZpycrCXa3jr4cQkPEOqwWAuPvwwecz467
   SrPEU/Nq9znd5S7q/Gm/R9dU7N/IjEBAWRdLGigh2UpJ74TZkaJjLx03k
   nEWkwOhv3BCD8e1+BSNyhGZfAUDWYTFuDYMJHowZj4XaFu+pFZEqFkbUq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370458871"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="370458871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 17:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="682332081"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="682332081"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Aug 2023 17:14:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUFnL-0007MO-2J;
	Fri, 11 Aug 2023 00:14:23 +0000
Date: Fri, 11 Aug 2023 08:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/7] media: imx: fsl_asrc: Add memory to memory
 driver
Message-ID: <202308110826.slP3yZxy-lkp@intel.com>
References: <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690265540-25999-6-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on media-tree/master tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20230725-144857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/1690265540-25999-6-git-send-email-shengjiu.wang%40nxp.com
patch subject: [RFC PATCH v2 5/7] media: imx: fsl_asrc: Add memory to memory driver
config: openrisc-randconfig-r082-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110826.slP3yZxy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110826.slP3yZxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110826.slP3yZxy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/nxp/fsl_asrc_m2m.c:458:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] format @@     got restricted snd_pcm_format_t @@
   drivers/media/platform/nxp/fsl_asrc_m2m.c:458:29: sparse:     expected unsigned int [usertype] format
   drivers/media/platform/nxp/fsl_asrc_m2m.c:458:29: sparse:     got restricted snd_pcm_format_t
   drivers/media/platform/nxp/fsl_asrc_m2m.c:472:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] format @@     got restricted snd_pcm_format_t @@
   drivers/media/platform/nxp/fsl_asrc_m2m.c:472:29: sparse:     expected unsigned int [usertype] format
   drivers/media/platform/nxp/fsl_asrc_m2m.c:472:29: sparse:     got restricted snd_pcm_format_t
>> drivers/media/platform/nxp/fsl_asrc_m2m.c:502:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_format_t @@     got unsigned int [usertype] format @@
   drivers/media/platform/nxp/fsl_asrc_m2m.c:502:38: sparse:     expected restricted snd_pcm_format_t
   drivers/media/platform/nxp/fsl_asrc_m2m.c:502:38: sparse:     got unsigned int [usertype] format
   drivers/media/platform/nxp/fsl_asrc_m2m.c:535:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted snd_pcm_format_t @@     got unsigned int [usertype] format @@
   drivers/media/platform/nxp/fsl_asrc_m2m.c:535:38: sparse:     expected restricted snd_pcm_format_t
   drivers/media/platform/nxp/fsl_asrc_m2m.c:535:38: sparse:     got unsigned int [usertype] format

vim +458 drivers/media/platform/nxp/fsl_asrc_m2m.c

   449	
   450	static int fsl_asrc_m2m_g_fmt_aud_cap(struct file *file, void *fh,
   451					      struct v4l2_format *f)
   452	{
   453		struct fsl_asrc_pair_m2m *pair_m2m = fsl_asrc_m2m_fh_to_ctx(fh);
   454		struct fsl_asrc_pair *pair = pair_m2m->pair;
   455	
   456		f->fmt.audio.channels = pair->channels;
   457		f->fmt.audio.rate = pair->rate[V4L_CAP];
 > 458		f->fmt.audio.format = pair->sample_format[V4L_CAP];
   459		f->fmt.audio.buffersize = pair->buf_len[V4L_CAP];
   460	
   461		return 0;
   462	}
   463	
   464	static int fsl_asrc_m2m_g_fmt_aud_out(struct file *file, void *fh,
   465					      struct v4l2_format *f)
   466	{
   467		struct fsl_asrc_pair_m2m *pair_m2m = fsl_asrc_m2m_fh_to_ctx(fh);
   468		struct fsl_asrc_pair *pair = pair_m2m->pair;
   469	
   470		f->fmt.audio.channels = pair->channels;
   471		f->fmt.audio.rate = pair->rate[V4L_OUT];
   472		f->fmt.audio.format = pair->sample_format[V4L_OUT];
   473		f->fmt.audio.buffersize = pair->buf_len[V4L_OUT];
   474	
   475		return 0;
   476	}
   477	
   478	/* output for asrc */
   479	static int fsl_asrc_m2m_s_fmt_aud_cap(struct file *file, void *fh,
   480					      struct v4l2_format *f)
   481	{
   482		struct fsl_asrc_pair_m2m *pair_m2m = fsl_asrc_m2m_fh_to_ctx(fh);
   483		struct fsl_asrc_pair *pair = pair_m2m->pair;
   484		struct fsl_asrc_m2m *m2m = pair_m2m->m2m;
   485		struct fsl_asrc *asrc = pair->asrc;
   486		struct device *dev = &m2m->pdev->dev;
   487		int ret;
   488	
   489		ret = asrc->m2m_check_format(OUT, f->fmt.audio.rate,
   490					     f->fmt.audio.channels,
   491					     f->fmt.audio.format);
   492		if (ret)
   493			return -EINVAL;
   494	
   495		if (pair->channels > 0 && pair->channels != f->fmt.audio.channels) {
   496			dev_err(dev, "channels don't match for cap and out\n");
   497			return -EINVAL;
   498		}
   499	
   500		pair->channels = f->fmt.audio.channels;
   501		pair->rate[V4L_CAP] = f->fmt.audio.rate;
 > 502		pair->sample_format[V4L_CAP] = f->fmt.audio.format;
   503	
   504		/* Get buffer size from user */
   505		if (f->fmt.audio.buffersize > pair->buf_len[V4L_CAP])
   506			pair->buf_len[V4L_CAP] = f->fmt.audio.buffersize;
   507	
   508		return 0;
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
