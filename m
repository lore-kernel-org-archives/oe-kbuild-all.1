Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6263CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 23:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757592; cv=none; b=tbZJ7fCLztz7u9MWUln1x2X0lOkF+yLocfqqqJ+36v7QoP69gjcTcVFhYzW39EqDaYgl+JAJER/ReEWJCApuPZGgBTzPYxMfbrX/4Sw7H60L9CgqVz2E2+rRozjFVsvLoUDe8Pr3fdut2sIGWRBorGDAZdJTKWNmAIeAp78SV9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757592; c=relaxed/simple;
	bh=EJwxOKDlBvfdTx6XjNs2LBCH7LkoYQCyo4TbbzdY2Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIURqtgqKmnOc8ZxUesWT5U45WP4A6nCWMB2kJPS6N5u9nSPaW45NVqvNWG0DXyx45bqGQsX6Sgu+hOMuTUWM43Cj1VMEUbgTbuVIqMAYYXglzPE/Wk8atdVw8rBYDaO5s3q9iP7zkf+dHGmzoTPbz1fOeYA6k+oRVI2QlOWhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6qOQfdq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6qOQfdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758757590; x=1790293590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJwxOKDlBvfdTx6XjNs2LBCH7LkoYQCyo4TbbzdY2Gs=;
  b=a6qOQfdqAuyHE/SMOpMSry/3GXecNGlVj/WZDbTiMFHr/69TqaTdEGEN
   tmb7YALxG/yeor9t6KlJOCaPbUHG7kZm/NCk/lkbhfFt1f6zFDy0F9rgl
   7yHOO1ki02XZTMcgCtafWOPC/GSir3GAvpVgyRZxumD3rn8oSnaOdIMNk
   QA5g7+XSFfIR88ESeYvYbWp7Q6ya126BA6+VtTOVWGnFIEHv2xoieZDPu
   Dz3Wc82JQ/uHw56a1mnLObgQ4lZkL95+KAue/SxtTw+fzDqmLLna4Z4qO
   CMg3WbRnllEYNkbAMW14d7DUZcitu2XsJaZLOa1wgqyufHtWcq6sLkhFC
   Q==;
X-CSE-ConnectionGUID: 4zvIpSb2TjeBEIjbp2ueiw==
X-CSE-MsgGUID: vy8LjjlDSuKiUI5OjG5SGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61012470"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61012470"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 16:46:30 -0700
X-CSE-ConnectionGUID: 3puLAJRRSmqwYqNMVA07bA==
X-CSE-MsgGUID: Kvf+3SadRjiCHJrMAvn4Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177564695"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2025 16:46:28 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1ZBq-000000004h3-0blL;
	Wed, 24 Sep 2025 23:46:26 +0000
Date: Thu, 25 Sep 2025 01:45:39 +0200
From: kernel test robot <lkp@intel.com>
To: Chen Meng J <meng.j.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	Jianxu Zheng <jian.xu.zheng@intel.com>, wu xia <xia.wu@intel.com>,
	Meng Wei <wei.meng@intel.com>, zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] htmldocs:
 ./include/media/media-entity.h:941: warning: Function parameter or member
 'pad' not described in 'media_graph_walk_start'
Message-ID: <202509250120.6KbVmRwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: 83d758e01f1c6e57e62b6abb8fae37b0d3175677 [3/3] media entity graph walk starting from pad
reproduce: (https://download.01.org/0day-ci/archive/20250925/202509250120.6KbVmRwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250120.6KbVmRwK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/input/matrix_keypad.h
   Error: Cannot open file ./include/linux/input/matrix_keypad.h
   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/input/sparse-keymap.h
   Error: Cannot open file ./include/linux/interconnect-provider.h
>> ./include/media/media-entity.h:941: warning: Function parameter or member 'pad' not described in 'media_graph_walk_start'
>> ./include/media/media-entity.h:941: warning: Excess function parameter 'entity' description in 'media_graph_walk_start'
   ./include/media/v4l2-ctrls.h:92: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_ptr'
   ./include/media/v4l2-ctrls.h:92: warning: Function parameter or member 'ANDROID_KABI_RESERVE(2' not described in 'v4l2_ctrl_ptr'
   ./include/media/v4l2-ctrls.h:126: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_ops'
   ./include/media/v4l2-ctrls.h:149: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl_type_ops'
   ./include/media/v4l2-ctrls.h:301: warning: Function parameter or member 'ANDROID_KABI_RESERVE(1' not described in 'v4l2_ctrl'


vim +941 ./include/media/media-entity.h

   921	
   922	bool media_entity_has_route(struct media_entity *entity, unsigned int sink,
   923				unsigned int source);
   924	
   925	/**
   926	 * media_graph_walk_start - Start walking the media graph at a
   927	 *	given entity
   928	 *
   929	 * @graph: Media graph structure that will be used to walk the graph
   930	 * @entity: Starting entity
   931	 *
   932	 * Before using this function, media_graph_walk_init() must be
   933	 * used to allocate resources used for walking the graph. This
   934	 * function initializes the graph traversal structure to walk the
   935	 * entities graph starting at the given entity. The traversal
   936	 * structure must not be modified by the caller during graph
   937	 * traversal. After the graph walk, the resources must be released
   938	 * using media_graph_walk_cleanup().
   939	 */
   940	void media_graph_walk_start(struct media_graph *graph,
 > 941				    struct media_pad *pad);
   942	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
