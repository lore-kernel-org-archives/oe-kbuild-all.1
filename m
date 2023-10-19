Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C280C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 02:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkRDoCqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697681644; x=1729217644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6w9NaNZaxRYGbedKvIhg80dRRXAX254bKEkPbIF96w=;
  b=hkRDoCqYH4fiFExkQJ5xkpL8734sS2EH4U/9kA3ZpL2YihsOWqPiC4WG
   4MUl4pWRizRAMibKbPGh3kAwJVzUYiXnr/iUIVKJdJ0YpKVzZNNczsccs
   O05KdbsRd3xwvyECKaRGe1x3mtrqTJrG/Vm3fGP7KB82PgC0UZm1vCJm6
   wJXcjbTS3aR0t1ynpBO0li8OkJ5TXAc8g8TF2i6qxKoI3BGW7/6LMdGOM
   IovveqVyvQkaZ9rpnp9vzWQ1y9QkKanJiB1BeCbF7ojzdgsPWnYpIKLfp
   +9Y3GxahM0QtuIy8yGGgiwWuJazlAMeh7PMdY2ZK9GRlx2uBLD/mfwJqd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389018091"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="389018091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 19:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791833077"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="791833077"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 19:13:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtIXa-0001Qr-1S;
	Thu, 19 Oct 2023 02:13:38 +0000
Date: Thu, 19 Oct 2023 10:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Amritha Nambiar <amritha.nambiar@intel.com>, netdev@vger.kernel.org,
	kuba@kernel.org, pabeni@redhat.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next PATCH v5 05/10] netdev-genl: spec: Extend netdev
 netlink spec in YAML for NAPI
Message-ID: <202310191058.r3nsnBem-lkp@intel.com>
References: <169767398827.6692.6743112954598240496.stgit@anambiarhost.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169767398827.6692.6743112954598240496.stgit@anambiarhost.jf.intel.com>

Hi Amritha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Amritha-Nambiar/netdev-genl-spec-Extend-netdev-netlink-spec-in-YAML-for-queue/20231019-082941
base:   net-next/main
patch link:    https://lore.kernel.org/r/169767398827.6692.6743112954598240496.stgit%40anambiarhost.jf.intel.com
patch subject: [net-next PATCH v5 05/10] netdev-genl: spec: Extend netdev netlink spec in YAML for NAPI
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191058.r3nsnBem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191058.r3nsnBem-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#425: FILE: tools/net/ynl/generated/netdev-user.h:257:
+	struct netdev_napi_get_rsp obj __attribute__ ((aligned (8)));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
