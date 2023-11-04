Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AB15A3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVOx5sa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699065318; x=1730601318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANXimmF6XJCXmVchNXXU7UgX0wtbOl7piBWJQ5k+CJQ=;
  b=AVOx5sa59cW0HkZBkq9kuxOSBG6zIw3u33HKdKJOu2pV5gQWDfH6fViQ
   tx6842yxFU7dIc4/wrlF8QJveFOP0DyyehErwYQ//yilS2Eud17nIoifv
   6owtMPDoDvg8H2AyJ8ueN6I2wsapESv9mlBwoyJyoZKm/W46vQntoZtwY
   K4M74kwWOv10az/16ZvXvXKTtS6VWH1k/4olyB9k+k2QxwJLSkItiO1Cf
   fw/VPGwirbpJmD2Si8z9rQxHmZol2K4zg7ccAg+OzCJEnr4AYjtA/AP/7
   RvbJyy6Wp/RmWb9onnXzo/vZDapcXKg0c+iBQcsKy7e/6cNqDh4W0o1iR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="455544661"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="455544661"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 19:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="711695794"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="711695794"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Nov 2023 19:35:15 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz6VF-0003Gx-29;
	Sat, 04 Nov 2023 02:35:13 +0000
Date: Sat, 4 Nov 2023 10:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Cindy Lu <lulu@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/8] Kconfig: Add the new file vhost/iommufd
Message-ID: <202311041046.4d77udwY-lkp@intel.com>
References: <20231103171641.1703146-3-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103171641.1703146-3-lulu@redhat.com>

