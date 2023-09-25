Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D4539F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695610573; x=1727146573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H5yHWt6l/AGvRTITF4KrmXa9crJh5Ws0YkwAYOP95O4=;
  b=LoiM4VUJZBgbQSLz2iPx+AdkKg/NcBlf/89cw1EeVxfpWsfzkVjwRtJ6
   g7I1R2MSzIFkaUHt8FG/BuMJran6WHr7dYKwn74RkwgZsQyqIPUTkKOY4
   M4p0YZORzpU6TFcG0qYLRG6CBllCmDNieRYP941ceUo/u1ME3Ho21f62h
   HXUe0ABm2tDl1JVcofXyd5NlmPQcSdmCpVopKA4oAE8iS8+W6sE08Ox1/
   pEWc6xYOWC6qrHANxQC2UVzMdUo3pXK2Iigqyyqi1q4EA2LxDxtP20Wn0
   hB03c2GY5M+CxyRkB/4Nu1QNJDHMyeVhR199i5G3Rff1bDwOOpxcUAC3A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445255894"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="445255894"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995202807"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="995202807"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2023 19:56:10 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkblY-00012N-1H;
	Mon, 25 Sep 2023 02:56:08 +0000
Date: Mon, 25 Sep 2023 10:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 95/115]
 drivers/gpu/drm/apple/iomfb.c:150:6: warning: no previous prototype for
 'dcp_push'
Message-ID: <202309251057.EnTNJKE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   f4266bb9a0d063559ea03f3a46244bb54c167e0c
commit: b8c3d5229173e76cb8574531e19b3e5eff495622 [95/115] drm/apple: Add support for the macOS 13.2 DCP firmware
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230925/202309251057.EnTNJKE5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251057.EnTNJKE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251057.EnTNJKE5-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
