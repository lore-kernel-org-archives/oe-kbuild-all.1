Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191F03209
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jan 2023 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673369172; x=1704905172;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=PkhBq/zvP+lRjp86ajagPkVnZzfkI+X9oK4GrUJ4TCI=;
  b=T7tJHtHsM/kTzmS4NR5+pEqL7k0w4XLVzeiYAocKvMXkcO//+vCkR+b7
   cLTRCiyTwYnD5yV4+APKFXPUKhNRHQEzNVpt32/bNxVmIJdcLsuRF9sW/
   FpAiOjUzHDHSJ309J8DPizWbHq1Ht/ENokFeM44NDciLpQroA++7e3I0l
   VC3JnJFqzp/5w/JigVYIy+kqnDXxoBoAlt4E5UBWuPt6kNCd4odotB7az
   HNQgd62z38mmy7tGbtAMn4n16lw92l5c8B7nJJwefuiZmGpIYposnDySa
   sYGoW5nxEoYiJCojaI6yfAd67l8gjcBZyGr94pOdiO3He3eIwVaB1J0sP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="387649456"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="387649456"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 08:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="687625635"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="687625635"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Jan 2023 08:42:59 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFHiE-0008D5-2P;
	Tue, 10 Jan 2023 16:42:58 +0000
Date: Wed, 11 Jan 2023 00:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10.y] io_uring: Fix unsigned 'res' comparison with zero
 in io_fixup_rw_res()
Message-ID: <Y72VYW1FaqvbCYKm@d82c38c126d2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110164044.755234-1-harshit.m.mogalapalli@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 5.10.y] io_uring: Fix unsigned 'res' comparison with zero in io_fixup_rw_res()
Link: https://lore.kernel.org/stable/20230110164044.755234-1-harshit.m.mogalapalli%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



