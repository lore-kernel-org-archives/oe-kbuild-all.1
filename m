Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C83D78
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668782458; x=1700318458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+85RkjpLIREaQId0PYkLWbogG+OMfeNobdXzritYRA=;
  b=WIak1VorrlgzrQ9yCiimC1d9ATNoUlacHq1H4DjaF7XaGQxFl4jPUfy0
   nPJqlpoVeBweQ5zXLJiMjbeqFT9rBYfpfuRl6IatX/hGlQM/IBBaEJWLx
   RVzp8YM5qVqOAh9UInlyPPMN9WN0+ban9UzmqTILzg6oAbtX0EAP5Xwlv
   fFDWGggt51g18Sufuo3UAM6wtDUeBtWwBMxOG6QtVig6wAYz2VKV4xO0l
   tlFKIXwo3WC7TGlGywZ6ZVZWt5q0SL4A+W/mCjWy9xpAw5S/FJtHYpUpg
   WgNqfr6fFxCCQW8zC/KDm7PeeY3FIX5lg++t3/DywBw9xDoIOIwQb18ib
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="399433520"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="399433520"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 06:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="640228464"
X-IronPort-AV: E=Sophos;i="5.96,174,1665471600"; 
   d="scan'208";a="640228464"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Nov 2022 06:40:55 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ow2Y2-0001WL-2M;
	Fri, 18 Nov 2022 14:40:54 +0000
Date: Fri, 18 Nov 2022 22:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sam McNally <sammc@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Lyude Paul <lyude@redhat.com>
Subject: [hverkuil-media-tree:dp-mst-cec 3/5]
 drivers/gpu/drm/display/drm_dp_mst_topology.c:463:49: warning: Local
 variable 'msg' shadows outer variable [shadowVariable]
Message-ID: <202211182206.Q0YnDoXF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git dp-mst-cec
head:   4e1e3b68bf9013dda2eaf143accebd69534df7c0
commit: c5278e8ed0b239bf4151520ed94b5c982382e614 [3/5] drm/dp_mst: Add self-tests for up requests
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c5278e8ed0b239bf4151520ed94b5c982382e614
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/i2c/i2c-core-base.c:1248:8: warning: %hi in format string (no. 1) requires 'short *' but the argument type is 'unsigned short *'. [invalidScanfArgType_int]
    res = sscanf(buf, "%hi%c", &addr, &end);
          ^
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:463:49: warning: Local variable 'msg' shadows outer variable [shadowVariable]
     const struct drm_dp_connection_status_notify *msg;
                                                   ^
   drivers/gpu/drm/display/drm_dp_mst_topology.c:450:42: note: Shadowed declaration
     const struct drm_dp_sink_event_notify *msg;
                                            ^
   drivers/gpu/drm/display/drm_dp_mst_topology.c:463:49: note: Shadow variable
     const struct drm_dp_connection_status_notify *msg;
                                                   ^
   drivers/gpu/drm/display/drm_dp_mst_topology.c:480:47: warning: Local variable 'msg' shadows outer variable [shadowVariable]
     const struct drm_dp_resource_status_notify *msg;
                                                 ^
   drivers/gpu/drm/display/drm_dp_mst_topology.c:450:42: note: Shadowed declaration
     const struct drm_dp_sink_event_notify *msg;
                                            ^
   drivers/gpu/drm/display/drm_dp_mst_topology.c:480:47: note: Shadow variable
     const struct drm_dp_resource_status_notify *msg;
                                                 ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/input/ff-core.c:25:18: warning: Parameter 'file' can be declared as pointer to const [constParameter]
       struct file *file)
                    ^
--
>> drivers/hwmon/f75375s.c:643:0: warning: failed to expand 'show_fan', Wrong number of parameters for macro 'show_fan'. [preprocessorErrorDirective]
   #define show_fan(thing) 3-^
--
>> drivers/hwmon/asb100.c:243:1: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
   show_in_reg(in)
   ^
   drivers/hwmon/asb100.c:244:1: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
   show_in_reg(in_min)
   ^
   drivers/hwmon/asb100.c:245:1: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
   show_in_reg(in_max)
   ^
>> drivers/hwmon/w83792d.c:435:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
    return sprintf(buf, "%un", DIV_FROM_REG(data->fan_div[nr - 1]));
           ^
