Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185320F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685176259; x=1716712259;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=spHlOhP6XJ5XUXeg5lCJxnJUQ1S7p9+r5h6LsC0+EFg=;
  b=cYJZtkorxyAzV3kdRflOZrsBv6Qme9bW9KLxuRbwmeHlIvC3RDk6zc3G
   1vkzDYfQUzBjsprkHMgHcc+Plz+P0VbSf/MKT3OV8ixrj3KqLfd5gWrpY
   dvcSy5672c1mdN483G6HlrE5jjZ049/fTf/DicizYr9yFt/veFJ2caXI/
   8Z9bm5ZsyLMVTmprgwA6WKWsvQyPiU5m0M0qLeEzwuMt8j7Nh1Lsvywxg
   JhTlQRqhs3kDyWSWQlIG50aAab+NXFZNRw6ow/TUY4LHVWJWp0Davdg+Q
   Qlwc1M5BKkZWN5AMSe5Hk4/ktASqfyfEn00wLwngCU8cX203C30GOYBnm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="417859602"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="417859602"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="708646563"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="708646563"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 01:30:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2pKC-000Jre-1l;
	Sat, 27 May 2023 08:30:56 +0000
Date: Sat, 27 May 2023 16:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] wifi: rtw89: remove redundant check of entering LPS
Message-ID: <ZHG/t/dgpF807Z3u@3bef23cc04e9>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527082939.11206-4-pkshih@realtek.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 3/3] wifi: rtw89: remove redundant check of entering LPS
Link: https://lore.kernel.org/stable/20230527082939.11206-4-pkshih%40realtek.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



