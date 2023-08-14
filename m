Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87FBA921
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692002866; x=1723538866;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=ZpHR6iGCaUYj7VdQTowDjj9YmEhOOecajoJi4Qg8ChI=;
  b=iWk1E91FAFUD39mFpyL6pVnBU/7jvpip9aYsF2F71+XttoRxxvdNVio8
   XKmBE1qTWsUUN58mT76Fv83ifd1QjTif7tiDOiLCmLyR8L0So6fdHhAcC
   0r89dr+yACKBE/70Cg6IrG5h09o7dtp9ny4Ygl32IFgqTNvWxECBaPW0y
   dMunMW96oe0lXvqY8XFzyXIFTiObdTD7IVM6pfMqf61aRIL86Ewra1OI8
   9Nw0ihqXPNrRarWu6j/yepYl1Nvnp5nWWLrVgCBJkxJGmHTdPOJVx429B
   TgFyh+sv2Z6J0axvQx+VdCsejIprqEZX6lsWTGH9pFFCFU0tZhUX2kuLc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="435886979"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="435886979"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 01:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="733388529"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="733388529"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Aug 2023 01:47:44 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVTEl-000056-2G;
	Mon, 14 Aug 2023 08:47:43 +0000
Date: Mon, 14 Aug 2023 16:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/5] selftests: memfd: error out test process when
 child test fails
Message-ID: <ZNnp9se7p9OKeP3q@de6b5a1e2688>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814-memfd-vm-noexec-uapi-fixes-v2-1-7ff9e3e10ba6@cyphar.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2 1/5] selftests: memfd: error out test process when child test fails
Link: https://lore.kernel.org/stable/20230814-memfd-vm-noexec-uapi-fixes-v2-1-7ff9e3e10ba6%40cyphar.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



