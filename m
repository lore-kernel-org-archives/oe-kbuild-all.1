Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786401;
	b=VB8DGwrpQIlTlTK+6Ohp4pYdb3C7JQe1rb0aR57zTG6nvCnfybc2j+ynsaPZLKWL9YUm
	 QuyVJPpBnfjFvVKus4dM6HrfK0dDrw2EVW7ib2UOV84ifb7X1f+IiZ67iu8NBH35+gPtu
	 calTpAB5CMhPkggoV57smBhpIa3yO9crVLwV59dpPJuERxBojiYolj2Fw85mrlTXvSDmC
	 iauiN2ydEkqTN+B3SYySauv+z2OMjFjDtk4D6OD8A1avi3FOk1WGx31MhEo1ueNZ5zrbb
	 i9FUp8w1KXv6XXFfiWf0It8jFlpn0utqxUxb0wRV+rYynLZyIbUErqyE1ZwEdr7b+YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uYd0geXH7+7vad92Nfa07NehHhEbMgjOwqrTJyRJ1Ss=;
	b=cFuSUzasXC06sxgfDEIF55FIQgVs4rT56ciIFci7oAoIWumj3XJF9rJsAGd2KHKhjlVb
	 ctKLCFw00g76AeZt6cjAYq8ghodpL8MQhxNQaCHcoixp/OuZ5PKb5fD/Ia4HiccxDdScr
	 QCfqTrWgu0Z39/5XICEvm9lWnIDkfENdBG8HMGpemMA4kaYT+rC+quYkMTl/gRZMwFQVg
	 Kohxvsph7C4z+rUQDZk4LSQfBcOljsnVMoVN/HJjtIRA4ohH+eSHrGKTBKth+qZqQSAIG
	 nNkRtmVV+XR17vUSUr9srQRllpDzzGoMGsZOzOpYFfN0EQtBBl9eIFpxDhc2eo2Mbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIAqU3lm;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50160606A32C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 10:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50160606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIAqU3lm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793786401; x=1825322401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8rnYeavypSHx9rXyGxkktAWwxit2FoV/RbgwfVay8A=;
  b=kIAqU3lmzbFs91Jf4ewO3hFK8ACdW5a3WxxIlJTSRW+lOlcBSSSARjtx
   mZoJeMGwdXfSGtNSvGCVI1HpH7mX4TkZmrhE/ZofvsFdf8VKFLvLy1Bf8
   duJU2JJizNap2fmFh6VQFFXjS1WwQ2eR8VbZ0omy7XuGChi88NoAWIuQL
   L6g3zkIN2QPeqG6Vow/h+IRt2DHbDewxHIu+HY/h4a5kTI40S0p+uek9O
   3fMiLFxV08EFir0FMNSUMLGULfK0NQjVKyyG7xbgsU2823Y0dVcs5OW4B
   fmBXMcMSpWKCxIsWhTF2AOCAsYeuYrEM4Mf13AB/DNdJOVVNTuA8AtHX4
   A==;
X-CSE-ConnectionGUID: 4Seuj9DqTdWGOjr+lshPPA==
X-CSE-MsgGUID: Lage58HpSPy/KLGJFFRimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2562832"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2562832"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:00:00 -0800
X-CSE-ConnectionGUID: hE5qdq68SPCBaoPpi+hJHw==
X-CSE-MsgGUID: fn1V+KIHRNuzu9SdmqVa/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7071102"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2026 01:59:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOXme-00000000kCH-2jSQ;
	Wed, 04 Nov 2026 09:59:56 +0000
Date: Wed, 4 Nov 2026 17:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Stead <alan.stead@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/3] drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is
 enabled
Message-ID: <202611041749.7Na4IlGX-lkp@intel.com>
References: <20261030203314.1085262-3-alan.stead@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030203314.1085262-3-alan.stead@intel.com>

Hi Alan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261029]
[also build test ERROR on linus/master]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes v7.3 v7.3-rc7 v7.3-rc6 v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Stead/drm-i915-dip-Send-HDMI-EMPs-early-in-V-Blank-when-VRR-is-in-range/20261030-133220
base:   next-20261029
patch link:    https://lore.kernel.org/r/20261030203314.1085262-3-alan.stead%40intel.com
patch subject: [RFC v1 2/3] drm/i915/dip: Send the HDMI 2.1 VTEM when VRR is enabled
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611041749.7Na4IlGX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041749.7Na4IlGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041749.7Na4IlGX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/display/intel_dip.c: In function 'intel_dip_write_hdmi_vtem':
>> drivers/gpu/drm/i915/display/intel_dip.c:141:41: error: implicit declaration of function 'HDMI_EMP_DATA'; did you mean 'HDMI_EMP_CTL'? [-Wimplicit-function-declaration]
     141 |                 intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
         |                                         ^~~~~~~~~~~~~
         |                                         HDMI_EMP_CTL
