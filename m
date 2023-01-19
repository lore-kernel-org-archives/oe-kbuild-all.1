Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B6C2F29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674167490; x=1705703490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoJGpj8vaP9dF2CWcRmJfrTrGxAvkWjp3W42IgzKc3E=;
  b=QtmSCsQ5jwwY0xK9IrJHVhTgLRR2GvMXJQ1feiG41EtuxccA/77/FWbV
   1NyWYE5zDNpVeRUMVLJuxt1v99kxkUMQNCS8kLSykbZt/4Dz6ThZijVgC
   dyZYoOAEaUbCXUhd9RkZVbjJi8WqNWqgbDc4+molxalKfIE5LvzpZqAqO
   xpYrJPmzW5KHCn+0ARzh13oYIxFMuDBjiVNv7NU4bQWNJCTaM2mySQ+Nm
   TC/3aIXCMkKQvs2o7dj2ZkWxTOta0rJrx0bOQ27KWKlebotm3KV8so83M
   MJsOiXXBpg0rns2R6Z+wRFPaNAqWKf4TnCFnBVgASAOyvtrn98D5gJAb6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="389965180"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="389965180"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 14:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="768410237"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="768410237"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2023 14:31:26 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIdRN-0001uq-2N;
	Thu, 19 Jan 2023 22:31:25 +0000
Date: Fri, 20 Jan 2023 06:31:05 +0800
From: kernel test robot <lkp@intel.com>
To: Babis Chalios <bchalios@amazon.es>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, amit@kernel.org, graf@amazon.de,
	Jason@zx2c4.com, xmarcalx@amazon.co.uk
Subject: Re: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
Message-ID: <202301200640.CsblwTsa-lkp@intel.com>
References: <20230119184349.74072-3-bchalios@amazon.es>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119184349.74072-3-bchalios@amazon.es>

Hi Babis,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
patch link:    https://lore.kernel.org/r/20230119184349.74072-3-bchalios%40amazon.es
patch subject: [PATCH 2/2] virtio-rng: add sysfs entries for leak detection
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301200640.CsblwTsa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2a801d93b8225555e4cb293a173e2053870cb2d1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Babis-Chalios/virtio-rng-implement-entropy-leak-feature/20230120-024631
        git checkout 2a801d93b8225555e4cb293a173e2053870cb2d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/char/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/virtio-rng.c:61:9: warning: no previous prototype for 'virtrng_sysfs_read' [-Wmissing-prototypes]
      61 | ssize_t virtrng_sysfs_read(struct file *filep, struct kobject *kobj,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/char/hw_random/virtio-rng.c:76:5: warning: no previous prototype for 'virtrng_sysfs_mmap' [-Wmissing-prototypes]
      76 | int virtrng_sysfs_mmap(struct file *filep, struct kobject *kobj,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:106:5: warning: no previous prototype for 'add_fill_on_leak_request' [-Wmissing-prototypes]
     106 | int add_fill_on_leak_request(struct virtrng_info *vi, struct virtqueue *vq, void *data, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:120:5: warning: no previous prototype for 'virtrng_fill_on_leak' [-Wmissing-prototypes]
     120 | int virtrng_fill_on_leak(struct virtrng_info *vi, void *data, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:141:5: warning: no previous prototype for 'add_copy_on_leak_request' [-Wmissing-prototypes]
     141 | int add_copy_on_leak_request(struct virtrng_info *vi, struct virtqueue *vq,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/hw_random/virtio-rng.c:160:5: warning: no previous prototype for 'virtrng_copy_on_leak' [-Wmissing-prototypes]
     160 | int virtrng_copy_on_leak(struct virtrng_info *vi, void *to, void *from, size_t len)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/virtrng_sysfs_read +61 drivers/char/hw_random/virtio-rng.c

    59	
    60	#ifdef CONFIG_SYSFS
  > 61	ssize_t virtrng_sysfs_read(struct file *filep, struct kobject *kobj,
    62			struct bin_attribute *attr, char *buf, loff_t pos, size_t len)
    63	{
    64		struct virtrng_info *vi = attr->private;
    65		unsigned long gen_counter = *(unsigned long *)vi->map_buffer;
    66	
    67		if (!len)
    68			return 0;
    69	
    70		len = min(len, sizeof(gen_counter));
    71		memcpy(buf, &gen_counter, len);
    72	
    73		return len;
    74	}
    75	
  > 76	int virtrng_sysfs_mmap(struct file *filep, struct kobject *kobj,
    77			struct bin_attribute *attr, struct vm_area_struct *vma)
    78	{
    79		struct virtrng_info *vi = attr->private;
    80	
    81		if (vma->vm_pgoff || vma_pages(vma) > 1)
    82			return -EINVAL;
    83	
    84		if (vma->vm_flags & VM_WRITE)
    85			return -EPERM;
    86	
    87		vma->vm_flags |= VM_DONTEXPAND;
    88		vma->vm_flags &= ~VM_MAYWRITE;
    89	
    90		return vm_insert_page(vma, vma->vm_start, virt_to_page(vi->map_buffer));
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
