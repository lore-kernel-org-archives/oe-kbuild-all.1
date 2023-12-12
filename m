Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67C275403
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqwpKgaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702394661; x=1733930661;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=p2IUJrC5Gk9zGOG5a3pPHEp8ky/FvfByH9MNDDfIYX8=;
  b=AqwpKgaT3qw/5cuClFKWaGSEy6q3SePxsthOEF8nrqYTSxPUBKEbAiQU
   iVlGyg16k46J9GE6lxoPlldY7Q2J6PQZFUMhoDRSRFDKnl9fuG2mKmdEv
   8Jf0e+58nGKDfTeTX4fPj/aPIusBt6qcI7F5EXr6BaEY9+kgSgGM+es4+
   U02lmCD6/EO0OZv0/LU5jPYdcdPW1BFQh/44jFTMO7+iOoEzIN9U/Njs4
   L3JMHMtBYI8tArGlbQpMjuLk+MMib08Fg0ZLO4b64bivvyQrFhX/ZZrHq
   EhWvVQAvHHcJfRtlfPvcBbN18QbcDZikxWfxDm0prULM+1rCjQZraUoCP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394567186"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="394567186"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 07:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="891629322"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="891629322"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2023 07:20:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD4Z0-000JJr-0S;
	Tue, 12 Dec 2023 15:20:50 +0000
Date: Tue, 12 Dec 2023 23:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Gavrilov Ilia <Ilia.Gavrilov@infotecs.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] tty: n_gsm: add sanity check for gsm->receive in
 gsm_receive_buf()
Message-ID: <ZXh6UNFgyochTbrt@171f04e7aea4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212111431.4064760-4-Ilia.Gavrilov@infotecs.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 3/3] tty: n_gsm: add sanity check for gsm->receive in gsm_receive_buf()
Link: https://lore.kernel.org/stable/20231212111431.4064760-4-Ilia.Gavrilov%40infotecs.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



