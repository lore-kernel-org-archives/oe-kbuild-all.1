Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF63033F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771051278; cv=none; b=iM/b3W6SmFc0Wm+uq85fjOPJn0vFz2ovFMWE7XBb+lXor2aHtGcnOem2lVhlRY9DnEBYoi4OKdxw6SvC+gK9LGA4EeZhBuN7Ge3jyPZ4mTnwVUjunIieI8Wd3iT00CNp6Cu4rZqbPgPMDLPAy3/FyBw5AaZRG7S+c9GBtwWnEwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771051278; c=relaxed/simple;
	bh=Vsw4eVMnklCQ8pUfl0qF6bgRfnnC9foztF1yWlAni9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ORXxQhGSBncdq2GTNGxLtjtDmHD2ViYmeaLavu8fKDO0gVnCy1grWl4gnUJXSikxKm+ohk6nqmYjPVt34nartjNy6bDLRKNCtlr+iiWDqtnrx/G/s03JL3JCwRVPUuN2r/bt+0JNjnivVvv4HAND9N8e+MFD8aXkJGn72MEqhFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cT+h2KvM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cT+h2KvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771051276; x=1802587276;
  h=date:from:to:cc:subject:message-id;
  bh=Vsw4eVMnklCQ8pUfl0qF6bgRfnnC9foztF1yWlAni9g=;
  b=cT+h2KvMHpvdAYDKL/Zu1GbVcc5cYaIdxHKMMaQY5Wv0tnzK3eD0J0MZ
   Q+MVyEAmbD/2Ssa7AXjiC+OVAl7PZ/xBuks4s7SP2i1AnVHQo2ZXbOs0g
   aXCguS7suAMHZ04kf30K7QtoxkthQLHf5DvOUvrMi5/xS3Zn5Siif1jcS
   AV/i/XRs5mALPN5PqPyDGhqLBsGLGoIrPJcsEmr/POrL5DdpRYDF4Bvoh
   borK1dnIvL9QiVMFGNYONxV95CyuFpOtWYRrhG//NYRgbTCIiz8Hh7W5y
   OXtR5nGll+t8JuL9EAqt2oqI507wC8TEn70H6jyaiwCop09mE+hkfni8f
   g==;
X-CSE-ConnectionGUID: OuH7bMCwThC3tf2WWRtBfA==
X-CSE-MsgGUID: 1Oib4TGQQ7+9N5a3yU+7Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71424962"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71424962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:41:16 -0800
X-CSE-ConnectionGUID: j2myYO7BSveeY+jWxT5wmw==
X-CSE-MsgGUID: 0prxbuyWQPWmDIMmqUoVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217264341"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2026 22:41:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr9L5-00000000wIG-3CvX;
	Sat, 14 Feb 2026 06:41:11 +0000
Date: Sat, 14 Feb 2026 14:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:master 119/176]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:614:18: error: implicit
 declaration of function 'kzalloc'
Message-ID: <202602141439.ghVFodzo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 9e37ba4d81ee6e4dd9b1f37295ef9be04399e15b [119/176] drm: xlnx: hdcp: Reduce stack usage in xlnx_hdcp2x_tx_write_msg
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260214/202602141439.ghVFodzo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141439.ghVFodzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141439.ghVFodzo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c: In function 'xlnx_hdmi_hdcp2x_tx_write_msg':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:614:18: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     614 |         tx_msg = kzalloc(sizeof(*tx_msg), GFP_KERNEL);
         |                  ^~~~~~~
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:614:16: error: assignment to 'struct xhdcp2x_tx_msg *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     614 |         tx_msg = kzalloc(sizeof(*tx_msg), GFP_KERNEL);
         |                ^
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c:710:9: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Wimplicit-function-declaration]
     710 |         kfree(tx_msg);
         |         ^~~~~
         |         kvfree


