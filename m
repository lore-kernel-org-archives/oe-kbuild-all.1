Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D717B19C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 00:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684196386; x=1715732386;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4U46PVwQJLgW+Vl8Kx+BVXEcb3nvvxhpNLneH88J8H4=;
  b=Bor9ZxfG0wTxqtCMjPuuWZ37VCIk7FwsiW3/oSC54HPbl29dxRuVYOPt
   x94ASfwZH7bWjdxOKpZbpz4AUbTaPOeORVxEqj/nYzTrvCc+8JFWntZjF
   ZsQAiDMh7wFGpgFORtXTMla+KgvXgz4beCweQ0cBXognDZ3VasJzwoBNd
   tkByqfXLb+0w3HJsY8ADJP0RcuRp6EjxXWCdS72sCbaIqVWkexW6mMsDI
   3aFULf6Fry8USw0WembkuAh+13riCpbWiXSfeZYpHw+46s1s4GVrGGSCI
   kqB1v4jJZ3SbiR4lNM1T63oSm+YY4vpW2eQAy2aN2hivq/pNJRz9v9pT6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331704964"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="331704964"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 17:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="790857636"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="790857636"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 May 2023 17:19:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pyiPo-0006mg-1h;
	Tue, 16 May 2023 00:19:44 +0000
Date: Tue, 16 May 2023 08:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sagar Biradar <sagar.biradar@microchip.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] aacraid: reply queue mapping to CPUs based of IRQ
 affinity
Message-ID: <ZGLL/THrnaGX4J9o@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230516001703.5384-1-sagar.biradar@microchip.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v3] aacraid: reply queue mapping to CPUs based of IRQ affinity
Link: https://lore.kernel.org/stable/20230516001703.5384-1-sagar.biradar%40microchip.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



