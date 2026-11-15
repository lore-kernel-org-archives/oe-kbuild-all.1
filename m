Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715812;
	b=xnUDo7alKdkHaTxoNmlsOzeMCKQgZnDWPD/rohhZ0xqutDCyxuNxWMn1bj2rFmsuvgwn
	 3o1oEqXHRr7mKNNn1yB1xESr38mrqQvwjx1ZGNFtQYzmDhcI/2g6Ibe6+piA+dH0uduWH
	 upD2NaRel3ssduTXMJE3z52QDUtUTNiE8E7xLoe8n06Iq7YEq6CJDQkpUnCZfMGDHXia9
	 Sj2zzvjSfmgL+Imn8eKUaj5LOvtfnsbSUmy6lS6rG9luu5/Al/C7l7XkHFr97X2RwF6oz
	 Aiw/Jpo36scJCKkpqqz7Y0ag/gnngwEVpq1RDCtxyc6VUXyhMhNIZhjZ+V+in3yQfUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715812;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eLw9UxOkbJOGrRA3RFRNcJTWj+yEZHOLhRIu5l+QDxc=;
	b=5ZM6MEWpIgStR8ZAFX1f068rff75/8PXb7KAvM/a/pMFAaaWApdNZeBP21MoUlVK65Yy
	 AgGObKfTKcPcUiVp8ItM4f62sRf1xwMeMeRxEQLS7VYs1gkO6GdEZnHB5Xq5lt2dVYF83
	 ryuPfiHq+kyoKDflq/Q1pHdGrcjX56tQ3ORMZ5maAWJ2FjUH/rEUJQxNleXeDa/IyrhoJ
	 P3TR2dECvA/ZfH6DiOa22D4CbzXupcR4uQFxslgzdh7EEHb05NrMWSENxuf+iPKGdacOH
	 5NiVi6OF1DqBMjs7OBqs3CrNdAxCDekGTkGh0aIF7elPjz8qxU7eTHCHejjjOZVU8OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AxpjDQV0;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076F606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 04:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1076F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AxpjDQV0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794715811; x=1826251811;
  h=date:from:to:cc:subject:message-id;
  bh=4fvaqCa3qJRVBWi7Is/Y/AICWXmqR7DAg/mWa2KPXl8=;
  b=AxpjDQV0519nhNx3QF6D9ImlSWteWCm7T5piPleHB/et6I7EpJWXYMsn
   KwT/k+uJXioZq8H5yA6ve2qsAoEig9HLwY2dsO57HDRCo/WnfsRH7Y0nN
   2R5dwiuy5ft0OWAWFn2oqjegxcub0n/TCGu47mlI2KvZBJvc2utLwchmF
   TgW7QOBWkAfu/zPVIu6vXgyPYLOJglJ4QYt5/avamTmDq61vZuDGhrxTz
   2Zntoutd/7juBNe70+I+quLEVsjJ1ypOaAdIyOW/qCy+zXgfk98k8Rt+j
   eyoDzlJWvGMu+RlAAw0NvWKemhGBbqKtPOqhj0cjq9TrhAZCWg8S/8Ern
   A==;
X-CSE-ConnectionGUID: gqRPNhtARKil11in0zNGbA==
X-CSE-MsgGUID: jfRBkSNETM25pUCX2iy50A==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3495404"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3495404"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 20:10:10 -0800
X-CSE-ConnectionGUID: fsnb2chvSAqUBTalOtpExQ==
X-CSE-MsgGUID: DJbs2NCeRDGg0c1UvLB0ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9583331"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2026 20:10:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSRZ8-0000000020I-3fcY;
	Sun, 15 Nov 2026 04:10:06 +0000
Date: Sun, 15 Nov 2026 05:09:13 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8615:3-4: Unneeded
 semicolon
