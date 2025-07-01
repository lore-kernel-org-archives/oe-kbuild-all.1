Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D21F3B98
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391982; cv=none; b=R4C9kM8jsq4kkbLfD8wlhcf6J1eitP6uDzWOCIiGOlYY+NuMGJeujYD4ZeqSssZGv0j+ykZCD3OJwSqIVPPgGKUCutqt+tBfsFi+oYlbYXB3S66dPTw8gfooxl9/ALUyMC9prx8Wy26kyLRM2qan4EX/Ifcbc7McgSuhj4DzJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391982; c=relaxed/simple;
	bh=cpoRfTmyCrCNqpUYqCt0YeeTGP2wJSmz7AhoM5/BarM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fvs8yYVU84t9DLiQVOuoI4x421w9hwM/BKILOHt57p+vVYX8DF1FD8KbgP1SDWGRgXrqEhLExwWtNQVkB0brGsYscuPSLm7JTWjqOLb6lrsvKYFwoWV2gCAUntgiFlsDuBEpKMG4CGNY/KuU3c47HNjmQAXGaZag9etz7ki9Kgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7GuvDIf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7GuvDIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751391980; x=1782927980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cpoRfTmyCrCNqpUYqCt0YeeTGP2wJSmz7AhoM5/BarM=;
  b=Q7GuvDIf4+Y9qsf2MojnOOf331Lt0Rjlsvutma/11JFqtIzElnyGNRJD
   N4181ow2nyu6LtdtrNJPEX4yLDAWFeO8ZK47pCapM48v6AWZoroO1d871
   S+3HrUjBP62CvA5Cv0bi4kRIdK0jQAU9CdjBJVOrxDfgjPCFgvoUkhi4l
   lxFKn6noQze9HCvuLNuknbEiuAMPyEWExUdwsR2LzcL7i0BBAY7B2ZBqO
   6YYiSEplAuzIymfCKeaOvn84TnWm8srv/cedDek4w8OaQpFlQg6GI8xVr
   vq7mZwBLTwYr+QdEta8KJzQWeFcEriUd/iORY629lSxpV2Sl0Q5QvcLeo
   Q==;
X-CSE-ConnectionGUID: fEWI3Y/wRPCD6vO8jr6ffg==
X-CSE-MsgGUID: EOocbb24RbOfUrQ8HtQqeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="63918694"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="63918694"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 10:46:19 -0700
X-CSE-ConnectionGUID: 1EFZaMofRJul3rN0b1kcVg==
X-CSE-MsgGUID: vKXyVQJLTkqdjC/B2pV98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154328737"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2025 10:46:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWf3e-000aUw-37;
	Tue, 01 Jul 2025 17:46:14 +0000
Date: Wed, 2 Jul 2025 01:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [brauner-github:vfs-6.17.fileattr 1/7] fs/file_attr.c: warning:
 EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
Message-ID: <202507020107.NpprY3Cl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.17.fileattr
head:   ab24d0a80c8ca08997b98763c51da02c059d103b
commit: 3f15b5042327fa755f668b534c88e515a44e10c1 [1/7] fs: split fileattr related helpers into separate file
config: x86_64-buildonly-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020107.NpprY3Cl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020107.NpprY3Cl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020107.NpprY3Cl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/matrox/matroxfb_DAC1064.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/matrox/matroxfb_Ti3026.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/matrox/matroxfb_accel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/matrox/matroxfb_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/matrox/matroxfb_g450.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/matrox/matroxfb_misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap/lcd_dma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap/lcdc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap/omapfb_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/apply.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/display.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/dss-of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/dss_features.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/output.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/overlay.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/dss/venc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/omap2/omapfb/vrfb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/pxafb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/sbuslib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/via/via-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/via/via_i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/fbdev/wmt_ge_rops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/logo/logo.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/nomodeset.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/screen_info_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/sticore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/video/vgastate.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virt/coco/guest/report.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virt/coco/guest/tsm-mr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virt/fsl_hypervisor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virt/vboxguest/vboxguest_linux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virt/vboxguest/vboxguest_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_anchor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_dma_buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_pci_admin_legacy_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_pci_legacy_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_pci_modern.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_pci_modern_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/virtio/virtio_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/w1/slaves/w1_ds2780.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/w1/slaves/w1_ds2781.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/w1/w1_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/watchdog/iTCO_vendor_support.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/watchdog/watchdog_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/watchdog/watchdog_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/watchdog/watchdog_pretimeout.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/balloon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/events/events_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/grant-table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/mem-reservation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/privcmd-buf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/privcmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/pvcalls-front.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/unpopulated-alloc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xen-balloon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xen-front-pgdir-shbuf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xenbus/xenbus_dev_frontend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xenbus/xenbus_probe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xenbus/xenbus_probe_frontend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xenbus/xenbus_xs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/xen/xlate_mmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/zorro/zorro-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/zorro/zorro.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/anon_inodes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/backing-file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/bcachefs/thread_with_file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/char_dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/configfs/dir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/configfs/item.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/bio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/crypto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/fname.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/hooks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/inline_crypt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/keyring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/keysetup.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/crypto/policy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/dax.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/debugfs/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/debugfs/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/direct-io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/dlm/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/dlm/plock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/exportfs/expfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fat/dir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fat/fatent.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fat/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fat/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fat/misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fcntl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> fs/file_attr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/file_table.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/filesystems.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fs_context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fuse/dax.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fuse/dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fuse/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fuse/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/fuse/ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/hostfs/hostfs_user_exp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/buffered-io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/direct-io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/fiemap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/ioend.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/seek.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/iomap/swapfile.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/jbd2/commit.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/jbd2/journal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/jbd2/transaction.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/kernel_read_file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/kernfs/dir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/kernfs/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/lockd/clntlock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/lockd/clntproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/lockd/svc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/lockd/svcsubs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/locks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/mbcache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/mnt_idmapping.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/fscache_cookie.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/fscache_io.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/fscache_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/fscache_stats.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/locking.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/misc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/netfs/rolling_buffer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/delegation.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/dir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/direct.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/fs_context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/fscache.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/inode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/localio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/namespace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs3client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs42proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4idmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4proc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4session.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4state.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/nfs4xdr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/pnfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/pnfs_nfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/read.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/super.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs/sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs_common/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs_common/grace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs_common/nfs_ssc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs_common/nfsacl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nfs_common/nfslocalio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nls/nls_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nls/nls_ucs2_utils.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/notify/fsnotify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/notify/group.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/notify/mark.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/notify/notification.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/nsfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/cluster/heartbeat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/cluster/masklog.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/cluster/nodemanager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/dlm/dlmdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/dlm/dlmlock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/dlm/dlmunlock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/ocfs2/stackglue.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/open.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/pipe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/proc/generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/proc/proc_net.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/proc/proc_sysctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/pstore/blk.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/pstore/ftrace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/pstore/platform.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/pstore/zone.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/quota/dquot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/quota/netlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/quota/quota_tree.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/smb/common/cifs_arc4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/smb/common/cifs_md4.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/sysfs/dir.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/sysfs/file.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/sysfs/group.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/sysfs/symlink.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/unicode/mkutf8data.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/unicode/utf8-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/unicode/utf8-norm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/verity/enable.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   fs/verity/measure.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
