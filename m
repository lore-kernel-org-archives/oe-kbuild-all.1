Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474B515CD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689428881; x=1720964881;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=h/HgrvF3zglUJAjb3DAYgi/AlNNTXbQJ1hTrRY4kC6c=;
  b=iCQSLMbLxNJiXhbJNj7w5+xFn7e68e4es36T7w6P8yXY31upjgoGKLBH
   lj4yn2IT6+APJtx4MDHomKH7zZSUGQFpgKZf0I0KFYJttdSlAB9Iv995x
   poSWREffHUuxulpwXhAmbG1VIbuaZBe1wh5qtEKrtDr8EdYPDaRUAZEdr
   gON/OPCMf2ovvMMsVRVmRi559ja0X39QJeUV1xPKmZlrNN1Uy9FdUBqzi
   PAhV/Op/mFrDu52yW1ZUxz4XVnNqgssnnGHJNsxWufu2YReYPtcSQW28i
   DNIu8nuglrHBbpGFmL2rJB+NqFSujgvzEBDqKWq5rO+rwH15TUSGFOQtz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368304466"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="368304466"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 06:48:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="969325972"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="969325972"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2023 06:47:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKfcs-0008BJ-28;
	Sat, 15 Jul 2023 13:47:58 +0000
Date: Sat, 15 Jul 2023 21:46:58 +0800
From: kernel test robot <lkp@intel.com>
To: guoren@kernel.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: stack: Fixup independent irq stack for
 CONFIG_FRAME_POINTER=n
Message-ID: <ZLKjUh2YTdjsgK2M@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230715134552.3437933-2-guoren@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/2] riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
Link: https://lore.kernel.org/stable/20230715134552.3437933-2-guoren%40kernel.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



