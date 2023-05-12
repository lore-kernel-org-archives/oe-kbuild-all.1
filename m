Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2437B1952E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683897230; x=1715433230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGlCDyKyIRr+PtdFA+KR83JFRK7IFBrIT9H+L8pKLCY=;
  b=Fyw9UjVKYsEZ86Dqp7+/h604ybyVbFOTvKrFVGMXZyWW+bBg2Ici70X7
   4WBSqJSGuvsqnNqTAoms92CYYdP0gygZoF8thmpKpO3KylyzERqK2Abcn
   gdg6EBGmUj2h4KEBRnkoGywaJ8cBh36hY6ApbKhw4xIRX8XI1n9d1vNXm
   2sfkOgUzmwOdkfhR3Fs+39iPHhetmckFkM2MiUQYu9/dmHWemZS4V5p0w
   J9trlT/PVrJunvVLQe4bLZGJ3eLIpHVDJcBoKPSJxb4YQdV0z/EKxeH8G
   CskpS9oXJpnTfAQ+xvXoPcO12qR/0SM9QYGtzbbJuT7P/JJpVZz/Bozd2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414155581"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414155581"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 06:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="730817792"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="730817792"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 May 2023 06:13:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxSah-0004sM-1m;
	Fri, 12 May 2023 13:13:47 +0000
Date: Fri, 12 May 2023 21:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.nikula@intel.com
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/irq: split out display irq
 handling
Message-ID: <202305122141.7yr9QGpe-lkp@intel.com>
References: <20230512102310.1398406-3-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512102310.1398406-3-jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on next-20230512]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.4-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-irq-split-out-hotplug-irq-handling/20230512-182445
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230512102310.1398406-3-jani.nikula%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/i915/irq: split out display irq handling
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230512/202305122141.7yr9QGpe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/40f02fc9ce92df7a661245796cb4b53471edb004
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-i915-irq-split-out-hotplug-irq-handling/20230512-182445
        git checkout 40f02fc9ce92df7a661245796cb4b53471edb004
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122141.7yr9QGpe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display_irq.c:411:41: error: argument 3 of type 'u32[4]' {aka 'unsigned int[4]'} with mismatched bound [-Werror=array-parameter=]
     411 |                            u32 iir, u32 pipe_stats[I915_MAX_PIPES])
         |                                     ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/intel_display_irq.c:10:
   drivers/gpu/drm/i915/display/intel_display_irq.h:74:73: note: previously declared as 'u32 *' {aka 'unsigned int *'}
      74 | void i9xx_pipestat_irq_ack(struct drm_i915_private *i915, u32 iir, u32 *pipe_stats);
         |                                                                    ~~~~~^~~~~~~~~~
   cc1: all warnings being treated as errors


vim +411 drivers/gpu/drm/i915/display/intel_display_irq.c

   409	
   410	void i9xx_pipestat_irq_ack(struct drm_i915_private *dev_priv,
 > 411				   u32 iir, u32 pipe_stats[I915_MAX_PIPES])
   412	{
   413		enum pipe pipe;
   414	
   415		spin_lock(&dev_priv->irq_lock);
   416	
   417		if (!dev_priv->display_irqs_enabled) {
   418			spin_unlock(&dev_priv->irq_lock);
   419			return;
   420		}
   421	
   422		for_each_pipe(dev_priv, pipe) {
   423			i915_reg_t reg;
   424			u32 status_mask, enable_mask, iir_bit = 0;
   425	
   426			/*
   427			 * PIPESTAT bits get signalled even when the interrupt is
   428			 * disabled with the mask bits, and some of the status bits do
   429			 * not generate interrupts at all (like the underrun bit). Hence
   430			 * we need to be careful that we only handle what we want to
   431			 * handle.
   432			 */
   433	
   434			/* fifo underruns are filterered in the underrun handler. */
   435			status_mask = PIPE_FIFO_UNDERRUN_STATUS;
   436	
   437			switch (pipe) {
   438			default:
   439			case PIPE_A:
   440				iir_bit = I915_DISPLAY_PIPE_A_EVENT_INTERRUPT;
   441				break;
   442			case PIPE_B:
   443				iir_bit = I915_DISPLAY_PIPE_B_EVENT_INTERRUPT;
   444				break;
   445			case PIPE_C:
   446				iir_bit = I915_DISPLAY_PIPE_C_EVENT_INTERRUPT;
   447				break;
   448			}
   449			if (iir & iir_bit)
   450				status_mask |= dev_priv->pipestat_irq_mask[pipe];
   451	
   452			if (!status_mask)
   453				continue;
   454	
   455			reg = PIPESTAT(pipe);
   456			pipe_stats[pipe] = intel_uncore_read(&dev_priv->uncore, reg) & status_mask;
   457			enable_mask = i915_pipestat_enable_mask(dev_priv, pipe);
   458	
   459			/*
   460			 * Clear the PIPE*STAT regs before the IIR
   461			 *
   462			 * Toggle the enable bits to make sure we get an
   463			 * edge in the ISR pipe event bit if we don't clear
   464			 * all the enabled status bits. Otherwise the edge
   465			 * triggered IIR on i965/g4x wouldn't notice that
   466			 * an interrupt is still pending.
   467			 */
   468			if (pipe_stats[pipe]) {
   469				intel_uncore_write(&dev_priv->uncore, reg, pipe_stats[pipe]);
   470				intel_uncore_write(&dev_priv->uncore, reg, enable_mask);
   471			}
   472		}
   473		spin_unlock(&dev_priv->irq_lock);
   474	}
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
