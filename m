Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2B7748E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674322902; x=1705858902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZbzLBRSYHALctzAHZ0CNb5mY62MyzVCgbG2fg+bYig=;
  b=SZ50trQnwyJ1etKKdXSYsHEeYgqIPwC+gxTDDHwsSs2WFXjjW1itm6EF
   ceXWsL/pX1ZWloA/5qaHb4V4lwRiZVratz0btPbr60roQZzSdiBuLJ9yz
   /Okj8y+3RLdIplPpQKNtYWi0LBxbrt0HwOMpC3IGuuZP2Ist09cmQ9m4u
   t/TwdwkMBm2Hm2bT+CgQgFcJ1jHb+IXQt7JBhdpshBH+YLjeP8kzzgT6T
   1m6F0bImjUD5fxyCeqluogfukYLE6Kplb0drRNbXTfJX+M8HOAUrmZWev
   p+fPKQXM1qGO3xdzaw3yDCEVLSyBr/RCHbFGO8JUEiMYHoLSwkPlLNsgv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="388167993"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="388167993"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 09:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="729472795"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729472795"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 09:41:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJHs1-0004KA-0n;
	Sat, 21 Jan 2023 17:41:37 +0000
Date: Sun, 22 Jan 2023 01:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-doc@vger.kernel.org
Subject: [drm-intel:drm-intel-gt-next 1/2] htmldocs:
 Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32:
 WARNING: Inline emphasis start-string without end-string.
Message-ID: <202301220116.qlw4dHOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
head:   8d7eb8ed3f83f248e01a4f548d9c500a950a2c2d
commit: 0c3064cf33fbfa8a25871d847e715f33b64f323e [1/2] drm/i915/doc: Document where to implement register workarounds
reproduce:
        git remote add drm-intel git://anongit.freedesktop.org/drm-intel
        git fetch --no-tags drm-intel drm-intel-gt-next
        git checkout 0c3064cf33fbfa8a25871d847e715f33b64f323e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/gpu/i915:64: ./drivers/gpu/drm/i915/gt/intel_workarounds.c:32: WARNING: Inline emphasis start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
