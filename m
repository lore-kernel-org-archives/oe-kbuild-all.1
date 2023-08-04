Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2199134B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691162979; x=1722698979;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=RXUgXJ460/N3w4ixn9YIAH2dxiya11UE6bCAGMuC4G4=;
  b=U259QsO311mBH2iZYggpag+b2BrJ8r+i8mD5PddFwX0/0d+NtpQvtkve
   wp0hz1wnOlydcbclP3KukX1R9udtGC+bo5PgsC1ZQr7l+2dBNitdn7XEK
   1Kvb9Tph0WbX2m+7trHHGy+8tGeUxYgiYnfciqAkqdMgIM66uzg4XdBq5
   JgU4Q5vIYAEki6qd+SX2L7n11s1eF5AHDemdL0tR9XPXFYenKN3TT+S9t
   cw6qq7zMo97k3qWW5nqBrlq/5heta8cN6cCLfHBk51FqhqH8dIh5pEBF/
   5ueW5inRP/CUS1Fc5NGvBjjFg7OmdryP+FdsNfMYOtrWhCM06Uru1L9jQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372924415"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372924415"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 08:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976622864"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="976622864"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Aug 2023 08:29:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRwkD-0002vN-0v;
	Fri, 04 Aug 2023 15:29:37 +0000
Date: Fri, 4 Aug 2023 23:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock
 assertion for vma and mmap
Message-ID: <ZM0ZTrTtj/McL+FT@11d7ca01dc46>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804152724.3090321-3-surenb@google.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v4 2/6] mm: for !CONFIG_PER_VMA_LOCK equate write lock assertion for vma and mmap
Link: https://lore.kernel.org/stable/20230804152724.3090321-3-surenb%40google.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



