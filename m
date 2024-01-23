Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF11A27C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706053425; cv=none; b=kvNMRwBzLVR1rdvXHZ9h+sFUt2ZbQLNbDkywi5OkiIGeY3dHNUyTIhxgcwTT4fANVoTAi41S0y6YmCRTlv5j4p2QGXAQ9XeT5w8xu88Cp8JMu/SFEVsiRWYxbtcpYJZLKZxs2xaNn+tBCozoHGMFtKncY3UQcc/O0LDu8q6eSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706053425; c=relaxed/simple;
	bh=HeprUA6MXjvh0WIPTGcu63QyJwspyQfWAyzHbbau+oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrVLLVtqBBc/7jmV4cOW6/seE0MSBhcAHbDXAxtgW8Im3DD3oQNSXe5p21AnFQ9/fOrHVBmqP5Cy/Jxa+v5kJmvKXfvZZQ+9Zo5es9swPz/zwwkmE8CDE42Pzld8cUVkDl6RCw1vPa6N++yFq1LXqVco7Vf/XaAggOVyE1U2QiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkyI4xmS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkyI4xmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706053421; x=1737589421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HeprUA6MXjvh0WIPTGcu63QyJwspyQfWAyzHbbau+oo=;
  b=bkyI4xmSWyEcw/inW4jgZB1uiWGOvdrqdcnwusloAED3WpW0Orbsq0jg
   ViVYalY9pGAJF+7BLmjg6SzdAK7HlP21XuR+c0UHF5KPtKnVVbHx/pa8w
   qgLQzpvWzsjOwd3ixU/Frn+yzxdIz14/zYjIX4maekloc3FkSvO8h/hDq
   BtDD1jKeUR7vLnFnjN9CEeq38QzwtT7Bu4XGZeLA4m5xunCk+wEUyTcq3
   WLLw45F8vpbkyEA4AiHO0CBnHAL2Itil7gabiEhg7Rfg0qhh7owgW7iMV
   P1znPVq2d+TKtCQOnAqS1y6JlOwu3AhHMRabQBZE1jLbKGi7PfBIimyMH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15201750"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="15201750"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 15:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856491796"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="856491796"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2024 15:43:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSQQb-0007k1-01;
	Tue, 23 Jan 2024 23:43:37 +0000
Date: Wed, 24 Jan 2024 07:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file 31/35] block/fops.c:866:56: error:
 initializer element is not constant
Message-ID: <202401240700.usRpQ56f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file
head:   86d0fab9651f2edb5dc7094c36ce414bf2c407ff
commit: d200dd4d01b253bf3964c013247dfea89baef880 [31/35] block: use file->f_op to indicate restricted writes
config: i386-randconfig-012-20240124 (https://download.01.org/0day-ci/archive/20240124/202401240700.usRpQ56f-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240700.usRpQ56f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240700.usRpQ56f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/fops.c:866:56: error: initializer element is not constant
    const struct file_operations def_blk_fops_restricted = def_blk_fops;
                                                           ^~~~~~~~~~~~


vim +866 block/fops.c

   864	
   865	/* Indicator that this block device is opened with restricted write access. */
 > 866	const struct file_operations def_blk_fops_restricted = def_blk_fops;
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
