Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C81FA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676271612; x=1707807612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TicRqcq6yFIObXDi3ZMSSjye+jt3GaEvIzd9eLdHX0c=;
  b=aFEmlCwnjVU80fAuTSMe3ntEQBTeRKV/tpqnV57nmvacKk4Ve4XMpObK
   vPPX1eWH4dukfZMRzQb40IMmW0glf/rmeDXP8TbPkdflFfJeO+YWbgyIB
   4aMh8spekGiQfkPElYMBdABV/pIT/ml+uYitJ7HfpOiFoMVM3oWb9fvJv
   LbFv/SBmUgJl2awxpAQoE4ya1niiR6lBCIgCgngkTJGB8PM4MAE7xA6/t
   53At1J5ER6x7wNwc7WJPEPPpxyG/Q9BR/FAmmCLO8+LBes37zVQPUY6T4
   6PR/2x7FLAy1RPFA/ElAUiRyOLNyV5vKCRuxMmrUCWzOrJuiMLWeR6fDw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="358234197"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="358234197"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 23:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670709393"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="670709393"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Feb 2023 23:00:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRSos-0007bZ-0U;
	Mon, 13 Feb 2023 07:00:10 +0000
Date: Mon, 13 Feb 2023 15:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Gerd Hoffmann <kraxel@redhat.com>
Subject: [kraxel:drm-qemu-next 6/7]
 drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse: sparse: incorrect type
 in argument 3 (different base types)
Message-ID: <202302131424.wBEsydUG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kraxel.org/linux drm-qemu-next
head:   678d45faf3684f4ec694cc19b70db7f2a0c9c841
commit: 347d001a65ba84c02ebd403000bf4e524cf678e6 [6/7] drm/virtio: Attach and set suggested_x/y properties for the connector
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230213/202302131424.wBEsydUG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add kraxel git://git.kraxel.org/linux
        git fetch --no-tags kraxel drm-qemu-next
        git checkout 347d001a65ba84c02ebd403000bf4e524cf678e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302131424.wBEsydUG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le32 [usertype] x @@
   drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse:     expected unsigned long long [usertype] val
   drivers/gpu/drm/virtio/virtgpu_vq.c:654:70: sparse:     got restricted __le32 [usertype] x
>> drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le32 [usertype] y @@
   drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse:     expected unsigned long long [usertype] val
   drivers/gpu/drm/virtio/virtgpu_vq.c:656:70: sparse:     got restricted __le32 [usertype] y

vim +654 drivers/gpu/drm/virtio/virtgpu_vq.c

   647	
   648	static void virtio_gpu_update_output_position(struct virtio_gpu_output *output)
   649	{
   650		struct drm_connector *connector = &output->conn;
   651		struct drm_device *dev = connector->dev;
   652	
   653		drm_object_property_set_value(&connector->base,
 > 654			dev->mode_config.suggested_x_property, output->info.r.x);
   655		drm_object_property_set_value(&connector->base,
 > 656			dev->mode_config.suggested_y_property, output->info.r.y);
   657	}
   658	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
