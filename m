Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C17F2232A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 23:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723244545; cv=none; b=L4uoKnFGYQXBZMLSWu4/RnJL8zwNi2U0Sjk2bktV6X1FNhwDNXKITtMupo9wJzGECthZJRqHvs0GwFlR6PHIFKBJNh6+W3gxztybwX9qoRsXeDuLgKgGJXYZftVSGh8z+5X+HhndS9+xEna/eb3JW8lMXiF044bb+hlTx4nhun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723244545; c=relaxed/simple;
	bh=h5bnm+7gwQzC9Xd+GkJAtswlkeABN/aINHp6vSeopNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=StmQeh0B0pBqRgp4CkR6pl+5nbDo8eYFt0Q1kOwCt5EbPxARgCnYiQnS0mRdd8hs3f2isPK0esyRvOAWT56wes7BO/zkDvbMXqakCpCI5xSgkBUV06CvS1CPna1w+lXo6U23ZgoRjj1rdGn/uithPD7Ra2nfw5J2Lvd1pf90wl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6FMr2Cs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6FMr2Cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723244544; x=1754780544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5bnm+7gwQzC9Xd+GkJAtswlkeABN/aINHp6vSeopNE=;
  b=L6FMr2Cs1/QKe1uQmnW7oHegO4owxtJ7v5yCZs7wvkfOklXd+0uo+BYi
   n2qzkuZvtaHR+caByWa5jtDnoJJiajHIkazZbsWvIi6Cpa0LuB5hMzs8x
   HFix4GwTOuX2p4P1M6QF2vT2gix0w51mo1DCcjmimQugUpV/Kdygkg6K4
   dGt1n9/5CkNlUuffRXi/MqxQryBqma52ndAPSE4Slwc6mvlRS2r2gBdTo
   5bxBL4Y2IOkhzFfCd3i3Kz/ndlUXFclt0tT05M/pEiyIO+y/zV7kEv5b1
   NvoGBE3X8BN9ENlCanvTQ9lRyFIuKEl7F/9uT1iCNcfmNVRYtaQSu2QGp
   Q==;
X-CSE-ConnectionGUID: oq0hZhhjSAaDpfjiBBOdWg==
X-CSE-MsgGUID: 3Fn8j94mRD25H3j+h1SWPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21595910"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="21595910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 16:02:23 -0700
X-CSE-ConnectionGUID: jL7m5MSCTeyUflJcMphKpg==
X-CSE-MsgGUID: ooscP4IdQEyNOOxtvgiQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="57353771"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 09 Aug 2024 16:02:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scYcl-0009Kh-2z;
	Fri, 09 Aug 2024 23:02:19 +0000
Date: Sat, 10 Aug 2024 07:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: William Qiu <william.qiu@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14] pwm: opencores: Add PWM driver support
Message-ID: <202408100615.p8lsfN3r-lkp@intel.com>
References: <20240809103831.156436-1-william.qiu@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809103831.156436-1-william.qiu@starfivetech.com>

Hi William,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on thierry-reding-pwm/for-next v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Qiu/pwm-opencores-Add-PWM-driver-support/20240809-213210
base:   linus/master
patch link:    https://lore.kernel.org/r/20240809103831.156436-1-william.qiu%40starfivetech.com
patch subject: [PATCH v14] pwm: opencores: Add PWM driver support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240810/202408100615.p8lsfN3r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100615.p8lsfN3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100615.p8lsfN3r-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pwm/pwm-ocores.c: In function 'ocores_pwm_apply':
>> drivers/pwm/pwm-ocores.c:130:14: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     130 |         else if (duty_data > U32_MAX)
         |              ^~
   drivers/pwm/pwm-ocores.c:132:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     132 |                 ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
         |                 ^~~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-ocores.c:133:9: error: 'else' without a previous 'if'
     133 |         else
         |         ^~~~


vim +133 drivers/pwm/pwm-ocores.c

   106	
   107	static int ocores_pwm_apply(struct pwm_chip *chip,
   108				    struct pwm_device *pwm,
   109				    const struct pwm_state *state)
   110	{
   111		struct ocores_pwm_device *ddata = chip_to_ocores(chip);
   112		u32 ctrl_data = 0;
   113		u64 period_data, duty_data;
   114	
   115		if (state->polarity != PWM_POLARITY_INVERSED)
   116			return -EINVAL;
   117	
   118		period_data = mul_u64_u32_div(state->period, ddata->clk_rate, NSEC_PER_SEC);
   119		if (!period_data)
   120			return -EINVAL;
   121	
   122		if (period_data > U32_MAX)
   123			period_data = U32_MAX;
   124	
   125		ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_LRC, (u32)period_data);
   126	
   127		duty_data = mul_u64_u32_div(state->duty_cycle, ddata->clk_rate, NSEC_PER_SEC);
   128		if (duty_data <= U32_MAX)
   129			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
 > 130		else if (duty_data > U32_MAX)
   131			duty_data = U32_MAX;
   132			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_HRC, (u32)duty_data);
 > 133		else
   134			return -EINVAL;
   135	
   136		ctrl_data = ocores_pwm_readl(ddata, pwm->hwpwm, REG_OCPWM_CTRL);
   137		if (state->enabled)
   138			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_CTRL,
   139					  ctrl_data | REG_OCPWM_CNTR_EN | REG_OCPWM_CNTR_OE);
   140		else
   141			ocores_pwm_writel(ddata, pwm->hwpwm, REG_OCPWM_CTRL,
   142					  ctrl_data & ~(REG_OCPWM_CNTR_EN | REG_OCPWM_CNTR_OE));
   143	
   144		return 0;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
