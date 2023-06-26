Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE37464
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687771265; x=1719307265;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=OxoDYKes+yK7X6t6RqKhg0wpWRdW22YGq8MvZGmIHSA=;
  b=GogIdSlweFibRHeIN6amEljaEQX9bhuT6QUnp3va3ScMr3l+30M9CUAS
   dBjRaspduT8ln6ZEkbwZiDBg3lqaYjx1K1n1hN7e2AGA8hbYuPpd/Aaad
   NMmwbVmmGkhRHOx7dREK+MaCL/4u0LaOcqbwK+UNM+jCUA03UFwk696mg
   XzhfEb13tOcM/Rf2DXKez+47JyTQgQaTH43pDrt2PdoRta4tZvZ3ab2/8
   bgFXZxfE9r0ApqNza0TV5mHm/3LBwEaJVJbfyxbqqUm3Dxj8ehcFkgPkX
   6ZSD4m2FX352Pr85mrOHaFxAdw+xGP+YU2E1PhSjCLUyjdRMbXTjTTuCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="427215984"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="427215984"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 02:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="840198526"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="840198526"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jun 2023 02:21:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDiP9-000Aaz-02;
	Mon, 26 Jun 2023 09:21:03 +0000
Date: Mon, 26 Jun 2023 17:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: souradeep chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2 V3 net] net: mana: Fix MANA VF unload when host is
 unresponsive
Message-ID: <ZJlYbnr2UzONeu5U@65525e8f8615>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687771137-26911-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH 1/2 V3 net] net: mana: Fix MANA VF unload when host is unresponsive
Link: https://lore.kernel.org/stable/1687771137-26911-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