vim +/kzalloc +614 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_tx.c

   607	
   608	static int xlnx_hdmi_hdcp2x_tx_write_msg(struct xlnx_hdcp2x_config *xhdcp2x_tx)
   609	{
   610		struct xhdcp2x_tx_msg *tx_msg;
   611		int message_size = 0;
   612		int status = -EINVAL;
   613	
 > 614		tx_msg = kzalloc(sizeof(*tx_msg), GFP_KERNEL);
   615		if (!tx_msg)
   616			return -ENOMEM;
   617	
   618		memcpy(tx_msg, xhdcp2x_tx->msg_buffer, sizeof(struct xhdcp2x_tx_msg));
   619	
   620		switch (tx_msg->msg_type.msg_id) {
   621		case HDCP_2_2_AKE_INIT:
   622			message_size =
   623				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   624								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   625								(u8 *)tx_msg,
   626								sizeof(struct hdcp2x_tx_ake_init) + 1);
   627			if (message_size == sizeof(struct hdcp2x_tx_ake_init) + 1)
   628				status = 0;
   629			break;
   630		case HDCP_2_2_AKE_NO_STORED_KM:
   631			message_size =
   632				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   633								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   634								(u8 *)tx_msg,
   635								sizeof(struct hdcp2x_tx_ake_no_stored_km)
   636								+ 1);
   637	
   638			if (message_size == sizeof(struct hdcp2x_tx_ake_no_stored_km) + 1)
   639				status = 0;
   640			break;
   641		case HDCP_2_2_AKE_STORED_KM:
   642			message_size =
   643				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   644								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   645								(u8 *)tx_msg,
   646								sizeof(struct hdcp2x_tx_ake_stored_km)
   647								+ 1);
   648	
   649			if (message_size == (sizeof(struct hdcp2x_tx_ake_stored_km) + 1))
   650				status = 0;
   651			break;
   652		case HDCP_2_2_LC_INIT:
   653			message_size =
   654				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   655								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   656								(u8 *)tx_msg,
   657								sizeof(struct hdcp2x_tx_lc_init) + 1);
   658	
   659			if (message_size == (sizeof(struct hdcp2x_tx_lc_init) + 1))
   660				status = 0;
   661			break;
   662		case HDCP_2_2_SKE_SEND_EKS:
   663			message_size =
   664				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   665								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   666								(u8 *)tx_msg,
   667								sizeof(struct hdcp2x_tx_ske_send_eks)
   668								+ 1);
   669	
   670			if (message_size == (sizeof(struct hdcp2x_tx_ske_send_eks) + 1))
   671				status = 0;
   672			break;
   673		case HDCP2X_TX_TYPE_VALUE:
   674			message_size =
   675				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   676								HDCP2X_TX_HDCPPORT_TYPE_VALUE_OFFSET,
   677								(u8 *)&xhdcp2x_tx
   678								->xhdcp2x_info.content_stream_type,
   679								HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE);
   680			if (message_size == HDCP2X_TX_HDCPPORT_TYPE_VALUE_SIZE)
   681				status = 0;
   682			break;
   683		case HDCP_2_2_REP_SEND_ACK:
   684			message_size =
   685				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   686								HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   687								(u8 *)tx_msg,
   688								sizeof(struct hdcp2x_tx_rpt_auth_send_ack)
   689								+ 1);
   690	
   691			if (message_size == (sizeof(struct hdcp2x_tx_rpt_auth_send_ack) + 1))
   692				status = 0;
   693			break;
   694		case HDCP_2_2_REP_STREAM_MANAGE:
   695			message_size =
   696				xhdcp2x_tx->handlers.wr_handler(xhdcp2x_tx->interface_ref,
   697							HDCP_2_2_HDMI_REG_WR_MSG_OFFSET,
   698							(u8 *)tx_msg,
   699							sizeof(struct hdcp2x_tx_rpt_auth_stream_manage)
   700							+ 1);
   701	
   702			if (message_size == (sizeof(struct hdcp2x_tx_rpt_auth_stream_manage) + 1))
   703				status = 0;
   704			break;
   705		default:
   706			status = -EINVAL;
   707			break;
   708		}
   709	
 > 710		kfree(tx_msg);
   711		return status;
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
