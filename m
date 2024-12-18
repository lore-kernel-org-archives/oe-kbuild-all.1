Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6C156676
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Dec 2024 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515314; cv=none; b=QnOUS/cCWtfqpVHXuo8m4DMadECrU0UNwbJqGYa8Xp1CmU8WC8kJbG3L9Iz8/dVIBrDEb/dfx6S38IyFVEnnkaK2lx7kXAo6p6SCH3V788zivI0EOp3FxyuUc/hfNFJLAxBEY57eTkJP3g/WNC+MKTBs30noYHAzUdcgLfYYcnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515314; c=relaxed/simple;
	bh=JYgzOkFlhWhKYVUWucml3dkZTkASViC9un/23mjZMzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G52bvLUkHow93koyop50/cYiynZIs8WJsOcW4ev4id7q/KvESGaUcOy8lsdg1U8KIvgam9LkG2nW9GUt00z0wqZmRl/THpo4jV0GTIuaUe/a2U1Q9C5TfuQ0rUKaHVwZN2b29a4pJvoU7dYnwotQ65jRnLt89D6Veluh/SbWTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D46apn8J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D46apn8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734515313; x=1766051313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYgzOkFlhWhKYVUWucml3dkZTkASViC9un/23mjZMzg=;
  b=D46apn8JeltpoufvDhJQJ+EcIY712irj5gfUe5u7fXmxedNlzxA9sbmc
   UzwPu7qGwz2CYiC7Rx6t80Mjjd8CcaJu6TCnqemh09cayzvfOajna/ERq
   ZUXMWE7tAYYuqPtk5LmxOow9BNL4jbphI5u9mLYHoaMxVZcR6yCfHfAPV
   dxURzRSN1RzdPDg/dNl9GIestaXk026jnNZinRzgPtw4gk/w7x5jRmmZ+
   HnvCLK5rYLY8Zh3lBvzkM5gPrGKG610CjnTo0Cr/5DazG0/f9+++tC4dT
   c0jyBW5GKQaWEkQqp8m91tddwSeoGV8wR5L6GPezZDVyqz2+mEJX63JvD
   Q==;
X-CSE-ConnectionGUID: 9XXz2SMQSI2xYKVZ0bNQ7A==
X-CSE-MsgGUID: TtKKddYNSdm63y6OCjHWRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38763463"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="38763463"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:48:33 -0800
X-CSE-ConnectionGUID: 3JfxTgU+TSuhFJ8ET0Bf/g==
X-CSE-MsgGUID: u/cX/zHSSiuwzcYYoogcoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102900828"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Dec 2024 01:48:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNqfN-000GG1-0w;
	Wed, 18 Dec 2024 09:48:29 +0000
Date: Wed, 18 Dec 2024 17:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: vmlinux.o: warning: objtool: __static_call_update_early+0x33: call
 to serialize() leaves .noinstr.text section
Message-ID: <202412181756.aJvzih2K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 0ef8047b737d7480a5d4c46d956e97c190f13050 x86/static-call: provide a way to do very early static-call updates
date:   5 days ago
config: x86_64-buildonly-randconfig-005-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181756.aJvzih2K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181756.aJvzih2K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181756.aJvzih2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: xway_gphy_led_polarity_set() falls through to next function xway_gphy_led_hw_control_get()
>> vmlinux.o: warning: objtool: __static_call_update_early+0x33: call to serialize() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
