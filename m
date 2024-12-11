Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7BF1C07C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 06:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733900223; cv=none; b=PrsG0CSMa6yJDRyrx7OsTsgB3pnf7pNJCHa6IiYEc0+2CS0/VctB3rlHJN4wrrBd6YelrDWov9CJ0bUzUi+bfq526yNSOqjbJOGuViEU+oKrIgSCSjhyYqqmWYtn2tvTn6pNNtT+juTN9rww8YOElQ4G1IRQRcqtv5rLSiuw5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733900223; c=relaxed/simple;
	bh=6QcVmfhG/yiPf8emzE87k93uNORF4KVnYiu5xUAKPg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6Mzt/D6M/3e55ulZnHsqRAz1K2Y37AhITMedo5kd2mqHahdkzrT6jTFPncdcZ+vFCA5jQ591Pq5cprVfhrEvVMt2k5c4oXOUmLaM60OQdfWsfTiJEG5qAnBEDJJbKqlHxcvRxAIXGlFY0tqGl7AogpniSGfogDqChDWupJBOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmIRpxiY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmIRpxiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733900222; x=1765436222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QcVmfhG/yiPf8emzE87k93uNORF4KVnYiu5xUAKPg0=;
  b=XmIRpxiYhHD55J5jhyTD7cuk0kipy4MzuPCB82X2IwHQtQu0wo68lodk
   NKmDNsHA9EONjGwbSFNZph5FtKl9Q7UAbjXYU9rSvKjgiAfIlvn13nBtM
   e5H4dyEGui45OXG2Pc/ioXQUC5IDLIJBKVhbZfQL5fv1IQak5iqn+PPq0
   aErpWAFxJD7nNfXnfQvpjCOmQ/G1aZb9jkYIR7d7fxLerA975seVn+4fk
   puVCpHDgNhFoTZ1I/2wT/Xa0Ivl/VbPLKoOCmbYCm3q1GF6vtHfYqLByl
   ode90X2FQPIoX0Zy5UzOAxfuZjajv6U57uA5WfwiPehXYz5kAzEmgL95Q
   w==;
X-CSE-ConnectionGUID: epRevuWIQOqRRk1QbtxC2A==
X-CSE-MsgGUID: 7dzLy/hnQTmMbRCBb84+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38051469"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38051469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 22:57:01 -0800
X-CSE-ConnectionGUID: h/3FrSNAQBmfplSME0aogQ==
X-CSE-MsgGUID: MhEMEpGwSEOIeGYVqJsV1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95885834"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2024 22:57:00 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLGeX-0006Nh-1x;
	Wed, 11 Dec 2024 06:56:57 +0000
Date: Wed, 11 Dec 2024 14:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2]
 drivers/media/v4l2-core/v4l2-loopback.c:923: undefined reference to
 `__moddi3'
Message-ID: <202412111428.dxOzlUcx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   a3f82e653c46a6e972edb5f623ab83190db10758
commit: a3f82e653c46a6e972edb5f623ab83190db10758 [2/2] media: v4l2-loopback
config: i386-randconfig-004-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111428.dxOzlUcx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111428.dxOzlUcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111428.dxOzlUcx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `get_capture_buffer':
>> drivers/media/v4l2-core/v4l2-loopback.c:923: undefined reference to `__moddi3'
>> ld: drivers/media/v4l2-core/v4l2-loopback.c:930: undefined reference to `__moddi3'
   ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `vidioc_reqbufs':
   drivers/media/v4l2-core/v4l2-loopback.c:1909: undefined reference to `__moddi3'
   ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `buffer_written':
   drivers/media/v4l2-core/v4l2-loopback.c:1026: undefined reference to `__moddi3'
   ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `v4l2_loopback_write':
   drivers/media/v4l2-core/v4l2-loopback.c:1073: undefined reference to `__moddi3'


vim +923 drivers/media/v4l2-core/v4l2-loopback.c

   903	
   904	static int get_capture_buffer(struct file *file)
   905	{
   906		struct v4l2_loopback_device *dev = v4l2l_getdevice(file);
   907		struct v4l2_loopback_opener *opener = fh_to_opener(file->private_data);
   908		int pos, ret;
   909		int timeout_happened;
   910	
   911		if ((file->f_flags & O_NONBLOCK) &&
   912		    (dev->write_position <= opener->read_position &&
   913		     dev->reread_count <= opener->reread_count &&
   914		     !dev->timeout_happened))
   915			return -EAGAIN;
   916		wait_event_interruptible(dev->read_event, can_read(dev, opener));
   917	
   918		spin_lock_bh(&dev->lock);
   919		if (dev->write_position == opener->read_position) {
   920			if (dev->reread_count > opener->reread_count + 2)
   921				opener->reread_count = dev->reread_count - 1;
   922			++opener->reread_count;
 > 923			pos = (opener->read_position + dev->used_buffers - 1) %
   924			      dev->used_buffers;
   925		} else {
   926			opener->reread_count = 0;
   927			if (dev->write_position >
   928			    opener->read_position + dev->used_buffers)
   929				opener->read_position = dev->write_position - 1;
 > 930			pos = opener->read_position % dev->used_buffers;
   931			++opener->read_position;
   932		}
   933		timeout_happened = dev->timeout_happened;
   934		dev->timeout_happened = 0;
   935		spin_unlock_bh(&dev->lock);
   936	
   937		ret = dev->bufpos2index[pos];
   938		if (timeout_happened) {
   939			if (ret < 0) {
   940				pr_debug("trying to return not mapped buf[%d]\n", ret);
   941				return -EFAULT;
   942			}
   943			/* although allocated on-demand, timeout_image is freed only
   944			 * in free_buffers(), so we don't need to worry about it being
   945			 * deallocated suddenly */
   946			memcpy(dev->image + dev->buffers[ret].buffer.m.offset,
   947			       dev->timeout_image, dev->buffer_size);
   948		}
   949		return ret;
   950	}
   951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
