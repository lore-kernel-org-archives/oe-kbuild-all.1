Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CA335BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737914046; cv=none; b=qdezV5fswyVBYLkyr/xaaObN75ZrAns76aBbzzMmkG/CPVPf8IHLyFC1a1qMp8QaczOb+t/+EZcjEYx+D22tIi61WJTtD9H76DzkYDrhaeOE5jkMXQHfr64eD3qhEMf/c0j7g9I+AJu+1kSONXZLY83ULaB1LnkhqhUrRhOS5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737914046; c=relaxed/simple;
	bh=sQCpkWGg5sLc+e/ZsMHtprrmUBRXWEtlaBHFcU410LE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DpTXEc8Zp9w7m9072eX7hZvObupRnKuEvSAqZHRRfKlkhL4LYzwZNIh/zgzx6wVOs6CWXNITp0taogzHKyWktx5Hvibo6R889adHU43TlPufBX1lXNlVjoQa1u98bxYyGzjYvywa98brHkjdARVuq6CaEdtMSCD0MNY7MnjkCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxWSefAJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxWSefAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737914044; x=1769450044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQCpkWGg5sLc+e/ZsMHtprrmUBRXWEtlaBHFcU410LE=;
  b=jxWSefAJdXp43v5KPeEjOoFYtxhfNEO2eoSi5aqsbZNjJf5uQXBxNYeg
   Ta7UdA0jGmM1Er5QINlLKStMU1PsQG4Jhxyl9IvdafMl720Kzi6JlAlJo
   dWn6gtOi6MxGHipdRb/PuvUlv6hUhVvilrdKN/06Vjjh/SZLypbsXdvGy
   yL02hOcF9vw9Hv1tW/nyj3+rS+cJir+TsAcUQai6cKaTk5n11Ycl8JE79
   Ljc3C1oOPO5ZZuQspyLwxfem0IlCPXw88W6iKk0t15zPDEv6GVoUyDege
   PjTm/8Y8NfYwdLLEI2Nt0aKhQJcY8mY4wyJagGQYTNzw8ncm3e2kBRtX9
   g==;
X-CSE-ConnectionGUID: bxMLVpxyQuWxeUEKqR8OqQ==
X-CSE-MsgGUID: UX66Hum9SWSKha8GQ2PE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="41225366"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="41225366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 09:54:03 -0800
X-CSE-ConnectionGUID: Oggg+sUxRwKl3CpBeTonqQ==
X-CSE-MsgGUID: f1z+8ZRxRiiwJmzeixHWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108112526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2025 09:54:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc6pZ-000fbf-1Q;
	Sun, 26 Jan 2025 17:53:57 +0000
Date: Mon, 27 Jan 2025 01:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2441/2441]
 drivers/vfio/mdev/idxd/mdev.c:1278:68: warning: passing argument 2 of
 '(vfio_pdev->region + (sizetype)((long unsigned int)index * 40))->ops->rw'
 discards 'const' qualifier from pointer target type
Message-ID: <202501270126.RJVLSQqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: 3fc743601586ae7d5e07907a94af65a8112159d4 [2441/2441] vfio: idxd: wholesale copy over 5.12 PO kernel mdev driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250127/202501270126.RJVLSQqz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270126.RJVLSQqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270126.RJVLSQqz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/vfio/mdev/idxd/mdev.c:5:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/init.h:5,
                    from drivers/vfio/mdev/idxd/mdev.c:3:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/vfio/mdev/idxd/mdev.c: In function 'idxd_vdcm_write':
>> drivers/vfio/mdev/idxd/mdev.c:1278:68: warning: passing argument 2 of '(vfio_pdev->region + (sizetype)((long unsigned int)index * 40))->ops->rw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1278 |                 return vfio_pdev->region[index].ops->rw(vfio_pdev, buf, count, ppos, true);
         |                                                                    ^~~
   drivers/vfio/mdev/idxd/mdev.c:1278:68: note: expected 'char *' but argument is of type 'const char *'
