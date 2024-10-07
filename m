Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37881B4F18
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728296677; cv=none; b=jgXg+W6aOkFcB7YU6wbCjYsSEbnjFibIwa2+nPoTtOOb6sSIFozG8WB8XfDIG3P/jRhaGbJlTOx+3BGRXh9esNPMtpWvapWGos2ZxG3fE7appzhf+qvW3JIDrHx1SGd6V7flYDJNYGh4AUvrMA/HdybU6+61zvFrAYZRprsBaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728296677; c=relaxed/simple;
	bh=5GNj/zyhCQEF+jVar7YrC7KhafSmp007Qa31mvJ/AUo=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=bDEktOP4iEEWlqvxatb/2Ugvfolyb/OVczWeo42j1gkDz1C1sfYrLQ2VJ1SPA/R0t1gN79GvXjRnXBCdGAkzYUZqWwxkxszcMkRDP1iwlkmCsnqwsvoJqeZrCxIgss7PtTaGtN3nLQNjNVFEVuWLq53JMEeaFyF4H5RH+w3FR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=WOSH2NPt; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="WOSH2NPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j59YkxTBgoRlpUL2wnN8AYuBff3YLIS7SQonOmmmQaU=;
  b=WOSH2NPtjyLHSbi0JrAPJpX1QB6XedV75WFmo2VBJTh8C0y3xL2MeDHx
   moGZ2rTOj847uth8dojBlEGj/Zd32UlSBXZPV2oNmZxbc8UZS5+SE1q3n
   yBszbbwhiZtyKvISF6r33ikxks4d6tBpsN5QbTcGsOakvoh9PcrhxTo6x
   Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,184,1725314400"; 
   d="scan'208";a="187378384"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 12:24:31 +0200
Date: Mon, 7 Oct 2024 12:24:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Imre Deak <imre.deak@intel.com>, 
    Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, 
    linux-kernel@vger.kernel.org
cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for
 str_enabled_disabled(enable) (fwd)
Message-ID: <14b98e31-4cf-1021-e61d-6ac0eb87feb@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Mon, 7 Oct 2024 17:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for
    str_enabled_disabled(enable)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Imre Deak <imre.deak@intel.com>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 8ab5a03643fc529f0e8663bc4d5b43f8f6885922 drm/i915/dp: Disable FEC ready flag in the sink
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-102-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071601.TFpXoqgW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410071601.TFpXoqgW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for str_enabled_disabled(enable)

vim +2225 drivers/gpu/drm/i915/display/intel_ddi.c

1639406a31c23ca drivers/gpu/drm/i915/display/intel_ddi.c Manasi Navare   2021-01-22  2212
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2213  static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2214  					const struct intel_crtc_state *crtc_state,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2215  					bool enable)
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2216  {
47bdb1caba0bc5a drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2020-03-20  2217  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
47bdb1caba0bc5a drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2020-03-20  2218
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2219  	if (!crtc_state->fec_enable)
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2220  		return;
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2221
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2222  	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2223  			       enable ? DP_FEC_READY : 0) <= 0)
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2224  		drm_dbg_kms(&i915->drm, "Failed to set FEC_READY to %s in the sink\n",
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24 @2225  			    enable ? "enabled" : "disabled");
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2226
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2227  	if (enable &&
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2228  	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2229  			       DP_FEC_DECODE_EN_DETECTED | DP_FEC_DECODE_DIS_DETECTED) <= 0)
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2230  		drm_dbg_kms(&i915->drm, "Failed to clear FEC detected flags\n");
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2231  }
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2232

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
