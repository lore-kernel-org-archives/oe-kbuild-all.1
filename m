Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716C209668
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730927559; cv=none; b=dNTJtjj/b76k/UYkgIvF1zGeLq6zFGtr9H0uVrfIFGg5mZqRMh27ddhjOZZhT/YhOW1pAHIyu7txwKzBf4NzVNqQDC60vY43MNb37tAlRP16ApLIT5q71OeS25Z8czKBDnaBAE9aHckqmOs1uGSzZbQiFgJhsZ5nChy33/GoIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730927559; c=relaxed/simple;
	bh=49CPRwpfEabvpoWyYJlCSgemc7WVgWusT7Umz6RYQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjHHBTfAbb5lWFjW5pm7MovKt7G+G+Be4PIu/josXKixlYRVefdWplDiIf7phk/du5L+9lZpLu+dPtbnF9bIc3XSi1so9swMCl6KEGrzAgC8kxEOHGltIwtJcYshiJezPHDBf3UHuLajsiqi6QRvzOmvpd3NLrP3Axi0xxYgiuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFXVPDno; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFXVPDno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730927558; x=1762463558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=49CPRwpfEabvpoWyYJlCSgemc7WVgWusT7Umz6RYQmQ=;
  b=CFXVPDnolccqq+wiO6vkWREB/wq8yg7HydLFfx8ztqpO0DYMEK7L+a51
   ZhmMm+DcMnUuUInpQOxGZQ81GRlU+G4NV3T2wZPE33Kvh4ctBIJAIw/E0
   d1F/lCNpcFxbVSf4q0u5S+dneG6xXJPVwnknjTjCrvenTrSBkyUHMR2Wo
   XDZbXDSOs7rNO29gSG7ZHARMt0Vw393RconKuM7n1STJaOmMuy6Rb6Jyj
   6D2Y6M0Rvgp8kXwyDSLlsUzxqKrnKZKKgCQPXsUkaMnGqsnUVeCxvmfBh
   cLUd2jID8F/+GIVAULLh0DHchcGj2ctoQ0dNjAZIT1ZDrkwo/JHoP3zEv
   g==;
X-CSE-ConnectionGUID: mgGoj/ecSqissEDa3DvXAQ==
X-CSE-MsgGUID: W4PPVchgRz2gR2s+BSf7GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30851630"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30851630"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 13:12:38 -0800
X-CSE-ConnectionGUID: 4SrOcXWcRea9CXwo9ugeMw==
X-CSE-MsgGUID: gvD9PBIKRxeTq6+PRfTQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89353069"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 13:12:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8nKM-000pQw-2E;
	Wed, 06 Nov 2024 21:12:34 +0000
Date: Thu, 7 Nov 2024 05:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/5] drivers/dma-buf/dma-buf.c:345:
 warning: Function parameter or struct member 'name' not described in
 'dma_buf_set_name'
Message-ID: <202411070525.fxJENtOy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   07be6b4d90ac00c60a3343b76eb2fb5aabfdabc4
commit: 88a96b0b27bcdda732e9d4e9d35cefad8ea7ffd9 [1/5] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241107/202411070525.fxJENtOy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070525.fxJENtOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070525.fxJENtOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:345: warning: Function parameter or struct member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:345: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +345 drivers/dma-buf/dma-buf.c

   330	
   331	/**
   332	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   333	 * It could support changing the name of the dma-buf if the same
   334	 * piece of memory is used for multiple purpose between different devices.
   335	 *
   336	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   337	 * @buf:    [in]     A piece of userspace memory that contains the name of
   338	 *                   the dma-buf.
   339	 *
   340	 * Returns 0 on success. If the dma-buf buffer is already attached to
   341	 * devices, return -EBUSY.
   342	 *
   343	 */
   344	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 345	{
   346		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   347		if (!buf)
   348			return -ENOMEM;
   349	
   350		_dma_buf_set_name(dmabuf, buf);
   351	
   352		return 0;
   353	}
   354	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
