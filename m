Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459346684
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0PxQZvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697699939; x=1729235939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTod0+J3ULg0nD/QvgkhMmp+S43LSOt0yS8P01Uetps=;
  b=X0PxQZvxJATKjQjsbmd2+pOzBB/tVIcpBcX+wJZ2sM8hZCSoBI714uVj
   G4nR7kF6gfQVwi5tGV66XOnIDCEJGqyUQEuKT5kgUrRu8nKIAW2ikH0SN
   +/I+Md2MsVMgpMhLisEdt0aTScypFkjIHXo2eaiOr98nslqs5FcZDx5QJ
   eRaqZAwkyJzhjmZGKnSmBScfDmQ2wKd/ZeGV+GuSqQ8d433zL/f3vIkhb
   Qrm42HdAF6WNnuaLiOGIc7B8BfbToXWwQqfvOrR+vufBj2cRnZ+AvhLjp
   eETQrxBuNflb8UJQGyWMy+iu8Q8rp2pjs538gYaHydghqCZkpeQFUDJWz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389050063"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="389050063"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 00:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930503355"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930503355"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 00:18:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtNJ0-0001nQ-27;
	Thu, 19 Oct 2023 07:18:54 +0000
Date: Thu, 19 Oct 2023 15:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:hdmi-dbg 11/33]
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1163:25:
 error: '%s' directive output may be truncated writing up to 31 bytes into a
 region of size 26
