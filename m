Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D76154BF0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928394; cv=none; b=WbGe7sv85PlrSCQoM4/ERVGaPf+OWwvASBPxwN34+V/ICiRE/1HSK0WElHucigwmjyZxzMjQlmjBX5jTIaVn849RupS4NZmIO1MnG8uOWiE3C0xvDEsraHfVKUA9pPwpVlfmLTnQVm8dx8V4+sH/Q+BI1nzfLg8R/cg4dWYX+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928394; c=relaxed/simple;
	bh=iAmF7LRn/znF/W+7oBAUvZSu9cW+lhp3uMOTsb1j6Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXvtbYoCuyT9gGUKTrcdPRyZByUlRWGeMEYoUwIF1gXa9Dr6J+zf6ksnpaHjINZHEPa1CCGv/Uweyg+JGYjSHQ6zhK6xfFVQPiKk2Jsa9PEWMEE9Q2JA39HrnHhtyC4LndOq1G/U4b2zkj/YIKYHv1wBJucVg5CQgM3hnBHXTug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvwCcw0f; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvwCcw0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735928392; x=1767464392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iAmF7LRn/znF/W+7oBAUvZSu9cW+lhp3uMOTsb1j6Hg=;
  b=SvwCcw0fY7aygdkdBvmmpIWev2+tdnx8HNXPFkrkcwRq3UX+gf0zI6Im
   +WaA9IxjpJhyGzcZVSkwj9mLI4J6mjui59jZwkBbL04tpTCBXsi6e8daq
   WSge0H8byc107AAOJ4ru2gTj7RgadGoDEpy+M/FAWENpuZHN4K3O+q5MB
   JjGeHCihZ9aLLc3lKOmOzHOkdSaKW2MoM5oFVAwUHGFbwu9sc8ATP34M8
   B0fYq06sVSKKftFPpK4bcmbGnqPivqV/wCd3e9XLJDtt/lxsukjLShoQC
   N1sD6+Ubt0KolijCJ9O9T5Ax77QhRH9UScfGc7mBvpGnRSn26pbTHT0kk
   w==;
X-CSE-ConnectionGUID: EPM8qSeISbmVv6KptE7KwQ==
X-CSE-MsgGUID: Ktu8tjprSEeBot10f+im8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36194236"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36194236"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 10:19:52 -0800
X-CSE-ConnectionGUID: e/qLMOckTLq4ixDwbSOGhQ==
X-CSE-MsgGUID: mbylgPlCQIuvqWjZbMQbcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101715387"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jan 2025 10:19:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTmGz-000A9d-0Z;
	Fri, 03 Jan 2025 18:19:49 +0000
Date: Sat, 4 Jan 2025 02:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2601/2601] drivers/vdpa/vdpa.c:759:19: sparse:
 sparse: cast to restricted __le16
Message-ID: <202501040206.QD8GJyq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: 661b972e802c8e252911361538651db906c084bb [2601/2601] vdpa: Introduce query of device config layout
config: x86_64-randconfig-121-20241228 (https://download.01.org/0day-ci/archive/20250104/202501040206.QD8GJyq4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040206.QD8GJyq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040206.QD8GJyq4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/vdpa.c:759:19: sparse: sparse: cast to restricted __le16
>> drivers/vdpa/vdpa.c:759:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:775:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:775:19: sparse: sparse: cast from restricted __virtio16
   drivers/vdpa/vdpa.c:779:19: sparse: sparse: cast to restricted __le16
   drivers/vdpa/vdpa.c:779:19: sparse: sparse: cast from restricted __virtio16

vim +759 drivers/vdpa/vdpa.c

   749	
   750	static int vdpa_dev_net_mq_config_fill(struct vdpa_device *vdev,
   751					       struct sk_buff *msg, u64 features,
   752					       const struct virtio_net_config *config)
   753	{
   754		u16 val_u16;
   755	
   756		if ((features & (1ULL << VIRTIO_NET_F_MQ)) == 0)
   757			return 0;
   758	
 > 759		val_u16 = le16_to_cpu(config->max_virtqueue_pairs);
   760		return nla_put_u16(msg, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, val_u16);
   761	}
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
