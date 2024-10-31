Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648B01A0BFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385872; cv=none; b=iwTJuK3S2O6ErO65KzFsqnn5XGaitTUFkJ4upGOYOW7uvmoXlF1etxsr1TWSEJWDkZPOHWWsGT/LrXaG9rmqhFpt8TyQYa3m1b9sBtY0sCnZw9lhmbGK0i9LbJoBh+baXHWj0llgzrxLOPmtOdAn7bcWVWOWxJJzJ7qMDPP7b9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385872; c=relaxed/simple;
	bh=yiTo9/Qupkt0THvl5qXfssUdSAf/2g0rB5JXT3kZR98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsgCIKoKqB36EycDpdUTzqvvIOcPkz6CuUynS8EvpEH4JIA3KOU09qTpcSHEWIqCoW/DLOXX0bZ1w7y9z/L9JdxfSZxNAtjoFE5rx6V65OHQ9trfXUpOCqiKUrU8TRYnV7tzz9Ge0xA50el0dYLlPYm0ZpKY25Mx96J3fMWF2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1Ei64sP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1Ei64sP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730385869; x=1761921869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiTo9/Qupkt0THvl5qXfssUdSAf/2g0rB5JXT3kZR98=;
  b=I1Ei64sP6BAGeKBBsk/eB3YE02icGQCNdiUxfTBiIpLH3dPEjbsjUOG5
   GW2cjHoa/Da8rQnfV3XtKij0WSFHCcWfgvlhswxwQ1RbQRnU9b8JTA+T6
   STGmBu9D8wXsf9UQKnDdseTUW91s2URzjgEGTtcggjrXjAVJ+xPtngfkK
   HrpdEpyPjs9c52BQZzAPKK9C2SS2BztvHKG+An/PVfqKhGqEt+1w0nmQ0
   sqP62WivJPpJcHzKoUYiKXFW2XXthj20es0ducaUKtYtf9L4ffR+prKpD
   A6hG/IH6AOXq8EWD5KDxdRYjubNxsxr8TxwuI4nltkQOgRAEq8cv6oN9d
   A==;
X-CSE-ConnectionGUID: jproyUEBSbOqfWPhQbaT7Q==
X-CSE-MsgGUID: X0zFcTj/QGy3JzuEcNFvNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30317627"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30317627"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:44:29 -0700
X-CSE-ConnectionGUID: OpQkWATTSkOzJ+uF0nFKxA==
X-CSE-MsgGUID: U/ACCSR3RJ23541I10LdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82977661"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Oct 2024 07:44:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6WPR-000gKg-1o;
	Thu, 31 Oct 2024 14:44:25 +0000
Date: Thu, 31 Oct 2024 22:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/dma-buf/dma-buf.c:696:29: error: incompatible pointer types passing
 'struct dma_buf *' to parameter of type 'struct file *'
