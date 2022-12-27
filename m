Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2642108
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Dec 2022 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672151369; x=1703687369;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=dwkZnIeBEOLUv3nMjE8wSzvGm4l8GQibrnPUGKh0AWk=;
  b=TQZVXzZCZoj7aJnAX+qWwpYz/laSZ331NQYG/XJOjRYDHhmH3x8E452p
   mpi8W0F8pM7EtjW0LFyaCf6BU8riu7w8fFAdpSkDu5vG1cG35FkF8i4xS
   QeFr1HVXB6UoBNwWB9oXziRc4+fXY6tBqBMTcqCEiMaiV2kWiXQVhKDj4
   dPkZgWGucHhTbts/oDyCo7Bkhaun+KJ2hTCvrT40A+/637aH6n8JyGpoT
   7zAywB+/BGG8Cv/CJFRVlsl6cNIKTes/omhFhUoANkzbA9JFK3I3lfgz1
   HprCqumPHW+pFQjMA4rx+U9M0erRR6Q/ecg6bdPYXSdmPQVBEH0vYRnht
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="300395509"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="300395509"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2022 06:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="683629567"
X-IronPort-AV: E=Sophos;i="5.96,278,1665471600"; 
   d="scan'208";a="683629567"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Dec 2022 06:29:27 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAAxK-000F3B-2j;
	Tue, 27 Dec 2022 14:29:26 +0000
Date: Tue, 27 Dec 2022 22:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 1/2] lib/mpi: Fix buffer overrun when SG is too long
Message-ID: <Y6sBL789NM3i3nJL@181616e551cc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227142740.2807136-2-roberto.sassu@huaweicloud.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v5 1/2] lib/mpi: Fix buffer overrun when SG is too long
Link: https://lore.kernel.org/stable/20221227142740.2807136-2-roberto.sassu%40huaweicloud.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



