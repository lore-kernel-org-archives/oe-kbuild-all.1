Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7831E6AA6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 15:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688485080; x=1720021080;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=BccB/jLG0jTsPhFXGuSY5h0bnIwFRBA0N62/vzxLcIU=;
  b=NBnnBCoJNkbY9ePUnSTWaKlQBsWEon79+/ihFB/U0XwFx49VZab7nPpT
   6pPrTCn/gGZapkhLLIIgpX80r+lc+xYRoKevA03yx+Ww9NZmpC1xNe0AU
   ouzUFEjsB6BFAtIOT5RNLisf30KKpXh8PrXrqR9dHkShawXtCqmeyLL+K
   aZnBMP/TKzAThfVVEeF7rLnvhZ0twe1fmYydn6+TNUx6maPH5zypV/nfn
   /7SmcLLxKOOEKDioaKks0c6du7RLwlwrKmIIgLSvcEyeTn7cE8JaAt9Jf
   SnUAQbFfLRlXj6L3eAScdhFFZYdA/2q3Hz2EZyw32fZbsWHKNc9qxz4z6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="366628470"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="366628470"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 08:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788889465"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788889465"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 08:37:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGi6H-000IKl-2X;
	Tue, 04 Jul 2023 15:37:57 +0000
Date: Tue, 4 Jul 2023 23:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Florent Revest <revest@chromium.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/5] mm: Make PR_MDWE_REFUSE_EXEC_GAIN an unsigned long
Message-ID: <ZKQ81doy5ARaykJs@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704153630.1591122-4-revest@chromium.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3 3/5] mm: Make PR_MDWE_REFUSE_EXEC_GAIN an unsigned long
Link: https://lore.kernel.org/stable/20230704153630.1591122-4-revest%40chromium.org

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



