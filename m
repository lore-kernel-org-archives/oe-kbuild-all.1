Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AED3EA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 01:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWH3x+Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701912150; x=1733448150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cswOJEuzyCHnzZcbK6DqxzbmdpCQUo/oHxAIV0mYalE=;
  b=UWH3x+ReWyvAZM0p3FO4HLMoYptYEswLrOQYbTdqsuaOfdElmO3I1T7U
   1eLewMBsgffkTGlflEgzY+z2Xl5vqvaIQvmREpblRc94kRJKoOTVxuWyS
   leFeqZQIzSrGB9YL/6YamjFNaPRzUiPN57/+pNMGt01czox4AEzf1uFbF
   Kch94rGWU9J9bxT4GYhb+VuvJKQTlkcVfj5Io/ZUN67OAiFf0A/M7qBtr
   bldKxvYNUJU/xitr5pl+7vdqI+0z+KOqoBS1MpzZzytZn9cXl6CAxrSub
   O2N/00pCKSg5/a2iaRRPfwJZ9xpVfMUrwizF89GfbXW2M/AgEFs+kzYt+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="391325980"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="391325980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 17:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="894943618"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="894943618"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 06 Dec 2023 17:22:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB35t-000BfE-32;
	Thu, 07 Dec 2023 01:22:26 +0000
Date: Thu, 7 Dec 2023 09:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 15013/30000]
 drivers/virtio/virtio_wl.c:1435:14: error: dereferencing pointer to
 incomplete type 'struct sync_file'
