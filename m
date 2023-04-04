Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71AD2F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680641507; x=1712177507;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=sN0sU+Z3KFvHPELOIkUyvxC/trytnuZU6N+uD76iUao=;
  b=kCbfvFaIccIpzLTbPISaj8661BPvgLqu1Il1py0fPxVz/heSJZT56Mdx
   VYLtpK+68CiQvccadZ2NDKSx2Tw+aYJGL1Jc20wTaFPk4meCX6ii8KGym
   0Eo5x0cYsQQMQyV32UpIPXUF1pQk+tF3Y4WERLp/2pGffv2jdP8Ibph5X
   q5UD40tl+lrUkOrKwXhBJWGNZYrVgbyEjlrUAUYah1aZwbZpgnu6cxj4m
   +c0RQDO9KiUQdt2e2uH6xI7E84sPc2ClMf3jx5z52jrfA/LaU9hZPMZYv
   Ymv1XfVdaSWXzWCdbegEBGmxaa8yPOsqi/bMvQP34geX51lIhQ8wPi4bC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344015821"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="344015821"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 13:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775795214"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="775795214"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 13:51:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjnd3-000Q24-1U;
	Tue, 04 Apr 2023 20:51:45 +0000
Date: Wed, 5 Apr 2023 04:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: Shaun Tancheff <shaun.tancheff@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] memcg-v1: Enable setting memory min, low, high
Message-ID: <ZCyN3x8n3vZNXUYh@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404205013.31520-1-shaun.tancheff@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] memcg-v1: Enable setting memory min, low, high
Link: https://lore.kernel.org/stable/20230404205013.31520-1-shaun.tancheff%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



