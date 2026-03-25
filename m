Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AEE3FFD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 05:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774415616; cv=none; b=SPVIcIgPs8MMfvBt8I5Zgs7nbUnpW7bvjYNaBa4UIBkbd+w0g306dtFLebAqpGRhCnr5pTrMCARsvhDIhtcnLyHbeOIhaIXj752L/QdwHfNZizWzbJH4nPRt4fdVAD/N2v6YNGNsXBZq0GwGTN5ZlciaGINzpwIMzkSw7EN/yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774415616; c=relaxed/simple;
	bh=zbOZtQB9t7N6nWQi4Sq3zWwKdsJST8dPSJMgcRghxoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LK+s3yCpK4Z1qQJscesj7X7F05VyXw+hHR7slMLzudwwSGJJwtLgpGAlykPIhKjOQPHRFH2ElcODmLl7nOQo6Oe/+Lnck62yYwnIqdGVclNT1T5lGN8rcT3RfTRRS8y6786LtTr21LM9uLm1uwQMpAJYBWEyLKO6wEEGU2jxvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gH+2WjaP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gH+2WjaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774415615; x=1805951615;
  h=date:from:to:cc:subject:message-id;
  bh=zbOZtQB9t7N6nWQi4Sq3zWwKdsJST8dPSJMgcRghxoo=;
  b=gH+2WjaPnUzQr1rPmG6Ko6NOSbaxcZxbFP6gKkN8Mr32xjr7527umAw0
   H0k0/BFIV5s5O0igfDFQ5VYq3xaHHuL9GJZaJH7y1y31OwQGWP5g4nzTf
   bgEMrlaV59m0pYYPhR3A4HzAouZzMBIdsZA+9fp9+yVyyn3rLyxeKZQo4
   q8In45BX4sW1TB6TINPEkqkSW4AcSsCHx0AWV1FweIA0wMyrC+6Ez7u+Z
   mUoSh/iEPBt5DIrKTU7YXJBXVcXZXOVwtQDSMdHcpBATsTFq8GnaJy6S3
   baslOQfJbTDiP5zO5lxiHoXOnWPQJ6Uy9ShaRnfBxdWsiL6LMDjmAY4T3
   A==;
X-CSE-ConnectionGUID: POOiuEy3TE6rzcZuphegKQ==
X-CSE-MsgGUID: Bf3vjswlSN2RiSIIh5SqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75332312"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75332312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 22:13:35 -0700
X-CSE-ConnectionGUID: xGKlra+TSQ+m2aI4MeQIJw==
X-CSE-MsgGUID: ZiPFa3TuTACR42G5+HeE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229351150"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2026 22:13:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5GYd-0000000067r-036F;
	Wed, 25 Mar 2026 05:13:31 +0000
Date: Wed, 25 Mar 2026 13:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/dma-buf/dma-buf.c:363: warning: Function parameter or member 'name'
 not described in 'dma_buf_set_name'
Message-ID: <202603251337.2IY8IHC5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 05811b07b50aa107b805735f20c9029b40e9a7d9 [1/1] ANDROID: dma-buf: support users to change dma_buf.name
config: x86_64-randconfig-002-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251337.2IY8IHC5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251337.2IY8IHC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251337.2IY8IHC5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:363: warning: Function parameter or member 'name' not described in 'dma_buf_set_name'
   drivers/dma-buf/dma-buf.c:363: warning: Excess function parameter 'buf' description in 'dma_buf_set_name'


vim +363 drivers/dma-buf/dma-buf.c

   348	
   349	/**
   350	 * dma_buf_set_name - Set a name to a specific dma_buf to track the usage.
   351	 * It could support changing the name of the dma-buf if the same
   352	 * piece of memory is used for multiple purpose between different devices.
   353	 *
   354	 * @dmabuf: [in]     dmabuf buffer that will be renamed.
   355	 * @buf:    [in]     A piece of userspace memory that contains the name of
   356	 *                   the dma-buf.
   357	 *
   358	 * Returns 0 on success. If the dma-buf buffer is already attached to
   359	 * devices, return -EBUSY.
   360	 *
   361	 */
   362	long dma_buf_set_name(struct dma_buf *dmabuf, const char *name)
 > 363	{
   364		char *buf = kstrndup(name, DMA_BUF_NAME_LEN, GFP_KERNEL);
   365		if (!buf)
   366			return -ENOMEM;
   367	
   368		_dma_buf_set_name(dmabuf, buf);
   369	
   370		return 0;
   371	}
   372	EXPORT_SYMBOL_GPL(dma_buf_set_name);
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
