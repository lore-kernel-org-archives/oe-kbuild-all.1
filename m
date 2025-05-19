Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65051EE032
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 18:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678199; cv=none; b=f/VdzjGaPtY6gZKmTsua2mC6xpZ3CCPuqdG0yAo/6uDxx+5iKnD7wbs/MQ1Vmgkap7d0xkbm6ZGorbomRBQTMNhY+LLRWLmktpfAz0WbKfWFwQcrsN4ThZ8Y7dIWCc9xUpa9qAo+qboxIdKBaChpp25FFu1FqNHmX7H8IvWcgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678199; c=relaxed/simple;
	bh=Ujm3qC0orBzqYk5UGsJndf74AenQ037h15KGkkJwDGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5xnW9KwMMTxTj54CbFEhUbD62W6KpTAPMYZ8OgL9ekypzEbaJxj0vd6giQKDZD7aPhY5Dve4+hGqpsrIjfN4HYgti+iVeHU/zwF65xAy2SQlhSCWPipNgd4pKp9oTEANKhNoTzQPS79ux4LELo1GH9cG6DMIPrTQvE25UqKeKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPUgYP57; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPUgYP57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747678198; x=1779214198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ujm3qC0orBzqYk5UGsJndf74AenQ037h15KGkkJwDGg=;
  b=MPUgYP57FX+NhVkguIAL6X5HW1twSE0Bx0U2IUpXBxkZnRjVmP1PA4CC
   duRxrpoSDzBpvncjmmAnW3z2eNXyZeI36BM9ooxHnbYUng1bIA6bP/cx/
   gccj0hygeWcpzevG1UnXxQ1otcvtUcSIDz20Tz1XBsd8YLB1cwup3fDSB
   k/tK9CF/JxDG081YpIG6CG42xmTunAFq/TMrHRlnq7Ck0Y1TLhldKR6Dp
   nPWRMEMceJxp0WHHFdVG6pEKtFLY1bByGdh+NlfCtsPm231ueVvAw9Akn
   2Z+wT2lRyRk779DUOVuXbnK0sO5+3Odlz1kFfNp6nKhrYsoyy5B7gCrJm
   g==;
X-CSE-ConnectionGUID: dy1WeH25SG26jNUuCN1nGA==
X-CSE-MsgGUID: v9VZ/iKKQHC2Wo5IXaCA5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49727481"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49727481"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:09:57 -0700
X-CSE-ConnectionGUID: tiLWmR9IROypzZN0IeVY/w==
X-CSE-MsgGUID: QUqYULJsRK+M1Mr/7+CgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="143444590"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2025 11:09:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH4vv-000Lko-1i;
	Mon, 19 May 2025 18:09:51 +0000
Date: Tue, 20 May 2025 02:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Wang <jasowang@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [mst-vhost:vhost 35/35] drivers/virtio/virtio_ring.c:1281:22:
 sparse: sparse: symbol 'split_in_order_ops' was not declared. Should it be
 static?
Message-ID: <202505200227.usDCH63W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   f640220b1e149add1dff0be2978905c5df628eaf
commit: f640220b1e149add1dff0be2978905c5df628eaf [35/35] virtio_ring: add in order support
config: arc-randconfig-r132-20250519 (https://download.01.org/0day-ci/archive/20250520/202505200227.usDCH63W-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505200227.usDCH63W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200227.usDCH63W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virtio/virtio_ring.c:1281:22: sparse: sparse: symbol 'split_in_order_ops' was not declared. Should it be static?
   drivers/virtio/virtio_ring.c:2510:22: sparse: sparse: symbol 'packed_ops' was not declared. Should it be static?
>> drivers/virtio/virtio_ring.c:2511:22: sparse: sparse: symbol 'packed_in_order_ops' was not declared. Should it be static?

vim +/split_in_order_ops +1281 drivers/virtio/virtio_ring.c

  1279	
> 1280	struct virtqueue_ops split_ops;
> 1281	struct virtqueue_ops split_in_order_ops;
  1282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
