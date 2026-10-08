Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74C374A15
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791502911; cv=none; b=d8xXfoTVwR4z84NQfuDK1QkAgwfu99bQgNMOHD4ERSW4krYCx6+Dp6On5kVs5/8k09WaZxLtGs84G27aWAFl6j1FM/uIMfY0GWFRDH/LWVFO7ZT4LXqYNnFF1yQ9Fz+nk518GLRVefsX/WV+ktmSE3/r0A0EGZ3qrP7hSdIL950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791502911; c=relaxed/simple;
	bh=hx/2kGhUkEnnxlk4VRQFCAjTbVUDZJSSkPq6VCl+BLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kxV2ju888thmIvBFyytaoBKKQ8JwDd/tKz7S0MP65H3e7NziWy7wpvKB66XjsMVrHJ0sO0IQJHPtry4fcphZmESWs+/h29kh3duk0feXALO1FcafsjB4IN1ZbimVKKxyRyK9kVLI/Nyl92NPmayOS2gA5O4gZMr7FtOjVrBJqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0nLVDZY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0nLVDZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791502909; x=1823038909;
  h=date:from:to:cc:subject:message-id;
  bh=hx/2kGhUkEnnxlk4VRQFCAjTbVUDZJSSkPq6VCl+BLQ=;
  b=N0nLVDZY75Q/e6kIeLec85iVRgzXhOCsHthVclMBF0o/pRDNGcqXMh2i
   kMprMBlIKFAjEV1yO/VcBQ0QvgRq/l3dj0ajpxrPKoBneOtXV7s+WXTPm
   +WfiuFXSFMhlFLh6FwS6HaVtNqGoRhTBtFUZ72WxWNILBlI49GDUXZ9la
   6zSzbawAjbPzOo8E8FAgYUP9HZ79lXUoNx4YzI/hI/FQ7iiMMLNqQZKDR
   wSYvo0UJBXAxibYSQlMgpOlsFETVSAr1jZL80JIKAWFCIi4cueVZrgLwc
   hzfxr+9aNfUPRdLgqROh7fNd25axfqttlVybS9Kx765/YkjXfbUaR5Xp4
   w==;
X-CSE-ConnectionGUID: zzHhkoBiSJOoJQVYdEHocA==
X-CSE-MsgGUID: 2xQVcKEDQ/GPTZcn6VHK9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="183025"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="183025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 16:41:49 -0700
X-CSE-ConnectionGUID: dP1lHaHmTMyy9T0eJ2hZIA==
X-CSE-MsgGUID: cUIyxhZYTOawbtDtgjb4zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="109498"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Oct 2026 16:41:48 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xExk9-000000006JH-1XC2;
	Thu, 08 Oct 2026 23:41:45 +0000
Date: Fri, 09 Oct 2026 01:41:21 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v4 26/29]
 fs/fuse/backing.c:159:undefined reference to `fsdev_dax_from_file'
Message-ID: <202610090144.uLZlv2nF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v4
head:   4b2887a36cd547c2e59952e0a202094c82d9c6a9
commit: 70cf1c0aef205f9384095f2536c61b945d320ef6 [26/29] fuse: add support for opening dax device as backing
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20261009/202610090144.uLZlv2nF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090144.uLZlv2nF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090144.uLZlv2nF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `fuse_backing_open_file':
>> fs/fuse/backing.c:159:(.text+0xc0259d): undefined reference to `fsdev_dax_from_file'


vim +159 fs/fuse/backing.c

   130	
   131	static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb, struct file *file)
   132	{
   133		struct inode *inode = file_inode(file);
   134		struct dax_device *daxdev;
   135		int err;
   136	
   137		switch (inode->i_mode & S_IFMT) {
   138		case S_IFREG:
   139			/* TODO: relax CAP_SYS_ADMIN once backing files are visible to lsof */
   140			if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
   141				return -EPERM;
   142	
   143			if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
   144				return -ELOOP;
   145	
   146			fb->type = FUSE_BACKING_PATH;
   147			fb->path = file->f_path;
   148			path_get(&fb->path);
   149			fb->cred = get_current_cred();
   150			return 0;
   151	
   152		case S_IFCHR:
   153			if (!fc->passthrough || !fc->backing_id_64)
   154				return -EINVAL;
   155	
   156			if (!IS_ENABLED(CONFIG_DEV_DAX_FSDEV))
   157				return -EINVAL;
   158	
 > 159			daxdev = fsdev_dax_from_file(file);
   160			if (!daxdev)
   161				return -EINVAL;
   162	
   163			err = -EPERM;
   164			if (capable(CAP_SYS_RAWIO)) {
   165				err = fs_dax_get(daxdev, fb, &fuse_dax_holder_ops);
   166				if (!err) {
   167					fb->type = FUSE_BACKING_DAXDEV;
   168					fb->dax_dev = daxdev;
   169				}
   170			}
   171			put_dax(daxdev);
   172			return err;
   173	
   174		case S_IFDIR:
   175			return -EISDIR;
   176	
   177		default:
   178			return -EINVAL;
   179		}
   180	}
   181	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
