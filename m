Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387879D8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677860903; x=1709396903;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=mJfFLqQNlGLKYVGmiqt/zVaRBspmVn6dqILuvq4QdNw=;
  b=dsB+6dbxaNUKYbu8jUjKBt+/reZ3K/RYP5ud3myBtIEO//VUeh7lITnW
   g82U+Jne7ckGeA6JoWBaDF3/QtmECh1h0lLbqpu8BqKBSzDTX+gfJy5eV
   7klNV3VUuZztPPL7VloE/HEdptkl3bPAU+Qa7QHEU3OlsEZgAprw/gAAq
   H2cMC6I/xTYHsK93Eyyjqg3j0daxyWURaCHouAb5uT6ArAgCDk/97PFlD
   JvITAOX7v7sLg15QnNAd9tB0WnBydPJT4M3POfg7vCyviks8RUJ2eaTOO
   CeSTANS5nrM3ifoI/P+JemzAv1ddTsII+p6WakORqGjpgRLAf9piewfHc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="314740236"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="314740236"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 08:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818525511"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="818525511"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2023 08:28:18 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY8GY-0001Xs-0F;
	Fri, 03 Mar 2023 16:28:18 +0000
Date: Sat, 4 Mar 2023 00:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs: add backporting and conflict resolution document
Message-ID: <ZAIgFLJ0tRCxzwjN@5bb25e6b0e5e>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303162553.17212-1-vegard.nossum@oracle.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] docs: add backporting and conflict resolution document
Link: https://lore.kernel.org/stable/20230303162553.17212-1-vegard.nossum%40oracle.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



