Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACC18DF62
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756102347; cv=none; b=R8yslipoJn7S0zfr++TASWhhqCbuc/p0ouEMu0ZMqo1jMKuDohjsP3nYgX8rSflQVArFHzXLZlCNayCW8Bh5K7b7oYP8YBMdMcnNPVSmlWxfeDLd09aaDqTW8UucvguCSeK4TLEotwyMBG7HrT4uG5i1IzphqBmVgS17jw7bNJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756102347; c=relaxed/simple;
	bh=tZ1NtCt8Bu9ttZzlF2SQucPW+m9v/iXOzIo1q8QDAn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jCJ/vQ1b+xAvnk8wART/+Uxsz3vqzf21Eet5+b1x1hWTSRA4VKLeLZF9Vg3EDdULMHfiDsN/vwR34JMr8FLfPFSEf/8qDhWSYfN64QXuU0iOUDtzac7mUsUNaAAlPGV3olDQeNycyrJ/g65yzkNwHnecqbYS/j7MinSCDLIEOQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHQNI6AA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHQNI6AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756102346; x=1787638346;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=tZ1NtCt8Bu9ttZzlF2SQucPW+m9v/iXOzIo1q8QDAn4=;
  b=jHQNI6AAobO0ppproCMVHoWAHERify7YmlU9hKHX9a+6tMcEdjMydnoN
   mKRVGAGJn1tt+QNIIgn6D9uqQ2aNir7a6JAQL+pDLWvTBZt0Nyo2BQtas
   u8rtjsKrzogccu95RFFizOaSkczI3ZN8NpdCL8SoB70EQXsdyj/LagvuS
   WomvuLwoyf79wANX7BZoIPUGUz1kQxlH0iHBBL42SYPagVfODF614oqR2
   Tno1toDYwCfEin1Rje9HPra1c8EN11jmDr+aet6ICmxv5TIuKtzPNTg4k
   TiBfbmA+KJb1ZTgd4iXPPPfY7CxfycZll73dsof/Pj1ixiYO57JNMBhWZ
   Q==;
X-CSE-ConnectionGUID: WkK7aeMNTM66R/IadEvS6g==
X-CSE-MsgGUID: p+Nfx7RsQ/GjUj20LDTDWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58234439"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58234439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 23:12:25 -0700
X-CSE-ConnectionGUID: oO0wo6DySKy+kQEIya2kTw==
X-CSE-MsgGUID: +2yjTfYURAuAQBr/kA2Y6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168418068"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2025 23:12:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqQRK-000NPJ-0N;
	Mon, 25 Aug 2025 06:12:22 +0000
Date: Mon, 25 Aug 2025 14:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Maes <oscmaes92@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net 2/2] selftests: net: add test for destination in
 broadcast packets
Message-ID: <aKv-mcCm0jTDBG64@13ae35437deb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825060918.4799-2-oscmaes92@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net 2/2] selftests: net: add test for destination in broadcast packets
Link: https://lore.kernel.org/stable/20250825060918.4799-2-oscmaes92%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



