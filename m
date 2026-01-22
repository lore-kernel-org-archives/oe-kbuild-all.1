Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE153A4F2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 03:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051681; cv=none; b=DO2/59WF03u0alQLe2ZP1bJvKmDRvwPK0QYyM5Xd1ixHhPrLdwq/GHvG26cDdTL42ek3vVgcBTTa0NKP1xrNp2kY7Cfnae0v7j8X0bhf0Z4pknAeasfkVr7OCyfEfyytincCgGR64inV0ki2KZUJVTK9pgqAIqHD7hrxZNaWzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051681; c=relaxed/simple;
	bh=qiKQrEB4W91ejU/+SSkOMO2A0QB9bc34P9x/PoRv/MQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EsWQmmNIiY9hmkE9CzcBjQnaeYiCG7chgdxfCjzRcaFLRRJMTNeUVc11Ohkf6kJ+zQXuMa+4adKIOxm1At8/D5vups5T48qHMdC5sk3l69h5vcl1FzS8KA/tomix4w+UCIDRNxdhabaHviS1LvgnWGFcHLORzhzGhqmDr3CSoMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Meyo+TO0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Meyo+TO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051676; x=1800587676;
  h=date:from:to:cc:subject:message-id;
  bh=qiKQrEB4W91ejU/+SSkOMO2A0QB9bc34P9x/PoRv/MQ=;
  b=Meyo+TO0QCzRM9A77/8pwsZJGhlw9EFpBJsNitoGhJRS1uPtzC81LHFC
   HcqG3DRTLt2wqgp37HMRwkMBvIbyd+/4aGmL47u/mQZplTASPsYj5mNwt
   i59HFYXRPfawJg+r+NmhjafQ9BOxurk70AuD/kPenhRsSzqHaUNrtruH4
   OQAh03S/N2KBTKG05/R12pzpaAOToSGAKFe+lFJ8MlBIQqCkkgXaGss8+
   MJXhpDTHkX8PvoYqcWNYIDmHtn7pnE3bteLO9CTb5XDXIZLgTHYms62Ij
   KVUrsbG+4+/TRj+axijBtRq5Wr6lNhFat1NYwmJJvIfGaVElHfV7l753a
   Q==;
X-CSE-ConnectionGUID: mTFpuWmTT2aPaTxhCwHfCA==
X-CSE-MsgGUID: tUc0JS5pRRWS53eoSk2UeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70189899"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="70189899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:14:33 -0800
X-CSE-ConnectionGUID: L22U34h6QJaSSvaW9oqiSw==
X-CSE-MsgGUID: eRAtPLOLTzWzy3LiXuSAfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="244209911"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2026 19:14:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vil9Q-00000000SMl-1E4h;
	Thu, 22 Jan 2026 03:14:28 +0000
Date: Thu, 22 Jan 2026 11:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:new_memory_domain_logic 7/7]
 sound/soc/sof/ipc4-topology.c:3123:12: error: no member named 'interim_bytes'
 in 'struct sof_ipc4_glb_pipe_ext_obj_memory_data'
Message-ID: <202601221116.H0v8QTWZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jsarha/linux new_memory_domain_logic
head:   a3430c5513049eb3e42bbdb9197762df44aed221
commit: a3430c5513049eb3e42bbdb9197762df44aed221 [7/7] ASoC: SOF: ipc4-topology: Change struct sof_ipc4_mod_init_ext_dp_memory_data
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601221116.H0v8QTWZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221116.H0v8QTWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221116.H0v8QTWZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:3123:12: error: no member named 'interim_bytes' in 'struct sof_ipc4_glb_pipe_ext_obj_memory_data'
    3123 |         mem_data->interim_bytes = swidget->interim_bytes;
         |         ~~~~~~~~  ^
>> sound/soc/sof/ipc4-topology.c:3124:12: error: no member named 'lifetime_bytes' in 'struct sof_ipc4_glb_pipe_ext_obj_memory_data'
    3124 |         mem_data->lifetime_bytes = swidget->lifetime_bytes;
         |         ~~~~~~~~  ^
   sound/soc/sof/ipc4-topology.c:3140:13: error: no member named 'interim_bytes' in 'struct sof_ipc4_glb_pipe_ext_obj_memory_data'
    3140 |                 mem_data->interim_bytes, mem_data->lifetime_bytes, mem_data->shared_bytes);
         |                 ~~~~~~~~  ^
   sound/soc/sof/ipc4-topology.c:3140:38: error: no member named 'lifetime_bytes' in 'struct sof_ipc4_glb_pipe_ext_obj_memory_data'
    3140 |                 mem_data->interim_bytes, mem_data->lifetime_bytes, mem_data->shared_bytes);
         |                                          ~~~~~~~~  ^
   4 errors generated.


vim +3123 sound/soc/sof/ipc4-topology.c

