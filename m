Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D0202F7C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741302309; cv=none; b=ih0txaDeyUhmbgFbU1+kAMlKY2i9qNJ3ecfvfbZ1UqD4otaOLUOiyJCQ3vtjRHEzsCIvVYOP5H4rUGnSBpLSQLPL0+UoFF8AX3g1Nr74D/1zNCuJzJf3/PlbyDboz5Ih0a7AYnLZ2ENbM5EDH9cNGUCO2PAQ8k7BuWNRz2v1YG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741302309; c=relaxed/simple;
	bh=S5UNLZEHySgW6nQcztdgKqNE59E7FDwitccLhO2bchA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nay5RXRWHQRdUT5aE579zwWxvtN/cKD+jndoTBxhQ68JTWgYOe/sNuR357MiB/njMi1DKV0GM2L6CSUYdh5TKi2ZiFjYvxjX0DY3ytxMepoc/k3/FAvSd7XZHGDRSKg4XnSf2DmNUisK8+eiSdvNoo9F7E1iS0tp4ahpQTYTQqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EITIKa5Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EITIKa5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741302308; x=1772838308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5UNLZEHySgW6nQcztdgKqNE59E7FDwitccLhO2bchA=;
  b=EITIKa5ZwsufDdhYlnfPQ8hSR4v/GsgU/TY0xhumg6gL+c8dGZqYhZIh
   ImfOAoN5YiRnvyyBtQna2kQHHEsWb9v+cbOPEuv3egA769k1frL1O+ooq
   8b8ypErENe300xM8OQXxBfMxB/qVUMV9UzIadb6LKFn2WI2xaLOB3pFOJ
   A4jDAnIYsTf/ya4u1uhtiag7W8wbO6dtMQoubiK46Wi+22snHH5EbqSx3
   vv/0gpcPBU7QMrtvzPXDmpBmFtuARF9RN6WYhQzw2ouV0vRx3lmsP4xC+
   JTMy/HbJXJkM3nLFb1wjwoaYTN+PZK31CFDNxSbWY28O9Ya+cICKPyQF6
   Q==;
X-CSE-ConnectionGUID: JH7vZQ+qT2CEpW3fBNu9XQ==
X-CSE-MsgGUID: caTEm5BgSumHRf70vdD8Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42194216"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="42194216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 15:05:07 -0800
X-CSE-ConnectionGUID: R7bQaTunTtaYYQv40/EUqQ==
X-CSE-MsgGUID: 0q3HhJLOSRmVQtd89HJjIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123350750"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Mar 2025 15:05:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqKGz-000Njq-1x;
	Thu, 06 Mar 2025 23:05:01 +0000
Date: Fri, 7 Mar 2025 07:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 7/21] drivers/virtio/virtio_msg.c:133:16:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202503070647.Erk5xgdt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   c730e1395f647d9d1fa33df71071563ab13c599d
commit: b028d6dbfc26a5381a3ebb56883b0b00f1f34ffd [7/21] virtio-msg: Add support for FFA based channel bus
config: arm64-randconfig-r122-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070647.Erk5xgdt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503070647.Erk5xgdt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070647.Erk5xgdt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_msg.c:133:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int offset @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_msg.c:133:16: sparse:     expected unsigned int offset
   drivers/virtio/virtio_msg.c:133:16: sparse:     got restricted __le32 [usertype]
   drivers/virtio/virtio_msg.c:163:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int offset @@     got restricted __le32 [usertype] @@
   drivers/virtio/virtio_msg.c:163:16: sparse:     expected unsigned int offset
   drivers/virtio/virtio_msg.c:163:16: sparse:     got restricted __le32 [usertype]
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:38: sparse: sparse: cast to restricted __le64
>> drivers/virtio/virtio_msg.c:170:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
   drivers/virtio/virtio_msg.c:170:36: sparse:     expected restricted __le64
   drivers/virtio/virtio_msg.c:170:36: sparse:     got unsigned long long [usertype]
>> drivers/virtio/virtio_msg.c:402:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] size @@     got restricted __le64 [usertype] @@
   drivers/virtio/virtio_msg.c:402:33: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] size
   drivers/virtio/virtio_msg.c:402:33: sparse:     got restricted __le64 [usertype]

vim +133 drivers/virtio/virtio_msg.c

