Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A663F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695551627; x=1727087627;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jtdyJVmAGkdzBCdUD/pBHYqX4wo4oFsCNucLjOmMyMA=;
  b=H9WSrk+pWhoF4ceq/otjQ5HVBOKCqjKHAXk357IDLYAf3Nz5ttvIg3+L
   KOgvsREnmJaKd7MhHIzlnjROkMnt+RO0UpxsD4CPo8Dcjky7buVUNajOs
   9IXC0ZNPePx8rFjQIUHx++6Y+7Mo7lnwQ0yXBt0C7BwnAiGPNqBaKF5ps
   2TdLdJ32QV3htDSel467JJ1F/K92/OdYLJDAWZdY/HYnQmsMUfClIGoX5
   xf9WWw8eb2r7kPkFho5hKyNHPxxfrizuV2aQjTkjCFmJCbkQWhWPkFd3G
   FLWSvCijKyKL2CIpCkKCHFVR9qtEVDik7kezGLMNHWdGd+JtKipG9BeS7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="378360271"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="378360271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 03:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777362802"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="777362802"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 03:33:44 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkMQo-0003Ub-2r
	for oe-kbuild-all@lists.linux.dev;
	Sun, 24 Sep 2023 10:33:42 +0000
Date: Sun, 24 Sep 2023 18:33:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1155/6555]
 drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrs
 sstatus,a1', extension `zicsr' required
Message-ID: <202309241839.RC5PYxwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: dfdec43d0411076dc70591a0496a0824a8620695 [1155/6555] UPSTREAM: drm: extract drm_atomic_uapi.c
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230924/202309241839.RC5PYxwZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241839.RC5PYxwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241839.RC5PYxwZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1193:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1193 |         struct drm_crtc *crtc;
         |                          ^~~~
   drivers/gpu/drm/drm_atomic_uapi.c: Assembler messages:
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1052: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrs sstatus,s5', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1230: Error: unrecognized opcode `csrc sstatus,s5', extension `zicsr' required
>> drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
>> drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:466: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1297: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1314: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1327: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required


vim +366 drivers/gpu/drm/drm_atomic_uapi.c

   356	
   357	static int set_out_fence_for_connector(struct drm_atomic_state *state,
   358						struct drm_connector *connector,
   359						s32 __user *fence_ptr)
   360	{
   361		unsigned int index = drm_connector_index(connector);
   362	
   363		if (!fence_ptr)
   364			return 0;
   365	
 > 366		if (put_user(-1, fence_ptr))
   367			return -EFAULT;
   368	
   369		state->connectors[index].out_fence_ptr = fence_ptr;
   370	
   371		return 0;
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