Message-ID: <202310191557.63Tg1UP7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   99c0aa87508f07fc523d9e841b6bd981fd702b83
commit: 1eb159538ab221d1ffb1002a0cf8585906e75ca0 [11/33] cec/extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310191557.63Tg1UP7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191557.63Tg1UP7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191557.63Tg1UP7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_querycap':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1163:25: error: '%s' directive output may be truncated writing up to 31 bytes into a region of size 26 [-Werror=format-truncation=]
    1163 |                  "serio:%s", port->name);
         |                         ^~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1162:9: note: 'snprintf' output between 7 and 38 bytes into a destination of size 32
    1162 |         snprintf(cap->bus_info, sizeof(cap->bus_info),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1163 |                  "serio:%s", port->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_cec_adap_log_addr':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:986:49: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
     986 |         snprintf(cmd, sizeof(cmd), "W%c%u*%uLCEC",
         |                                                 ^
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:986:9: note: 'snprintf' output between 10 and 21 bytes into a destination of size 11
     986 |         snprintf(cmd, sizeof(cmd), "W%c%u*%uLCEC",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     987 |                  port->direction, port->port.port, la);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In function 'extron_setup':
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1512:49: error: '*15LCEC' directive output may be truncated writing 7 bytes into a region of size between 4 and 13 [-Werror=format-truncation=]
    1512 |                 snprintf(cmd, sizeof(cmd), "WO%u*15LCEC", p + 1);
         |                                                 ^~~~~~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1512:17: note: 'snprintf' output between 11 and 20 bytes into a destination of size 16
    1512 |                 snprintf(cmd, sizeof(cmd), "WO%u*15LCEC", p + 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1513:54: error: '*15' directive output may be truncated writing 3 bytes into a region of size between 1 and 10 [-Werror=format-truncation=]
    1513 |                 snprintf(resp, sizeof(resp), "LcecO%u*15", p + 1);
         |                                                      ^~~
   drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1513:17: note: 'snprintf' output between 10 and 19 bytes into a destination of size 16
    1513 |                 snprintf(resp, sizeof(resp), "LcecO%u*15", p + 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +1163 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c

   977	
   978	static int extron_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
   979	{
   980		struct extron_port *port = cec_get_drvdata(adap);
   981		char cmd[11];
   982		char resp[17];
   983		u8 la = log_addr == CEC_LOG_ADDR_INVALID ? 15 : log_addr;
   984		int err;
   985	
 > 986		snprintf(cmd, sizeof(cmd), "W%c%u*%uLCEC",
   987			 port->direction, port->port.port, la);
   988		snprintf(resp, sizeof(resp), "Lcec%c%u*%u",
   989			 port->direction, port->port.port, la);
   990		err = extron_send_and_wait(port->extron, port, cmd, resp);
   991		return log_addr != CEC_LOG_ADDR_INVALID && err ? err : 0;
   992	}
   993	
   994	static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
   995					    u32 signal_free_time, struct cec_msg *msg)
   996	{
   997		struct extron_port *port = cec_get_drvdata(adap);
   998		char buf[CEC_MAX_MSG_SIZE * 3 + 1];
   999		char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
  1000		unsigned int i;
  1001	
  1002		buf[0] = 0;
  1003		for (i = 0; i < msg->len - 1; i++)
  1004			sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
  1005		snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
  1006			 port->direction, port->port.port,
  1007			 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
  1008		return extron_send_and_wait(port->extron, port, cmd, NULL);
  1009	}
  1010	
  1011	static void extron_cec_adap_configured(struct cec_adapter *adap, bool configured)
  1012	{
  1013		struct extron_port *port = cec_get_drvdata(adap);
  1014	
  1015		if (debug)
  1016			dev_info(port->extron->dev, "%sconfigured port %d (%s)\n",
  1017				 configured ? "" : "un", port->port.port,
  1018				 port->extron->splitter.is_standby ? "Off" : "On");
  1019		if (!port->is_input)
  1020			cec_splitter_configured_output(&port->port, configured);
  1021	}
  1022	
  1023	static int extron_received(struct cec_adapter *adap, struct cec_msg *msg)
  1024	{
  1025		struct extron_port *port = cec_get_drvdata(adap);
  1026	
  1027		if (!vendor_id)
  1028			return -ENOMSG;
  1029		if (port->is_input)
  1030			return cec_splitter_received_input(&port->port, msg);
  1031		return cec_splitter_received_output(&port->port, msg,
  1032						    port->extron->ports[port->extron->num_out_ports]->adap);
  1033	}
  1034	
  1035	#define log_printf(adap, file, fmt, arg...) \
  1036		do { \
  1037			if (file) \
  1038				seq_printf((file), fmt, ## arg); \
  1039			else \
  1040				pr_info("cec-%s: " fmt, (adap)->name, ## arg);	\
  1041		} while (0)
  1042	
  1043	static const char * const pwr_state[] = {
  1044		"on",
  1045		"standby",
  1046		"to on",
  1047		"to standby",
  1048	};
  1049	
  1050	static void extron_adap_status_port(struct extron_port *port, struct seq_file *file)
  1051	{
  1052		struct cec_adapter *adap = port->adap;
  1053	
  1054		if (port->disconnected) {
  1055			log_printf(adap, file,
  1056				   "\tport %u: disconnected\n", port->port.port);
  1057			return;
  1058		}
  1059		if (port->is_input)
  1060			log_printf(adap, file,
  1061				   "\tport %u: %s signal, %s edid, %s 4kp30, %s 4kp60, %sQS/%sQY, is %s\n",
  1062				   port->port.port,
  1063				   port->has_signal ? "has" : "no",
  1064				   port->has_edid ? "has" : "no",
  1065				   port->has_4kp30 ? "has" : "no",
  1066				   port->has_4kp60 ? "has" : "no",
  1067				   port->has_qs ? "" : "no ",
  1068				   port->has_qy ? "" : "no ",
  1069				   !port->port.adap->is_configured ? "not configured" :
  1070					pwr_state[port->extron->splitter.is_standby]);
  1071		else
  1072			log_printf(adap, file,
  1073				   "\tport %u: %s sink, %s signal, %s edid, %s 4kp30, %s 4kp60, %sQS/%sQY, is %sactive source, is %s\n",
  1074				   port->port.port,
  1075				   port->port.found_sink ? "found" : "no",
  1076				   port->has_signal ? "has" : "no",
  1077				   port->has_edid ? "has" : "no",
  1078				   port->has_4kp30 ? "has" : "no",
  1079				   port->has_4kp60 ? "has" : "no",
  1080				   port->has_qs ? "" : "no ",
  1081				   port->has_qy ? "" : "no ",
  1082				   port->port.is_active_source ? "" : "not ",
  1083				   !port->port.adap->is_configured ? "not configured" :
  1084				   pwr_state[port->port.power_status & 3]);
  1085		if (port->port.out_give_device_power_status_seq)
  1086			log_printf(adap, file,
  1087				   "\tport %u: querying power status (%u, %lldms)\n",
  1088				   port->port.port,
  1089				   port->port.out_give_device_power_status_seq & ~(1 << 31),
  1090				   ktime_ms_delta(ktime_get(),
  1091						  port->port.out_give_device_power_status_ts));
  1092		if (port->port.out_request_current_latency_seq)
  1093			log_printf(adap, file,
  1094				   "\tport %u: querying latency (%u, %lldms)\n",
  1095				   port->port.port,
  1096				   port->port.out_request_current_latency_seq & ~(1 << 31),
  1097				   ktime_ms_delta(ktime_get(),
  1098						  port->port.out_request_current_latency_ts));
  1099	}
  1100	
  1101	static void extron_adap_status(struct cec_adapter *adap, struct seq_file *file)
  1102	{
  1103		struct extron_port *port = cec_get_drvdata(adap);
  1104		struct extron *extron = port->extron;
  1105		unsigned int i;
  1106	
  1107		log_printf(adap, file, "name: %s type: %s\n",
  1108			   extron->unit_name, extron->unit_type);
  1109		log_printf(adap, file, "model: 60-160%c-01 (1 input, %u outputs)\n",
  1110			   '6' + extron->num_out_ports / 2, extron->num_out_ports);
  1111		log_printf(adap, file, "firmware version: %s CEC engine version: %s\n",
  1112			   extron->unit_fw_version, extron->unit_cec_engine_version);
  1113		if (extron->hpd_never_low)
  1114			log_printf(adap, file, "always keep input HPD high\n");
  1115		else
  1116			log_printf(adap, file,
  1117				   "pull input HPD low if all output HPDs are low\n");
  1118		if (vendor_id)
  1119			log_printf(adap, file,
  1120				   "splitter vendor ID: 0x%06x\n", vendor_id);
  1121		if (manufacturer_name[0])
  1122			log_printf(adap, file, "splitter manufacturer name: %s\n",
  1123				   manufacturer_name);
  1124		log_printf(adap, file, "splitter power status: %s\n",
  1125			   pwr_state[extron->splitter.is_standby]);
  1126		log_printf(adap, file, "%s port: %d (%s)\n",
  1127			   port->is_input ? "input" : "output",
  1128			   port->port.port, port->name);
  1129		log_printf(adap, file, "splitter input port:\n");
  1130		extron_adap_status_port(extron->ports[extron->num_out_ports], file);
  1131	
  1132		log_printf(adap, file, "splitter output ports:\n");
  1133		for (i = 0; i < extron->num_out_ports; i++)
  1134			extron_adap_status_port(extron->ports[i], file);
  1135	
  1136		if (!port->has_edid || !port->read_edid)
  1137			return;
  1138	
  1139		for (i = 0; i < port->edid_blocks * 128; i += 16) {
  1140			if (i % 128 == 0)
  1141				log_printf(adap, file, "\n");
  1142			log_printf(adap, file, "EDID: %*ph\n", 16, port->edid + i);
  1143		}
  1144	}
  1145	
  1146	static const struct cec_adap_ops extron_cec_adap_ops = {
  1147		.adap_enable = extron_cec_adap_enable,
  1148		.adap_log_addr = extron_cec_adap_log_addr,
  1149		.adap_transmit = extron_cec_adap_transmit,
  1150		.adap_configured = extron_cec_adap_configured,
  1151		.adap_status = extron_adap_status,
  1152		.received = extron_received,
  1153	};
  1154	
  1155	static int extron_querycap(struct file *file, void *priv,
  1156				   struct v4l2_capability *cap)
  1157	{
  1158		struct extron_port *port = video_drvdata(file);
  1159	
  1160		strscpy(cap->driver, "extron-da-hd-4k-plus-cec", sizeof(cap->driver));
  1161		strscpy(cap->card, cap->driver, sizeof(cap->card));
  1162		snprintf(cap->bus_info, sizeof(cap->bus_info),
> 1163			 "serio:%s", port->name);
  1164		return 0;
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
