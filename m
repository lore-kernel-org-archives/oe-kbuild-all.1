Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E78B2CA8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729932538; cv=none; b=czZBLV0k0Fa3QkxG8ymba7zRGch31PS8OqRq60UY4ktY7nilUuJiCQ0JphJcrv5Nv0ZTP3QwXu0klaIuyqsnAQ4nQq8r5EJA+nXOje3B2DQyLIXXvhThgBp3gU330LgAJ/FpoXjQ7+w/+YBvC+vBoHoYAgUzLS/77uVM8nUFNNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729932538; c=relaxed/simple;
	bh=k96YAJJSh56cTCsfVByu8RhRwAa3I7BuNO4E/Lof6es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZ2HNqlBlL3M6Ne6TOKYhoGuSUIe+a/UfbmCrypUrcD6Sx68YNoEgLQMC83TLH1Gpy9XvFaca34B5/XR3gLk+PFfltxKBZ5DEreM2znhtnmvVvKYG/GbOYe2hVF0CBPKiU3Ok47fYy0XuUdQPAhY+DH6yZcMS1v0iPNWaYNYs6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0ALeOwY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0ALeOwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729932536; x=1761468536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k96YAJJSh56cTCsfVByu8RhRwAa3I7BuNO4E/Lof6es=;
  b=T0ALeOwYoRvFvdokSBFBM2y78pb/CWfte5wP6HsXZ7qta6x2cBP3p7uV
   zKCTBJb95ooiG5O7mox7Z3F8K5qEX70dGF1BUMl5aQfvcJnchXHVk1Abp
   hYtY+lK8FAmNEEwV7Mb7amEmWCMUtWdnlj9rnTyXWYaEdUU3Z+tW/338H
   60ebOa+tU6D3+teLKwCzwVpWwboZDPVb826Y7ZMVjnYXyLSg1g07485Hh
   Ldsp860QRVO0pNk9W/tN9MwgOHH/oWSDQuRqBc4PrabnCMGnOfkVnh/2p
   1gCQzgzL+8bYHdZdnzeR/78IpfxeocZlrXecbj23UIWVXX3Bcpt4ZhgkJ
   w==;
X-CSE-ConnectionGUID: xPzZCjPOSxiWr6cR00LO0w==
X-CSE-MsgGUID: D3KBVAxpRtGuiTjhhvs/1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29715515"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="29715515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 01:48:55 -0700
X-CSE-ConnectionGUID: l/IHMjdeQkqcpH44W7EK3Q==
X-CSE-MsgGUID: hqB9xWiYRdybHwI8gUXNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="118619007"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Oct 2024 01:48:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4cTc-000ZRk-08;
	Sat, 26 Oct 2024 08:48:52 +0000
Date: Sat, 26 Oct 2024 16:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 4/10] drivers/virtio/virtio_msg.c:126:16:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202410261647.gb4nV92x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi lei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1ee7d4424b5fb877c9020b7426879470c2d47125
commit: c2e84aeab0977181f136f303781ce111b29e7905 [4/10] virtio: Add support for FFA based channel bus
config: arc-randconfig-r122-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261647.gb4nV92x-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241026/202410261647.gb4nV92x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261647.gb4nV92x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg.c:126:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int offset @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_msg.c:126:16: sparse:     expected unsigned int offset
   drivers/virtio/virtio_msg.c:126:16: sparse:     got restricted __le32 [usertype]
   drivers/virtio/virtio_msg.c:156:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int offset @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_msg.c:156:16: sparse:     expected unsigned int offset
   drivers/virtio/virtio_msg.c:156:16: sparse:     got restricted __le32 [usertype]
>> drivers/virtio/virtio_msg.c:163:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:163:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
   drivers/virtio/virtio_msg.c:163:36: sparse:     expected restricted __le64
   drivers/virtio/virtio_msg.c:163:36: sparse:     got unsigned long long [usertype]
>> drivers/virtio/virtio_msg.c:395:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] size @@     got restricted __le64 [usertype] @@
   drivers/virtio/virtio_msg.c:395:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] size
   drivers/virtio/virtio_msg.c:395:33: sparse:     got restricted __le64 [usertype]

vim +126 drivers/virtio/virtio_msg.c

