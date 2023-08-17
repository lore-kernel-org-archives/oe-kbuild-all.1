Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB092100
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692257002; x=1723793002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DBKsg7ezZZY+YB9Kes2VfMo61CaZT77x1l8bqCBAdj8=;
  b=A7+vp4/+2vCtY4nNxng9Hacp4JLRtmgae5oorE2K9ESI0T4ZaZn2VEjx
   hm17Jhqw9ihgG4zDePfYC8CAFcyd+PHUqyrE9YsoDfjmmJzbbeF0eDFgt
   6pSmdFzppEZEqmljjJFielo5npQRYaT+pDhdhrv64CN/OyiC7GA6oFdDU
   Ns6n2AyW40WqiO6wj80Y0olNn8xmW7lzrtuGHmma2tvWOzELMo5lFNKPS
   r5dOngsGs+bfUKMqro0+ubbhupRKqlT7B88XI40D1KrXzgUsm0viCmydK
   ecdM+JwMNbOJlVPHZKLjLTjlUGLEBhCZ5qxjCYR/rjP54KXHZsE6kHikO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357701584"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="357701584"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799915926"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="799915926"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 00:23:20 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXLj-0000tx-1w;
	Thu, 17 Aug 2023 07:23:19 +0000
Date: Thu, 17 Aug 2023 15:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 22926/28679]
 include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202308171500.oERnEk0S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   2893dad7a2890e9678e5141cb18abbfde37facf5
commit: 60e037a422d44856f57117330ecb0e5ab613a043 [22926/28679] CHROMIUM: media: virtio: add virtio_video tracepoints
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230817/202308171500.oERnEk0S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171500.oERnEk0S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171500.oERnEk0S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_driver.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/media/virtio/trace.h):
>> include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] type @@     got restricted __le32 [usertype] type @@
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     expected unsigned int [usertype] type
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     got restricted __le32 [usertype] type
>> include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] stream_id @@     got restricted __le32 [usertype] stream_id @@
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     expected unsigned int [usertype] stream_id
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     got restricted __le32 [usertype] stream_id
   drivers/media/virtio/virtio_video_driver.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/media/virtio/trace.h):
>> include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] type @@     got restricted __le32 [usertype] type @@
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     expected unsigned int [usertype] type
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     got restricted __le32 [usertype] type
>> include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] stream_id @@     got restricted __le32 [usertype] stream_id @@
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     expected unsigned int [usertype] stream_id
   include/trace/../../drivers/media/virtio//trace.h:74:1: sparse:     got restricted __le32 [usertype] stream_id
   drivers/media/virtio/virtio_video_driver.c:169:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/media/virtio/virtio_video_driver.c:169:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_driver.c:169:9: sparse:    bad type *
   drivers/media/virtio/virtio_video_driver.c:169:9: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_driver.c:169:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
   drivers/media/virtio/virtio_video_driver.c:177:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
   drivers/media/virtio/virtio_video_driver.c:177:9: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_driver.c:177:9: sparse:    bad type *
   drivers/media/virtio/virtio_video_driver.c:177:9: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_driver.c:177:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'

vim +74 include/trace/../../drivers/media/virtio//trace.h

    73	
  > 74	DECLARE_EVENT_CLASS(virtio_video_cmd_class,
    75		TP_PROTO(struct virtio_video_cmd_hdr *hdr),
    76	
    77		TP_ARGS(hdr),
    78	
    79		TP_STRUCT__entry(
    80			__field(uint32_t, type)
    81			__field(uint32_t, stream_id)
    82		),
    83	
    84	
    85		TP_fast_assign(
    86			__entry->type = hdr->type;
    87			__entry->stream_id = hdr->stream_id;
    88		),
    89	
    90		TP_printk("type=%s stream_id=%u",
    91			__print_symbolic(__entry->type,
    92				{ VIRTIO_VIDEO_CMD_QUERY_CAPABILITY, "QUERY_CAPABILITY" },
    93				{ VIRTIO_VIDEO_CMD_STREAM_CREATE, "STREAM_CREATE" },
    94				{ VIRTIO_VIDEO_CMD_STREAM_DESTROY, "STREAM_DESTROY" },
    95				{ VIRTIO_VIDEO_CMD_STREAM_DRAIN, "STREAM_DRAIN" },
    96				{ VIRTIO_VIDEO_CMD_RESOURCE_CREATE, "RESOURCE_CREATE" },
    97				{ VIRTIO_VIDEO_CMD_RESOURCE_QUEUE, "RESOURCE_QUEUE" },
    98				{ VIRTIO_VIDEO_CMD_RESOURCE_DESTROY_ALL, "RESOURCE_DESTROY_ALL" },
    99				{ VIRTIO_VIDEO_CMD_QUEUE_CLEAR, "QUEUE_CLEAR" },
   100				{ VIRTIO_VIDEO_CMD_QUERY_CONTROL, "QUERY_CONTROL" },
   101				{ VIRTIO_VIDEO_CMD_GET_CONTROL, "GET_CONTROL" },
   102				{ VIRTIO_VIDEO_CMD_SET_CONTROL, "SET_CONTROL" },
   103				{ VIRTIO_VIDEO_CMD_GET_PARAMS_EXT, "GET_PARAMS_EXT" },
   104				{ VIRTIO_VIDEO_CMD_SET_PARAMS_EXT, "SET_PARAMS_EXT" }
   105			),
   106			__entry->stream_id)
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
