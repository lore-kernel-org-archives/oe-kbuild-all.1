Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484AAD30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680028040; x=1711564040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfkhSioAh+an0gPz78mr/2lLnXVZch2Xz5NLKm9aUeE=;
  b=fhMs2WdZzPSXF/7rWTB1qS49ND3ksVJuL0CrxFLQYCYXtmTHG6OXgasF
   GploLIlF2OV9uaZOwo5F7rtrF5zd3cvlqE651ItmXW9YOQWohsl2UYhBB
   vR3w0b3+v0u415FCT9gvhhgYfgh1EXeobLs+eoLow7cXTSiqoAowqldde
   A7Q9iPminpvnEpnTKca/Y4Sd5Ly2fqwIP0mysWLL/OtxXqF8KhaPjQ+/P
   VuY5vuGJCHkqnPB52TczcrkexZMTJ2sJveBFcLcIkZnbwfOW1l+KlCtEL
   Z1ZYqWKO4coXNwHl3F3CgaxNOYvLTLQUWXtbD5zcS85w/ky8FGya95eVd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338157386"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="338157386"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 11:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930020913"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="930020913"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2023 11:27:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phE2O-000IoT-1X;
	Tue, 28 Mar 2023 18:27:16 +0000
Date: Wed, 29 Mar 2023 02:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 103/107] drivers/virtio/virtio_wl.c:247:23:
 sparse: sparse: restricted __le64 degrades to integer
Message-ID: <202303290240.s1QQ2n3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   268c8aee161e4135a7202da9cf31722ddbdb750e
commit: fdbfc0b7fd52458bf8cd94a8558961513e03e0f6 [103/107] CHROMIUM: virtwl: add support for shmem region
config: nios2-randconfig-s052-20230326 (https://download.01.org/0day-ci/archive/20230329/202303290240.s1QQ2n3M-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout fdbfc0b7fd52458bf8cd94a8558961513e03e0f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290240.s1QQ2n3M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/virtio/virtio_wl.c:220:21: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:220:21: sparse:     expected unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:220:21: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:246:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:246:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:246:19: sparse:     got restricted __le32 [usertype] size
>> drivers/virtio/virtio_wl.c:247:23: sparse: sparse: restricted __le64 degrades to integer
   drivers/virtio/virtio_wl.c:248:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:248:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:248:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:261:39: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:261:39: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:261:39: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:295:42: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] vfd_id @@
   drivers/virtio/virtio_wl.c:295:42: sparse:     expected unsigned long id
   drivers/virtio/virtio_wl.c:295:42: sparse:     got restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:323:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:323:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:323:20: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:501:24: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:506:26: sparse: sparse: cast from restricted __le32
   drivers/virtio/virtio_wl.c:508:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:532:58: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:537:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:575:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:581:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/virtio/virtio_wl.c:619:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:619:30: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:619:30: sparse:     got int
   drivers/virtio/virtio_wl.c:620:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:620:28: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:620:28: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:906:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:906:29: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:906:29: sparse:     got int
   drivers/virtio/virtio_wl.c:929:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:929:27: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:929:27: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:930:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_count @@     got unsigned int [assigned] [usertype] vfd_count @@
   drivers/virtio/virtio_wl.c:930:30: sparse:     expected restricted __le32 [usertype] vfd_count
   drivers/virtio/virtio_wl.c:930:30: sparse:     got unsigned int [assigned] [usertype] vfd_count
   drivers/virtio/virtio_wl.c:963:45: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:963:45: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:963:45: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:998:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:998:36: sparse:     got int
   drivers/virtio/virtio_wl.c:999:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:999:34: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:999:34: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1000:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned int [usertype] flags @@
   drivers/virtio/virtio_wl.c:1000:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1000:33: sparse:     got unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1169:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] vfd_id @@     got unsigned int [usertype] id @@
   drivers/virtio/virtio_wl.c:1169:26: sparse:     expected restricted __le32 [usertype] vfd_id
   drivers/virtio/virtio_wl.c:1169:26: sparse:     got unsigned int [usertype] id
   drivers/virtio/virtio_wl.c:1172:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1172:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1172:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1173:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1173:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1173:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1176:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1176:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1176:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1177:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1177:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1177:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1181:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1181:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1181:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1182:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] size @@     got unsigned int @@
   drivers/virtio/virtio_wl.c:1182:32: sparse:     expected restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1182:32: sparse:     got unsigned int
   drivers/virtio/virtio_wl.c:1185:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1185:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1185:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1186:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1186:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1186:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1189:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1189:36: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1189:36: sparse:     got int
   drivers/virtio/virtio_wl.c:1190:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got int @@
   drivers/virtio/virtio_wl.c:1190:33: sparse:     expected restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1190:33: sparse:     got int
   drivers/virtio/virtio_wl.c:1195:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] type @@     got int @@
   drivers/virtio/virtio_wl.c:1195:44: sparse:     expected restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1195:44: sparse:     got int
   drivers/virtio/virtio_wl.c:1217:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int type @@     got restricted __le32 [usertype] type @@
   drivers/virtio/virtio_wl.c:1217:44: sparse:     expected unsigned int type
   drivers/virtio/virtio_wl.c:1217:44: sparse:     got restricted __le32 [usertype] type
   drivers/virtio/virtio_wl.c:1221:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [usertype] size @@
   drivers/virtio/virtio_wl.c:1221:19: sparse:     expected unsigned int [usertype] size
   drivers/virtio/virtio_wl.c:1221:19: sparse:     got restricted __le32 [usertype] size
   drivers/virtio/virtio_wl.c:1222:28: sparse: sparse: restricted __le64 degrades to integer
   drivers/virtio/virtio_wl.c:1223:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flags @@     got restricted __le32 [usertype] flags @@
   drivers/virtio/virtio_wl.c:1223:20: sparse:     expected unsigned int [usertype] flags
   drivers/virtio/virtio_wl.c:1223:20: sparse:     got restricted __le32 [usertype] flags
   drivers/virtio/virtio_wl.c:1449:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/virtio/virtio_wl.c:1449:17: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/virtio/virtio_wl.c:1449:17: sparse:     got unsigned int ( * )( ... )

