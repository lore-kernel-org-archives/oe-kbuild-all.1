Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266C17C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilCrczmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700099969; x=1731635969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btDuB7GEDjeQzn6tXiGZn7+MiwBkZULs9zkt+vUoTCs=;
  b=ilCrczmoXH875yMffgskpJoF9GEgIPh5v3fBFiTKr2XyHc9TKuhKHtRK
   2NGz9AlXg39VlLcvn1K7GJyP18Fu3hcMsANfAo0i57N9xIyzrjkdy4v1k
   EA8Lj72n9GwHFMRkteHHzzhoQ5UCMcjiTwfpgKqG+rNI9I+xQ24rtpUil
   ROuRPS0v8QiIPWl991alAWK3bEM6pHrCRySNQyV7/uTYpnhBFe/EqB7J5
   3CQr8/tVFQAeZsAVBb6lqC1WbF407n60yDnAOdnduzkibArwovw2/uoHL
   lNo/wRrhiQO+f5H0N5UtlNYxSQU/JUMNC8E9Oy2HVAZF1d1v2MwyJhwQ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393845254"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="393845254"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758682482"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="758682482"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 17:59:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Rf8-00016q-2v;
	Thu, 16 Nov 2023 01:59:22 +0000
Date: Thu, 16 Nov 2023 09:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>,
	Algea Cao <algea.cao@rock-chips.com>
Subject: [sre-misc:rk3588 31/37]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2295:25: error: implicit
 declaration of function 'cec_queue_pin_hpd_event'
Message-ID: <202311160906.saP8P5Sj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 171fd53717525f0f6dc56e90e6f38a9038c5c779 [31/37] drm/bridge: synopsys: Add initial support for DW HDMI QP TX Controller
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231116/202311160906.saP8P5Sj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160906.saP8P5Sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160906.saP8P5Sj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:488:6: warning: no previous prototype for 'dw_hdmi_qp_set_audio_infoframe' [-Wmissing-prototypes]
     488 | void dw_hdmi_qp_set_audio_infoframe(struct dw_hdmi_qp *hdmi,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:566:6: warning: no previous prototype for 'dw_hdmi_qp_audio_enable' [-Wmissing-prototypes]
     566 | void dw_hdmi_qp_audio_enable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:578:6: warning: no previous prototype for 'dw_hdmi_qp_audio_disable' [-Wmissing-prototypes]
     578 | void dw_hdmi_qp_audio_disable(struct dw_hdmi_qp *hdmi)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2135:6: warning: no previous prototype for 'dw_hdmi_qp_set_cec_adap' [-Wmissing-prototypes]
    2135 | void dw_hdmi_qp_set_cec_adap(struct dw_hdmi_qp *hdmi, struct cec_adapter *adap)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2284:6: warning: no previous prototype for 'dw_hdmi_qp_cec_set_hpd' [-Wmissing-prototypes]
    2284 | void dw_hdmi_qp_cec_set_hpd(struct dw_hdmi_qp *hdmi, bool plug_in, bool change)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c: In function 'dw_hdmi_qp_cec_set_hpd':
>> drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c:2295:25: error: implicit declaration of function 'cec_queue_pin_hpd_event' [-Werror=implicit-function-declaration]
    2295 |                         cec_queue_pin_hpd_event(hdmi->cec_adap, plug_in, ktime_get());
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cec_queue_pin_hpd_event +2295 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c

  2283	
  2284	void dw_hdmi_qp_cec_set_hpd(struct dw_hdmi_qp *hdmi, bool plug_in, bool change)
  2285	{
  2286		enum drm_connector_status status = plug_in ?
  2287			connector_status_connected : connector_status_disconnected;
  2288	
  2289		if (!plug_in)
  2290			cec_notifier_set_phys_addr(hdmi->cec_notifier,
  2291						   CEC_PHYS_ADDR_INVALID);
  2292	
  2293		if (hdmi->bridge.dev) {
  2294			if (change && hdmi->cec_adap && hdmi->cec_adap->devnode.registered)
> 2295				cec_queue_pin_hpd_event(hdmi->cec_adap, plug_in, ktime_get());
  2296			drm_bridge_hpd_notify(&hdmi->bridge, status);
  2297		}
  2298	}
  2299	EXPORT_SYMBOL_GPL(dw_hdmi_qp_cec_set_hpd);
  2300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
