Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96145383
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681675880; x=1713211880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4LSU7F5ebPSrVIc75UbNBTEwz24sI0VT5yFYJOaO0ng=;
  b=FThFmfhg633Kp9IFVZoAE9nz9zxfFX3wvJfZjtzDb0i3tpbIqwP9ddny
   raV7QMqcmuKwaD5xv+k7ZXYwKSAPSLyCHygxqvZubNbNPIj7oaJMPXdUI
   RATuKJGZdMjsKrmKHIPdfRk2xjRLdL6LM9Y7r5gimk6rgIniNcMeRnnMq
   d3u4JwRw/k2b94vlZqfZ+HMplcSsiHJG+LPq7n7b994j/EGrJQuXhp2rA
   4NymG7Ru5/7KYuRl4jbEGbzE1qCKXikQRBHa75hVMS16NK6PgSCscMPb1
   EsRl8XHkxFd2U5CqXOxTsARmzeGN34vVJHWN07NBkuXpZRRPXY+VQobV6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344759898"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="344759898"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 13:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="640737615"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="640737615"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Apr 2023 13:11:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po8iQ-000bpH-1R;
	Sun, 16 Apr 2023 20:11:14 +0000
Date: Mon, 17 Apr 2023 04:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: bingbu.cao@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 12/14] media: add Kconfig and Makefile for IPU6
Message-ID: <202304170317.nncIh6Gk-lkp@intel.com>
References: <20230413100429.919622-13-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413100429.919622-13-bingbu.cao@intel.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master sailus-media-tree/streams v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/bingbu-cao-intel-com/media-intel-ipu6-add-Intel-IPU6-PCI-device-driver/20230413-175746
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230413100429.919622-13-bingbu.cao%40intel.com
patch subject: [RFC PATCH 12/14] media: add Kconfig and Makefile for IPU6
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230417/202304170317.nncIh6Gk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/845e01f6490aadbb154545367590d2dc73e08014
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review bingbu-cao-intel-com/media-intel-ipu6-add-Intel-IPU6-PCI-device-driver/20230413-175746
        git checkout 845e01f6490aadbb154545367590d2dc73e08014
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170317.nncIh6Gk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu6-fw-isys.c: In function 'ipu6_fw_isys_complex_cmd':
>> drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:185:17: error: implicit declaration of function 'clflush_cache_range'; did you mean 'flush_cache_range'? [-Werror=implicit-function-declaration]
     185 |                 clflush_cache_range(cpu_mapped_buf, size);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 flush_cache_range
   cc1: some warnings being treated as errors
--
   drivers/media/pci/intel/ipu6/ipu6-dma.c: In function '__dma_clear_buffer':
>> drivers/media/pci/intel/ipu6/ipu6-dma.c:55:17: error: implicit declaration of function 'clflush_cache_range'; did you mean 'flush_cache_range'? [-Werror=implicit-function-declaration]
      55 |                 clflush_cache_range(ptr, size);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 flush_cache_range
   cc1: some warnings being treated as errors
--
   drivers/media/pci/intel/ipu6/ipu6-mmu.c: In function 'l2_map':
>> drivers/media/pci/intel/ipu6/ipu6-mmu.c:280:17: error: implicit declaration of function 'clflush_cache_range'; did you mean 'flush_cache_range'? [-Werror=implicit-function-declaration]
     280 |                 clflush_cache_range(&mmu_info->l1_pt[l1_idx],
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 flush_cache_range
   cc1: some warnings being treated as errors


vim +185 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c

25a1e8d166c011 Bingbu Cao 2023-04-13  164  
25a1e8d166c011 Bingbu Cao 2023-04-13  165  int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
25a1e8d166c011 Bingbu Cao 2023-04-13  166  			     const unsigned int stream_handle,
25a1e8d166c011 Bingbu Cao 2023-04-13  167  			     void *cpu_mapped_buf,
25a1e8d166c011 Bingbu Cao 2023-04-13  168  			     dma_addr_t dma_mapped_buf,
25a1e8d166c011 Bingbu Cao 2023-04-13  169  			     size_t size, u16 send_type)
25a1e8d166c011 Bingbu Cao 2023-04-13  170  {
25a1e8d166c011 Bingbu Cao 2023-04-13  171  	struct ipu6_fw_com_context *ctx = isys->fwcom;
25a1e8d166c011 Bingbu Cao 2023-04-13  172  	struct ipu6_fw_send_queue_token *token;
25a1e8d166c011 Bingbu Cao 2023-04-13  173  
25a1e8d166c011 Bingbu Cao 2023-04-13  174  	if (send_type >= N_IPU6_FW_ISYS_SEND_TYPE)
25a1e8d166c011 Bingbu Cao 2023-04-13  175  		return -EINVAL;
25a1e8d166c011 Bingbu Cao 2023-04-13  176  
25a1e8d166c011 Bingbu Cao 2023-04-13  177  	dev_dbg(&isys->adev->dev, "send_token: %s\n",
25a1e8d166c011 Bingbu Cao 2023-04-13  178  		send_msg_types[send_type]);
25a1e8d166c011 Bingbu Cao 2023-04-13  179  
25a1e8d166c011 Bingbu Cao 2023-04-13  180  	/*
25a1e8d166c011 Bingbu Cao 2023-04-13  181  	 * Time to flush cache in case we have some payload. Not all messages
25a1e8d166c011 Bingbu Cao 2023-04-13  182  	 * have that
25a1e8d166c011 Bingbu Cao 2023-04-13  183  	 */
25a1e8d166c011 Bingbu Cao 2023-04-13  184  	if (cpu_mapped_buf)
25a1e8d166c011 Bingbu Cao 2023-04-13 @185  		clflush_cache_range(cpu_mapped_buf, size);
25a1e8d166c011 Bingbu Cao 2023-04-13  186  
25a1e8d166c011 Bingbu Cao 2023-04-13  187  	token = ipu6_send_get_token(ctx,
25a1e8d166c011 Bingbu Cao 2023-04-13  188  				    stream_handle + IPU6_BASE_MSG_SEND_QUEUES);
25a1e8d166c011 Bingbu Cao 2023-04-13  189  	if (!token)
25a1e8d166c011 Bingbu Cao 2023-04-13  190  		return -EBUSY;
25a1e8d166c011 Bingbu Cao 2023-04-13  191  
25a1e8d166c011 Bingbu Cao 2023-04-13  192  	token->payload = dma_mapped_buf;
25a1e8d166c011 Bingbu Cao 2023-04-13  193  	token->buf_handle = (unsigned long)cpu_mapped_buf;
25a1e8d166c011 Bingbu Cao 2023-04-13  194  	token->send_type = send_type;
25a1e8d166c011 Bingbu Cao 2023-04-13  195  
25a1e8d166c011 Bingbu Cao 2023-04-13  196  	ipu6_send_put_token(ctx, stream_handle + IPU6_BASE_MSG_SEND_QUEUES);
25a1e8d166c011 Bingbu Cao 2023-04-13  197  
25a1e8d166c011 Bingbu Cao 2023-04-13  198  	return 0;
25a1e8d166c011 Bingbu Cao 2023-04-13  199  }
25a1e8d166c011 Bingbu Cao 2023-04-13  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
