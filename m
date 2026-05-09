Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0EB276049
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778313563; cv=none; b=PFUK3QMIsIdQ9s72JPfcQQjd8+Fq3gXVNMckyA4nlWFWMKoxpRH1oJTEaExR1PnfzlaxuzckOfnX5MzS+F89NeZlWii3oDcbbzdtXwyfUXP+B61dhDiJXW7mi4qllIS8JUXOoHyrry7uaqt6ZUdz2gzXhDpsT0Uiy7rHT04MWX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778313563; c=relaxed/simple;
	bh=3q/f4hV944HTsHLpWjvAeOatcM9Ss2OhbFyxCVHM4OE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ubbgoOSNau1i/wrIxiZyv5lv/FuTPMa0Dt5c8xKGoAh8V/Aq0/lOABF3f++h18xRiHb/ZviRjkAey+/yM+08sUTurNkqLoZsIH6V2EmNBfXlHiqWG0MzsQDz9PkOhVAUtGq3nyU1Q678+29/iyAdzpy0HoZVhjGJ1xfehmw/CiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nqg0lbpM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nqg0lbpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778313562; x=1809849562;
  h=date:from:to:cc:subject:message-id;
  bh=3q/f4hV944HTsHLpWjvAeOatcM9Ss2OhbFyxCVHM4OE=;
  b=Nqg0lbpML3kWBVWE64tNx1I7Ycx91qz30GrjlWV1iBGABjdP5flaz9U2
   9kS//u2dbU+21ea1DUJ569IkAc/KSSti2XMxjGNr7O6xBi04iXeO/1oHC
   jCJpUBvYZhow5t2hZuyUbPrjacJWVJdfZxs7elLhjNrJ0Kx7/6uMo9/1M
   MFAXEPgFdvMWqgiQU0xl+1+ETzul5wfSqi4jOvxXqTlTTWw3OTjDRFdh1
   miK0+ZeDob64jpSFMijT5As1b5itxZj1wJNoUjj0Fl2owXmSw2WRrZQms
   uMi+PZOqs7ftV/IDG4lehbvfwczz4l0lPtFCBH/tFAgu4O3qPaFqnL2fy
   w==;
X-CSE-ConnectionGUID: QdgTj3m3QoKxinhZhhqroA==
X-CSE-MsgGUID: 7MrDg5SwRsOmNbQMUBB/4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79384771"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79384771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 00:59:21 -0700
X-CSE-ConnectionGUID: R64Mc5ZwSHCDxzE1o9XQow==
X-CSE-MsgGUID: nbqwuQs0RP2fO3T60enF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234310359"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 00:59:19 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLcai-000000000nB-38De;
	Sat, 09 May 2026 07:59:16 +0000
Date: Sat, 09 May 2026 15:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: drivers/misc/mei/mei_lb.c:284:32: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202605091533.79Zcv3CX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70390501d1944d4e5b8f7352be180fceb3a44132
commit: 773a43b8627f54dca56d08949497014b4ee8878a mei: lb: add late binding version 2
date:   5 weeks ago
config: mips-randconfig-r134-20260508 (https://download.01.org/0day-ci/archive/20260509/202605091533.79Zcv3CX-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091533.79Zcv3CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 773a43b8627f ("mei: lb: add late binding version 2")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091533.79Zcv3CX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/mei/mei_lb.c:284:32: sparse: sparse: restricted __le32 degrades to integer
>> drivers/misc/mei/mei_lb.c:330:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] command_id @@     got int @@
   drivers/misc/mei/mei_lb.c:330:40: sparse:     expected restricted __le32 [usertype] command_id
   drivers/misc/mei/mei_lb.c:330:40: sparse:     got int

