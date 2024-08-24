Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ACF48CCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724488561; cv=none; b=OIbdVoXIqKDszScoEzIW1uq7Cnau6iIY1dwOaL0t1hVyTS8iqWeds6RKcFzYMii8SA3hFOWw0QLAqbUa3h7oCBgVdT4P/GY4jwGYZs41pl0hVT2KIQjmqxXfGvEYPFfQNT+6Hzu1H3xAKMGbKYUHfbmzeMRNqWQft7DZHlpex4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724488561; c=relaxed/simple;
	bh=bhJmyHeid1xwT9U9+ZbuzIWyuJgKAB9K+QDYyvTh3DU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAksq1mLP58FPHYlBcYXo2uaXCght1dD7khtv0fitoh8E8knQ7l5b2whh7GEcUmTAphwB7u/vM8+9X81TAUCezj1+jTobX+8Z5uUAZbst6TSigDoVBcksehkWjhJk6D9lSVFmG83yCZPuBGKQ316x8Wb6CypOCulfNAV9wNL7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDL+qoH5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDL+qoH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724488560; x=1756024560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhJmyHeid1xwT9U9+ZbuzIWyuJgKAB9K+QDYyvTh3DU=;
  b=MDL+qoH5jxapnDFjiPkh7a5a/ywnI7VyKggX3rCrVqABMAS1zKeZRYIl
   JrQv3jJHpQW4+BabU0yk6JHGNbR4X2pwEIIhYXWpNu5LXC3yTGYkrmxzI
   o42ThHJfdZA1UQ6Z+18kF9R5UFQyA/AVf71AylbsRf+fidmW62N5q37Cs
   5atjZRTL4nFQgK82eToNjC3mzVPMvHcnGQRrNJectjnwYL7CdoW/3+auU
   VvVWAWsmdTwD484QmKUWi/EPuERkIeDiHLk+3TBjjfod0eHn8NkxyKM4D
   FjzGUn7+HXZs1TScUXvnF7naDa94rEKYuRmTAfmBnkGDAxnyjeWuJoihL
   Q==;
X-CSE-ConnectionGUID: OZbxWUk1Sb2eqekN4vR45Q==
X-CSE-MsgGUID: hNqfiNfBTIak6YjPrJXhiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26843991"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="26843991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 01:36:00 -0700
X-CSE-ConnectionGUID: EvjD95eqRuiPT5QpduHiMA==
X-CSE-MsgGUID: Uzk6zRA9REuyP+AiSZUqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="62334069"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2024 01:35:59 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shmFY-000EN1-0q;
	Sat, 24 Aug 2024 08:35:56 +0000
Date: Sat, 24 Aug 2024 16:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliuoc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20578/23548]
 drivers/crypto/.tmp_zhaoxin-sha.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202408241654.npDnHEKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   212ca308cc9fa1267c1d7934ac416660f41c549f
commit: 0f74c26725b8cd5e9b968081850c0303a9fc9137 [20578/23548] crypto: Add Zhaoxin ACE driver
config: x86_64-buildonly-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240824/202408241654.npDnHEKI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408241654.npDnHEKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408241654.npDnHEKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/.tmp_zhaoxin-sha.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
