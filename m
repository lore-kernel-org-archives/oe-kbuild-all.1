Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390E361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689813360; x=1721349360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iFE5rYZg10NWLMvogW49qG9lRTX7y8rSpefbZH/OVwE=;
  b=OEhj+8PicAOyCV5I+YO+WLJSodtRY55vLcEykLRAVYiCjspqfo63xzvO
   vqia1ToSO3tObGsA9IG4OuWlRFRW6pkSqlcX//rOplMQ8pzeAlcghtSnu
   DygPuKubIEZZO99hwJ0TQo4QdoGkbLXVZQv8Bvr6k4MrWoDOQBAGqdicp
   2wgeY31KhY0mzT/R2OTXprst14Ia/4uXXuZkGWNPhk9sGF0c7OTfG3vM3
   MNwYks6SpRAZIYhMPohUOFMC6RTY+nsg7391shiNkj0SNahc+vBA5n/TP
   dsDzMxYhkVE9nIzJ7V8Kb692ICKK8uCQJD9SDmsSN3D1TZP7g9VXLjR/c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365484718"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="365484718"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 17:35:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753883315"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="753883315"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Jul 2023 17:35:58 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMHe9-0005cf-0q;
	Thu, 20 Jul 2023 00:35:57 +0000
Date: Thu, 20 Jul 2023 08:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.0.x-imx 4851/12470]
 sound/soc/fsl/imx-hdmi-dma.c:387: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202307200835.xdmH23K0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.0.x-imx
head:   b872b1170fc8843b55e9f8838dd373ff43bb7552
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/12470] Merge branch 'mxc/next' into next
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200835.xdmH23K0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200835.xdmH23K0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200835.xdmH23K0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/imx-hdmi-dma.c:226:5: warning: no previous prototype for 'odd_ones' [-Wmissing-prototypes]
     226 | int odd_ones(unsigned a)
         |     ^~~~~~~~
--
>> sound/soc/fsl/imx-hdmi-dma.c:387: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Convert pcm samples to iec samples suitable for HDMI transfer.


vim +387 sound/soc/fsl/imx-hdmi-dma.c