Hi Cindy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6 next-20231103]
[cannot apply to mst-vhost/linux-next joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-iommufd-Add-the-functions-support-iommufd/20231104-011948
base:   linus/master
patch link:    https://lore.kernel.org/r/20231103171641.1703146-3-lulu%40redhat.com
patch subject: [RFC v1 2/8] Kconfig: Add the new file vhost/iommufd
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041046.4d77udwY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041046.4d77udwY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041046.4d77udwY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_bind':
   drivers/vhost/iommufd.c:19:26: error: 'const struct vdpa_config_ops' has no member named 'bind_iommufd'
      19 |         if (!vdpa->config->bind_iommufd)
         |                          ^~
   drivers/vhost/iommufd.c:21:27: error: 'const struct vdpa_config_ops' has no member named 'bind_iommufd'
      21 |         ret = vdpa->config->bind_iommufd(vdpa, ictx, device_id);
         |                           ^~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_unbind':
   drivers/vhost/iommufd.c:32:27: error: 'const struct vdpa_config_ops' has no member named 'unbind_iommufd'; did you mean 'unbind_mm'?
      32 |         if (vdpa->config->unbind_iommufd)
         |                           ^~~~~~~~~~~~~~
         |                           unbind_mm
   drivers/vhost/iommufd.c:33:31: error: 'const struct vdpa_config_ops' has no member named 'unbind_iommufd'; did you mean 'unbind_mm'?
      33 |                 vdpa->config->unbind_iommufd(vdpa);
         |                               ^~~~~~~~~~~~~~
         |                               unbind_mm
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:36:5: warning: no previous prototype for 'vdpa_iommufd_physical_bind' [-Wmissing-prototypes]
      36 | int vdpa_iommufd_physical_bind(struct vdpa_device *vdpa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_physical_bind':
   drivers/vhost/iommufd.c:45:13: error: 'struct vdpa_device' has no member named 'iommufd_device'
      45 |         vdpa->iommufd_device = idev;
         |             ^~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:50:6: warning: no previous prototype for 'vdpa_iommufd_physical_unbind' [-Wmissing-prototypes]
      50 | void vdpa_iommufd_physical_unbind(struct vdpa_device *vdpa)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_physical_unbind':
   drivers/vhost/iommufd.c:54:17: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      54 |         if (vdpa->iommufd_attached) {
         |                 ^~
   drivers/vhost/iommufd.c:55:43: error: 'struct vdpa_device' has no member named 'iommufd_device'
      55 |                 iommufd_device_detach(vdpa->iommufd_device);
         |                                           ^~
   drivers/vhost/iommufd.c:56:21: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      56 |                 vdpa->iommufd_attached = false;
         |                     ^~
   drivers/vhost/iommufd.c:58:35: error: 'struct vdpa_device' has no member named 'iommufd_device'
      58 |         iommufd_device_unbind(vdpa->iommufd_device);
         |                                   ^~
   drivers/vhost/iommufd.c:59:13: error: 'struct vdpa_device' has no member named 'iommufd_device'
      59 |         vdpa->iommufd_device = NULL;
         |             ^~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:63:5: warning: no previous prototype for 'vdpa_iommufd_physical_attach_ioas' [-Wmissing-prototypes]
      63 | int vdpa_iommufd_physical_attach_ioas(struct vdpa_device *vdpa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/vdpa.h:6,
                    from drivers/vhost/iommufd.c:1:
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_physical_attach_ioas':
   drivers/vhost/iommufd.c:70:26: error: 'struct vdpa_device' has no member named 'iommufd_device'
      70 |         if (WARN_ON(!vdpa->iommufd_device))
         |                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/vhost/iommufd.c:73:17: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      73 |         if (vdpa->iommufd_attached)
         |                 ^~
   drivers/vhost/iommufd.c:74:49: error: 'struct vdpa_device' has no member named 'iommufd_device'
      74 |                 rc = iommufd_device_replace(vdpa->iommufd_device,
         |                                                 ^~
   drivers/vhost/iommufd.c:77:48: error: 'struct vdpa_device' has no member named 'iommufd_device'
      77 |                 rc = iommufd_device_attach(vdpa->iommufd_device,
         |                                                ^~
   drivers/vhost/iommufd.c:81:13: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      81 |         vdpa->iommufd_attached = true;
         |             ^~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:87:5: warning: no previous prototype for 'vdpa_iommufd_physical_detach_ioas' [-Wmissing-prototypes]
      87 | int vdpa_iommufd_physical_detach_ioas(struct vdpa_device *vdpa)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_physical_detach_ioas':
   drivers/vhost/iommufd.c:91:26: error: 'struct vdpa_device' has no member named 'iommufd_device'
      91 |         if (WARN_ON(!vdpa->iommufd_device) || !vdpa->iommufd_attached)
         |                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/vhost/iommufd.c:91:52: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      91 |         if (WARN_ON(!vdpa->iommufd_device) || !vdpa->iommufd_attached)
         |                                                    ^~
   drivers/vhost/iommufd.c:94:35: error: 'struct vdpa_device' has no member named 'iommufd_device'
      94 |         iommufd_device_detach(vdpa->iommufd_device);
         |                                   ^~
   drivers/vhost/iommufd.c:95:13: error: 'struct vdpa_device' has no member named 'iommufd_attached'
      95 |         vdpa->iommufd_attached = false;
         |             ^~
   drivers/vhost/iommufd.c: In function 'vdpa_emulated_unmap':
>> drivers/vhost/iommufd.c:103:29: warning: unused variable 'vdpa' [-Wunused-variable]
     103 |         struct vdpa_device *vdpa = data;
         |                             ^~~~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:114:5: warning: no previous prototype for 'vdpa_iommufd_emulated_bind' [-Wmissing-prototypes]
     114 | int vdpa_iommufd_emulated_bind(struct vdpa_device *vdpa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_emulated_bind':
   drivers/vhost/iommufd.c:124:13: error: 'struct vdpa_device' has no member named 'iommufd_access'
     124 |         vdpa->iommufd_access = user;
         |             ^~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:129:6: warning: no previous prototype for 'vdpa_iommufd_emulated_unbind' [-Wmissing-prototypes]
     129 | void vdpa_iommufd_emulated_unbind(struct vdpa_device *vdpa)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_emulated_unbind':
   drivers/vhost/iommufd.c:133:17: error: 'struct vdpa_device' has no member named 'iommufd_access'
     133 |         if (vdpa->iommufd_access) {
         |                 ^~
   drivers/vhost/iommufd.c:134:44: error: 'struct vdpa_device' has no member named 'iommufd_access'
     134 |                 iommufd_access_destroy(vdpa->iommufd_access);
         |                                            ^~
   drivers/vhost/iommufd.c:135:21: error: 'struct vdpa_device' has no member named 'iommufd_attached'
     135 |                 vdpa->iommufd_attached = false;
         |                     ^~
   drivers/vhost/iommufd.c:136:21: error: 'struct vdpa_device' has no member named 'iommufd_access'
     136 |                 vdpa->iommufd_access = NULL;
         |                     ^~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:141:5: warning: no previous prototype for 'vdpa_iommufd_emulated_attach_ioas' [-Wmissing-prototypes]
     141 | int vdpa_iommufd_emulated_attach_ioas(struct vdpa_device *vdpa,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_emulated_attach_ioas':
   drivers/vhost/iommufd.c:150:17: error: 'struct vdpa_device' has no member named 'iommufd_attached'
     150 |         if (vdpa->iommufd_attached) {
         |                 ^~
   drivers/vhost/iommufd.c:151:49: error: 'struct vdpa_device' has no member named 'iommufd_access'
     151 |                 rc = iommufd_access_replace(vdpa->iommufd_access,
         |                                                 ^~
   drivers/vhost/iommufd.c:154:48: error: 'struct vdpa_device' has no member named 'iommufd_access'
     154 |                 rc = iommufd_access_attach(vdpa->iommufd_access,
         |                                                ^~
   drivers/vhost/iommufd.c:157:20: error: 'struct vdpa_device' has no member named 'iommufd_access'
     157 |         user = vdpa->iommufd_access;
         |                    ^~
   drivers/vhost/iommufd.c:161:13: error: 'struct vdpa_device' has no member named 'iommufd_attached'
     161 |         vdpa->iommufd_attached = true;
         |             ^~
>> drivers/vhost/iommufd.c:146:32: warning: variable 'user' set but not used [-Wunused-but-set-variable]
     146 |         struct iommufd_access *user;
         |                                ^~~~
   drivers/vhost/iommufd.c: At top level:
   drivers/vhost/iommufd.c:166:5: warning: no previous prototype for 'vdpa_iommufd_emulated_detach_ioas' [-Wmissing-prototypes]
     166 | int vdpa_iommufd_emulated_detach_ioas(struct vdpa_device *vdpa)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vhost/iommufd.c: In function 'vdpa_iommufd_emulated_detach_ioas':
   drivers/vhost/iommufd.c:170:26: error: 'struct vdpa_device' has no member named 'iommufd_access'
     170 |         if (WARN_ON(!vdpa->iommufd_access) || !vdpa->iommufd_attached)
         |                          ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/vhost/iommufd.c:170:52: error: 'struct vdpa_device' has no member named 'iommufd_attached'
     170 |         if (WARN_ON(!vdpa->iommufd_access) || !vdpa->iommufd_attached)
         |                                                    ^~
   drivers/vhost/iommufd.c:173:35: error: 'struct vdpa_device' has no member named 'iommufd_access'
     173 |         iommufd_access_detach(vdpa->iommufd_access);
         |                                   ^~
   drivers/vhost/iommufd.c:174:13: error: 'struct vdpa_device' has no member named 'iommufd_attached'
     174 |         vdpa->iommufd_attached = false;
         |             ^~


vim +/vdpa +103 drivers/vhost/iommufd.c

5da69b20d552cc Cindy Lu 2023-11-04   99  
5da69b20d552cc Cindy Lu 2023-11-04  100  static void vdpa_emulated_unmap(void *data, unsigned long iova,
5da69b20d552cc Cindy Lu 2023-11-04  101  				unsigned long length)
5da69b20d552cc Cindy Lu 2023-11-04  102  {
5da69b20d552cc Cindy Lu 2023-11-04 @103  	struct vdpa_device *vdpa = data;
5da69b20d552cc Cindy Lu 2023-11-04  104  	/* todo: need to unmap the iova-lenth in all ASID*/
5da69b20d552cc Cindy Lu 2023-11-04  105  
5da69b20d552cc Cindy Lu 2023-11-04  106  	//	vdpa->config->dma_unmap(vdpa, 0, iova, length);
5da69b20d552cc Cindy Lu 2023-11-04  107  }
5da69b20d552cc Cindy Lu 2023-11-04  108  
5da69b20d552cc Cindy Lu 2023-11-04  109  static const struct iommufd_access_ops vdpa_user_ops = {
5da69b20d552cc Cindy Lu 2023-11-04  110  	.needs_pin_pages = 1,
5da69b20d552cc Cindy Lu 2023-11-04  111  	.unmap = vdpa_emulated_unmap,
5da69b20d552cc Cindy Lu 2023-11-04  112  };
5da69b20d552cc Cindy Lu 2023-11-04  113  
5da69b20d552cc Cindy Lu 2023-11-04  114  int vdpa_iommufd_emulated_bind(struct vdpa_device *vdpa,
5da69b20d552cc Cindy Lu 2023-11-04  115  			       struct iommufd_ctx *ictx, u32 *out_device_id)
5da69b20d552cc Cindy Lu 2023-11-04  116  {
5da69b20d552cc Cindy Lu 2023-11-04  117  	vhost_vdpa_lockdep_assert_held(vdpa);
5da69b20d552cc Cindy Lu 2023-11-04  118  
5da69b20d552cc Cindy Lu 2023-11-04  119  	struct iommufd_access *user;
5da69b20d552cc Cindy Lu 2023-11-04  120  
5da69b20d552cc Cindy Lu 2023-11-04  121  	user = iommufd_access_create(ictx, &vdpa_user_ops, vdpa, out_device_id);
5da69b20d552cc Cindy Lu 2023-11-04  122  	if (IS_ERR(user))
5da69b20d552cc Cindy Lu 2023-11-04  123  		return PTR_ERR(user);
5da69b20d552cc Cindy Lu 2023-11-04  124  	vdpa->iommufd_access = user;
5da69b20d552cc Cindy Lu 2023-11-04  125  	return 0;
5da69b20d552cc Cindy Lu 2023-11-04  126  }
5da69b20d552cc Cindy Lu 2023-11-04  127  EXPORT_SYMBOL_GPL(vdpa_iommufd_emulated_bind);
5da69b20d552cc Cindy Lu 2023-11-04  128  
5da69b20d552cc Cindy Lu 2023-11-04  129  void vdpa_iommufd_emulated_unbind(struct vdpa_device *vdpa)
5da69b20d552cc Cindy Lu 2023-11-04  130  {
5da69b20d552cc Cindy Lu 2023-11-04  131  	vhost_vdpa_lockdep_assert_held(vdpa);
5da69b20d552cc Cindy Lu 2023-11-04  132  
5da69b20d552cc Cindy Lu 2023-11-04  133  	if (vdpa->iommufd_access) {
5da69b20d552cc Cindy Lu 2023-11-04  134  		iommufd_access_destroy(vdpa->iommufd_access);
5da69b20d552cc Cindy Lu 2023-11-04  135  		vdpa->iommufd_attached = false;
5da69b20d552cc Cindy Lu 2023-11-04  136  		vdpa->iommufd_access = NULL;
5da69b20d552cc Cindy Lu 2023-11-04  137  	}
5da69b20d552cc Cindy Lu 2023-11-04  138  }
5da69b20d552cc Cindy Lu 2023-11-04  139  EXPORT_SYMBOL_GPL(vdpa_iommufd_emulated_unbind);
5da69b20d552cc Cindy Lu 2023-11-04  140  
5da69b20d552cc Cindy Lu 2023-11-04  141  int vdpa_iommufd_emulated_attach_ioas(struct vdpa_device *vdpa,
5da69b20d552cc Cindy Lu 2023-11-04  142  				      u32 *iommufd_ioasid)
5da69b20d552cc Cindy Lu 2023-11-04  143  {
5da69b20d552cc Cindy Lu 2023-11-04  144  	int rc;
5da69b20d552cc Cindy Lu 2023-11-04  145  
5da69b20d552cc Cindy Lu 2023-11-04 @146  	struct iommufd_access *user;
5da69b20d552cc Cindy Lu 2023-11-04  147  
5da69b20d552cc Cindy Lu 2023-11-04  148  	vhost_vdpa_lockdep_assert_held(vdpa);
5da69b20d552cc Cindy Lu 2023-11-04  149  
5da69b20d552cc Cindy Lu 2023-11-04  150  	if (vdpa->iommufd_attached) {
5da69b20d552cc Cindy Lu 2023-11-04  151  		rc = iommufd_access_replace(vdpa->iommufd_access,
5da69b20d552cc Cindy Lu 2023-11-04  152  					    *iommufd_ioasid);
5da69b20d552cc Cindy Lu 2023-11-04  153  	} else {
5da69b20d552cc Cindy Lu 2023-11-04  154  		rc = iommufd_access_attach(vdpa->iommufd_access,
5da69b20d552cc Cindy Lu 2023-11-04  155  					   *iommufd_ioasid);
5da69b20d552cc Cindy Lu 2023-11-04  156  	}
5da69b20d552cc Cindy Lu 2023-11-04  157  	user = vdpa->iommufd_access;
5da69b20d552cc Cindy Lu 2023-11-04  158  
5da69b20d552cc Cindy Lu 2023-11-04  159  	if (rc)
5da69b20d552cc Cindy Lu 2023-11-04  160  		return rc;
5da69b20d552cc Cindy Lu 2023-11-04  161  	vdpa->iommufd_attached = true;
5da69b20d552cc Cindy Lu 2023-11-04  162  	return 0;
5da69b20d552cc Cindy Lu 2023-11-04  163  }
5da69b20d552cc Cindy Lu 2023-11-04  164  EXPORT_SYMBOL_GPL(vdpa_iommufd_emulated_attach_ioas);
5da69b20d552cc Cindy Lu 2023-11-04  165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
