Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1474360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 01:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685235700; x=1716771700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BR5TugNWNU+2Kty+1H7Shzkwglr+sNZde1XMbVMa1Hw=;
  b=SYnpYxNxlDMLr8PT6bDOvT5oVYLQz3ueEJwth5dOjwECA1dyJXFuy8Ct
   ONu0ZN9gkkkCrsqYyzHYXnn84qeWMCU+e96GNuUJbD/a0zljuqTYSZ2v+
   ldYjC1k0BUjkwTtBb7WncipAA46SfwKPXpMG1jLvK7WTLJ4HBDt91e/Y3
   VChzbPwktCJh7RvQilmDDhs59Ua9X+gdmZbQ510bb8tA0x9hQgmTyOnPd
   5Xh4yZVU5EtScTwDEGMUD8YvhSc7PaGRG1UJSY5Za95gam+fSLG/QFiyL
   zgY9kkrDTVrgDYqFIsYSvGdRQzgpMRZU0bWzBk3hiu0wTeWc+T6czRGYq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="339055053"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="339055053"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 18:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708807618"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="708807618"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 18:01:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q34mq-000KLA-1B;
	Sun, 28 May 2023 01:01:32 +0000
Date: Sun, 28 May 2023 09:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 22926/27651]
 include/trace/../../drivers/media/virtio//trace.h:74:1: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202305280846.yx7LxKnP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 60e037a422d44856f57117330ecb0e5ab613a043 [22926/27651] CHROMIUM: media: virtio: add virtio_video tracepoints
config: i386-randconfig-s003-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280846.yx7LxKnP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 60e037a422d44856f57117330ecb0e5ab613a043
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280846.yx7LxKnP-lkp@intel.com/

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