Message-ID: <202312070935.RqTvUt6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   799749bdbfa75d19afbb979725fcd53cc65462e0
commit: 6686780d2960d81b608e66938266602d276ea4d1 [15013/30000] CHROMIUM: virtio-wl: add support for host fences
config: x86_64-randconfig-003-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070935.RqTvUt6N-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070935.RqTvUt6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070935.RqTvUt6N-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_wl.c: In function 'virtwl_vfd_send':
   drivers/virtio/virtio_wl.c:938:13: error: implicit declaration of function 'sync_file_get_fence'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
     938 |     fence = sync_file_get_fence(vfd_fds[i]);
         |             ^~~~~~~~~~~~~~~~~~~
         |             sync_file_range
   drivers/virtio/virtio_wl.c:938:11: warning: assignment to 'struct dma_fence *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     938 |     fence = sync_file_get_fence(vfd_fds[i]);
         |           ^
   drivers/virtio/virtio_wl.c:939:18: error: implicit declaration of function 'is_local_fence' [-Werror=implicit-function-declaration]
     939 |     if (fence && is_local_fence(fence)) {
         |                  ^~~~~~~~~~~~~~
   drivers/virtio/virtio_wl.c: In function 'virtwl_ioctl_recv':
   drivers/virtio/virtio_wl.c:1417:11: error: implicit declaration of function 'sync_file_create'; did you mean 'sync_file_range'? [-Werror=implicit-function-declaration]
    1417 |    sync = sync_file_create(&fence->base);
         |           ^~~~~~~~~~~~~~~~
         |           sync_file_range
   drivers/virtio/virtio_wl.c:1417:9: warning: assignment to 'struct sync_file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1417 |    sync = sync_file_create(&fence->base);
         |         ^
>> drivers/virtio/virtio_wl.c:1435:14: error: dereferencing pointer to incomplete type 'struct sync_file'
    1435 |     fput(sync->file);
         |              ^~
   cc1: some warnings being treated as errors


vim +1435 drivers/virtio/virtio_wl.c

  1361	
  1362	static long virtwl_ioctl_recv(struct file *filp, void __user *ptr)
  1363	{
  1364		struct virtwl_ioctl_txn ioctl_recv;
  1365		void __user *user_data = ptr + sizeof(struct virtwl_ioctl_txn);
  1366		int __user *user_fds = (int __user *)ptr;
  1367		size_t vfd_count = VIRTWL_SEND_MAX_ALLOCS;
  1368		struct virtwl_vfd *vfds[VIRTWL_SEND_MAX_ALLOCS] = { 0 };
  1369		int fds[VIRTWL_SEND_MAX_ALLOCS];
  1370		size_t i;
  1371		int ret = 0;
  1372	
  1373		for (i = 0; i < VIRTWL_SEND_MAX_ALLOCS; i++)
  1374			fds[i] = -1;
  1375	
  1376		ret = copy_from_user(&ioctl_recv, ptr, sizeof(struct virtwl_ioctl_txn));
  1377		if (ret)
  1378			return -EFAULT;
  1379	
  1380		/* Early check for user error. */
  1381		ret = !access_ok(user_data, ioctl_recv.len);
  1382		if (ret)
  1383			return -EFAULT;
  1384	
  1385		ret = virtwl_vfd_recv(filp, user_data, ioctl_recv.len, vfds,
  1386				      &vfd_count);
  1387		if (ret < 0)
  1388			return ret;
  1389	
  1390		ret = copy_to_user(&((struct virtwl_ioctl_txn __user *)ptr)->len, &ret,
  1391				   sizeof(ioctl_recv.len));
  1392		if (ret) {
  1393			ret = -EFAULT;
  1394			goto free_vfds;
  1395		}
  1396	
  1397		for (i = 0; i < vfd_count; i++) {
  1398			if (vfds[i]->flags & VIRTIO_WL_VFD_FENCE) {
  1399				struct virtwl_vfd *vfd = filp->private_data;
  1400				struct virtwl_info *vi = vfd->vi;
  1401				struct virtwl_fence *fence;
  1402				struct sync_file *sync;
  1403	
  1404				fence = kzalloc(sizeof(*fence), GFP_KERNEL);
  1405				if (!fence) {
  1406					ret = -ENOMEM;
  1407					goto free_vfds;
  1408				}
  1409				fence->vfd = vfds[i];
  1410				dma_fence_init(&fence->base, &virtwl_fence_ops,
  1411					       &vi->fence_lock, fence->vfd->id, 1);
  1412	
  1413				// If something fails, cleanup of the dma_fence will
  1414				// clean up this vfd.
  1415				vfds[i] = NULL;
  1416	
  1417				sync = sync_file_create(&fence->base);
  1418				dma_fence_put(&fence->base);
  1419				if (!sync) {
  1420					// Maybe not -ENOMEM, but sync_file_create
  1421					// doesn't expose what actually went wrong.
  1422					ret = -ENOMEM;
  1423					goto free_vfds;
  1424				}
  1425	
  1426				spin_lock(&vi->fence_lock);
  1427				if (!fence->vfd->hungup)
  1428					fence->vfd->fence = dma_fence_get(&fence->base);
  1429				else
  1430					dma_fence_signal_locked(&fence->base);
  1431				spin_unlock(&vi->fence_lock);
  1432	
  1433				ret = get_unused_fd_flags(O_CLOEXEC);
  1434				if (ret < 0) {
> 1435					fput(sync->file);
  1436					goto free_vfds;
  1437				}
  1438				fd_install(ret, sync->file);
  1439			} else {
  1440				ret = anon_inode_getfd("[virtwl_vfd]", &virtwl_vfd_fops,
  1441						       vfds[i], virtwl_vfd_file_flags(vfds[i])
  1442						       | O_CLOEXEC);
  1443			}
  1444	
  1445			if (ret < 0)
  1446				goto free_vfds;
  1447	
  1448			vfds[i] = NULL;
  1449			fds[i] = ret;
  1450		}
  1451	
  1452		ret = copy_to_user(user_fds, fds, sizeof(int) * VIRTWL_SEND_MAX_ALLOCS);
  1453		if (ret) {
  1454			ret = -EFAULT;
  1455			goto free_vfds;
  1456		}
  1457	
  1458		return 0;
  1459	
  1460	free_vfds:
  1461		for (i = 0; i < vfd_count; i++) {
  1462			if (vfds[i])
  1463				do_vfd_close(vfds[i]);
  1464			if (fds[i] >= 0)
  1465				__close_fd(current->files, fds[i]);
  1466		}
  1467		return ret;
  1468	}
  1469	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
