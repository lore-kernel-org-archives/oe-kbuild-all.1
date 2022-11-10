Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADFE625
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Nov 2022 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668070700; x=1699606700;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Gf3GXeUSlo7n0zjvagoFb2D9uFIDAkCSjtuVjSKZB3g=;
  b=L5ZyVPJBzlZ5X24pefbm1CPwsnZarHd85+HvT6DtLg9qnV7yFZiqvGut
   YiyF0MaacY+4RJsk721/87VumwGuDK/TpJqyKADi+tYiudaX/lwsAA1id
   +idKJUeo0XG+znVQSs7Pc6nx6fNn/nZ0L5O1yS4xIlQ24dhWlA/t08e2I
   dMe8J/Z3e4Kh52DPNtvc4C+5oOndkNeUGNiflrxrZTdX5/dR/KhfryXq6
   Ixb2Zk5bgA4ucn6qFs6IbnpqCXyElB2gebadEjZBbpJC0BQFcIcvnGSqg
   D7RQHbh+/Eh9OrNZXrRCVHw40JUaq7cQcqGuesAHpGvIF7lr9wnTnsEyG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312390970"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="312390970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 00:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="615026704"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; 
   d="scan'208";a="615026704"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2022 00:58:19 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ot3O6-0002gj-1G;
	Thu, 10 Nov 2022 08:58:18 +0000
Date: Thu, 10 Nov 2022 16:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alban Crequy <albancrequy@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf v2 2/2] selftests: bpf: add a test when
 bpf_probe_read_kernel_str() returns EFAULT
Message-ID: <Y2y88PVeCDK8MORB@9c6a254c5b7f>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110085614.111213-3-albancrequy@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH bpf v2 2/2] selftests: bpf: add a test when bpf_probe_read_kernel_str() returns EFAULT
Link: https://lore.kernel.org/stable/20221110085614.111213-3-albancrequy%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



