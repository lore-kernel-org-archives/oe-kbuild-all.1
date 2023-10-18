Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCAC1EB32
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 19:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8Fj02+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697658788; x=1729194788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vVcTcLcqzSvvPpWvdFGa7bhaSwzPNStbb7uaXtpeqCI=;
  b=e8Fj02+xziZOtf6xIsGIW9FJJxphVpq+zJ/3+bwqlrTtIWwcO8Joc9sv
   /IirkLcqHx14MniBeIm9ZKe0n2c2LnzY+LHCYUIgkbswDwYFn0ernnL8v
   LiNSPtf3Pvj1HSyas0NlOz+ajmxat+sAMTJJvHgbvcf8rg1uBovCgKcIO
   NC1QOgms9X365+kzxJTcr7J53LVmH0K1pJjpjlR/Gf+ft5Apl16U7DLnP
   XTt9rqtauJUsekibCU/QYeJKdp0+8is52+uRdgNbctucWzDZdwEmGa14w
   zjVsP4pw1mkSeAha9Tamuxv2WSLHrGaNPoRcsSEi6NUcq83pcX6QGVuVp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452569153"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="452569153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 12:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003924988"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="1003924988"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 12:52:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtCaX-0000wa-1O;
	Wed, 18 Oct 2023 19:52:17 +0000
Date: Thu, 19 Oct 2023 03:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [mst-vhost:vhost 18/35] drivers/virtio/virtio_pci_modern.c:54:17:
 warning: format '%ld' expects argument of type 'long int', but argument 3
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202310190338.ES0nNnf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   185ec99c107fe7659a9d809bc7a8e7ab3c338bf9
commit: 37c82be3988d4cc710dee436d47cd80e792cab93 [18/35] virtio_pci: add check for common cfg size
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190338.ES0nNnf4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190338.ES0nNnf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190338.ES0nNnf4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/pci.h:37,
                    from drivers/virtio/virtio_pci_common.h:21,
                    from drivers/virtio/virtio_pci_modern.c:20:
   drivers/virtio/virtio_pci_modern.c: In function '__vp_check_common_size_one_feature':
>> drivers/virtio/virtio_pci_modern.c:54:17: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      54 |                 "virtio: common cfg size(%ld) does not match the feature %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/virtio/virtio_pci_modern.c:53:9: note: in expansion of macro 'dev_err'
      53 |         dev_err(&vdev->dev,
         |         ^~~~~~~
   drivers/virtio/virtio_pci_modern.c:54:44: note: format string is defined here
      54 |                 "virtio: common cfg size(%ld) does not match the feature %s\n",
         |                                          ~~^
         |                                            |
         |                                            long int
         |                                          %d


vim +54 drivers/virtio/virtio_pci_modern.c

  > 20	#include "virtio_pci_common.h"
    21	
    22	static u64 vp_get_features(struct virtio_device *vdev)
    23	{
    24		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    25	
    26		return vp_modern_get_features(&vp_dev->mdev);
    27	}
    28	
    29	static void vp_transport_features(struct virtio_device *vdev, u64 features)
    30	{
    31		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    32		struct pci_dev *pci_dev = vp_dev->pci_dev;
    33	
    34		if ((features & BIT_ULL(VIRTIO_F_SR_IOV)) &&
    35				pci_find_ext_capability(pci_dev, PCI_EXT_CAP_ID_SRIOV))
    36			__virtio_set_bit(vdev, VIRTIO_F_SR_IOV);
    37	
    38		if (features & BIT_ULL(VIRTIO_F_RING_RESET))
    39			__virtio_set_bit(vdev, VIRTIO_F_RING_RESET);
    40	}
    41	
    42	static int __vp_check_common_size_one_feature(struct virtio_device *vdev, u32 fbit,
    43						    u32 offset, const char *fname)
    44	{
    45		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
    46	
    47		if (!__virtio_test_bit(vdev, fbit))
    48			return 0;
    49	
    50		if (likely(vp_dev->mdev.common_len >= offset))
    51			return 0;
    52	
    53		dev_err(&vdev->dev,
  > 54			"virtio: common cfg size(%ld) does not match the feature %s\n",
    55			vp_dev->mdev.common_len, fname);
    56	
    57		return -EINVAL;
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
