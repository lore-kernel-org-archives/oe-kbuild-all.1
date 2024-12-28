Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32764C98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735347250; cv=none; b=VmwrD91RgDaKbCpGlrCofLPrItt65TvmtyUQ4WHUWBluFBZ0yXmKmhQ1D0JvF/NvKd/keREkMOzfzwwoB2ddIyJ+wdRqMtjLytqmLySWlTr+sJT6HBCGeBdjaJ906dbh0oP3VafQ8lZjwAi0U/aMB5UEgKP/nXU64Api+3O5Y9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735347250; c=relaxed/simple;
	bh=Zgble0R/A6qktRSywihZP+OydzHJzW7Hua5aTw5tcto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TROqcIdRwLLTrmy3UTj+66FWf5qwpGUE9HYw6oFqO1UlFbuuNwM8q6gcEmuvM6XdHtT12H1mAIRiRRvWey1HXhJ6fk1wXKUZTXBvokp9AhB4ONoAqMZfhUf7usfc8AJB7a0QEeY8CWYWjAL/c9Z1iigpUa24upq3++KQC7clqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpZ3rlWh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpZ3rlWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735347249; x=1766883249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zgble0R/A6qktRSywihZP+OydzHJzW7Hua5aTw5tcto=;
  b=ZpZ3rlWhbsGTlnbCoqtWCHEkQO7MriqzDYlejHUdKU1OcGQqhQ8Y1yo/
   91jKF7EewOYlUKa4l7iJw+MDvfo8J4pJEMJcpIZ+M1V2D2pEyDseo+slY
   IB6mDbvbKYej6u2i+AbcI6HslisI6YZdZDgMibUDQ0DqNGILYZVrp7+sn
   hp54bqz2SRfdh+ewdx5v+khV1o0/HBBV/kx9JcgKfDQFzCxziL0EVIpN3
   2x9I1HkSg+ljbrsXG3/0ABt/muqZA6RfPzSuql8VWeb/kYj69qRYyjpKk
   Ha5XDPJpHuxWQbDBaUHz4k36HWotK66BkKFWu0ML9dLkFdNhAi2gaj+XR
   A==;
X-CSE-ConnectionGUID: ESYq4SHZT4a8PwS5r5e59A==
X-CSE-MsgGUID: q34iS9EkQ9ucRjMMdDx4tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53139002"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="53139002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 16:54:08 -0800
X-CSE-ConnectionGUID: tg/AmqVATJ67N7A04w1u7A==
X-CSE-MsgGUID: Xh+wgKo7SiWHLRJ+qiDfrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="100457482"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2024 16:54:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRL5h-0003li-0V;
	Sat, 28 Dec 2024 00:54:05 +0000
Date: Sat, 28 Dec 2024 08:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2601/2601] drivers/vdpa/vdpa.c:759:19: sparse:
 sparse: cast to restricted __le16
Message-ID: <202412280838.dtwJgjlH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 661b972e802c8e252911361538651db906c084bb [2601/2601] vdpa: Introduce query of device config layout
config: x86_64-randconfig-121-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280838.dtwJgjlH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280838.dtwJgjlH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280838.dtwJgjlH-lkp@intel.com/

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
