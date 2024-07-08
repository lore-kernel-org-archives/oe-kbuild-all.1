Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0F918E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 00:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720397131; cv=none; b=pVyecOeyRqcoZHCUQC/YXA/inOaufNhZ87SDLKShmXS/AG+H1U9ucAsCLuOv/WMh3IF2xrzb2FZyZUA0qVOogPXMtAKsfSl+sPGEpgB3fmuKIahIpJHwhGPo/MoVL4+Pt/JnG3Xw9Z+Tnn/MTb0KR+qwSEswK6JeILkJZNE01I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720397131; c=relaxed/simple;
	bh=Iby0qGl8rlX3Er0DYgWm4obm8quWl8NmO4EUJX5B5V8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5rcOjQ2cArqnBfcSFX3MYXYymcXg+/XfltFnp3J12Ao+HFbCHJ36LsErwmkFbJ7LiZzxIJeKrSKbZyA9aIAgoecUnfECPETJ+069PZL8TPfyWtHxmU7+Mu3pxDMlzvkUT+mbLsxJUjtPMd0sI+7t7CDVsa+7Z+swHuOAzsutrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjvGahIV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjvGahIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720397128; x=1751933128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iby0qGl8rlX3Er0DYgWm4obm8quWl8NmO4EUJX5B5V8=;
  b=fjvGahIVUOMSnvC12Xe8NFK+/Svckv4vbe7td0Dpec40/nCenJcCRGGc
   jvFvGsqKlgaT9yVzJrgMIansgpdzjV2eqiU/WYPaJJGhFfcwBb6MC7PSJ
   fZdRS1eKUKnvtk7pU716uf3HoxuSt6QmjefuW+MhKB2FcHC/KE2S2RjjT
   2S0QkWtC43bx4dh5KonSdxq8Z+H0bA3l9OsoCnUVS/vf8Ia88e80z8M03
   vWB/hSQ1zCW0BNE7wsEMBb8DrjB658aSUTW8YvULMTk95smKJoaqjO+tU
   loGXDt1cLOix0kbLl46BQMCabslwuzTy3F1B6buWbNpaZgaP1r2I2SiaY
   g==;
X-CSE-ConnectionGUID: YarhGOZBRCeuMQxZ54X3dQ==
X-CSE-MsgGUID: qt11qEIPQrSP3dAMbQaR5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17402971"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17402971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 17:05:28 -0700
X-CSE-ConnectionGUID: I1MVYdzUQhuaeycT6V10Bw==
X-CSE-MsgGUID: HIsjpAsHT2aIv8t3Bi4Oag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47403897"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2024 17:05:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQbsh-000VNy-15;
	Mon, 08 Jul 2024 00:05:23 +0000
Date: Mon, 8 Jul 2024 08:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 150/150]
 drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:911:15: error:
 call to undeclared function 'phys_to_page'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202407080811.wZ15E3tQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brandon,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   e298dab666632b6f62ed61eac35813331341c3aa
commit: 882d9360984568792cc0fd52aee488411771f76d [150/150] media: imagination: Clean Up Imagination Directory
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240708/202407080811.wZ15E3tQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080811.wZ15E3tQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080811.wZ15E3tQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:911:15: error: call to undeclared function 'phys_to_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                    ^
>> drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:911:13: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
     911 |                         new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
         |                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c:778:6: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
     778 |         int pages;
         |             ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +/phys_to_page +911 drivers/media/platform/imagination/vxe-vxd/decoder/vxd_v4l2.c