>> drivers/i2c/i2c-core-base.c:1325:16: warning: Uninitialized variable: devinfo->busnum [uninitvar]
     if (devinfo->busnum == adapter->nr &&
                  ^
--
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:5243:34: warning: Parameter 'branch' can be declared as pointer to const [constParameter]
          struct drm_dp_mst_branch *branch)
                                    ^

vim +/msg +463 drivers/gpu/drm/display/drm_dp_mst_topology.c

   331	
   332	void
   333	drm_dp_encode_sideband_req(const struct drm_dp_sideband_msg_req_body *req,
   334				   struct drm_dp_sideband_msg_tx *raw)
   335	{
   336		int idx = 0;
   337		int i;
   338		u8 *buf = raw->msg;
   339	
   340		buf[idx++] = req->req_type & 0x7f;
   341	
   342		switch (req->req_type) {
   343		case DP_ENUM_PATH_RESOURCES:
   344		case DP_POWER_DOWN_PHY:
   345		case DP_POWER_UP_PHY:
   346			buf[idx] = (req->u.port_num.port_number & 0xf) << 4;
   347			idx++;
   348			break;
   349		case DP_ALLOCATE_PAYLOAD:
   350			buf[idx] = (req->u.allocate_payload.port_number & 0xf) << 4 |
   351				(req->u.allocate_payload.number_sdp_streams & 0xf);
   352			idx++;
   353			buf[idx] = (req->u.allocate_payload.vcpi & 0x7f);
   354			idx++;
   355			buf[idx] = (req->u.allocate_payload.pbn >> 8);
   356			idx++;
   357			buf[idx] = (req->u.allocate_payload.pbn & 0xff);
   358			idx++;
   359			for (i = 0; i < req->u.allocate_payload.number_sdp_streams / 2; i++) {
   360				buf[idx] = ((req->u.allocate_payload.sdp_stream_sink[i * 2] & 0xf) << 4) |
   361					(req->u.allocate_payload.sdp_stream_sink[i * 2 + 1] & 0xf);
   362				idx++;
   363			}
   364			if (req->u.allocate_payload.number_sdp_streams & 1) {
   365				i = req->u.allocate_payload.number_sdp_streams - 1;
   366				buf[idx] = (req->u.allocate_payload.sdp_stream_sink[i] & 0xf) << 4;
   367				idx++;
   368			}
   369			break;
   370		case DP_QUERY_PAYLOAD:
   371			buf[idx] = (req->u.query_payload.port_number & 0xf) << 4;
   372			idx++;
   373			buf[idx] = (req->u.query_payload.vcpi & 0x7f);
   374			idx++;
   375			break;
   376		case DP_REMOTE_DPCD_READ:
   377			buf[idx] = (req->u.dpcd_read.port_number & 0xf) << 4;
   378			buf[idx] |= ((req->u.dpcd_read.dpcd_address & 0xf0000) >> 16) & 0xf;
   379			idx++;
   380			buf[idx] = (req->u.dpcd_read.dpcd_address & 0xff00) >> 8;
   381			idx++;
   382			buf[idx] = (req->u.dpcd_read.dpcd_address & 0xff);
   383			idx++;
   384			buf[idx] = (req->u.dpcd_read.num_bytes);
   385			idx++;
   386			break;
   387	
   388		case DP_REMOTE_DPCD_WRITE:
   389			buf[idx] = (req->u.dpcd_write.port_number & 0xf) << 4;
   390			buf[idx] |= ((req->u.dpcd_write.dpcd_address & 0xf0000) >> 16) & 0xf;
   391			idx++;
   392			buf[idx] = (req->u.dpcd_write.dpcd_address & 0xff00) >> 8;
   393			idx++;
   394			buf[idx] = (req->u.dpcd_write.dpcd_address & 0xff);
   395			idx++;
   396			buf[idx] = (req->u.dpcd_write.num_bytes);
   397			idx++;
   398			memcpy(&buf[idx], req->u.dpcd_write.bytes, req->u.dpcd_write.num_bytes);
   399			idx += req->u.dpcd_write.num_bytes;
   400			break;
   401		case DP_REMOTE_I2C_READ:
   402			buf[idx] = (req->u.i2c_read.port_number & 0xf) << 4;
   403			buf[idx] |= (req->u.i2c_read.num_transactions & 0x3);
   404			idx++;
   405			for (i = 0; i < (req->u.i2c_read.num_transactions & 0x3); i++) {
   406				buf[idx] = req->u.i2c_read.transactions[i].i2c_dev_id & 0x7f;
   407				idx++;
   408				buf[idx] = req->u.i2c_read.transactions[i].num_bytes;
   409				idx++;
   410				memcpy(&buf[idx], req->u.i2c_read.transactions[i].bytes, req->u.i2c_read.transactions[i].num_bytes);
   411				idx += req->u.i2c_read.transactions[i].num_bytes;
   412	
   413				buf[idx] = (req->u.i2c_read.transactions[i].no_stop_bit & 0x1) << 4;
   414				buf[idx] |= (req->u.i2c_read.transactions[i].i2c_transaction_delay & 0xf);
   415				idx++;
   416			}
   417			buf[idx] = (req->u.i2c_read.read_i2c_device_id) & 0x7f;
   418			idx++;
   419			buf[idx] = (req->u.i2c_read.num_bytes_read);
   420			idx++;
   421			break;
   422	
   423		case DP_REMOTE_I2C_WRITE:
   424			buf[idx] = (req->u.i2c_write.port_number & 0xf) << 4;
   425			idx++;
   426			buf[idx] = (req->u.i2c_write.write_i2c_device_id) & 0x7f;
   427			idx++;
   428			buf[idx] = (req->u.i2c_write.num_bytes);
   429			idx++;
   430			memcpy(&buf[idx], req->u.i2c_write.bytes, req->u.i2c_write.num_bytes);
   431			idx += req->u.i2c_write.num_bytes;
   432			break;
   433		case DP_QUERY_STREAM_ENC_STATUS: {
   434			const struct drm_dp_query_stream_enc_status *msg;
   435	
   436			msg = &req->u.enc_status;
   437			buf[idx] = msg->stream_id;
   438			idx++;
   439			memcpy(&buf[idx], msg->client_id, sizeof(msg->client_id));
   440			idx += sizeof(msg->client_id);
   441			buf[idx] = 0;
   442			buf[idx] |= FIELD_PREP(GENMASK(1, 0), msg->stream_event);
   443			buf[idx] |= msg->valid_stream_event ? BIT(2) : 0;
   444			buf[idx] |= FIELD_PREP(GENMASK(4, 3), msg->stream_behavior);
   445			buf[idx] |= msg->valid_stream_behavior ? BIT(5) : 0;
   446			idx++;
   447			}
   448			break;
   449		case DP_SINK_EVENT_NOTIFY: {
   450			const struct drm_dp_sink_event_notify *msg;
   451	
   452			msg = &req->u.sink_event;
   453			buf[idx] = (msg->port_number & 0xf) << 4;
   454			idx++;
   455			memcpy(&raw->msg[idx], msg->guid, 16);
   456			idx += 16;
   457			buf[idx] = (msg->event_id & 0xff00) >> 8;
   458			idx++;
   459			buf[idx] = (msg->event_id & 0xff);
   460			idx++;
   461			break;
   462		case DP_CONNECTION_STATUS_NOTIFY: {
 > 463			const struct drm_dp_connection_status_notify *msg;
   464	
   465			msg = &req->u.conn_stat;
   466			buf[idx] = (msg->port_number & 0xf) << 4;
   467			idx++;
   468			memcpy(&raw->msg[idx], msg->guid, 16);
   469			idx += 16;
   470			raw->msg[idx] = 0;
   471			raw->msg[idx] |= msg->legacy_device_plug_status ? BIT(6) : 0;
   472			raw->msg[idx] |= msg->displayport_device_plug_status ? BIT(5) : 0;
   473			raw->msg[idx] |= msg->message_capability_status ? BIT(4) : 0;
   474			raw->msg[idx] |= msg->input_port ? BIT(3) : 0;
   475			raw->msg[idx] |= FIELD_PREP(GENMASK(2, 0), msg->peer_device_type);
   476			idx++;
   477			break;
   478		}
   479		case DP_RESOURCE_STATUS_NOTIFY: {
   480			const struct drm_dp_resource_status_notify *msg;
   481	
   482			msg = &req->u.resource_stat;
   483			buf[idx] = (msg->port_number & 0xf) << 4;
   484			idx++;
   485			memcpy(&raw->msg[idx], msg->guid, 16);
   486			idx += 16;
   487			buf[idx] = (msg->available_pbn & 0xff00) >> 8;
   488			idx++;
   489			buf[idx] = (msg->available_pbn & 0xff);
   490			idx++;
   491			break;
   492		}
   493		}
   494		}
   495		raw->cur_len = idx;
   496	}
   497	EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_dp_encode_sideband_req);
   498	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
