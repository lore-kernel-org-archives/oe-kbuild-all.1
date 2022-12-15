Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA207190
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Dec 2022 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671117153; x=1702653153;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=8fGzHXQ3ieml722S6qgKR16cdo8fHidbjyCiG3c+O3g=;
  b=H2STQ3Sw9nkN+120lkEnqzl1vVX5jedU+RcDPbAS0NLM9vHPx1HJM27R
   m2MS8YKaLggYbhEd8zKn6JLOvCxqXlvYoVmpQxinmDvtEl13nuq6elVwx
   4Jchw+EEQMGcRCNIDzvuH+WsohBttcgQJQ4uopuv2Kop3cx/n2M9xCjRJ
   hzALIGTA44Ye6CCKmI6KKP31ZUNE40Yb86bXskM82BAkA3dr8ovVpI7r/
   LNklY7eDivt+2NAat8XsxhjBwwdhmbLZh8jU7Q4/C2mse3QtpuCzyvKJS
   YmYyyYjhSzsP8llJxg+LXWlXNVwj/qEkj9Y/cm1LWGcnFOvHVemnnZhHF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="383021036"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="383021036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2022 06:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="680112879"
X-IronPort-AV: E=Sophos;i="5.96,247,1665471600"; 
   d="scan'208";a="680112879"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2022 06:50:53 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5pZU-0006LO-22;
	Thu, 15 Dec 2022 14:50:52 +0000
Date: Thu, 15 Dec 2022 22:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eelco Chaudron <echaudro@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v3] openvswitch: Fix flow lookup to use unmasked key
Message-ID: <Y5s0GEK+ylnDnpXP@416bcb91c936>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167111551443.359845.7122827280135116424.stgit@ebuild>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net v3] openvswitch: Fix flow lookup to use unmasked key
Link: https://lore.kernel.org/stable/167111551443.359845.7122827280135116424.stgit%40ebuild

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



