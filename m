Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842CB53BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlZWHe4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700385334; x=1731921334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j6DquUxB0ba+bsvgNZ+qh/zcBdPlPI6Nucv2UnglaFY=;
  b=PlZWHe4zXws899mKSqw6O7qvEhxdBsdpZS9Kiyid4D2s4FzEa01+BtDT
   cEnKJCVe3HgI4oR8BHHfWo1XwGey92peZEL6yeh/P/CjVKmdy22Ikacsq
   6UjYsYd47hjXcOKuyNtz+oq2uJiKBRDxxiKsqq5nO9rZj7qa15FnpclqT
   JeH8S7VmPDXguqjbLsxeU1kHz9qxO+07Ex8L9gky/lbgiCqtpITo7Tb7W
   XuH79AY1rbncfzIiCGta7Ruk033MoPm1LwPtmnsJg69zbtDuPQdVYH9Rt
   eRgYbAROrHxUkoK6pvsfySEqJVY/WWaH5mv1zCqukBfxFrmLryNiYwroF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="422572718"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="422572718"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 01:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="889641186"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="889641186"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Nov 2023 01:15:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4dtl-0004tb-1i;
	Sun, 19 Nov 2023 09:15:25 +0000
Date: Sun, 19 Nov 2023 17:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, deb.chatterjee@intel.com,
	anjali.singhai@intel.com, namrata.limaye@intel.com, tom@sipanda.io,
	mleitner@redhat.com, Mahesh.Shirshyad@amd.com,
	tomasz.osinski@intel.com, jiri@resnulli.us,
	xiyou.wangcong@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, vladbu@nvidia.com,
	horms@kernel.org, daniel@iogearbox.net, bpf@vger.kernel.org,
	khalidm@nvidia.com, toke@redhat.com, mattyk@nvidia.com
Subject: Re: [PATCH net-next v8 13/15] p4tc: add set of P4TC table kfuncs
Message-ID: <202311191752.mYGymxfv-lkp@intel.com>
References: <20231116145948.203001-14-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116145948.203001-14-jhs@mojatatu.com>

Hi Jamal,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-Introduce-dynamic-actions-list/20231116-230427
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231116145948.203001-14-jhs%40mojatatu.com
patch subject: [PATCH net-next v8 13/15] p4tc: add set of P4TC table kfuncs
config: um-randconfig-r132-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191752.mYGymxfv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191752.mYGymxfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191752.mYGymxfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: net/sched/p4tc/p4tc_tmpl_api.o: in function `p4tc_template_init':
>> p4tc_tmpl_api.c:(.init.text+0x71): undefined reference to `register_p4tc_tbl_bpf'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
