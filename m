Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F482EA720
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750178443; cv=none; b=pIOZsybgle7aEVgI5uEfoUTcpRfaERrwgYPB2dx2ubCiabPWBCklYZH0OPat579zskhf2e4s99QTLLuKlzlArIQCNCJ/cF24QNgZHkan8YqXdTchV79LtkTLb8QV2wNXluA9x6868ixHJRLgErz1enwURMHOljoozcOvYD+4Zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750178443; c=relaxed/simple;
	bh=w9aRWdvrid5Oln41AbrV0F6HFeaj7eEksZa/1MNqMEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=un4cNQEtx6/ujIluFb/e8F1BdIGBFVzp6X1+LwuQVHk3vBtmGPBnxFeH2NffXjGVlza8pcp05QLuUibsutjwmU/ULUUyRQaP6YkqLTbvWpOBUHqZrYH8rUb4ow+0QdIDb1HchlrGrsoAQGKkSHdX7+7/2H3glPuE0EwAXxqDGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A09MMu+W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A09MMu+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750178442; x=1781714442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9aRWdvrid5Oln41AbrV0F6HFeaj7eEksZa/1MNqMEU=;
  b=A09MMu+WGDBwpyBwNzwgNV5aqjb35lvHh36dt3iu75LwpDzf0vJO0qOq
   f1706ms4VAE+vGjSyFqKx+yLgY08aK7ZmiuKaf1fozpDWRvzmKpmsRjiZ
   nYREDYuMD01ve2Eal25iwcnXh+mgsKOd2e93nS5/kJWS4tDDOLbRdBCzX
   W3tmxwnEaXX2i5gqMGWRR4Mm2DynKX8uoGB13RB1IipcEJjo+3tA5Wxw9
   RXB7SisA9zPsuiKQ6fXUBR0CoO2Ns6PfBXpA+dq3iTGHQk0veZ6Z0icql
   S9l8yREOSCjvmAsuYYm5boM0RU3PL4CHxkSqOZZqrIwSZUeU0zE00ov4J
   g==;
X-CSE-ConnectionGUID: 2QyzAXzVS/CUZXy2br493w==
X-CSE-MsgGUID: v4BFSj+1Spak9Vz8lXHYgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52506575"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52506575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 09:40:32 -0700
X-CSE-ConnectionGUID: OnOxPNH4SDeR9mlSKlXaWw==
X-CSE-MsgGUID: 8PEG8tg+RSiKHfYypGRdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148821402"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 09:40:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRZMK-000HJG-0V;
	Tue, 17 Jun 2025 16:40:28 +0000
Date: Wed, 18 Jun 2025 00:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:new_component_attributes 4/4]
 sound/soc/sof/ipc4-topology.c:2873:2: warning: variable 'ext_pos' is
 uninitialized when used here
Message-ID: <202506180047.HADU6PaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux new_component_attributes
head:   38a9088a99683fd5ec4938a8c4fce92aeab2776e
commit: 38a9088a99683fd5ec4938a8c4fce92aeab2776e [4/4] ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250618/202506180047.HADU6PaF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180047.HADU6PaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180047.HADU6PaF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:2873:2: warning: variable 'ext_pos' is uninitialized when used here [-Wuninitialized]
    2873 |         ext_pos += DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
         |         ^~~~~~~
   sound/soc/sof/ipc4-topology.c:2861:13: note: initialize the variable 'ext_pos' to silence this warning
    2861 |         u32 ext_pos;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/ext_pos +2873 sound/soc/sof/ipc4-topology.c

  2851	
  2852	static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
  2853						     struct snd_sof_widget *swidget,
  2854						     struct sof_ipc4_msg *msg,
  2855						     void *ipc_data, u32 ipc_size,
  2856						     void **new_data, u32 *new_size)
  2857	{
  2858		struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
  2859		struct sof_ipc4_module_init_ext_init *ext_init;
  2860		struct sof_ipc4_module_init_ext_object *hdr;
  2861		u32 ext_pos;
  2862		u32 *payload;
  2863	
  2864		/* For the moment the only reason for adding init_ext_init payload is DP
  2865		 * memory data. If both stack and heap size are 0 (= use default), then
  2866		 * there is no need for init_ext_init payload.
  2867		 */
  2868		if (swidget->stack_size == 0 && swidget->heap_size == 0) {
  2869			msg->extension &= ~SOF_IPC4_MOD_EXT_EXTENDED_MASK;
  2870			return 0;
  2871		}
  2872	
> 2873		ext_pos += DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
  2874	
  2875		payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
  2876		if (payload == NULL)
  2877			return -ENOMEM;
  2878	
  2879		/* Add ext_init first and set objects array flag to 1 */
  2880		ext_init = (struct sof_ipc4_module_init_ext_init *) payload;
  2881		ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
  2882		ext_pos = DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
  2883	
  2884		/* Add object array objects after ext_init */
  2885		if (swidget->heap_size != 0 || swidget->stack_size != 0) {
  2886			hdr = (struct sof_ipc4_module_init_ext_object *) &payload[ext_pos];
  2887			hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
  2888				SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_GLB_ID_DP_DATA) |
  2889				SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
  2890									     sizeof(u32)));
  2891			ext_pos += DIV_ROUND_UP(sizeof(*hdr), sizeof(u32));
  2892			dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *) &payload[ext_pos];
  2893			dp_mem_data->stack_size = swidget->stack_size;
  2894			dp_mem_data->heap_size = swidget->heap_size;
  2895			ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
  2896		}
  2897	
  2898		/* If another array object is added, remember clear previous OBJ_LAST bit */
  2899	
  2900		/* Calculate final size and check that it fits to max payload size */
  2901		*new_size = ext_pos * sizeof(u32) + ipc_size;
  2902		*new_data = payload;
  2903		if (*new_size > sdev->ipc->max_payload_size) {
  2904			dev_err(sdev->dev, "Max ipc payload size %lu exceeded: %u",
  2905				sdev->ipc->max_payload_size, *new_size);
  2906			return -EINVAL;
  2907		}
  2908	
  2909		/* Copy module specific ipc_payload to end */
  2910		memcpy(&payload[ext_pos], ipc_data, ipc_size);
  2911	
  2912		/* Update msg extension bits accoring to the payload changes */
  2913		msg->extension |= SOF_IPC4_MOD_EXT_EXTENDED_MASK;
  2914		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
  2915		msg->extension |= SOF_IPC4_MOD_EXT_PARAM_SIZE(DIV_ROUND_UP(*new_size, sizeof(u32)));
  2916	
  2917		return 1;
  2918	}
  2919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
