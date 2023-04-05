Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622BF7EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680692605; x=1712228605;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+hLliYYIonZIdon8qWdGM0W8gjGNtAs0W2oC7Td2RNQ=;
  b=Rv4lhlKmI2N9Et14ziZySt/NScT9qj7bxp9v5KQpcRpYNglwpSpRYs5J
   DKuAjhM6qKkQKcMAFPyb0MVqJ8IlDhuEM6LJ+CCLJ08UIis48+eKb9nr4
   oqgyU3RnOSGxdQgFaDemcy1mnJtdafubRGQ3FO+yjVUmsBlopcBaYkf6w
   GTtQf7wFuHEgN6CwsxWn1uTRCQobK79u84yEBwcZjjbX2cFTFv5NKTcLn
   JVO+AKjTMuZ72AyqDL7t1yWcvW2c+zl1bYAuRYs+OVeSdsnVXU0h1QL0J
   HysOxiw7TRWEv4hoOPwy+pCgcy00ypA1xW0JgU8GkybNEYHP8B0tfiXUJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322802995"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="322802995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:03:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="797874121"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="797874121"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 04:03:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk0uz-000QU8-0z;
	Wed, 05 Apr 2023 11:03:09 +0000
Date: Wed, 5 Apr 2023 19:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Shaun Tancheff <shaun.tancheff@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] memcg-v1: Enable setting memory min, low, high
Message-ID: <ZC1VQvSSAeF7AXlE@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405110107.127156-1-shaun.tancheff@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] memcg-v1: Enable setting memory min, low, high
Link: https://lore.kernel.org/stable/20230405110107.127156-1-shaun.tancheff%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



