Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825ED217F3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729897237; cv=none; b=hXgR0lMyMm4idj+H9jKLVSV3uznJmPMLe+4FTM8I7EFy7y28olR33h+a+Ht/6tCIbGMwPUwTpigNsSafQEnfoN24iEhZzsDsl1Cd2iF6Jr+lbz25WGu1WAh/olZkn+yhi9roLlPn8001nkS1w2wa0nzuAfyOJT215N10uSpMmBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729897237; c=relaxed/simple;
	bh=/hn/ur/dNT4NaGcy1t6ho4GH6tyictr31KY3/exJ09I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FE2vgw6dKXEixgRkni/+3pGMHXiq7AObnDPXXw2rITuiuj/ikpxM7dURs/2rhoY3ROanvdlmyPpfhiByvIeigDllK1ON4YQwSFXkfE96U+fEZaT16aAZEpJTIUrAIL7qy2OLgd8xN+AsW4ZGKYJf5obghuWVUbthYZT/j7IyJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9CoFSz6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9CoFSz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729897235; x=1761433235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hn/ur/dNT4NaGcy1t6ho4GH6tyictr31KY3/exJ09I=;
  b=P9CoFSz6HgpE0mXTI9+ND6fOisbuPcGpQIzq/CqWQx2L16kkf3rlnCAq
   jwujT1EXQLarHD6NK8iMDXkyTmx/WAdyLC2i/kKPPeJDP0U3s3SSoR8ZK
   gaTVNMPYCmk1LgyHuL0x1GHUQClU01VtQVojcWbTkZCVQc8t/NqW4qRpZ
   +fn5dTwi3+1rnn+3fnEOIwKp1lS2G/0zLMP9Fo/eT9NYnHqgTiVRlyfbr
   Cawp52DezKUyYV8605kaVALxKMsCKe2Wl6Wtoe2KVbWXk2FOlOIdS604Y
   XvwOOgRyKSbEZ3m9P0FdWrKoOQVOiuLpLghI6BkRkGvmAtEMWMuf2y4Sd
   g==;
X-CSE-ConnectionGUID: GGxVZlfjRWiuGQjXim4k0Q==
X-CSE-MsgGUID: yZ+0yepbSQKzzwn2Kt9xDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29477697"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="29477697"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 16:00:35 -0700
X-CSE-ConnectionGUID: 54EJNGhrTu6ZQIKEouO5ng==
X-CSE-MsgGUID: rDGFLyygSN2oP3I38aQrxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80699057"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Oct 2024 16:00:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4TIG-000Z0S-0b;
	Fri, 25 Oct 2024 23:00:32 +0000
Date: Sat, 26 Oct 2024 07:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 2/10] drivers/virtio/virtio_msg_mmio.c:79:17:
 error: implicit declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202410260641.g8YhbrMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   1ee7d4424b5fb877c9020b7426879470c2d47125
commit: bea6928905ca9df686467ece8a8d226a11eeda75 [2/10] virtio: Add support for MMIO based channel bus
config: parisc-randconfig-r071-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260641.g8YhbrMU-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260641.g8YhbrMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260641.g8YhbrMU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_mmio.c: In function 'virtio_msg_mmio_send':
>> drivers/virtio/virtio_msg_mmio.c:79:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
      79 |                 writeq(*(data + i), addr + i);
         |                 ^~~~~~
         |                 writel
>> drivers/virtio/virtio_msg_mmio.c:87:31: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
      87 |                 *(data + i) = readq(addr + i);
         |                               ^~~~~
         |                               readl

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +79 drivers/virtio/virtio_msg_mmio.c

    68	
    69	static int virtio_msg_mmio_send(struct virtio_msg_device *vmdev,
    70					struct virtio_msg *request,
    71					struct virtio_msg *response)
    72	{
    73		struct virtio_msg_mmio_device *vmmdev = to_virtio_msg_mmio_device(vmdev);
    74		int i, len = sizeof(*request) / sizeof(u64);
    75		u64 *data = (u64 *) request;
    76		u64 *addr = vmmdev->base;
    77	
    78		for (i = 0; i < len; i++)
  > 79			writeq(*(data + i), addr + i);
    80	
    81		if (!response)
    82			return 0;
    83	
    84		data = (u64 *) response;
    85	
    86		for (i = 0; i < len; i++)
  > 87			*(data + i) = readq(addr + i);
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
