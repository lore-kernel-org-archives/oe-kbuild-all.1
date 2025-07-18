Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE13221F04
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827441; cv=none; b=Msjq3Bt7YODB/YWhdEMz51KT4UUKXWzee6+i1mTk3CUBbSPkzi980pQADKItOUB/WdhCfRfja4g4w8L8LUy4w+0u2veReZeqHOpDorw+1u1kBTg+UFhfFbYriilGip5qL3StIAiScaAWTnetSS0kSimg3YQJMrIp4qcYhx8tT5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827441; c=relaxed/simple;
	bh=VIOyea15uP6Bo32Qvnm7JomSOma2QMB7RwxQQLut0B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qWVoGEMoPcbpOPJCCpu0E/XD2bvBSqjnrc3eqDAbqqTS0iCC2Z+I/wRAyDgpvkLvGRYPme7qHVE7pRxnk95PYwcUV/Trkm63cUuNcqkp5nQWsG5KerCtNuAHbijzPe/9KTxQ5FDf8Z2VUkY9YWOikBrSr4A9LqLuw0xiKlnVet0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9ijO7S8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9ijO7S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752827440; x=1784363440;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=VIOyea15uP6Bo32Qvnm7JomSOma2QMB7RwxQQLut0B4=;
  b=f9ijO7S8esmTSp7B9czxEnzwnZ4XL++9YJHwri+xXddHbf0lGNzldGQv
   xEKc1TYitc1N+zlVE+58hJ9eXZeq8mK5nh7P9p6Uf4b4LgB1hWee8KFZ5
   tElXyqi+PWwKp0qES2H6zooTnTS6x2Txi3D6Aky9StKJrDCMmEMHtLFW6
   GIkrlevEE3Cij/+loDSCIFiCNqOOTZYWj366tQ6YeKp6Zr+2clCM+M4q4
   e3ZfK2NcvfqrFaUT+3F7eHbvqBByoQcomJTx+bwhj2sVd+7zTcfXMqFnQ
   in/z8DHAFktQsI8N6pXFVP7ZvM9STysdCSfkj7Ovtv+2raeftJSfOv+w1
   w==;
X-CSE-ConnectionGUID: R/7qRkRARtyC5W9gzWJrIg==
X-CSE-MsgGUID: wI4EEAj0R/OUxDjl43mAYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66566017"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="66566017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:30:39 -0700
X-CSE-ConnectionGUID: +AY4YLU6TaeMQlOZc+VJeQ==
X-CSE-MsgGUID: ouEqaQghS929NUmG3316UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158573131"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 01:30:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgUG-000ERd-19;
	Fri, 18 Jul 2025 08:30:36 +0000
Date: Fri, 18 Jul 2025 16:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
Message-ID: <aHoGBmNFD4FZqJf4@c1a0ab53bc35>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718082719.653228-2-macpaul.lin@mediatek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/3] dt-bindings: ufs: mediatek,ufs: add MT8195 compatible and update clock nodes
Link: https://lore.kernel.org/stable/20250718082719.653228-2-macpaul.lin%40mediatek.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