dcc2b374885a80a Viresh Kumar 2024-08-16  111  
dcc2b374885a80a Viresh Kumar 2024-08-16  112  static void vmsg_get(struct virtio_device *vdev, unsigned int offset,
dcc2b374885a80a Viresh Kumar 2024-08-16  113  		   void *buf, unsigned int len)
dcc2b374885a80a Viresh Kumar 2024-08-16  114  {
dcc2b374885a80a Viresh Kumar 2024-08-16  115  	struct virtio_msg_device *vmdev = to_virtio_msg_device(vdev);
dcc2b374885a80a Viresh Kumar 2024-08-16  116  	struct virtio_msg request, response;
dcc2b374885a80a Viresh Kumar 2024-08-16  117  	u64 data;
dcc2b374885a80a Viresh Kumar 2024-08-16  118  	int ret;
dcc2b374885a80a Viresh Kumar 2024-08-16  119  
dcc2b374885a80a Viresh Kumar 2024-08-16  120  	/* The protocol has reserved only 3 bytes for the offset */
dcc2b374885a80a Viresh Kumar 2024-08-16  121  	BUG_ON(offset > U24_MAX);
dcc2b374885a80a Viresh Kumar 2024-08-16  122  	BUG_ON(len > 8);
dcc2b374885a80a Viresh Kumar 2024-08-16  123  
dcc2b374885a80a Viresh Kumar 2024-08-16  124  	vmsg_prepare(&request, VIRTIO_MSG_GET_CONFIG, vmdev->dev_id);
dcc2b374885a80a Viresh Kumar 2024-08-16  125  
dcc2b374885a80a Viresh Kumar 2024-08-16 @126  	offset = cpu_to_le32(offset);
dcc2b374885a80a Viresh Kumar 2024-08-16  127  	request.get_config.offset[0] = (u8) offset;
dcc2b374885a80a Viresh Kumar 2024-08-16  128  	request.get_config.offset[1] = (u8) (offset >> 8);
dcc2b374885a80a Viresh Kumar 2024-08-16  129  	request.get_config.offset[2] = (u8) (offset >> 16);
dcc2b374885a80a Viresh Kumar 2024-08-16  130  	request.get_config.size = (u8) len;
dcc2b374885a80a Viresh Kumar 2024-08-16  131  
dcc2b374885a80a Viresh Kumar 2024-08-16  132  	ret = vmdev->ops->send(vmdev, &request, &response);
dcc2b374885a80a Viresh Kumar 2024-08-16  133  	if (ret < 0) {
dcc2b374885a80a Viresh Kumar 2024-08-16  134  		pr_err("%s: Failed to send request (%d)\n", __func__, ret);
dcc2b374885a80a Viresh Kumar 2024-08-16  135  		return;
dcc2b374885a80a Viresh Kumar 2024-08-16  136  	}
dcc2b374885a80a Viresh Kumar 2024-08-16  137  
dcc2b374885a80a Viresh Kumar 2024-08-16  138  	data = le64_to_cpu(response.get_config_resp.data[0]);
dcc2b374885a80a Viresh Kumar 2024-08-16  139  	memcpy(buf, &data, len);
dcc2b374885a80a Viresh Kumar 2024-08-16  140  }
dcc2b374885a80a Viresh Kumar 2024-08-16  141  
dcc2b374885a80a Viresh Kumar 2024-08-16  142  static void vmsg_set(struct virtio_device *vdev, unsigned int offset,
dcc2b374885a80a Viresh Kumar 2024-08-16  143  		   const void *buf, unsigned int len)
dcc2b374885a80a Viresh Kumar 2024-08-16  144  {
dcc2b374885a80a Viresh Kumar 2024-08-16  145  	struct virtio_msg_device *vmdev = to_virtio_msg_device(vdev);
dcc2b374885a80a Viresh Kumar 2024-08-16  146  	struct virtio_msg request;
dcc2b374885a80a Viresh Kumar 2024-08-16  147  	u64 data;
dcc2b374885a80a Viresh Kumar 2024-08-16  148  	int ret;
dcc2b374885a80a Viresh Kumar 2024-08-16  149  
dcc2b374885a80a Viresh Kumar 2024-08-16  150  	/* The protocol has reserved only 3 bytes for the offset */
dcc2b374885a80a Viresh Kumar 2024-08-16  151  	BUG_ON(offset > U24_MAX);
dcc2b374885a80a Viresh Kumar 2024-08-16  152  	BUG_ON(len > 8);
dcc2b374885a80a Viresh Kumar 2024-08-16  153  
dcc2b374885a80a Viresh Kumar 2024-08-16  154  	vmsg_prepare(&request, VIRTIO_MSG_SET_CONFIG, vmdev->dev_id);
dcc2b374885a80a Viresh Kumar 2024-08-16  155  
dcc2b374885a80a Viresh Kumar 2024-08-16  156  	offset = cpu_to_le32(offset);
dcc2b374885a80a Viresh Kumar 2024-08-16  157  	request.set_config.offset[0] = (u8) offset;
dcc2b374885a80a Viresh Kumar 2024-08-16  158  	request.set_config.offset[1] = (u8) (offset >> 8);
dcc2b374885a80a Viresh Kumar 2024-08-16  159  	request.set_config.offset[2] = (u8) (offset >> 16);
dcc2b374885a80a Viresh Kumar 2024-08-16  160  	request.set_config.size = (u8) len;
dcc2b374885a80a Viresh Kumar 2024-08-16  161  
dcc2b374885a80a Viresh Kumar 2024-08-16  162  	memcpy(&data, buf, len);
dcc2b374885a80a Viresh Kumar 2024-08-16 @163  	request.set_config.data[0] = le64_to_cpu(data);
dcc2b374885a80a Viresh Kumar 2024-08-16  164  
dcc2b374885a80a Viresh Kumar 2024-08-16  165  	ret = vmdev->ops->send(vmdev, &request, NULL);
dcc2b374885a80a Viresh Kumar 2024-08-16  166  	if (ret < 0) {
dcc2b374885a80a Viresh Kumar 2024-08-16  167  		pr_err("%s: Failed to send request (%d)\n", __func__, ret);
dcc2b374885a80a Viresh Kumar 2024-08-16  168  		return;
dcc2b374885a80a Viresh Kumar 2024-08-16  169  	}
dcc2b374885a80a Viresh Kumar 2024-08-16  170  }
dcc2b374885a80a Viresh Kumar 2024-08-16  171  

:::::: The code at line 126 was first introduced by commit
:::::: dcc2b374885a80adf94cda0ab38731b1c92c2722 virtio: Add support for virtio-msg transport

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