>> drivers/gpu/drm/i915/display/intel_dip.c:141:41: error: incompatible type for argument 2 of 'intel_de_write'
     141 |                 intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   In file included from drivers/gpu/drm/i915/display/intel_dip.c:11:
   drivers/gpu/drm/i915/display/intel_de.h:79:59: note: expected 'intel_reg_t' {aka 'i915_reg_t'} but argument is of type 'int'
      79 | intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
         |                                               ~~~~~~~~~~~~^~~


vim +141 drivers/gpu/drm/i915/display/intel_dip.c

    85	
    86	/*
    87	 * Tell an HDMI 2.1 sink whether VRR is active with a Class 0 (Gaming-VRR)
    88	 * Video Timing Extended Metadata (VTEM) packet. It is a periodic
    89	 * pseudo-static EM Data Set: the hardware sends it every frame until it is
    90	 * reprogrammed. On disable, a last VTEM with VRR_EN=0 and END set is sent,
    91	 * after which the hardware stops sending it.
    92	 */
    93	void intel_dip_write_hdmi_vtem(const struct intel_crtc_state *crtc_state,
    94				       bool enable)
    95	{
    96		struct intel_display *display = to_intel_display(crtc_state);
    97		enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
    98		const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
    99		u8 vic = crtc_state->infoframes.avi.avi.video_code;
   100		int base_rr = drm_mode_vrefresh(mode);
   101		u8 pb[HDMI_EMP_PACKET_BODY] = {};
   102		int i;
   103	
   104		if (DISPLAY_VER(display) < 20 ||
   105		    !intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) ||
   106		    !crtc_state->vrr.in_range)
   107			return;
   108	
   109		/* PB0-PB6: EM Data Set header (Sync = 0, DS_Type = pseudo-static) */
   110		pb[0] = BIT(7) |			/* NEW */
   111			BIT(2) |			/* VFR */
   112			(enable ? 0 : BIT(6));		/* END */
   113		pb[2] = 1;				/* Organization_ID: HDMI */
   114		pb[4] = 1;				/* Data_Set_Tag: VTEM */
   115		pb[6] = VTEM_DATA_SET_LENGTH;		/* Data_Set_Length */
   116	
   117		/* PB7-PB10: MD0-MD3 (M_CONST = 0, FVA_Factor_M1 = 0, MD2 bit 2 reserved) */
   118		if (enable) {
   119			pb[7] = BIT(0);			/* VRR_EN */
   120			/* Base_Vfront and Base_Refresh_Rate are only sent without a VIC */
   121			if (!vic) {
   122				pb[8] = min(mode->crtc_vsync_start - mode->crtc_vdisplay, 255);
   123				pb[9] = (base_rr >> 8) & 0x3;
   124				pb[10] = base_rr & 0xff;
   125			}
   126		}
   127	
   128		drm_dbg_kms(display->drm,
   129			    "[TRANSCODER %s] VTEM: VRR_EN=%d VIC=%u Base_Vfront=%u Base_RR=%u\n",
   130			    transcoder_name(cpu_transcoder), enable, vic, pb[8],
   131			    pb[9] << 8 | pb[10]);
   132	
   133		/*
   134		 * HDMI_EMP_CTL first, then the payload dwords (PB0 in bits 7:0), then
   135		 * the header, whose write clock crosses the whole packet. HB0 must be
   136		 * set to the EMP packet type, the hardware doesn't fill it in.
   137		 */
   138		intel_de_write(display, HDMI_EMP_CTL(display, cpu_transcoder),
   139			       HDMI_EMP_CTL_TYPE_VTEM);
   140		for (i = 0; i < ARRAY_SIZE(pb); i += 4)
 > 141			intel_de_write(display, HDMI_EMP_DATA(display, cpu_transcoder),
   142				       pb[i] | pb[i + 1] << 8 | pb[i + 2] << 16 |
   143				       pb[i + 3] << 24);
   144		intel_de_write(display, HDMI_EMP_HEADER(display, cpu_transcoder),
   145			       HDMI_EMP_HEADER_HB0_EMP |
   146			       HDMI_EMP_HEADER_DS_TYPE_PSEUDO_STATIC |
   147			       (enable ? 0 : HDMI_EMP_HEADER_END) |
   148			       HDMI_EMP_HEADER_NUM_PACKETS(DIV_ROUND_UP(VTEM_EMP_SIZE,
   149									HDMI_EMP_PACKET_BODY)));
   150	}
   151	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
