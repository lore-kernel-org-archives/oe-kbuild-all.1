Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB02B9A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265755; cv=none; b=RBBYYnbs8X8aZN+jNCaKvUea5AGy09BgWEA4CM2F9yx4avU/VjNHBWmU0T+ZYsdiakqAs+eDIQq+Q7mmeEd5o+E43M2Z2wEhUbxqvzyJqoiqQxgwmvzqVOp0H0QeKsBvUAd4u4sXVlN75mDduPg6ss9TShDq7TMAc7/4zazFElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265755; c=relaxed/simple;
	bh=4Gy4gB/zCAviIgFdojYJ0UEStP53F1zDLN56ot96yTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEPAvDJ8jTrbD3eb2E4UlyScK2b9lNZ9X1v8NiDMnQ5LAiXQdn+c19/2q44uDBZoEj5kDcBs6t6uo6YgCAEownApMwZ5Ts/hgHsi7Ka6aYPNaddxZifIDFhfKZkvrzEIK1Xf5xu3kWJ3mfknuDGTwsBpgghCS3GwP8IBJQSUb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rx4Dxm9R; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rx4Dxm9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716265753; x=1747801753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Gy4gB/zCAviIgFdojYJ0UEStP53F1zDLN56ot96yTg=;
  b=Rx4Dxm9R0/HLao80feC48ja5ZtI8IyQUA87ZKCk87PwvUxs0OXtLf2v+
   5xGL9JpxWaeJxyF1yEJnzWaylfYxnMS+/+UXvdy8zdIOmXOXDAF62M4DW
   LTKp89GiHQKZsrnCkp8u+ZtHznY0YtdvgSeCIJO3SHGnejbgfjpewzRtP
   n6YzhXc3QH9uUFHXdl6mxgIyzzSbeOpacEy2M4SZJ1tJH0zmXB5GS/ivG
   JaETtZfH0q5/hnPkbNKE5UvIRQfj5RWRPZwnscWKDW0IYdk7PU6iJCwlt
   MxBFAZBH1caZujWYgB5T7tDaiI2xh1Xfw4awsm7zcgUq/kSvfvEwD6HbA
   g==;
X-CSE-ConnectionGUID: QcPrltLaRt2EqwXT5hmONw==
X-CSE-MsgGUID: 6BAD4FIQR2aD6uRi3IGBEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23572649"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="23572649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 21:29:13 -0700
X-CSE-ConnectionGUID: q0KNfTo9SvWOP+5agI/Gfg==
X-CSE-MsgGUID: jYt4k4Z2RE2h5QlwM3Y+Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37610928"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2024 21:29:11 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9H7c-0005hm-2Z;
	Tue, 21 May 2024 04:29:08 +0000
Date: Tue, 21 May 2024 12:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, jani.saarinen@intel.com,
	ville.syrjala@linux.intel.com
Subject: Re: [PATCH 4/5] drm/i915: Compute config and mode valid changes for
 ultrajoiner
Message-ID: <202405211228.a5iQwc2H-lkp@intel.com>
References: <20240520073839.23881-5-stanislav.lisovskiy@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520073839.23881-5-stanislav.lisovskiy@intel.com>

Hi Stanislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip linus/master next-20240520]
[cannot apply to drm-intel/for-linux-next-fixes v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Lisovskiy/drm-i915-Rename-all-bigjoiner-to-joiner/20240520-194208
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240520073839.23881-5-stanislav.lisovskiy%40intel.com
patch subject: [PATCH 4/5] drm/i915: Compute config and mode valid changes for ultrajoiner
config: x86_64-randconfig-103-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211228.a5iQwc2H-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405211228.a5iQwc2H-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_vdsc.c:813:46-47: Unneeded semicolon

vim +813 drivers/gpu/drm/i915/display/intel_vdsc.c

   783	
   784	void intel_dsc_enable(const struct intel_crtc_state *crtc_state)
   785	{
   786		struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
   787		struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
   788		u32 dss_ctl1_val = 0;
   789		u32 dss_ctl2_val = 0;
   790		int vdsc_instances_per_pipe = intel_dsc_get_vdsc_per_pipe(crtc_state);
   791	
   792		if (!crtc_state->dsc.compression_enable)
   793			return;
   794	
   795		intel_dsc_pps_configure(crtc_state);
   796	
   797		dss_ctl2_val |= LEFT_BRANCH_VDSC_ENABLE;
   798		if (vdsc_instances_per_pipe > 1) {
   799			dss_ctl2_val |= RIGHT_BRANCH_VDSC_ENABLE;
   800			dss_ctl1_val |= JOINER_ENABLE;
   801		}
   802	
   803		if (crtc_state->joiner_pipes) {
   804			/*
   805			 * This bit doesn't seem to follow master/slave logic or
   806			 * any other logic, so lets just add helper function to
   807			 * at least hide this hassle..
   808			 */
   809			if (intel_crtc_ultrajoiner_enable_needed(crtc_state))
   810				dss_ctl1_val |= ULTRA_JOINER_ENABLE;
   811	
   812			if (intel_crtc_is_joiner_primary_master(crtc_state))
 > 813				dss_ctl1_val |= MASTER_ULTRA_JOINER_ENABLE;;
   814	
   815			dss_ctl1_val |= BIG_JOINER_ENABLE;
   816	
   817			if (intel_crtc_is_bigjoiner_master(crtc_state))
   818				dss_ctl1_val |= MASTER_BIG_JOINER_ENABLE;
   819		}
   820		intel_de_write(dev_priv, dss_ctl1_reg(crtc, crtc_state->cpu_transcoder), dss_ctl1_val);
   821		intel_de_write(dev_priv, dss_ctl2_reg(crtc, crtc_state->cpu_transcoder), dss_ctl2_val);
   822	}
   823	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
