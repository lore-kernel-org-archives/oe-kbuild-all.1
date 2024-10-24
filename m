Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE665BA4B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 03:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729739795; cv=none; b=hjaUh2vOaMooo5Fe+VlsqQJQGdUIT3M4Gz5q6Dr98fr0osNZ9iLkSJjX6EVH8NOy6pysT58MIKjjzjFiEAJ8qXwX7y4z/owCyIsxj0TZzIyAuvqmukSCrsJp+U8ukkoIRrtakHqvEuPVwUNCgLCFcD112yycoV1nNASTvcW6rQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729739795; c=relaxed/simple;
	bh=gV/zBt2iqGq0IUv1ksGst9PmKchlP8CJ+GS2jG77Hus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NsPYlQiCEfEJXof4hNQr7jjVISO0QdMvoCnPTCo14p2Jb6sPs3Nf+3pXfndqo7uiYWPVxNmxG/y45dnOcpnACB52kS4v9pZyILL7FBiDkoKkQWEKx7GRVkffFQy2oHH5EsHHKMU0uXVBBzEm7z0DQfTzWyugLEhn54w8m87lRM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQW1+c87; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQW1+c87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729739793; x=1761275793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gV/zBt2iqGq0IUv1ksGst9PmKchlP8CJ+GS2jG77Hus=;
  b=TQW1+c879bRIQOnuzjJFJU5uOx9hAh3QPkhIniwfMLwJqhygNnJGSIaD
   zTgt09wGyrnu0QtJ0Kh+7S+NkgBFKA4C51v1vhRYdwUdXMgdKE5nP7x11
   XsFmsNDdVZ/x3EYzuaxo85ePyxKP4WnzZK0l0iSMwuplJ9W0HjNonGIKr
   qyFU12Nc1qR9Yro4Wg1OO4vPnVUv2CUlkDI4TIhNg9Fq4BRcPO+LSg95w
   WFXlwfjrPwFIigIuSb5XajpqXyImOllx7YUTBWD5m8SzTaLuqXL3PWvAc
   JEXFnAlrff98y3VFXAF+5k8bSkcxBXL1OZQWuER94bomTcsWksD14Q7UJ
   Q==;
X-CSE-ConnectionGUID: m9KXrWrISXyyUtlZa4MPpw==
X-CSE-MsgGUID: /uc1lobnTfGLtDe25F0npA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33158317"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="33158317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 20:16:32 -0700
X-CSE-ConnectionGUID: gbFa1K0YS3qeY9DmJteg1g==
X-CSE-MsgGUID: kstCbbTkQAKfHkVF4sR4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80381835"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 20:16:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3oKr-000VsP-10;
	Thu, 24 Oct 2024 03:16:29 +0000
Date: Thu, 24 Oct 2024 11:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 9/9] drivers/virtio/virtio_msg_ffa.c:86:12:
 warning: 'vmsg_ffa_bus_error' defined but not used
Message-ID: <202410241109.gv4lsB9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   a48f3f89a6e63a510bc77d374dc291066dcef8f6
commit: a48f3f89a6e63a510bc77d374dc291066dcef8f6 [9/9] virtio: FFA: Updates
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241024/202410241109.gv4lsB9E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241109.gv4lsB9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241109.gv4lsB9E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_msg_ffa.c:86:12: warning: 'vmsg_ffa_bus_error' defined but not used [-Wunused-function]
      86 | static int vmsg_ffa_bus_error(struct virtio_msg_ffa_device *vmfdev)
         |            ^~~~~~~~~~~~~~~~~~


vim +/vmsg_ffa_bus_error +86 drivers/virtio/virtio_msg_ffa.c

    85	
  > 86	static int vmsg_ffa_bus_error(struct virtio_msg_ffa_device *vmfdev)
    87	{
    88		struct virtio_msg_ffa request;
    89	
    90		ffa_msg_prepare(&request, VIRTIO_MSG_FFA_ERROR);
    91		return vmsg_ffa_send(vmfdev->ffa_dev, &request, NULL);
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