32ecbcfdff46d0 Shengjiu Wang 2014-08-27  225  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27 @226  int odd_ones(unsigned a)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  227  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  228  	a ^= a >> 8;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  229  	a ^= a >> 4;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  230  	a ^= a >> 2;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  231  	a ^= a >> 1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  232  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  233  	return a & 1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  234  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  235  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  236  /* Add frame information for one pcm subframe */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  237  static u32 hdmi_dma_add_frame_info(struct hdmi_dma_priv *priv,
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  238  				   u32 pcm_data, int subframe_idx)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  239  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  240  	union hdmi_audio_dma_data_t subframe;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  241  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  242  	subframe.U = 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  243  	iec_header.B.channel = subframe_idx;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  244  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  245  	/* fill b (start-of-block) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  246  	subframe.B.b = (priv->frame_idx == 0) ? 1 : 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  247  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  248  	/* fill c (channel status) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  249  	if (priv->frame_idx < 42)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  250  		subframe.B.c = (iec_header.U >> priv->frame_idx) & 0x1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  251  	else
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  252  		subframe.B.c = 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  253  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  254  	subframe.B.p = odd_ones(pcm_data);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  255  	subframe.B.p ^= subframe.B.c;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  256  	subframe.B.p ^= subframe.B.u;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  257  	subframe.B.p ^= subframe.B.v;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  258  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  259  	/* fill data */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  260  	if (priv->sample_bits == 16)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  261  		subframe.B.data = pcm_data << 8;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  262  	else
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  263  		subframe.B.data = pcm_data;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  264  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  265  	return subframe.U;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  266  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  267  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  268  static void init_table(int channels)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  269  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  270  	unsigned char *p = g_packet_head_table;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  271  	int i, ch = 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  272  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  273  	for (i = 0; i < 48; i++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  274  		int b = 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  275  		if (i == 0)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  276  			b = 1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  277  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  278  		for (ch = 0; ch < channels; ch++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  279  			int c = 0;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  280  			if (i < 42) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  281  				iec_header.B.channel = ch+1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  282  				c = (iec_header.U >> i) & 0x1;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  283  			}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  284  			/* preset bit p as c */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  285  			*p++ = (b << 4) | (c << 2) | (c << 3);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  286  		}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  287  	}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  288  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  289  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  290  /*
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  291   * FIXME: Disable NEON Optimization in hdmi, or it will cause crash of
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  292   * pulseaudio in the userspace. There is no issue for the Optimization
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  293   * implemenation, if only use "VPUSH, VPOP" in the function, the pulseaudio
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  294   * will crash also. So for my assumption, we can't use the NEON in the
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  295   * interrupt.(tasklet is implemented by softirq.)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  296   * Disable SMP, preempt, change the dma buffer to nocached, add protection of
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  297   * Dn register and fpscr, all these operation have no effect to the result.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  298   */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  299  #define HDMI_DMA_NO_NEON
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  300  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  301  #ifdef HDMI_DMA_NO_NEON
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  302  /* Optimization for IEC head */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  303  static void hdmi_dma_copy_16_c_lut(u16 *src, u32 *dst, int samples,
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  304  				u8 *lookup_table)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  305  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  306  	u32 sample, head, p;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  307  	int i;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  308  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  309  	for (i = 0; i < samples; i++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  310  		/* get source sample */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  311  		sample = *src++;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  312  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  313  		/* xor every bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  314  		p = sample ^ (sample >> 8);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  315  		p ^= (p >> 4);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  316  		p ^= (p >> 2);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  317  		p ^= (p >> 1);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  318  		p &= 1;	/* only want last bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  319  		p <<= 3; /* bit p */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  320  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  321  		/* get packet header */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  322  		head = *lookup_table++;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  323  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  324  		/* fix head */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  325  		head ^= p;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  326  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  327  		/* store */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  328  		*dst++ = (head << 24) | (sample << 8);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  329  	}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  330  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  331  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  332  static void hdmi_dma_copy_16_c_fast(u16 *src, u32 *dst, int samples)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  333  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  334  	u32 sample, p;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  335  	int i;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  336  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  337  	for (i = 0; i < samples; i++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  338  		/* get source sample */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  339  		sample = *src++;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  340  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  341  		/* xor every bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  342  		p = sample ^ (sample >> 8);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  343  		p ^= (p >> 4);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  344  		p ^= (p >> 2);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  345  		p ^= (p >> 1);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  346  		p &= 1;	/* only want last bit */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  347  		p <<= 3; /* bit p */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  348  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  349  		/* store */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  350  		*dst++ = (p << 24) | (sample << 8);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  351  	}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  352  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  353  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  354  static void hdmi_dma_copy_16(u16 *src, u32 *dst, int framecnt, int channelcnt)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  355  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  356  	/* split input frames into 192-frame each */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  357  	int count_in_192 = (framecnt + 191) / 192;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  358  	int i;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  359  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  360  	for (i = 0; i < count_in_192; i++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  361  		int count, samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  362  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  363  		/* handles frame index [0, 48) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  364  		count = (framecnt < 48) ? framecnt : 48;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  365  		samples = count * channelcnt;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  366  		hdmi_dma_copy_16_c_lut(src, dst, samples, g_packet_head_table);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  367  		framecnt -= count;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  368  		if (framecnt == 0)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  369  			break;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  370  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  371  		src  += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  372  		dst += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  373  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  374  		/* handles frame index [48, 192) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  375  		count = (framecnt < 192 - 48) ? framecnt : 192 - 48;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  376  		samples = count * channelcnt;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  377  		hdmi_dma_copy_16_c_fast(src, dst, samples);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  378  		framecnt -= count;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  379  		src  += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  380  		dst += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  381  	}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  382  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  383  #else
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  384  /* NEON optimization for IEC head*/
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  385  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  386  /**
32ecbcfdff46d0 Shengjiu Wang 2014-08-27 @387   * Convert pcm samples to iec samples suitable for HDMI transfer.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  388   * PCM sample is 16 bits length.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  389   * Frame index always starts from 0.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  390   * Channel count can be 1, 2, 4, 6, or 8
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  391   * Sample count (frame_count * channel_count) is multipliable by 8.
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  392   */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  393  static void hdmi_dma_copy_16(u16 *src, u32 *dst, int framecount, int channelcount)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  394  {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  395  	/* split input frames into 192-frame each */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  396  	int i, count_in_192 = (framecount + 191) / 192;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  397  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  398  	for (i = 0; i < count_in_192; i++) {
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  399  		int count, samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  400  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  401  		/* handles frame index [0, 48) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  402  		count = (framecount < 48) ? framecount : 48;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  403  		samples = count * channelcount;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  404  		hdmi_dma_copy_16_neon_lut(src, dst, samples, g_packet_head_table);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  405  		framecount -= count;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  406  		if (framecount == 0)
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  407  			break;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  408  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  409  		src += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  410  		dst += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  411  
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  412  		/* handles frame index [48, 192) */
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  413  		count = (framecount < 192 - 48) ? framecount : (192 - 48);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  414  		samples = count * channelcount;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  415  		hdmi_dma_copy_16_neon_fast(src, dst, samples);
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  416  		framecount -= count;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  417  		src += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  418  		dst += samples;
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  419  	}
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  420  }
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  421  #endif
32ecbcfdff46d0 Shengjiu Wang 2014-08-27  422  

:::::: The code at line 387 was first introduced by commit
:::::: 32ecbcfdff46d0b03744d82aee4a12948226fe37 ASoC: fsl_hdmi: hdmi audio driver for imx6

:::::: TO: Shengjiu Wang <shengjiu.wang@freescale.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
