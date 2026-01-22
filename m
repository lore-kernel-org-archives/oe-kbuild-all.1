Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815A378D8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052997; cv=none; b=eZNNx1QJ+558LqV7TPTvl99I8XaxVTyHZuJoD2aylesKQb/5vcoP1PaDEMun5ELKBs1gcQq/03r6CiOlZDk6lRj6SldEyrV3ytBnipp0E5Gt/nNypwdS2ZeOeNt7cn4j0nuGTtbSHHEtTomzj6TgJLe+UoqEF1y0HUG3nVG8AqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052997; c=relaxed/simple;
	bh=3Ju08XejZiQQ9aVQoKoxy4RZ8WJPe4rcLcf/9m4WTI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uB+bmlrUSdEEx5zCk3fp6CIVUFR61+pa/5jEcz0ty23HrudNX9WMe0ETU0BFK9i0nzmW4a50iVzBYH73y7B21X04ECpiW9kqMJTyXxaNMyhKz57REgLSD75Oihd6iV1vLRbZA8BFySBBgmGiwjXrT5StjIroTZGeDPbiizP2Pcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHZEuy15; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHZEuy15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769052994; x=1800588994;
  h=date:from:to:cc:subject:message-id;
  bh=3Ju08XejZiQQ9aVQoKoxy4RZ8WJPe4rcLcf/9m4WTI4=;
  b=CHZEuy15VSWIcyck2258TeOxGN7FfYvLD0CgPVHwAIhMGK1RMpDBbk7Q
   euxqa/HVTrwPjyUo12Nd7KKw6U7P9jJj8L+ALEVpGoUeqSOJRpP/2v2SF
   i4Nix1K3cVz9frtCN3KtWLbw7H9kq73omYfkUbAGPasdSXohN1yJoRkYV
   IXGxcVhegnRlPyFEt3zTd0mxhZLcCWoJMdKowXHzis7/pXpJlzKLvueMo
   jttxcqxzl25rh1X1aTiTSBqHuDCzF7PSLCp4JCbzy3s1sw7k4J6QWroCU
   oKV46UPdRjGDWtsJTeD4gSNdGE0fPrSWBHqqxaskoA5nZUHK2Kx4+0p4n
   g==;
X-CSE-ConnectionGUID: QZCwooIWSSSeDl+wXFrXrQ==
X-CSE-MsgGUID: 7rjqAOTYQsSp9b/hWAkYJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81007741"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81007741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:36:33 -0800
X-CSE-ConnectionGUID: 6l7HUFSRQU+RDvD0a/U4bQ==
X-CSE-MsgGUID: mbhpsXZqQoexHlZl7WCgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237294437"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 19:36:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vilUj-00000000SNx-0zWW;
	Thu, 22 Jan 2026 03:36:29 +0000
Date: Thu, 22 Jan 2026 11:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:new_memory_domain_logic 7/7]
 sound/soc/sof/ipc4-topology.c:3123:19: error: 'struct
 sof_ipc4_glb_pipe_ext_obj_memory_data' has no member named 'interim_bytes';
 did you mean 'interim_heap_bytes'?
Message-ID: <202601221126.3B1HNHx7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jsarha/linux new_memory_domain_logic
head:   a3430c5513049eb3e42bbdb9197762df44aed221
commit: a3430c5513049eb3e42bbdb9197762df44aed221 [7/7] ASoC: SOF: ipc4-topology: Change struct sof_ipc4_mod_init_ext_dp_memory_data
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260122/202601221126.3B1HNHx7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221126.3B1HNHx7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221126.3B1HNHx7-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/sof/ipc4-topology.c: In function 'sof_ipc4_widget_pipe_create_msg_payload':
>> sound/soc/sof/ipc4-topology.c:3123:19: error: 'struct sof_ipc4_glb_pipe_ext_obj_memory_data' has no member named 'interim_bytes'; did you mean 'interim_heap_bytes'?
    3123 |         mem_data->interim_bytes = swidget->interim_bytes;
         |                   ^~~~~~~~~~~~~
         |                   interim_heap_bytes
>> sound/soc/sof/ipc4-topology.c:3124:19: error: 'struct sof_ipc4_glb_pipe_ext_obj_memory_data' has no member named 'lifetime_bytes'; did you mean 'lifetime_heap_bytes'?
    3124 |         mem_data->lifetime_bytes = swidget->lifetime_bytes;
         |                   ^~~~~~~~~~~~~~
         |                   lifetime_heap_bytes
   In file included from include/linux/printk.h:621,
                    from include/linux/kernel.h:31,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/sound/pcm.h:14,
                    from include/sound/pcm_params.h:10,
                    from sound/soc/sof/ipc4-topology.c:12:
   sound/soc/sof/ipc4-topology.c:3140:27: error: 'struct sof_ipc4_glb_pipe_ext_obj_memory_data' has no member named 'interim_bytes'; did you mean 'interim_heap_bytes'?
    3140 |                 mem_data->interim_bytes, mem_data->lifetime_bytes, mem_data->shared_bytes);
         |                           ^~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/sof/ipc4-topology.c:3137:9: note: in expansion of macro 'dev_dbg'
    3137 |         dev_dbg(sdev->dev,
         |         ^~~~~~~
   sound/soc/sof/ipc4-topology.c:3140:52: error: 'struct sof_ipc4_glb_pipe_ext_obj_memory_data' has no member named 'lifetime_bytes'; did you mean 'lifetime_heap_bytes'?
    3140 |                 mem_data->interim_bytes, mem_data->lifetime_bytes, mem_data->shared_bytes);
         |                                                    ^~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/sof/ipc4-topology.c:3137:9: note: in expansion of macro 'dev_dbg'
    3137 |         dev_dbg(sdev->dev,
         |         ^~~~~~~


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