vim +247 drivers/virtio/virtio_wl.c

   215	
   216	static bool vq_handle_new(struct virtwl_info *vi,
   217				  struct virtio_wl_ctrl_vfd_new *new, unsigned int len)
   218	{
   219		struct virtwl_vfd *vfd;
   220		u32 id = new->vfd_id;
   221		int ret;
   222	
   223		if (id == 0)
   224			return true; /* return the inbuf to vq */
   225	
   226		if (!(id & VFD_HOST_VFD_ID_BIT) || (id & VFD_ILLEGAL_SIGN_BIT)) {
   227			pr_warn("virtwl: received a vfd with invalid id: %u\n", id);
   228			return true; /* return the inbuf to vq */
   229		}
   230	
   231		vfd = virtwl_vfd_alloc(vi);
   232		if (!vfd)
   233			return true; /* return the inbuf to vq */
   234	
   235		mutex_lock(&vi->vfds_lock);
   236		ret = idr_alloc(&vi->vfds, vfd, id, id + 1, GFP_KERNEL);
   237		mutex_unlock(&vi->vfds_lock);
   238	
   239		if (ret <= 0) {
   240			virtwl_vfd_free(vfd);
   241			pr_warn("virtwl: failed to place received vfd: %d\n", ret);
   242			return true; /* return the inbuf to vq */
   243		}
   244	
   245		vfd->id = id;
   246		vfd->size = new->size;
 > 247		vfd->pfn = new->pfn + vi->pfn_base;
   248		vfd->flags = new->flags;
   249	
   250		return true; /* return the inbuf to vq */
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
