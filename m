Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9F8CA58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692258888; x=1723794888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxiFc3ACQMmGxVmffAXT4v35i0NFXFw30i+PXUuscTo=;
  b=V2Gsl2AdTOzrilxceqRmZNhRk/howP/iK9CHX2I/aWjd9PCrVVhLiJhA
   4aGQmwy53WjosnkB+K6jwgAR24oiSdYAat4cb0Tno7zbPjYTJ0ruSqPDL
   6QVYPEn2sjk1wH28nB2LyWljE+XAbrpUnKE44zzTBWAfUquo+UGb0DUBi
   JrCT4ATc+fPwau8F5/whvA9h8itTV/1ICqpcw6bP1NLzWTKiXRsWSK4qG
   IwzIlcpiYVeC13w4zr6XY7bqD9/9cxadg2Z0Y7C1SzfNyH6/r4h+cLZah
   +n1k8xLgx0vUgWpFwLyucQKpRO7jUmNDycGhZMEU6wUnmRXz+xm5NjtMp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357707715"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="357707715"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="711435492"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="711435492"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 00:54:40 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXq3-0000vD-0M;
	Thu, 17 Aug 2023 07:54:39 +0000
Date: Thu, 17 Aug 2023 15:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] drivers/dma-buf/dma-buf.c:1285:
 warning: bad line:                         range.
Message-ID: <202308171547.hEsJO6Ur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   4c73cba07b12a4d043898dd89c7590b9fbe57ab8
commit: 7216484575e098e8d295bb9d0d6f3b4084a332ca [1/1] ANDROID: dma-buf: Return EOPNOTSUPP in dma_buf_begin_cpu_access_partial
config: i386-randconfig-i053-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171547.hEsJO6Ur-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171547.hEsJO6Ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171547.hEsJO6Ur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c:385: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:385: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> drivers/dma-buf/dma-buf.c:1285: warning: bad line:                         range.
   drivers/dma-buf/dma-buf.c:1364: warning: bad line:                         range.


vim +1285 drivers/dma-buf/dma-buf.c

  1272	
  1273	
  1274	/**
  1275	 * dma_buf_begin_cpu_access_partial - An alternative to dma_buf_begin_cpu_access
  1276	 * which applies to a subset of the buffer instead of the entire buffer. This
  1277	 * can offer better performance than dma_buf_begin_cpu_access if implemented
  1278	 * by an exporter. If an exporter does not implement partial buffer access then
  1279	 * this function will return -EOPNOTSUPP and it is the responsibility of the
  1280	 * caller to fallback to dma_buf_begin_cpu_access or fail entirely.
  1281	 *
  1282	 * @dmabuf:	[in]	buffer to prepare cpu access for.
  1283	 * @direction:	[in]	direction for access.
  1284	 * @offset:	[in]	offset in bytes from beginning of buffer for partial
> 1285				range.
  1286	 * @len:	[in]	length in bytes of partial range beginning at @offset.
  1287	 *
  1288	 * After the cpu access is complete the caller should call
  1289	 * dma_buf_end_cpu_access_partial(). Only when cpu access is bracketed by both
  1290	 * calls is it guaranteed to be coherent with other DMA access.
  1291	 *
  1292	 * This function will also wait for any DMA transactions tracked through
  1293	 * implicit synchronization in &dma_buf.resv. For DMA transactions with explicit
  1294	 * synchronization this function will only ensure cache coherency, callers must
  1295	 * ensure synchronization with such DMA transactions on their own.
  1296	 *
  1297	 * Can return negative error values, returns 0 on success.
  1298	 */
  1299	int dma_buf_begin_cpu_access_partial(struct dma_buf *dmabuf,
  1300					     enum dma_data_direction direction,
  1301					     unsigned int offset, unsigned int len)
  1302	{
  1303		int ret;
  1304	
  1305		if (WARN_ON(!dmabuf))
  1306			return -EINVAL;
  1307	
  1308		if (!dmabuf->ops->begin_cpu_access_partial)
  1309			return -EOPNOTSUPP;
  1310	
  1311		ret = dmabuf->ops->begin_cpu_access_partial(dmabuf, direction,
  1312							    offset, len);
  1313	
  1314		/* Ensure that all fences are waited upon - but we first allow
  1315		 * the native handler the chance to do so more efficiently if it
  1316		 * chooses. A double invocation here will be reasonably cheap no-op.
  1317		 */
  1318		if (ret == 0)
  1319			ret = __dma_buf_begin_cpu_access(dmabuf, direction);
  1320	
  1321		return ret;
  1322	}
  1323	EXPORT_SYMBOL_GPL(dma_buf_begin_cpu_access_partial);
  1324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