dbed0a33a87b7b Jyri Sarha 2025-06-10  3092  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3093  static int sof_ipc4_widget_pipe_create_msg_payload(struct snd_sof_dev *sdev,
91c9b6e6acda4b Jyri Sarha 2025-09-17  3094  						   struct snd_sof_widget *swidget,
91c9b6e6acda4b Jyri Sarha 2025-09-17  3095  						   struct sof_ipc4_msg *msg,
91c9b6e6acda4b Jyri Sarha 2025-09-17  3096  						   void **new_data)
91c9b6e6acda4b Jyri Sarha 2025-09-17  3097  {
91c9b6e6acda4b Jyri Sarha 2025-09-17  3098  	struct sof_ipc4_glb_pipe_ext_obj_memory_data *mem_data;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3099  	struct sof_ipc4_glb_pipe_payload *payload_hdr;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3100  	struct sof_ipc4_glb_pipe_ext_object *obj;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3101  	u32 *payload;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3102  	u32 ext_pos;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3103  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3104  	payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
91c9b6e6acda4b Jyri Sarha 2025-09-17  3105  	if (!payload)
91c9b6e6acda4b Jyri Sarha 2025-09-17  3106  		return -ENOMEM;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3107  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3108  	/* Add sof_ipc4_glb_pipe_payload and set array bit to  1 */
91c9b6e6acda4b Jyri Sarha 2025-09-17  3109  	payload_hdr = (struct sof_ipc4_glb_pipe_payload *)payload;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3110  	payload_hdr->word0 |= SOF_IPC4_GLB_PIPE_EXT_OBJ_ARRAY_MASK;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3111  	ext_pos = DIV_ROUND_UP(sizeof(*payload_hdr), sizeof(u32));
91c9b6e6acda4b Jyri Sarha 2025-09-17  3112  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3113  	obj = (struct sof_ipc4_glb_pipe_ext_object *)&payload[ext_pos];
91c9b6e6acda4b Jyri Sarha 2025-09-17  3114  	/* Add object array objects after payload_hdr */
91c9b6e6acda4b Jyri Sarha 2025-09-17  3115  	obj->header = SOF_IPC4_GLB_PIPE_EXT_OBJ_LAST_MASK |
91c9b6e6acda4b Jyri Sarha 2025-09-17  3116  		SOF_IPC4_GLB_PIPE_EXT_OBJ_ID(SOF_IPC4_GLB_PIPE_DATA_ID_MEM_DATA) |
91c9b6e6acda4b Jyri Sarha 2025-09-17  3117  		SOF_IPC4_GLB_PIPE_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*mem_data),
91c9b6e6acda4b Jyri Sarha 2025-09-17  3118  							     sizeof(u32)));
91c9b6e6acda4b Jyri Sarha 2025-09-17  3119  	ext_pos += DIV_ROUND_UP(sizeof(*obj), sizeof(u32));
91c9b6e6acda4b Jyri Sarha 2025-09-17  3120  	mem_data = (struct sof_ipc4_glb_pipe_ext_obj_memory_data *)&payload[ext_pos];
91c9b6e6acda4b Jyri Sarha 2025-09-17  3121  	mem_data->domain_id = swidget->domain_id;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3122  	mem_data->stack_bytes = swidget->stack_bytes;
91c9b6e6acda4b Jyri Sarha 2025-09-17 @3123  	mem_data->interim_bytes = swidget->interim_bytes;
91c9b6e6acda4b Jyri Sarha 2025-09-17 @3124  	mem_data->lifetime_bytes = swidget->lifetime_bytes;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3125  	mem_data->shared_bytes = swidget->shared_bytes;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3126  	ext_pos += DIV_ROUND_UP(sizeof(*mem_data), sizeof(u32));
91c9b6e6acda4b Jyri Sarha 2025-09-17  3127  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3128  	/* If another array object is added, remember clear previous OBJ_LAST bit */
91c9b6e6acda4b Jyri Sarha 2025-09-17  3129  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3130  	/* Put total payload size in words to the payload header */
91c9b6e6acda4b Jyri Sarha 2025-09-17  3131  	payload_hdr->word0 |= SOF_IPC4_GLB_PIPE_PAYLOAD_WORDS(ext_pos);
91c9b6e6acda4b Jyri Sarha 2025-09-17  3132  	*new_data = payload;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3133  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3134  	/* Update msg extension bits according to the payload changes */
91c9b6e6acda4b Jyri Sarha 2025-09-17  3135  	msg->extension |= SOF_IPC4_GLB_PIPE_PAYLOAD_MASK;
91c9b6e6acda4b Jyri Sarha 2025-09-17  3136  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3137  	dev_dbg(sdev->dev,
91c9b6e6acda4b Jyri Sarha 2025-09-17  3138  		"payload word0 %#x domain_id %u stack %u interim %u lifetime %u  shared %u bytes",
91c9b6e6acda4b Jyri Sarha 2025-09-17  3139  		payload_hdr->word0, mem_data->domain_id, mem_data->stack_bytes,
91c9b6e6acda4b Jyri Sarha 2025-09-17  3140  		mem_data->interim_bytes, mem_data->lifetime_bytes, mem_data->shared_bytes);
91c9b6e6acda4b Jyri Sarha 2025-09-17  3141  
91c9b6e6acda4b Jyri Sarha 2025-09-17  3142  	return ext_pos * sizeof(int32_t);
91c9b6e6acda4b Jyri Sarha 2025-09-17  3143  }
91c9b6e6acda4b Jyri Sarha 2025-09-17  3144  

:::::: The code at line 3123 was first introduced by commit
:::::: 91c9b6e6acda4b4a27dbe9a8a2c728e6484b966b ASoC: SOF: ipc4-topology: Add payload to pipeline create messages

:::::: TO: Jyri Sarha <jyri.sarha@linux.intel.com>
:::::: CC: Jyri Sarha <jyri.sarha@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
