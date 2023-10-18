Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43153630
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 00:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwJXFzn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697590258; x=1729126258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hBCoNzwppuYtIv3HP0cVy+EIKrWqggclGyfBNO0tN+U=;
  b=AwJXFzn5CeZnZykpn6PDySOU+MXXGtUcRR7BQYp9Q/LSDLfnYmd9fofj
   jVNoaF2PCO3qFaKDylrarewKMMuKKHNE0Rh8mKnJZ2CEy/fCyxtU7Q0vt
   97VV10tUJhjRMp2/NBY5NjXLZ+NualelntKpWCzvpmrDs/4yeygZp5QJy
   nZV2D/IImoqzWJC07waX/fDaFzrLsefKHICzeJULY064Ds8BXRJBSxg3J
   rx8uk6B/84nrVEZu2y5Ce+iVrFQxPoby3KZddFKgVyjqb1pmQ+/EydHYR
   mxq9PiT+ksYPcFTLQawzN628UPlEsxGyz19RTZV7hlDz0nxOfoQgwMT02
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384789519"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384789519"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 17:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="785672766"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="785672766"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Oct 2023 17:50:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsulw-000AI3-2B;
	Wed, 18 Oct 2023 00:50:52 +0000
Date: Wed, 18 Oct 2023 08:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: Haonan Li <lihaonan1105@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] pata_lagacy: Handle failed ATA timing computation in
 opti82c46x_set_piomode
Message-ID: <202310180858.o7Wjw0A2-lkp@intel.com>
References: <20231017233234.2170437-1-lihaonan1105@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017233234.2170437-1-lihaonan1105@gmail.com>

Hi Haonan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haonan-Li/pata_lagacy-Handle-failed-ATA-timing-computation-in-opti82c46x_set_piomode/20231018-073451
base:   linus/master
patch link:    https://lore.kernel.org/r/20231017233234.2170437-1-lihaonan1105%40gmail.com
patch subject: [PATCH] pata_lagacy: Handle failed ATA timing computation in opti82c46x_set_piomode
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310180858.o7Wjw0A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180858.o7Wjw0A2-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#31: FILE: drivers/ata/pata_legacy.c:582:
+	if (ata_timing_compute(adev, adev->pio_mode, &t, clock, 1000)) {
+		return;
+	}

WARNING:BRACES: braces {} are not necessary for single statement blocks
#39: FILE: drivers/ata/pata_legacy.c:589:
+		if (ata_timing_compute(pair, pair->pio_mode, &tp, clock, 1000)) {
+			return;
+		}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
