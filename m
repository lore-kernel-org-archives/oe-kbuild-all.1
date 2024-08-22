Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400DF17B427
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315160; cv=none; b=P2x0Z+rYbO9BZxTzkOaVXmCndSwL5ZywNBB3r1YoBHJtqxngHKchaZPvvJFQL1PIZxgOgO2hVv0qaeIMhJ6eeOUnXM+7+/U2RWOi9wrReLP/sP8Y0i0mcWgRK7I88Fbxsxcn4qFGHeNLgHHtEHKcmatgIL424Cd6pf1D23j8mRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315160; c=relaxed/simple;
	bh=8+hFUiNKX/YrD8CuvvgkrVTE6G/5TU0P+TUJjxiOyZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZ+5DKjE3ilH9ybf03BtjPsHrbMv8AkIJLupUYDkNpIpcz5Pjl0fnx+YnEoNwjn4xlvRtPrboZdaoWsoeRSgpbRe6D0IEVXCO/8Je7zLPL4Vc0eZWV5/Vgu0Y7Ioc445b8HBsP63e4fqw7EE46CoET7VHJwGrWxFh3eKa8LLqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6MS6pCC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6MS6pCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724315159; x=1755851159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+hFUiNKX/YrD8CuvvgkrVTE6G/5TU0P+TUJjxiOyZY=;
  b=n6MS6pCCqwfcZLF9CaVSwg17D+0uw5uSQo6OhXS9yRBNk8Pzx4ELEIHd
   hfwVzxNyN56Ao7SmHym+4P0UOHaij1d1+nnxdfKhOaYot1iMUjjK3KLOO
   3T+dEnk6VkghxYv5itaBPq7MYtiHbBk+vAC8yjj1wc6GhBxfXoIHR1Q6q
   h08tIJkxKdD/UQCief1lXbHPwKqIdwXj21He7W9eBfiyhOkKqgr9i0+f6
   9vn83f48MY6M5Cgx70rqqBjcQlPjRZHYPz0z9jiZbCc9TvsnsT5yeZGTj
   hzAiDcGWMQFkkBani9tSvcvBgklOdKOCA5TUBLfM5Fk2rSWBI3Lcok9pU
   A==;
X-CSE-ConnectionGUID: 8kYUoIA9TKKvmufvHQWfCA==
X-CSE-MsgGUID: kfOSDP+vSeG7Nk4lA/JwzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13148889"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="13148889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:25:58 -0700
X-CSE-ConnectionGUID: mITbxy6pT4iV7OSf9S/ufA==
X-CSE-MsgGUID: MVCUoa1tT4yBDavvG0I/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66310540"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2024 01:25:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh38l-000CZi-1P;
	Thu, 22 Aug 2024 08:25:55 +0000
Date: Thu, 22 Aug 2024 16:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.i_state 44/46] ERROR: modpost:
 "inode_bit_waitqueue" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202408221655.g7QGt2qm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.i_state
head:   035cd2240eb98a5ab7e958674296570ac2668e9e
commit: 55198ec5ef32fc5ac9fe0165cecc9d3b42e38bc4 [44/46] inode: port __I_NEW to var event
config: i386-buildonly-randconfig-005-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221655.g7QGt2qm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221655.g7QGt2qm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221655.g7QGt2qm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
>> ERROR: modpost: "inode_bit_waitqueue" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
