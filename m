Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B5364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 08:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683709045; x=1715245045;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=hsDroL5OJfwMcPeLPQf0whZvyXbB6eA/ti5XoHR6W7o=;
  b=GVMVlijJnrtpe//Nb11lfoj6f6w/mv5b8gKec3f5E1OrjRxQ5Gov3txc
   LGwrV1VmZNlz54R5i2h8gQbbyDi0t94p9Hbagro/rP9uc/5dfkykd2MVn
   K2a2ugp9em+fQeF+ceiq+3COUHgGg4CXq5oL5oikEQ7RZyJwQVvdX2syU
   s4WL/t0I6ITwHauV4M8ursQDmSnQbHUdZ3b/3WMZ+0EOlKVcHDY9514o1
   oiT0TG2e2MZKdnC/k0wyNbGnzuV/tQW90f2++CSpZbx/V80tCQ72IegAy
   8N+GLbdB+9lALAl3yRFDXXdS3M6QevAsHlhSq6txik/LOcAMUqx2gT7wi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436486819"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="436486819"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 01:57:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="693315398"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="693315398"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 May 2023 01:57:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwfdS-00034u-2L;
	Wed, 10 May 2023 08:57:22 +0000
Date: Wed, 10 May 2023 16:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized.
Message-ID: <ZFtcS9tw7e29ylxz@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510085451.226546-1-jfalempe@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] drm/mgag200: Fix gamma lut not initialized.
Link: https://lore.kernel.org/stable/20230510085451.226546-1-jfalempe%40redhat.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



