Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94551200AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683909656; x=1715445656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJPVmTdRe4u56JmuEI8g5qgJZK5eGcMCwwuUoq3b64k=;
  b=hnxB0Tw1D7AIZpKGC3Ull4LVmStT6ZHPB7VPKxNeZ6VJLBq4BBXcuJcj
   79iMYzDzgh1oqk/CruVRJSX9Mqro8Sc6RHTluDPawi9bWUSCdCegsrVCv
   rYHy//HpX56MFqms3InfcVYCqwT7YYWxqfn1N8eYT6jjL2+8yFM9NL7rl
   rdRkORyuDVdtIN5QGZ4tutrTcg2cbdF9e+Fe4UYbD9x8Y96P8uwfiWM43
   3FewC8mHpKrjXzqwdqqfWKBgr0hWyDGO0CW2T1FBRyMpzwd8gTox27+V1
   EgXTc+2RVN0Pw37o8CurigYBnGBkk0PXln9FcRkpvUChnnnK1xKlz2OGQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="353965519"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353965519"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 09:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="824416404"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824416404"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2023 09:40:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxVp4-0004yS-3B;
	Fri, 12 May 2023 16:40:50 +0000
Date: Sat, 13 May 2023 00:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: zhenwei pi <pizhenwei@bytedance.com>, stefanha@redhat.com,
	mst@redhat.com, jasowang@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, xuanzhuo@linux.alibaba.com,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH 1/2] virtio: abstract virtqueue related methods
Message-ID: <202305130012.LQ2KTO5C-lkp@intel.com>
References: <20230512094618.433707-2-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512094618.433707-2-pizhenwei@bytedance.com>

Hi zhenwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on linus/master v6.4-rc1 next-20230512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhenwei-pi/virtio-abstract-virtqueue-related-methods/20230512-174928
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20230512094618.433707-2-pizhenwei%40bytedance.com
patch subject: [PATCH 1/2] virtio: abstract virtqueue related methods
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230513/202305130012.LQ2KTO5C-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/372bc1a0371968752fe0f5ec6e81edee6f9c44dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhenwei-pi/virtio-abstract-virtqueue-related-methods/20230512-174928
        git checkout 372bc1a0371968752fe0f5ec6e81edee6f9c44dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130012.LQ2KTO5C-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio.c: In function 'virtio_break_device':
>> drivers/virtio/virtio.c:893:24: error: 'struct virtqueue_ops' has no member named '__builtin_loongarch_break'
     893 |                 vq->ops->__break(vq);
         |                        ^~


vim +893 drivers/virtio/virtio.c

   882	
   883	/*
   884	 * This should prevent the device from being used, allowing drivers to
   885	 * recover.  You may need to grab appropriate locks to flush.
   886	 */
   887	void virtio_break_device(struct virtio_device *dev)
   888	{
   889		struct virtqueue *vq;
   890	
   891		spin_lock(&dev->vqs_list_lock);
   892		list_for_each_entry(vq, &dev->vqs, list) {
 > 893			vq->ops->__break(vq);
   894		}
   895		spin_unlock(&dev->vqs_list_lock);
   896	}
   897	EXPORT_SYMBOL_GPL(virtio_break_device);
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
