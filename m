Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE783D78
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681304915; x=1712840915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJFqgPnvnHlmAV8dUx/CcFUmgJFdKl8XP3e5dzH/RDs=;
  b=CWzpJBzmttSGvFA/O9Ql+7TuyyKkX4UfWYK7NuhdGZSyd42Ifrwbhb0w
   sy3AT+aQ28K2VwALRgdOqFZqiCMTZULjhMcErOxQULclUKhFhYSefX68c
   KFEsLmLYrkqdzWL7SmcxPe202SHYiMT6ruhVbYxV2JEt67YriBPE671AA
   EG8JvYQnEYE+Zb+GaETkDEgvTqK+0CXz1LJr/3BJFdYPb6HJkim49DuWE
   qHrNw26uEwjMiWf1T5ZwHnQnt4ok4tRBDViP5FFPmpCoE8PyQLcxu1vYA
   Y8R9nIqzm3WP3ECEEBdX1sMgGeDYhhxUBzwfCw5Ot/3DZcR9mPlZvBqV2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409027792"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409027792"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 06:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863300100"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863300100"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 06:07:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmaBp-000Xjz-2m;
	Wed, 12 Apr 2023 13:07:09 +0000
Date: Wed, 12 Apr 2023 21:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:t602x/bringup 130/139]
 drivers/gpu/drm/apple/iomfb.c:150:6: warning: no previous prototype for
 'dcp_push'
Message-ID: <202304122004.LY6BuWQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux t602x/bringup
head:   c0f58e1efe55af08259ff8b5d7f1ee77e858ee2c
commit: f0208e6a49f9796ccb04b0c49f4e3d61a22e9ad2 [130/139] drm/apple: Add support for the macOS 13.2 DCP firmware
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304122004.LY6BuWQx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f0208e6a49f9796ccb04b0c49f4e3d61a22e9ad2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux t602x/bringup
        git checkout f0208e6a49f9796ccb04b0c49f4e3d61a22e9ad2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122004.LY6BuWQx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/iomfb.c:150:6: warning: no previous prototype for 'dcp_push' [-Wmissing-prototypes]
     150 | void dcp_push(struct apple_dcp *dcp, bool oob, const struct dcp_method_entry *call,
         |      ^~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:192:5: warning: no previous prototype for 'dcp_parse_tag' [-Wmissing-prototypes]
     192 | int dcp_parse_tag(char tag[4])
         |     ^~~~~~~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:211:6: warning: no previous prototype for 'dcp_ack' [-Wmissing-prototypes]
     211 | void dcp_ack(struct apple_dcp *dcp, enum dcp_context_id context)
         |      ^~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:220:6: warning: no previous prototype for 'dcp_sleep' [-Wmissing-prototypes]
     220 | void dcp_sleep(struct apple_dcp *dcp)
         |      ^~~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:394:17: warning: no previous prototype for 'drm_to_dcp_rect' [-Wmissing-prototypes]
     394 | struct dcp_rect drm_to_dcp_rect(struct drm_rect *rect)
         |                 ^~~~~~~~~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:402:5: warning: no previous prototype for 'drm_format_to_dcp' [-Wmissing-prototypes]
     402 | u32 drm_format_to_dcp(u32 drm)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:448:26: warning: no previous prototype for 'lookup_mode' [-Wmissing-prototypes]
     448 | struct dcp_display_mode *lookup_mode(struct apple_dcp *dcp,
         |                          ^~~~~~~~~~~
>> drivers/gpu/drm/apple/iomfb.c:517:6: warning: no previous prototype for 'iomfb_start' [-Wmissing-prototypes]
     517 | void iomfb_start(struct apple_dcp *dcp)
         |      ^~~~~~~~~~~


vim +/dcp_push +150 drivers/gpu/drm/apple/iomfb.c

   148	
   149	/* Call a DCP function given by a tag */
 > 150	void dcp_push(struct apple_dcp *dcp, bool oob, const struct dcp_method_entry *call,
   151			     u32 in_len, u32 out_len, void *data, dcp_callback_t cb,
   152			     void *cookie)
   153	{
   154		enum dcp_context_id context = dcp_call_context(dcp, oob);
   155		struct dcp_channel *ch = dcp_get_channel(dcp, context);
   156	
   157		struct dcp_packet_header header = {
   158			.in_len = in_len,
   159			.out_len = out_len,
   160	
   161			/* Tag is reversed due to endianness of the fourcc */
   162			.tag[0] = call->tag[3],
   163			.tag[1] = call->tag[2],
   164			.tag[2] = call->tag[1],
   165			.tag[3] = call->tag[0],
   166		};
   167	
   168		u8 depth = dcp_push_depth(&ch->depth);
   169		u16 offset = dcp_packet_start(ch, depth);
   170	
   171		void *out = dcp->shmem + dcp_tx_offset(context) + offset;
   172		void *out_data = out + sizeof(header);
   173		size_t data_len = sizeof(header) + in_len + out_len;
   174	
   175		memcpy(out, &header, sizeof(header));
   176	
   177		if (in_len > 0)
   178			memcpy(out_data, data, in_len);
   179	
   180		trace_iomfb_push(dcp, call, context, offset, depth);
   181	
   182		ch->callbacks[depth] = cb;
   183		ch->cookies[depth] = cookie;
   184		ch->output[depth] = out + sizeof(header) + in_len;
   185		ch->end[depth] = offset + ALIGN(data_len, DCP_PACKET_ALIGNMENT);
   186	
   187		dcp_send_message(dcp, IOMFB_ENDPOINT,
   188				 dcpep_msg(context, data_len, offset));
   189	}
   190	
   191	/* Parse a callback tag "D123" into the ID 123. Returns -EINVAL on failure. */
 > 192	int dcp_parse_tag(char tag[4])
   193	{
   194		u32 d[3];
   195		int i;
   196	
   197		if (tag[3] != 'D')
   198			return -EINVAL;
   199	
   200		for (i = 0; i < 3; ++i) {
   201			d[i] = (u32)(tag[i] - '0');
   202	
   203			if (d[i] > 9)
   204				return -EINVAL;
   205		}
   206	
   207		return d[0] + (d[1] * 10) + (d[2] * 100);
   208	}
   209	
   210	/* Ack a callback from the DCP */
 > 211	void dcp_ack(struct apple_dcp *dcp, enum dcp_context_id context)
   212	{
   213		struct dcp_channel *ch = dcp_get_channel(dcp, context);
   214	
   215		dcp_pop_depth(&ch->depth);
   216		dcp_send_message(dcp, IOMFB_ENDPOINT,
   217				 dcpep_ack(context));
   218	}
   219	
 > 220	void dcp_sleep(struct apple_dcp *dcp)
   221	{
   222		switch (dcp->fw_compat) {
   223		case DCP_FIRMWARE_V_12_3:
   224			iomfb_sleep_v12_3(dcp);
   225			break;
   226		case DCP_FIRMWARE_V_13_2:
   227			iomfb_sleep_v13_2(dcp);
   228			break;
   229		default:
   230			WARN_ONCE(true, "Unexpected firmware version: %u\n", dcp->fw_compat);
   231			break;
   232		}
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