0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  764  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  765  static int vxd_dec_buf_prepare(struct vb2_buffer *vb)
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  766  {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  767  	struct vxd_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  768  	struct device *dev = ctx->dev->dev;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  769  	struct vxd_dec_q_data *q_data;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  770  	void *sgt;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  771  #ifdef CAPTURE_CONTIG_ALLOC
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  772  	struct page *new_page;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  773  #else
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  774  	void *sgl;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  775  #endif
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  776  	struct sg_table *sgt_new;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  777  	void *sgl_new;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  778  	int pages;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  779  	int nents = 0;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  780  	int size = 0;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  781  	int plane, num_planes, ret = 0;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  782  	unsigned long dma_addr;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  783  	struct vxd_mapping *mapping;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  784  	struct list_head *list;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  785  	struct vxd_buffer *buf =
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  786  		container_of(vb, struct vxd_buffer, buffer.vb.vb2_buf);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  787  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  788  	q_data = get_q_data(ctx, vb->vb2_queue->type);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  789  	if (!q_data)
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  790  		return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  791  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  792  	num_planes = q_data->fmt->num_planes;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  793  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  794  	for (plane = 0; plane < num_planes; plane++) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  795  		if (vb2_plane_size(vb, plane) < q_data->size_image[plane]) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  796  			dev_err(dev, "data will not fit into plane (%lu < %lu)\n",
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  797  				vb2_plane_size(vb, plane),
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  798  				(long)q_data->size_image[plane]);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  799  			return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  800  		}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  801  	}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  802  
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  803  	if (buf->mapped && !V4L2_TYPE_IS_OUTPUT(vb->type)) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  804  #ifdef CAPTURE_CONTIG_ALLOC
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  805  		dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  806  #else
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  807  		sgt = vb2_dma_sg_plane_desc(vb, 0);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  808  		if (!sgt)
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  809  			return -EFAULT;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  810  
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  811  		dma_addr = sg_phys(img_mmu_get_sgl(sgt));
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  812  #endif
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  813  		if (buf->buf_info.dma_addr != dma_addr) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  814  			list_for_each(list, &ctx->cap_mappings) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  815  				mapping = list_entry(list, struct vxd_mapping, list);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  816  				if (dma_addr == mapping->dma_addr)
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  817  					break;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  818  
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  819  				mapping = NULL;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  820  			}
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  821  			if (mapping) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  822  				/* skip the mapping, buf update buf_map_id */
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  823  				buf->buf_info.dma_addr = mapping->dma_addr;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  824  				buf->buf_map_id = mapping->buf_map_id;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  825  				buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  826  				buf->mapping = mapping;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  827  				return 0;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  828  			}
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  829  		} else {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  830  			return 0;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  831  		}
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  832  	} else if (buf->mapped) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  833  		return 0;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  834  	}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  835  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  836  	buf->buf_info.cpu_linear_addr = vb2_plane_vaddr(vb, 0);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  837  	buf->buf_info.buf_size = vb2_plane_size(vb, 0);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  838  	buf->buf_info.fd = -1;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  839  	sgt = vb2_dma_sg_plane_desc(vb, 0);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  840  	if (!sgt) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  841  		dev_err(dev, "Could not get sg_table from plane 0\n");
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  842  		return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  843  	}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  844  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  845  	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  846  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  847  		ret = core_stream_map_buf_sg(ctx->res_str_id,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  848  					     VDEC_BUFTYPE_BITSTREAM,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  849  					     &buf->buf_info, sgt,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  850  					     &buf->buf_map_id);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  851  		if (ret) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  852  			dev_err(dev, "OUTPUT core_stream_map_buf_sg failed\n");
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  853  			return ret;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  854  		}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  855  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  856  		buf->bstr_info.buf_size = q_data->size_image[0];
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  857  		buf->bstr_info.cpu_virt_addr = buf->buf_info.cpu_linear_addr;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  858  		buf->bstr_info.mem_attrib =
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  859  			SYS_MEMATTRIB_UNCACHED | SYS_MEMATTRIB_WRITECOMBINE |
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  860  			SYS_MEMATTRIB_INPUT | SYS_MEMATTRIB_CPU_WRITE;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  861  		buf->bstr_info.bufmap_id = buf->buf_map_id;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  862  		lst_init(&buf->seq_unit.bstr_seg_list);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  863  		lst_init(&buf->pic_unit.bstr_seg_list);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  864  		lst_init(&buf->end_unit.bstr_seg_list);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  865  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  866  		list_add_tail(&buf->list, &ctx->out_buffers);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  867  	} else {
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  868  #ifdef CAPTURE_CONTIG_ALLOC
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  869  		buf->buf_info.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  870  #else
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  871  		buf->buf_info.dma_addr = sg_phys(img_mmu_get_sgl(sgt));
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  872  #endif
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  873  		/* Create a single sgt from the plane(s) */
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  874  		sgt_new = kmalloc(sizeof(*sgt_new), GFP_KERNEL);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  875  		if (!sgt_new)
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  876  			return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  877  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  878  		for (plane = 0; plane < num_planes; plane++) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  879  			size += ALIGN(vb2_plane_size(vb, plane), PAGE_SIZE);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  880  			sgt = vb2_dma_sg_plane_desc(vb, plane);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  881  			if (!sgt) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  882  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  883  				kfree(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  884  				return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  885  			}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  886  #ifdef CAPTURE_CONTIG_ALLOC
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  887  			nents += 1;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  888  #else
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  889  			nents += sg_nents(img_mmu_get_sgl(sgt));
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  890  #endif
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  891  		}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  892  		buf->buf_info.buf_size = size;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  893  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  894  		pages = (size + PAGE_SIZE - 1) / PAGE_SIZE;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  895  		ret = sg_alloc_table(sgt_new, nents, GFP_KERNEL);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  896  		if (ret) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  897  			kfree(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  898  			return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  899  		}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  900  		sgl_new = img_mmu_get_sgl(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  901  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  902  		for (plane = 0; plane < num_planes; plane++) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  903  			sgt = vb2_dma_sg_plane_desc(vb, plane);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  904  			if (!sgt) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  905  				dev_err(dev, "Could not get sg_table from plane %d\n", plane);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  906  				sg_free_table(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  907  				kfree(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  908  				return -EINVAL;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  909  			}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  910  #ifdef CAPTURE_CONTIG_ALLOC
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16 @911  			new_page = phys_to_page(vb2_dma_contig_plane_dma_addr(vb, plane));
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  912  			sg_set_page(sgl_new, new_page, ALIGN(vb2_plane_size(vb, plane),
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  913  							     PAGE_SIZE), 0);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  914  			sgl_new = sg_next(sgl_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  915  #else
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  916  			sgl = img_mmu_get_sgl(sgt);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  917  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  918  			while (sgl) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  919  				sg_set_page(sgl_new, sg_page(sgl), img_mmu_get_sgl_length(sgl), 0);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  920  				sgl = sg_next(sgl);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  921  				sgl_new = sg_next(sgl_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  922  			}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  923  #endif
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  924  		}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  925  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  926  		buf->buf_info.pictbuf_cfg = ctx->pict_bufcfg;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  927  		ret = core_stream_map_buf_sg(ctx->res_str_id,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  928  					     VDEC_BUFTYPE_PICTURE,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  929  					     &buf->buf_info, sgt_new,
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  930  					     &buf->buf_map_id);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  931  		sg_free_table(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  932  		kfree(sgt_new);
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  933  		if (ret) {
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  934  			dev_err(dev, "CAPTURE core_stream_map_buf_sg failed\n");
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  935  			return ret;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  936  		}
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  937  		if (buf->mapped == FALSE)
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  938  			list_add_tail(&buf->list, &ctx->cap_buffers);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  939  
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  940  		/* Add this to the mappings */
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  941  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  942  
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  943  		mapping->reuse = TRUE;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  944  		mapping->dma_addr = buf->buf_info.dma_addr;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  945  		mapping->buf_map_id = buf->buf_map_id;
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  946  		list_add_tail(&mapping->list, &ctx->cap_mappings);
c0bb27fbf54264 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  947  		buf->mapping = mapping;
aa10134363cd01 drivers/media/platform/img/vxe-vxd/decoder/vxd_v4l2.c Darren Etheridge 2024-06-16  948  		mapping->buf = buf;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  949  	}
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  950  	buf->mapped = TRUE;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  951  
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  952  	return 0;
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  953  }
0c96853f1e6466 drivers/media/platform/vxe-vxd/decoder/vxd_v4l2.c     Sidraya          2024-06-16  954  

:::::: The code at line 911 was first introduced by commit
:::::: 0c96853f1e64665ced67561de84734bc85d30eca media: vxe-vxd: decoder: Add V4L2 Interface function implementations

:::::: TO: Sidraya <sidraya.bj@pathpartnertech.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
