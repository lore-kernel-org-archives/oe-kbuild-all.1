Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB54D524
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 May 2023 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684161813; x=1715697813;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Wf0+cuG2mo7fxpO+wkozIgwmAySWWppcywDNEn85Mss=;
  b=KvlYZtebx4pur6A+JVVZU+oyPFDLKr0eKQhfBFgk3Q+xtxgwlYoFPVUJ
   OI4Ojk+G1PoCmqS4Cp5k/0oUzsL6gT8Cm3qfS0EzX3FMvVZnSEm/QjyfU
   v8zA4UsAQZpQsVrDzOGsQRbhDlssdC8WCh5SZIF3yqWW+xRIJ2NZbcBzx
   /KczeYMntlr8IKi7XQW2hr7JMKeyb40weYedLJv8vjsFsZVKOqDihvQp4
   56PKUmhm1bsfJq3xwAVXmOh5m1zHZadsjUM5g3yX5yrUwFIFNKN7LNZSk
   tLa2tGDowzRHZfUsjbG9Ok4Z7Gq8LyxZHwkUOZKlktDQ08s3OjSVJZp1P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="416869960"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="416869960"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 07:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695035251"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="695035251"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 May 2023 07:43:18 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyZPx-0006P0-2U;
	Mon, 15 May 2023 14:43:17 +0000
Date: Mon, 15 May 2023 22:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2][For 5.15/5.10/5.4] spi: fsl-cpm: Use 16 bit mode for
 large transfers with even size
Message-ID: <ZGJE/Ds1S/rskh97@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a1b8774ad7004acb594fbf220f98488dbaa2896.1684156552.git.christophe.leroy@csgroup.eu>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 2/2][For 5.15/5.10/5.4] spi: fsl-cpm: Use 16 bit mode for large transfers with even size
Link: https://lore.kernel.org/stable/3a1b8774ad7004acb594fbf220f98488dbaa2896.1684156552.git.christophe.leroy%40csgroup.eu

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



