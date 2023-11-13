Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6108881E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Nov 2023 03:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckp3qknC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699845642; x=1731381642;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=qXMova+Doo2vJVahJwAaReiVlhiIRW+2rK0QU+dGz/A=;
  b=ckp3qknC0tZVdOvwgRm4Y/NGL8wEeyOgn1lZxXzPgNsVYM0VaugCA18O
   elBonY6PBtrgpRuWo2y0fhEc5v7t884fzoVmwbPAj1sjFRzS3GtDmEqFB
   EI+L53EfvkP9syA1XaY6OVUh45N8MNUkHdbsYxxjiP9ETEEDWZmt2aJUH
   7GdfDQfUpjNqNdEFeXnWtJTsN588ssUGbhDe1akEWqh9C3gzmMCJzrPAv
   tr/R4WXOa3th4EY1/jg/vG6nRQm4AzB1xgVobh+ULa7cqwjCipbEWxDpR
   9yQ6uPnRfZSVo/EJ7YCWTkz3+c6Ewnj5n4QaWVao2DOrOShLKpjmZ4hHz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370571392"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="370571392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 19:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="757683000"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="757683000"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Nov 2023 19:20:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2NV7-000BkU-2t;
	Mon, 13 Nov 2023 03:20:37 +0000
Date: Mon, 13 Nov 2023 11:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] ppp: limit MRU to 64K
Message-ID: <ZVGV2hIhSNWU9ylR@a9cca7fa5d54>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113031705.803615-1-willemdebruijn.kernel@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net] ppp: limit MRU to 64K
Link: https://lore.kernel.org/stable/20231113031705.803615-1-willemdebruijn.kernel%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



