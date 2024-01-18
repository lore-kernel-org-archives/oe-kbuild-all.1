Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189172906
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705542449; cv=none; b=ZW5OR1wPmIQdyrErWAOBj/uTHB3xkzuds9M9Ec+N3quufggmrKErEkcdIi9uqK8DfLYiZFLZtuFyjyVnPjfGHC25AgFj7vaGZ4kbvAoRhCt6cafKzFmzVOPB1VTLVPM84snnGlp/VHNdZlybvIW7Yw0By8hTVhIqpkAMd2dkK2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705542449; c=relaxed/simple;
	bh=Es8qg0O+ePgpXnBl1c0BYk9E3bN4I43R6BtIuHZCL7s=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition; b=XsSX/RWnRnZTg7SPJsSuRA7EGhLvx5rLwssTC0tBZIV7DrWh30AEzAlanB8hRQtNiioyIR6lbYseoprADRq3NX9XVheJFx+thCI0J/jvNjYkStCOq58JO1uYjPwYo1OB0Q1B0kJOsUIx1ZNYrt4tEAAROKCkYFspKas+QLDuQ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLDmLEhe; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLDmLEhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705542447; x=1737078447;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Es8qg0O+ePgpXnBl1c0BYk9E3bN4I43R6BtIuHZCL7s=;
  b=bLDmLEheltv1yx0qlEHcYvQj+EBKGgMdS4CkFPCRRs0pz82U96cFJbBr
   OEYPCt8Nr+TEa11THtrMIKuZrkUV/IdE2X4gLFtwyK+b2sbpjXePKx+x1
   PkZpuSxp0irEX4NodVL40xIFe9qTzI5Ns061H200sU8Mllh8u/fPb4Px5
   DnUbBAZ0A6Z3pfGZU461sWfCsINHJYtHG6hUUGHvr3Qt9mdWGBUUebbH9
   A10LXffAXiYoOdCtAT1cctoKLgjF45+crOxDG+LANP45W1S0qaRkZMsZ2
   5LDAmaKvvhSdjLe/vT7CJVFOtGaSoelOEvrNW8NP8YqdCpi18umTPPjRW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397479535"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="397479535"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 17:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="957681376"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="957681376"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Jan 2024 17:47:25 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQHV4-0002VC-0U
	for oe-kbuild-all@lists.linux.dev;
	Thu, 18 Jan 2024 01:47:22 +0000
Date: Thu, 18 Jan 2024 09:46:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 9724/9999]
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2308: warning: Function parameter
 or member 'work' not described in 'dw_hdmi_hdcp_periodic_work'
Message-ID: <202401180915.pfNQYlyB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 3e0b620a47e1670e4a3029ebc7f54da59d852799 [9724/9999] CHROMIUM: drm/bridge: dw-hdmi: Add HDCP support
config: i386-buildonly-randconfig-001-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180915.pfNQYlyB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180915.pfNQYlyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180915.pfNQYlyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:2308: warning: Function parameter or member 'work' not described in 'dw_hdmi_hdcp_periodic_work'


vim +2308 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

  2300	
  2301	/**
  2302	 * dw_hdmi_hdcp_periodic_work - Handle the HDCP state machine
  2303	 * @work - Our delayed work
  2304	 *
  2305	 * This function runs periodically in order to handle HDCP work.
  2306	 */
  2307	static void dw_hdmi_hdcp_periodic_work(struct work_struct *work)