Message-ID: <202410312241.WtAJFD4Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   407ebc2cb07f635969017e0a054ab71788aa96dc
commit: 407ebc2cb07f635969017e0a054ab71788aa96dc [2/2] BACKPORT: FROMLIST: dma-buf: Move sysfs work out of DMA-BUF export path
config: arm-imx_v4_v5_defconfig (https://download.01.org/0day-ci/archive/20241031/202410312241.WtAJFD4Y-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312241.WtAJFD4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312241.WtAJFD4Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:696:29: error: incompatible pointer types passing 'struct dma_buf *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
           __dma_buf_debugfs_list_del(dmabuf);
                                      ^~~~~~
   drivers/dma-buf/dma-buf.c:63:53: note: passing argument to parameter 'file' here
   static void __dma_buf_debugfs_list_del(struct file *file)
                                                       ^
   1 error generated.


vim +696 drivers/dma-buf/dma-buf.c

   574	
   575	/**
   576	 * DOC: dma buf device access
   577	 *
   578	 * For device DMA access to a shared DMA buffer the usual sequence of operations
   579	 * is fairly simple:
   580	 *
   581	 * 1. The exporter defines his exporter instance using
   582	 *    DEFINE_DMA_BUF_EXPORT_INFO() and calls dma_buf_export() to wrap a private
   583	 *    buffer object into a &dma_buf. It then exports that &dma_buf to userspace
   584	 *    as a file descriptor by calling dma_buf_fd().
   585	 *
   586	 * 2. Userspace passes this file-descriptors to all drivers it wants this buffer
   587	 *    to share with: First the file descriptor is converted to a &dma_buf using
   588	 *    dma_buf_get(). Then the buffer is attached to the device using
   589	 *    dma_buf_attach().
   590	 *
   591	 *    Up to this stage the exporter is still free to migrate or reallocate the
   592	 *    backing storage.
   593	 *
   594	 * 3. Once the buffer is attached to all devices userspace can initiate DMA
   595	 *    access to the shared buffer. In the kernel this is done by calling
   596	 *    dma_buf_map_attachment() and dma_buf_unmap_attachment().
   597	 *
   598	 * 4. Once a driver is done with a shared buffer it needs to call
   599	 *    dma_buf_detach() (after cleaning up any mappings) and then release the
   600	 *    reference acquired with dma_buf_get() by calling dma_buf_put().
   601	 *
   602	 * For the detailed semantics exporters are expected to implement see
   603	 * &dma_buf_ops.
   604	 */
   605	
   606	/**
   607	 * dma_buf_export - Creates a new dma_buf, and associates an anon file
   608	 * with this buffer, so it can be exported.
   609	 * Also connect the allocator specific data and ops to the buffer.
   610	 * Additionally, provide a name string for exporter; useful in debugging.
   611	 *
   612	 * @exp_info:	[in]	holds all the export related information provided
   613	 *			by the exporter. see &struct dma_buf_export_info
   614	 *			for further details.
   615	 *
   616	 * Returns, on success, a newly created struct dma_buf object, which wraps the
   617	 * supplied private data and operations for struct dma_buf_ops. On either
   618	 * missing ops, or error in allocating struct dma_buf, will return negative
   619	 * error.
   620	 *
   621	 * For most cases the easiest way to create @exp_info is through the
   622	 * %DEFINE_DMA_BUF_EXPORT_INFO macro.
   623	 */
   624	struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
   625	{
   626		struct dma_buf *dmabuf;
   627		struct dma_resv *resv = exp_info->resv;
   628		struct file *file;
   629		size_t alloc_size = sizeof(struct dma_buf);
   630		int ret;
   631	
   632		if (WARN_ON(!exp_info->priv || !exp_info->ops
   633			    || !exp_info->ops->map_dma_buf
   634			    || !exp_info->ops->unmap_dma_buf
   635			    || !exp_info->ops->release))
   636			return ERR_PTR(-EINVAL);
   637	
   638		if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
   639			    (exp_info->ops->pin || exp_info->ops->unpin)))
   640			return ERR_PTR(-EINVAL);
   641	
   642		if (WARN_ON(!exp_info->ops->pin != !exp_info->ops->unpin))
   643			return ERR_PTR(-EINVAL);
   644	
   645		if (!try_module_get(exp_info->owner))
   646			return ERR_PTR(-ENOENT);
   647	
   648		file = dma_buf_getfile(exp_info->size, exp_info->flags);
   649		if (IS_ERR(file)) {
   650			ret = PTR_ERR(file);
   651			goto err_module;
   652		}
   653	
   654		if (!exp_info->resv)
   655			alloc_size += sizeof(struct dma_resv);
   656		else
   657			/* prevent &dma_buf[1] == dma_buf->resv */
   658			alloc_size += 1;
   659		dmabuf = kzalloc(alloc_size, GFP_KERNEL);
   660		if (!dmabuf) {
   661			ret = -ENOMEM;
   662			goto err_file;
   663		}
   664	
   665		dmabuf->priv = exp_info->priv;
   666		dmabuf->ops = exp_info->ops;
   667		dmabuf->size = exp_info->size;
   668		dmabuf->exp_name = exp_info->exp_name;
   669		dmabuf->owner = exp_info->owner;
   670		spin_lock_init(&dmabuf->name_lock);
   671		init_waitqueue_head(&dmabuf->poll);
   672		dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
   673		dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
   674		INIT_LIST_HEAD(&dmabuf->attachments);
   675	
   676		if (!resv) {
   677			dmabuf->resv = (struct dma_resv *)&dmabuf[1];
   678			dma_resv_init(dmabuf->resv);
   679		} else {
   680			dmabuf->resv = resv;
   681		}
   682	
   683		file->private_data = dmabuf;
   684		file->f_path.dentry->d_fsdata = dmabuf;
   685		dmabuf->file = file;
   686	
   687		__dma_buf_debugfs_list_add(dmabuf);
   688	
   689		ret = dma_buf_stats_setup(dmabuf, file);
   690		if (ret)
   691			goto err_sysfs;
   692	
   693		return dmabuf;
   694	
   695	err_sysfs:
 > 696		__dma_buf_debugfs_list_del(dmabuf);
   697		dmabuf->file = NULL;
   698		file->f_path.dentry->d_fsdata = NULL;
   699		file->private_data = NULL;
   700		if (!resv)
   701			dma_resv_fini(dmabuf->resv);
   702		kfree(dmabuf);
   703	err_file:
   704		fput(file);
   705	err_module:
   706		module_put(exp_info->owner);
   707		return ERR_PTR(ret);
   708	}
   709	EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