--
   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/vfio/mdev/idxd/vdev.c:5:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/init.h:5,
                    from drivers/vfio/mdev/idxd/vdev.c:3:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/vfio/mdev/idxd/vdev.c: In function 'vidxd_wq_enable':
   drivers/vfio/mdev/idxd/vdev.c:1197:30: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    1197 |                 if (wq_pasid >= 0) {
         |                              ^~
   drivers/vfio/mdev/idxd/vdev.c: At top level:
>> drivers/vfio/mdev/idxd/vdev.c:1290:6: warning: no previous prototype for 'vidxd_free_ims_entries' [-Wmissing-prototypes]
    1290 | void vidxd_free_ims_entries(struct vdcm_idxd *vidxd)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +1278 drivers/vfio/mdev/idxd/mdev.c

  1252	
  1253	static ssize_t idxd_vdcm_write(struct vfio_device *vdev, const char __user *buf, size_t count,
  1254				       loff_t *ppos)
  1255	{
  1256		struct vdcm_idxd *vidxd = vdev_to_vidxd(vdev);
  1257		unsigned int index = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
  1258		unsigned int done = 0;
  1259		int rc;
  1260	
  1261		switch (index) {
  1262		case VFIO_PCI_CONFIG_REGION_INDEX:
  1263		case VFIO_PCI_BAR0_REGION_INDEX:
  1264		case VFIO_PCI_BAR1_REGION_INDEX:
  1265		case VFIO_PCI_BAR2_REGION_INDEX:
  1266		case VFIO_PCI_BAR3_REGION_INDEX:
  1267		case VFIO_PCI_BAR4_REGION_INDEX:
  1268		case VFIO_PCI_BAR5_REGION_INDEX:
  1269		case VFIO_PCI_VGA_REGION_INDEX:
  1270		case VFIO_PCI_ROM_REGION_INDEX:
  1271			break;
  1272		default: {
  1273			struct vfio_pci_core_device *vfio_pdev = &vidxd->vfio_pdev;
  1274			struct device *dev = vdev->dev;
  1275	
  1276			dev_dbg(dev, "vendor specific region: %u\n", index);
  1277			index -= VFIO_PCI_NUM_REGIONS;
> 1278			return vfio_pdev->region[index].ops->rw(vfio_pdev, buf, count, ppos, true);
  1279		} /* end default */
  1280		} /* end switch(index) */
  1281	
  1282		mutex_lock(&vidxd->dev_lock);
  1283		while (count) {
  1284			size_t filled;
  1285	
  1286			if (count >= 4 && !(*ppos % 4)) {
  1287				u32 val;
  1288	
  1289				if (copy_from_user(&val, buf, sizeof(val)))
  1290					goto write_err;
  1291	
  1292				rc = idxd_vdcm_rw(vdev, (char *)&val, sizeof(val),
  1293						  ppos, IDXD_VDCM_WRITE);
  1294				if (rc <= 0)
  1295					goto write_err;
  1296	
  1297				filled = 4;
  1298			} else if (count >= 2 && !(*ppos % 2)) {
  1299				u16 val;
  1300	
  1301				if (copy_from_user(&val, buf, sizeof(val)))
  1302					goto write_err;
  1303	
  1304				rc = idxd_vdcm_rw(vdev, (char *)&val,
  1305						  sizeof(val), ppos, IDXD_VDCM_WRITE);
  1306				if (rc <= 0)
  1307					goto write_err;
  1308	
  1309				filled = 2;
  1310			} else {
  1311				u8 val;
  1312	
  1313				if (copy_from_user(&val, buf, sizeof(val)))
  1314					goto write_err;
  1315	
  1316				rc = idxd_vdcm_rw(vdev, &val, sizeof(val),
  1317						  ppos, IDXD_VDCM_WRITE);
  1318				if (rc <= 0)
  1319					goto write_err;
  1320	
  1321				filled = 1;
  1322			}
  1323	
  1324			count -= filled;
  1325			done += filled;
  1326			*ppos += filled;
  1327			buf += filled;
  1328		}
  1329	
  1330		mutex_unlock(&vidxd->dev_lock);
  1331		return done;
  1332	
  1333	write_err:
  1334		mutex_unlock(&vidxd->dev_lock);
  1335		return -EFAULT;
  1336	}
  1337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