Message-ID: <202611150549.tejfwsYE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3540cf724bf0fe246a3131fd1f3e9342fa03b03e
commit: 0ba6c7ba081e4ee55f326d46e56c3f6e3419fea1 [2/2] drm/amd/display: phase3 mst hdcp for multiple displays
config: x86_64-randconfig-2102-20261114 (https://download.01.org/0day-ci/archive/20261115/202611150549.tejfwsYE-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150549.tejfwsYE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8615:3-4: Unneeded semicolon
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8669:4-5: Unneeded semicolon
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:8673:3-4: Unneeded semicolon

vim +8615 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c

  8567	
  8568	#ifdef CONFIG_DRM_AMD_DC_HDCP
  8569	static bool is_content_protection_different(struct drm_crtc_state *new_crtc_state,
  8570						    struct drm_crtc_state *old_crtc_state,
  8571						    struct drm_connector_state *new_conn_state,
  8572						    struct drm_connector_state *old_conn_state,
  8573						    const struct drm_connector *connector,
  8574						    struct hdcp_workqueue *hdcp_w)
  8575	{
  8576		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
  8577		struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
  8578	
  8579		pr_debug("[HDCP_DM] connector->index: %x connect_status: %x dpms: %x\n",
  8580			connector->index, connector->status, connector->dpms);
  8581		pr_debug("[HDCP_DM] state protection old: %x new: %x\n",
  8582			old_conn_state->content_protection, new_conn_state->content_protection);
  8583	
  8584		if (old_crtc_state)
  8585			pr_debug("[HDCP_DM] old crtc en: %x a: %x m: %x a-chg: %x c-chg: %x\n",
  8586			old_crtc_state->enable,
  8587			old_crtc_state->active,
  8588			old_crtc_state->mode_changed,
  8589			old_crtc_state->active_changed,
  8590			old_crtc_state->connectors_changed);
  8591	
  8592		if (new_crtc_state)
  8593			pr_debug("[HDCP_DM] NEW crtc en: %x a: %x m: %x a-chg: %x c-chg: %x\n",
  8594			new_crtc_state->enable,
  8595			new_crtc_state->active,
  8596			new_crtc_state->mode_changed,
  8597			new_crtc_state->active_changed,
  8598			new_crtc_state->connectors_changed);
  8599	
  8600		/* hdcp content type change */
  8601		if (old_conn_state->hdcp_content_type != new_conn_state->hdcp_content_type &&
  8602		    new_conn_state->content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
  8603			new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
  8604			pr_debug("[HDCP_DM] Type0/1 change %s :true\n", __func__);
  8605			return true;
  8606		}
  8607	
  8608		/* CP is being re enabled, ignore this */
  8609		if (old_conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
  8610		    new_conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
  8611			if (new_crtc_state && new_crtc_state->mode_changed) {
  8612				new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
  8613				pr_debug("[HDCP_DM] ENABLED->DESIRED & mode_changed %s :true\n", __func__);
  8614				return true;
> 8615			};
  8616			new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_ENABLED;
  8617			pr_debug("[HDCP_DM] ENABLED -> DESIRED %s :false\n", __func__);
  8618			return false;
  8619		}
  8620	
  8621		/* S3 resume case, since old state will always be 0 (UNDESIRED) and the restored state will be ENABLED
  8622		 *
  8623		 * Handles:	UNDESIRED -> ENABLED
  8624		 */
  8625		if (old_conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED &&
  8626		    new_conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED)
  8627			new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
  8628	
  8629		/* Stream removed and re-enabled
  8630		 *
  8631		 * Can sometimes overlap with the HPD case,
  8632		 * thus set update_hdcp to false to avoid
  8633		 * setting HDCP multiple times.
  8634		 *
  8635		 * Handles:	DESIRED -> DESIRED (Special case)
  8636		 */
  8637		if (!(old_conn_state->crtc && old_conn_state->crtc->enabled) &&
  8638			new_conn_state->crtc && new_conn_state->crtc->enabled &&
  8639			connector->state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
  8640			dm_con_state->update_hdcp = false;
  8641			pr_debug("[HDCP_DM] DESIRED->DESIRED (Stream removed and re-enabled) %s :true\n",
  8642				__func__);
  8643			return true;
  8644		}
  8645	
  8646		/* Hot-plug, headless s3, dpms
  8647		 *
  8648		 * Only start HDCP if the display is connected/enabled.
  8649		 * update_hdcp flag will be set to false until the next
  8650		 * HPD comes in.
  8651		 *
  8652		 * Handles:	DESIRED -> DESIRED (Special case)
  8653		 */
  8654		if (dm_con_state->update_hdcp &&
  8655		new_conn_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
  8656		connector->dpms == DRM_MODE_DPMS_ON && aconnector->dc_sink != NULL) {
  8657			dm_con_state->update_hdcp = false;
  8658			pr_debug("[HDCP_DM] DESIRED->DESIRED (Hot-plug, headless s3, dpms) %s :true\n",
  8659				__func__);
  8660			return true;
  8661		}
  8662	
  8663		if (old_conn_state->content_protection == new_conn_state->content_protection) {
  8664			if (new_conn_state->content_protection >= DRM_MODE_CONTENT_PROTECTION_DESIRED) {
  8665				if (new_crtc_state && new_crtc_state->mode_changed) {
  8666					pr_debug("[HDCP_DM] DESIRED->DESIRED or ENABLE->ENABLE mode_change %s :true\n",
  8667						__func__);
  8668					return true;
  8669				};
  8670				pr_debug("[HDCP_DM] DESIRED->DESIRED & ENABLE->ENABLE %s :false\n",
  8671					__func__);
  8672				return false;
  8673			};
  8674	
  8675			pr_debug("[HDCP_DM] UNDESIRED->UNDESIRED %s :false\n", __func__);
  8676			return false;
  8677		}
  8678	
  8679		if (new_conn_state->content_protection != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
  8680			pr_debug("[HDCP_DM] UNDESIRED->DESIRED or DESIRED->UNDESIRED or ENABLED->UNDESIRED %s :true\n",
  8681				__func__);
  8682			return true;
  8683		}
  8684	
  8685		pr_debug("[HDCP_DM] DESIRED->ENABLED %s :false\n", __func__);
  8686		return false;
  8687	}
  8688	#endif
  8689	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
