Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7C126C00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732686894; cv=none; b=nbt0GObVf7ZRXbZVyeUHH21CH9nVjywX1wLfPYBqNkiFKvIUsZMBI8NfQzncMp7l+opQbRyPbBvyIhq/0HhN3WKAUISvcQO59mmSurPl9srZ7mssB24GT44Ouiggvirhs5kiX5E92/OvawlB3nmH/S+XHoWBTNLpSGJGM0pFk44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732686894; c=relaxed/simple;
	bh=JjdG/B8c5PHhfV1OOclHOemcvZmRCZyQCDr54Kgin1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4J+G+nUizm+XMilPeTJWpvZrv9N2cYKZKt/+NGEcFfZiLaevCAICFQX9rw6GN0ZqpT7XsBOPc1HOLNQ/9hT/Z2IExvTYIZMXFWpFE7YNgpYII4nrnFsAD7cI8C8X0FeXlbN2JWddefhKA6CABW9AgU87KPD1JQhQkO+ZTmAP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2I07SBH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2I07SBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732686892; x=1764222892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JjdG/B8c5PHhfV1OOclHOemcvZmRCZyQCDr54Kgin1s=;
  b=K2I07SBHvlbkWsBGRY7SiDWabdYclH8AK55oMbNRX7v+ppMejxo6bmXQ
   /4bkZ3S5YwMfuv44RZWKh61V9MYn11Z1JNWgb14evA5i4hs05Q4rYAKFl
   rOFO+SCDoLrhH9ryyL8eZIb5yQolC6N09fFibqLnTXz10gWp917/QgzPF
   I4HkGcB+SpBhVqA3a9VL/So+R7ulM/rw8k1eaNzDJyV1r7Hl/NN8WEDwF
   otG6+tJIEav0etjdAZzw7uz7fE6ROpmcmxxUjHkJS9MPig7oqdoSIskYz
   0pDSV6t+Sue4qw4Fh+tgXTHzmMWtOqlphbAQv4lluAdB73vjx43TGHmP9
   Q==;
X-CSE-ConnectionGUID: I5pc/8q7R9KccYbH4P8OBQ==
X-CSE-MsgGUID: cKXAqOKvQDmBOzO3N2/yuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="20472726"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="20472726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 21:54:51 -0800
X-CSE-ConnectionGUID: 867AOzAgTIeiHm2q+Ry5kA==
X-CSE-MsgGUID: gZHYnmpXQDeJaEtJPmdBNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="122674740"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2024 21:54:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGB0i-0007kt-0r;
	Wed, 27 Nov 2024 05:54:48 +0000
Date: Wed, 27 Nov 2024 13:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v8-region-rebase 22/22] ERROR: modpost:
 "io_iov_get_page" [drivers/net/veth.ko] undefined!
Message-ID: <202411271310.YuV4cDkb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v8-region-rebase
head:   40f3c0ed84549afda9f6b6f3b9503ee7191809a4
commit: 40f3c0ed84549afda9f6b6f3b9503ee7191809a4 [22/22] [NOT-FOR-UPSTREAM] veth: add support for io_uring zc rx
config: hexagon-randconfig-r054-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271310.YuV4cDkb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271310.YuV4cDkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271310.YuV4cDkb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "io_iov_get_page" [drivers/net/veth.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
