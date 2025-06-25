Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA9273D73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 08:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841415; cv=none; b=oxyYQ7jImoK6f0QUVd7la9vzP5x4QxAH8pgBOYgH6muTDGW1yEGkS1ZS65p+B2T5L4H0GfPRyxJGVrRENhMXvgOBIIfT3oxhS6eBEvH8L80jIovNwTkO+ZMSnWyLp8Ol6thKrImKdpj/YhVNeQXPmj/H6Nl0xJD/9aZIY1BuoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841415; c=relaxed/simple;
	bh=YR738SBlrs0HffqYBQZGlz7Pdx6xbmMC1+5Fh2wMVUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=La7TV6R0X2qnJHp/aeyzU6/NsmAPDLnlNZeBU2IxomwM4YGPk4YRcnmPcnmCNXaLO1JgO92ICpsZlU9hJN7R1IfRQGAfvNmjyuK8TWRRi9zWpQ0/YBrVz1ruQHKv0PrT/8eNMm3qazy8caMFZ+bWE0ZshTvVuHPbKjs5qurd7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QO8Wr1Q8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QO8Wr1Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750841414; x=1782377414;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=YR738SBlrs0HffqYBQZGlz7Pdx6xbmMC1+5Fh2wMVUg=;
  b=QO8Wr1Q8pe5kw8rI396WwH0XJ/f3yWa4qyIaqpg5Go2/dZhecY60Uemq
   QwxlXTQ6TqchHmtsDQgKy2Rlp5SSHrp0xjnVi2NpcK+s6NzqxvmWH9Ys4
   EADE9/Ow67ti83TA88q8atofIpogoKq4hSr0rwwhssnCnKJV3Mnp1dzHP
   K14d/UzgrIVcJ1nDRbK7RmLZgx3ILeqmH5+DHjKH+kCz7nz15fQ8ui0HG
   ApB5I6xizO2R5YbVLF6ATWrj6r+cUZtVJq4WoUEG/UlDH/I8xPM1xx/Pd
   7DRlvrXafL02u37J3p9Zkq/RZ+smGds2A+D09RewgaJL3cQYa76FKgisJ
   g==;
X-CSE-ConnectionGUID: +U8r2pATQtyDm1p662bFEg==
X-CSE-MsgGUID: Kl+xAnaaQVa8hEIV5tAv9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40721639"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="40721639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:50:14 -0700
X-CSE-ConnectionGUID: hKxHp+uUTOe26X5LjUl/DQ==
X-CSE-MsgGUID: I5eTSMeZRk2TNUWex1Hb0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156435952"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jun 2025 01:50:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uULpa-000SuY-3B;
	Wed, 25 Jun 2025 08:50:11 +0000
Date: Wed, 25 Jun 2025 16:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: zhangjian <zhangjian496@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [5.10-LTS NFS] fix assert failure in
 __fscache_disable_cookie
Message-ID: <aFu4MavUO1eiVclZ@2e46cf93a049>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626020035.1043638-1-zhangjian496@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH] [5.10-LTS NFS] fix assert failure in __fscache_disable_cookie
Link: https://lore.kernel.org/stable/20250626020035.1043638-1-zhangjian496%40huawei.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



