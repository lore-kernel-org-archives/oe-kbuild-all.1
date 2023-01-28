Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81F17CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 02:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674874456; x=1706410456;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=PypngMrrFwhJL0Kwt6te9i9ZVeh6uthQkHCgL5Uiglk=;
  b=F9/mY6wrzNLN+pZ086f/tienp030CvX3RyYQx/FU9HJWfQKHLz41TWzs
   frWDjfawqiOUiStROpO150bVtsDl7HMyK/f+sqmNtNQ8rXouA7rG/QDt0
   g57lfXp2mN9MdPlL5rr4CEYeXFz1GAvZBOyb9+eIBjvOL9DzqHCDOzp63
   kzl6o4HbdChEkoMpEXudrXhScK5XyViLBNYYNPGS1ee8wXzHxvga6CX5Y
   c3MT2cbNk3/MwBGTevckGReDD0x9IKoN6Ev0NiWCEoXROMTXiDQiS8Tit
   fDj5zJhrztWEIAOeT/HMJtfmAfNAYguc+FwO+BsYiXALBPJiemMCs4pGK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="413475489"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="413475489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 18:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="693923843"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="693923843"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Jan 2023 18:54:14 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLbM6-0000Ku-0R;
	Sat, 28 Jan 2023 02:54:14 +0000
Date: Sat, 28 Jan 2023 10:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Saeger <tom.saeger@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10 fix build id for arm64 5/5] sh: define
 RUNTIME_DISCARD_EXIT
Message-ID: <Y9SOUwRrhh5x5SJs@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c605722f1659d93d0e95402723830cf7bc74e145.1674850666.git.tom.saeger@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.10 fix build id for arm64 5/5] sh: define RUNTIME_DISCARD_EXIT
Link: https://lore.kernel.org/stable/c605722f1659d93d0e95402723830cf7bc74e145.1674850666.git.tom.saeger%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