vim +284 drivers/misc/mei/mei_lb.c

   269	
   270	static int mei_lb_check_response_v2(const struct device *dev, ssize_t bytes,
   271					    struct mei_lb2_rsp *rsp)
   272	{
   273		/*
   274		 * Received message size may be smaller than the full message size when
   275		 * reply contains only header with status field set to the error code.
   276		 * Check the header size and content first to output exact error, if needed,
   277		 * and then process to the whole message.
   278		 */
   279		if (bytes < sizeof(rsp->rheader)) {
   280			dev_err(dev, "Received less than header size from the firmware: %zd < %zu\n",
   281				bytes, sizeof(rsp->rheader));
   282			return -ENOMSG;
   283		}
 > 284		if (rsp->rheader.header.command_id != MEI_LB2_CMD) {
   285			dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
   286				rsp->rheader.header.command_id, MEI_LB2_CMD);
   287			return -EPROTO;
   288		}
   289		if (!(rsp->rheader.header.flags & MEI_LB2_HDR_FLAG_RSP)) {
   290			dev_err(dev, "Not a response: 0x%x\n", rsp->rheader.header.flags);
   291			return -EBADMSG;
   292		}
   293		if (rsp->rheader.status) {
   294			dev_err(dev, "Error in result: 0x%x\n", rsp->rheader.status);
   295			return (int)le32_to_cpu(rsp->rheader.status);
   296		}
   297		if (bytes < sizeof(*rsp)) {
   298			dev_err(dev, "Received less than message size from the firmware: %zd < %zu\n",
   299				bytes, sizeof(*rsp));
   300			return -ENODATA;
   301		}
   302	
   303		return 0;
   304	}
   305	
   306	static int mei_lb_push_payload_v2(struct device *dev, struct mei_cl_device *cldev,
   307					  u32 type, u32 flags, const void *payload, size_t payload_size)
   308	{
   309		u32 first_chunk, last_chunk;
   310		struct mei_lb2_rsp rsp;
   311		size_t sent_data = 0;
   312		size_t chunk_size;
   313		size_t req_size;
   314		ssize_t bytes;
   315		int ret;
   316	
   317		struct mei_lb2_req *req __free(kfree) = kzalloc(mei_cldev_mtu(cldev), GFP_KERNEL);
   318		if (!req)
   319			return -ENOMEM;
   320	
   321		first_chunk = MEI_LB2_FLAG_FST_CHUNK;
   322		last_chunk = 0;
   323		do {
   324			chunk_size = min(payload_size - sent_data, mei_cldev_mtu(cldev) - sizeof(*req));
   325	
   326			req_size = struct_size(req, payload, chunk_size);
   327			if (sent_data + chunk_size == payload_size)
   328				last_chunk = MEI_LB2_FLAG_LST_CHUNK;
   329	
 > 330			req->header.command_id = MEI_LB2_CMD;
   331			req->type = cpu_to_le32(type);
   332			req->flags = cpu_to_le32(flags | first_chunk | last_chunk);
   333			req->reserved = 0;
   334			req->total_payload_size = cpu_to_le32(payload_size);
   335			req->payload_size = cpu_to_le32(chunk_size);
   336			memcpy(req->payload, payload + sent_data, chunk_size);
   337	
   338			dev_dbg(dev, "Sending %zu bytes from offset %zu of %zu%s%s\n",
   339				chunk_size, sent_data, payload_size,
   340				first_chunk ? " first" : "", last_chunk ? " last" : "");
   341	
   342			bytes = mei_cldev_send_timeout(cldev, (u8 *)req, req_size,
   343						       INTEL_LB_SEND_TIMEOUT_MSEC);
   344			if (bytes < 0) {
   345				dev_err(dev, "Failed to send late binding request to firmware. %zd\n",
   346					bytes);
   347				return bytes;
   348			}
   349	
   350			bytes = mei_cldev_recv_timeout(cldev, (u8 *)&rsp, sizeof(rsp),
   351						       INTEL_LB_RECV_TIMEOUT_MSEC);
   352			if (bytes < 0) {
   353				dev_err(dev, "Failed to receive late binding reply from firmware. %zd\n",
   354					bytes);
   355				return bytes;
   356			}
   357			ret = mei_lb_check_response_v2(dev, bytes, &rsp);
   358			if (ret)
   359				return ret;
   360	
   361			/* prepare for the next chunk */
   362			sent_data += chunk_size;
   363			first_chunk = 0;
   364		} while (!last_chunk);
   365	
   366		return 0;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
