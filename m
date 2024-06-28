Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A40139FEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587200; cv=none; b=OhWadn5pVNXvXAf+jHIK6EnJZZcxmptjVDjBaVzRyU6g1qVs+Nk1ltfj/c02ugm+xJOpbheP0y5DFbwjG+XQV8M3dvmfnjNM2Ck0umBlle4+QCplM/NV6sspdfCMcMigiPG1vwNgo/lKXMq7/LpkPbooALSrR7gBeEMi8X4N84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587200; c=relaxed/simple;
	bh=Y6nvyD5RnFziG8IugxVVi1oE+PA40pl+IZpunpveWkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dZAHbML2NdOO5PR/TT3vv2jraP+9aYbWwZfKNsM8VUlALvg4wTskS+W35Ae92pf1HuDmAuyTQ0PJEYos+6rLg59DsgBg9cx21S0rAIPnwqWoc7HpbJSe0/0je2aaLdvZt9B5Ynx+KqfHApFWfMLbAPn9GKoDHfvdRdwCjQIYG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNJEPDi8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNJEPDi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587198; x=1751123198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6nvyD5RnFziG8IugxVVi1oE+PA40pl+IZpunpveWkE=;
  b=GNJEPDi8j3h/m2elWilKgRjNs88Q7eKlvEio2WreSdEygb/j9KppDVzP
   kqryn8TmiaCnpmGMkDnvFc0IQsOIh3c2QcWEOrdqTK0O5mfZvtuWc5Vto
   YKKT6vuSjElG16v4xmyATDzH7pnF/DsmciDV58YKLaQFkCHo1cZuaCM26
   nnVVMQU3BMSYw0ilCyhMVs/xtZQ8MV7BXfWnK+SfbjGefvGtQng0Rn7np
   DFEqJt5hG/H26jFo6ED27QCQ1i6cXVxYy84u1LjIRFi77sHgq+R2wuE59
   fmlwJjbmRkEcNWs4UGp991AQoB/Zob2pMGliD/w7EgDlzMRz74Uq/iQkl
   Q==;
X-CSE-ConnectionGUID: kfg329CUQNaPZIdtEVvu9A==
X-CSE-MsgGUID: K2yfU9ZtTeaox9VHtP25Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16608624"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16608624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:06:38 -0700
X-CSE-ConnectionGUID: 2SEHM/VmS8yHw3Kq+b7TxQ==
X-CSE-MsgGUID: pH6EM2j0T7y+l+BW1/3r1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="75490076"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2024 08:06:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNDBK-000HDv-0U;
	Fri, 28 Jun 2024 15:06:34 +0000
Date: Fri, 28 Jun 2024 23:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8744/9027]
 drivers/hid/bpf/hid_bpf_dispatch.c:363:47: warning: cast from pointer to
 integer of different size
Message-ID: <202406282304.UydSVncq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
commit: 67eccf151d76a9939ad8a50c6db5cb486b01df24 [8744/9027] HID: add source argument to HID low level functions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240628/202406282304.UydSVncq-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282304.UydSVncq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282304.UydSVncq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/bpf/hid_bpf_dispatch.c: In function 'hid_bpf_hw_request':
>> drivers/hid/bpf/hid_bpf_dispatch.c:363:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     363 |                                               (__u64)ctx);
         |                                               ^
   drivers/hid/bpf/hid_bpf_dispatch.c: In function 'hid_bpf_hw_output_report':
   drivers/hid/bpf/hid_bpf_dispatch.c:403:49: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     403 |                                                 (__u64)ctx);
         |                                                 ^
   drivers/hid/bpf/hid_bpf_dispatch.c: In function 'hid_bpf_input_report':
   drivers/hid/bpf/hid_bpf_dispatch.c:434:68: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     434 |         return hid_ops->hid_input_report(hdev, type, buf, size, 0, (__u64)ctx);
         |                                                                    ^


vim +363 drivers/hid/bpf/hid_bpf_dispatch.c

   313	
   314	/**
   315	 * hid_bpf_hw_request - Communicate with a HID device
   316	 *
   317	 * @ctx: the HID-BPF context previously allocated in hid_bpf_allocate_context()
   318	 * @buf: a %PTR_TO_MEM buffer
   319	 * @buf__sz: the size of the data to transfer
   320	 * @rtype: the type of the report (%HID_INPUT_REPORT, %HID_FEATURE_REPORT, %HID_OUTPUT_REPORT)
   321	 * @reqtype: the type of the request (%HID_REQ_GET_REPORT, %HID_REQ_SET_REPORT, ...)
   322	 *
   323	 * @returns %0 on success, a negative error code otherwise.
   324	 */
   325	__bpf_kfunc int
   326	hid_bpf_hw_request(struct hid_bpf_ctx *ctx, __u8 *buf, size_t buf__sz,
   327			   enum hid_report_type rtype, enum hid_class_request reqtype)
   328	{
   329		struct hid_device *hdev;
   330		size_t size = buf__sz;
   331		u8 *dma_data;
   332		int ret;
   333	
   334		/* check arguments */
   335		ret = __hid_bpf_hw_check_params(ctx, buf, &size, rtype);
   336		if (ret)
   337			return ret;
   338	
   339		switch (reqtype) {
   340		case HID_REQ_GET_REPORT:
   341		case HID_REQ_GET_IDLE:
   342		case HID_REQ_GET_PROTOCOL:
   343		case HID_REQ_SET_REPORT:
   344		case HID_REQ_SET_IDLE:
   345		case HID_REQ_SET_PROTOCOL:
   346			break;
   347		default:
   348			return -EINVAL;
   349		}
   350	
   351		hdev = (struct hid_device *)ctx->hid; /* discard const */
   352	
   353		dma_data = kmemdup(buf, size, GFP_KERNEL);
   354		if (!dma_data)
   355			return -ENOMEM;
   356	
   357		ret = hid_ops->hid_hw_raw_request(hdev,
   358						      dma_data[0],
   359						      dma_data,
   360						      size,
   361						      rtype,
   362						      reqtype,
 > 363						      (__u64)ctx);
   364	
   365		if (ret > 0)
   366			memcpy(buf, dma_data, ret);
   367	
   368		kfree(dma_data);
   369		return ret;
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
