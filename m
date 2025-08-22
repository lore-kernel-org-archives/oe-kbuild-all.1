Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B62E4266
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847498; cv=none; b=GfPbtC74uuk3ytFi0QdNZDq7XKOyKeZMPgZzLP/Ear9UVZxL8I1yNaI9G9zK6JgovH6sQFBI5kjyLQd8YGTs/k26o2QFsTcHeV6byCEG7/J1YRahsTXNALGfmhzfN7ad4mBVrIQT2gcxbJTIXudi9fN862cpr+wqYRCHT0omC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847498; c=relaxed/simple;
	bh=amTHXuJSqqHamPmnJxe3dRoDxRqdbkgOusrtnlpvT+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=M//N4juf6InkEzy9jMmcmfVlIsIg3qlod3JeD0PdM2Cm/mr2I8twDPQxUyu4CwQABtyhDfhFIGmbddt65nTLKO+l4MNJJiUzqbvSzeb6zWZlE2CGZsGqkWsHiXEeMWqIdoxs8InjuDNP33i8HpDgEBewgRFiYMpqKPWU5HClUNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+cobEO5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+cobEO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755847495; x=1787383495;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=amTHXuJSqqHamPmnJxe3dRoDxRqdbkgOusrtnlpvT+w=;
  b=N+cobEO5wSovGGpwuzmaNA4dZnLkVjaCfcZPJ5wxXdDNCkacn8c+dUDb
   CNjcC8Bb+weVtuPOs4VT0sTeKAKsFLTL+buYlbOMboWtJDVm7IBvHff+s
   P0wv+I1jjdYGkrmvAElYlLM2hLaVcZNqUGJ64HTflaWHkmKZ0cQUgs9CX
   UbdPSvYar47a/50CaSHYQphRfucjy7zfGHb8E0KRABTMbtNA5BDExrqar
   GOFMGgOFpeEPI+MMQC6/uU68f4v24FJrpaztNe4G2Xnd2+5CjNT/h+cDH
   dtlpR2Yqo571qJx0DwSJ4qn4PhYCLnF34cEGWnQuB5izINYMa/RM64/O9
   g==;
X-CSE-ConnectionGUID: AD/t+ow4Sti/Z1KmeAYZSQ==
X-CSE-MsgGUID: kUQvRaqIQ/6DLNcT9BlUaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69522445"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69522445"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 00:24:55 -0700
X-CSE-ConnectionGUID: 6zrcyzGWRXqvNX3ntD1dAw==
X-CSE-MsgGUID: G0plkk4KT16ywi1KlaAveQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173057343"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Aug 2025 00:24:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upM8p-000L0h-17;
	Fri, 22 Aug 2025 07:24:51 +0000
Date: Fri, 22 Aug 2025 15:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gu Bowen <gubowen5@huawei.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] mm: Fix possible deadlock in kmemleak
Message-ID: <aKgbMXMaOj0j22ND@85d67d3e4d56>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822073541.1886469-1-gubowen5@huawei.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5] mm: Fix possible deadlock in kmemleak
Link: https://lore.kernel.org/stable/20250822073541.1886469-1-gubowen5%40huawei.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