c63fffe5f7af1f Viresh Kumar 2024-08-16  118  
c63fffe5f7af1f Viresh Kumar 2024-08-16  119  static void vmsg_get(struct virtio_device *vdev, unsigned int offset,
c63fffe5f7af1f Viresh Kumar 2024-08-16  120  		   void *buf, unsigned int len)
c63fffe5f7af1f Viresh Kumar 2024-08-16  121  {
c63fffe5f7af1f Viresh Kumar 2024-08-16  122  	struct virtio_msg_device *vmdev = to_virtio_msg_device(vdev);
c63fffe5f7af1f Viresh Kumar 2024-08-16  123  	struct virtio_msg request, response;
c63fffe5f7af1f Viresh Kumar 2024-08-16  124  	u64 data;
c63fffe5f7af1f Viresh Kumar 2024-08-16  125  	int ret;
c63fffe5f7af1f Viresh Kumar 2024-08-16  126  
c63fffe5f7af1f Viresh Kumar 2024-08-16  127  	/* The protocol has reserved only 3 bytes for the offset */
c63fffe5f7af1f Viresh Kumar 2024-08-16  128  	BUG_ON(offset > U24_MAX);
c63fffe5f7af1f Viresh Kumar 2024-08-16  129  	BUG_ON(len > 8);
c63fffe5f7af1f Viresh Kumar 2024-08-16  130  
c63fffe5f7af1f Viresh Kumar 2024-08-16  131  	vmsg_prepare(&request, VIRTIO_MSG_GET_CONFIG, vmdev->dev_id);
c63fffe5f7af1f Viresh Kumar 2024-08-16  132  
c63fffe5f7af1f Viresh Kumar 2024-08-16 @133  	offset = cpu_to_le32(offset);
c63fffe5f7af1f Viresh Kumar 2024-08-16  134  	request.get_config.offset[0] = (u8) offset;
c63fffe5f7af1f Viresh Kumar 2024-08-16  135  	request.get_config.offset[1] = (u8) (offset >> 8);
c63fffe5f7af1f Viresh Kumar 2024-08-16  136  	request.get_config.offset[2] = (u8) (offset >> 16);
c63fffe5f7af1f Viresh Kumar 2024-08-16  137  	request.get_config.size = (u8) len;
c63fffe5f7af1f Viresh Kumar 2024-08-16  138  
c63fffe5f7af1f Viresh Kumar 2024-08-16  139  	ret = vmsg_send(vmdev, &request, &response);
c63fffe5f7af1f Viresh Kumar 2024-08-16  140  	if (ret < 0) {
c63fffe5f7af1f Viresh Kumar 2024-08-16  141  		dev_err(&vdev->dev, "%s: Failed to send request (%d)\n", __func__, ret);
c63fffe5f7af1f Viresh Kumar 2024-08-16  142  		return;
c63fffe5f7af1f Viresh Kumar 2024-08-16  143  	}
c63fffe5f7af1f Viresh Kumar 2024-08-16  144  
c63fffe5f7af1f Viresh Kumar 2024-08-16  145  	data = le64_to_cpu(response.get_config_resp.data[0]);
c63fffe5f7af1f Viresh Kumar 2024-08-16  146  	memcpy(buf, &data, len);
c63fffe5f7af1f Viresh Kumar 2024-08-16  147  }
c63fffe5f7af1f Viresh Kumar 2024-08-16  148  
c63fffe5f7af1f Viresh Kumar 2024-08-16  149  static void vmsg_set(struct virtio_device *vdev, unsigned int offset,
c63fffe5f7af1f Viresh Kumar 2024-08-16  150  		   const void *buf, unsigned int len)
c63fffe5f7af1f Viresh Kumar 2024-08-16  151  {
c63fffe5f7af1f Viresh Kumar 2024-08-16  152  	struct virtio_msg_device *vmdev = to_virtio_msg_device(vdev);
c63fffe5f7af1f Viresh Kumar 2024-08-16  153  	struct virtio_msg request;
c63fffe5f7af1f Viresh Kumar 2024-08-16  154  	u64 data;
c63fffe5f7af1f Viresh Kumar 2024-08-16  155  	int ret;
c63fffe5f7af1f Viresh Kumar 2024-08-16  156  
c63fffe5f7af1f Viresh Kumar 2024-08-16  157  	/* The protocol has reserved only 3 bytes for the offset */
c63fffe5f7af1f Viresh Kumar 2024-08-16  158  	BUG_ON(offset > U24_MAX);
c63fffe5f7af1f Viresh Kumar 2024-08-16  159  	BUG_ON(len > 8);
c63fffe5f7af1f Viresh Kumar 2024-08-16  160  
c63fffe5f7af1f Viresh Kumar 2024-08-16  161  	vmsg_prepare(&request, VIRTIO_MSG_SET_CONFIG, vmdev->dev_id);
c63fffe5f7af1f Viresh Kumar 2024-08-16  162  
c63fffe5f7af1f Viresh Kumar 2024-08-16  163  	offset = cpu_to_le32(offset);
c63fffe5f7af1f Viresh Kumar 2024-08-16  164  	request.set_config.offset[0] = (u8) offset;
c63fffe5f7af1f Viresh Kumar 2024-08-16  165  	request.set_config.offset[1] = (u8) (offset >> 8);
c63fffe5f7af1f Viresh Kumar 2024-08-16  166  	request.set_config.offset[2] = (u8) (offset >> 16);
c63fffe5f7af1f Viresh Kumar 2024-08-16  167  	request.set_config.size = (u8) len;
c63fffe5f7af1f Viresh Kumar 2024-08-16  168  
c63fffe5f7af1f Viresh Kumar 2024-08-16  169  	memcpy(&data, buf, len);
c63fffe5f7af1f Viresh Kumar 2024-08-16 @170  	request.set_config.data[0] = le64_to_cpu(data);
c63fffe5f7af1f Viresh Kumar 2024-08-16  171  
c63fffe5f7af1f Viresh Kumar 2024-08-16  172  	ret = vmsg_send(vmdev, &request, NULL);
c63fffe5f7af1f Viresh Kumar 2024-08-16  173  	if (ret < 0) {
c63fffe5f7af1f Viresh Kumar 2024-08-16  174  		dev_err(&vdev->dev, "%s: Failed to send request (%d)\n", __func__, ret);
c63fffe5f7af1f Viresh Kumar 2024-08-16  175  		return;
c63fffe5f7af1f Viresh Kumar 2024-08-16  176  	}
c63fffe5f7af1f Viresh Kumar 2024-08-16  177  }
c63fffe5f7af1f Viresh Kumar 2024-08-16  178  

:::::: The code at line 133 was first introduced by commit
:::::: c63fffe5f7af1ffd76c236179eb324d3222fada3 virtio: Add support for virtio-msg transport

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