> 2308	{
  2309		struct dw_hdmi *hdmi = container_of(to_delayed_work(work),
  2310						    struct dw_hdmi, hdcp_periodic_work);
  2311		struct drm_connector *connector = &hdmi->connector;
  2312	
  2313		drm_modeset_lock(&connector->dev->mode_config.connection_mutex, NULL);
  2314		mutex_lock(&hdmi->hdcp_mutex);
  2315	
  2316		/*
  2317		 * If DRM thinks we've got content protection enabled but our HW
  2318		 * state disagrees, immediately switch back to "Desired".  Then we'll
  2319		 * start working back to getting to "Enabled".
  2320		 *
  2321		 * This is separate from the switch statement below so that we can
  2322		 * take action on starting HDCP again right away.
  2323		 */
  2324		if ((connector->state->content_protection ==
  2325		     DRM_MODE_CONTENT_PROTECTION_ENABLED) &&
  2326		    hdmi->hdcp_hw_state != DW_HDMI_HDCP_HW_STATE_ENCRY_EN)
  2327			drm_hdcp_update_content_protection(
  2328				connector, DRM_MODE_CONTENT_PROTECTION_DESIRED);
  2329	
  2330		switch (connector->state->content_protection) {
  2331		case DRM_MODE_CONTENT_PROTECTION_UNDESIRED:
  2332			/* Handle turning off encryption if it was on */
  2333	
  2334			if (hdmi->hdcp_hw_state == DW_HDMI_HDCP_HW_STATE_ENCRY_EN) {
  2335				/*
  2336				 * Leave things authed and keep track of state; note
  2337				 * that if we turn off auth here we blink the screen.
  2338				 */
  2339				hdmi_disable_hdcp_encry(hdmi);
  2340				hdmi->hdcp_hw_state = DW_HDMI_HDCP_HW_STATE_AUTH_DONE;
  2341			}
  2342			break;
  2343	
  2344		case DRM_MODE_CONTENT_PROTECTION_DESIRED:
  2345			/*
  2346			 * Going from Desired to Enabled is several steps, so here
  2347			 * we need to handle a bit of a state machine.
  2348			 */
  2349	
  2350			switch (hdmi->hdcp_hw_state) {
  2351			case DW_HDMI_HDCP_HW_STATE_ENCRY_EN:
  2352				/*
  2353				 * We already enabled things but someone (userspace?)
  2354				 * set it back to desired.  Just update.
  2355				 */
  2356				drm_hdcp_update_content_protection(
  2357					connector, DRM_MODE_CONTENT_PROTECTION_ENABLED);
  2358				break;
  2359	
  2360			case DW_HDMI_HDCP_HW_STATE_AUTH_DONE:
  2361				_hdmi_enable_hdcp_encry(hdmi);
  2362				drm_hdcp_update_content_protection(
  2363					connector, DRM_MODE_CONTENT_PROTECTION_ENABLED);
  2364				hdmi->hdcp_hw_state = DW_HDMI_HDCP_HW_STATE_ENCRY_EN;
  2365				break;
  2366	
  2367			case DW_HDMI_HDCP_HW_STATE_AUTH_START:
  2368				/* Nothing to do; wait for IRQ to move to AUTH_DONE */
  2369				break;
  2370	
  2371			case DW_HDMI_HDCP_HW_STATE_DISABLED:
  2372				_hdmi_start_hdcp_auth(hdmi);
  2373				hdmi->hdcp_hw_state = DW_HDMI_HDCP_HW_STATE_AUTH_START;
  2374				break;
  2375	
  2376			case DW_HDMI_HDCP_HW_STATE_BRIDGE_DISABLED:
  2377				/* Nothing to do;  */
  2378				break;
  2379			}
  2380	
  2381			break;
  2382		}
  2383	
  2384		/* Loop forever as long as the bridge isn't disabled */
  2385		if (hdmi->hdcp_hw_state != DW_HDMI_HDCP_HW_STATE_BRIDGE_DISABLED)
  2386			schedule_delayed_work(&hdmi->hdcp_periodic_work,
  2387					    msecs_to_jiffies(DRM_HDCP_CHECK_PERIOD_MS));
  2388	
  2389		mutex_unlock(&hdmi->hdcp_mutex);
  2390		drm_modeset_unlock(&connector->dev->mode_config.connection_mutex);
  2391	}
  2392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
