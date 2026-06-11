Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C62FFFBE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190120; cv=none; b=IexePeSFo3dbscsgNXwkRFa8IA8v0Jd+Esz01JEFZnVWlylQ3rqTC6K5jhOLZ1aOycG/3R+8t62q5BZVjK4rj6qRRFnDtaK8zN++09uzuPu8re91V4KF+nyaDz3sNagZmnmRkF88uZwhXDmj44pnTPSW414FXLtWNSVm5mDSH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190120; c=relaxed/simple;
	bh=WhDdyfO9V2vc5ed6PjhIp/giXaP58ZicnhpNqXakVVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWF5yDIDmxqarAbWxxry/Sk9raNT0IRYWBeZJyhNN0B39qIzBeLQlnAGxCDd4FPM445937imceUXygNAsx9VdmcuBtUzG3OcTWGG9HXj5sIXYIdYQqyWfKnPd1hXBeRMalxzxF6fyNx0UCYR5sxf7+uLhXpvaCrcgUqvypOZTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvBKxX4B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvBKxX4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781190119; x=1812726119;
  h=date:from:to:cc:subject:message-id;
  bh=WhDdyfO9V2vc5ed6PjhIp/giXaP58ZicnhpNqXakVVg=;
  b=mvBKxX4B0fofOEOSnOvO04VmIXiJOUyrBCdCeTOk2AbnwDUKYIAtGUr2
   gHyf/Zqb4RDyRNnfwfFdT+c2FeClLEU5YMrBhfdthgdZTz1Q6NEVXgvgS
   UxsrDMHx7wdEvH0mQ9jmlUzBPaCQMR/7IxlKIskidm00Zg5OWQoFHNiSl
   9i6KFMOqBd4b1Gbwjp1Xs5AVsepa6YzJSLQN9+aueVNNDxHh5lfY1XK+u
   clT7/YnJyKFzcLoC9rXEDqQ/T3kA4FQcPkeey8uE0Bcx2E1qdmUZUmtFh
   YJWtk5Np8EJLKwnt6p+ahOxtNcpOLyPwhh9VswO9X62tb7c5FucMBrVSZ
   w==;
X-CSE-ConnectionGUID: nYb73WPgS0ag2fe1qxt0Hg==
X-CSE-MsgGUID: qd8SOwgZRnOtJT0VNsbWfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69550108"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="69550108"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 08:01:50 -0700
X-CSE-ConnectionGUID: kFzSI1YpS2yKbzlbMULnlw==
X-CSE-MsgGUID: 2iSpzF41S/qRGbUx7YnnbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251593187"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 08:01:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXguf-00000000NHA-1fFv;
	Thu, 11 Jun 2026 15:01:45 +0000
Date: Thu, 11 Jun 2026 23:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: drivers/misc/mei/mei_lb.c:284:32: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <202606112254.vpmfzsUj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 773a43b8627f54dca56d08949497014b4ee8878a mei: lb: add late binding version 2
date:   9 weeks ago
config: sparc-randconfig-r112-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112254.vpmfzsUj-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112254.vpmfzsUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 773a43b8627f ("mei: lb: add late binding version 2")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112254.vpmfzsUj-lkp@intel.com/

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
