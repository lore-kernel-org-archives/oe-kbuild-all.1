Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29423A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jan 2023 16:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673369462; x=1704905462;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=BAd06rtmMXFRaSqKZ0oSUYvyH0olKfYhzZL/Ml6ObJE=;
  b=TRHfAXRj7dfZGyf98x4aexmGZfLAjvjaT+s1+y71TzbnQPZPfTOq1prk
   4kSlTIpDIV2n+5r61TwUzdQKAtsmey4kOx2e41mxmqBYYgqPWg8YyqLYa
   dgSFIsC2a9iZub/KQZw7GBRTCIODnHOBpP+aHIKmQp0dpU3CatM0F+j6q
   5GOOx/pcfKffQsDJDG7USXNLoUV3Ffu6lUSvz11H3CRjiZU89JjirVuFT
   ZMhypuNqzgCUf/K+OKW8KM6hfwJ9zXYZTi2ZbdwBB7xOGdI5u+6EC0CAI
   8DXqC+4cPOZPhlhlWrkYygMyntt8guO31/IWZu98wc9O6BgpZrkDQ/p28
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="310997793"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="310997793"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 08:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="745838371"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="745838371"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2023 08:50:59 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFHpz-0008Da-0a;
	Tue, 10 Jan 2023 16:50:59 +0000
Date: Wed, 11 Jan 2023 00:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.15.y] io_uring: Fix unsigned 'res' comparison with zero
 in io_fixup_rw_res()
Message-ID: <Y72XbqncuE9kRqKJ@d82c38c126d2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110164647.755556-1-harshit.m.mogalapalli@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.15.y] io_uring: Fix unsigned 'res' comparison with zero in io_fixup_rw_res()
Link: https://lore.kernel.org/stable/20230110164647.755556-1-harshit.m.mogalapalli%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



