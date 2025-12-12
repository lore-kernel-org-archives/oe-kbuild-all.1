Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED59B274B35
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765548007; cv=none; b=WY+7cQttFlFMrIthxjMq/N6uOo/3vFO7eigydABtJPB2TkBwt37QqEngKDhCaAMMnv+r8ko1SUxeQVJ+zEQq7v9tCni645KX2C0NxqEgLwTGbaggOUZA6SZVk6e6Ysj5a9ty0megEpNj7qz7yOpAjHrY9FobKwcKdMBgKtQAfc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765548007; c=relaxed/simple;
	bh=b3GLY3SReSFUO/67yDF3bBMRqUCTJUpExjUXZHcdufY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAxLi2bC2IMr+VZtpjcf5zv8bHxNJUWPEMNRnLC++ILTIHkI7XLStzJYWQJWu8m6VDoKdmVQmnC03RGy6wJ2VfY6Z/hdcMuRVishPiLEuErr5IdclMNexgCUPs0Fhpl2NligW+SpRNBWJKKLiWM6BCItCPY989ZXn+pTTrPHXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpWyq+SU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpWyq+SU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765548006; x=1797084006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3GLY3SReSFUO/67yDF3bBMRqUCTJUpExjUXZHcdufY=;
  b=NpWyq+SU+dYwJTN3f8/arL/8Yj+8JY4TPKZyhnPlWXZZ6DUhNGrkFFOo
   ZrMuwvq9FEsgcfEIQzoaSQwdeQUgwNyb809ccHutK3tATsaUKg7o+2zNb
   cTCmmUIJcZ7SdejlPL8VPQdA2CE6VPt43iq2t8OmcJPOrJnmNoVZjIWX0
   jxyGjQbOaaw7dfkYr9waMJYl4o9AnGifTHz17cI23+VJb7p73soyF3KjW
   tKEzYnqx8RS4KC6/iYJPv5mD+g3uZYdHnY9reQ3vg3QYpdKy8OIZOlrXB
   4Y6Ji/T/Wf+ZDuLDfhcyNfaYfCATV1oK/DTPtl8fZq5uLUQaWAek4PvbL
   A==;
X-CSE-ConnectionGUID: c1FkqV9cTn6QakyaoBc7Jg==
X-CSE-MsgGUID: 8SgwBo6cTEqI+f+FUSnEdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67298846"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67298846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:00:01 -0800
X-CSE-ConnectionGUID: t1eH+sypTzqtJzMBivUvuA==
X-CSE-MsgGUID: dPZ9U2p2T6WP6noU8da+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197000569"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 05:59:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU3ga-00000000689-1Tc0;
	Fri, 12 Dec 2025 13:59:56 +0000
Date: Fri, 12 Dec 2025 21:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1] drivers/dma-buf/dma-buf.c:1285:
 warning: bad line:                         range.
Message-ID: <202512122128.7V5UaYgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   65eb5a4a2e961a9252cefa9936c221b340ba0370
commit: 7216484575e098e8d295bb9d0d6f3b4084a332ca [1/1] ANDROID: dma-buf: Return EOPNOTSUPP in dma_buf_begin_cpu_access_partial
config: i386-buildonly-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122128.7V5UaYgk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122128.7V5UaYgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122128.7V5UaYgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-buf.c:385: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:385: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'
>> drivers/dma-buf/dma-buf.c:1285: warning: bad line:                         range.
   drivers/dma-buf/dma-buf.c:1364: warning: bad line:                         range.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


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
