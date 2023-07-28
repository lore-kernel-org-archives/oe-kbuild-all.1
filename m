Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46798134BD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690551615; x=1722087615;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=3tjnsgmfUMH9FUviQhsXvpNDxJRRTmls36zy4yA0BaU=;
  b=dGTEDzvaeq8hfKnnQfllThLAVfDC+lIF0l5A/gQST5EMVS+kXC0JlML2
   g10iNWmcnr34QyV1UMjZUGI+nmmvlbFQ+m5Uws+lbBPfVaN2qgJYu49d/
   5lTlQl4FLDPle+0lsw8S1C0i1pSChbUAzTFLo650dw3nS8rsZoUkpffhv
   ZUS0887RFoyY/8h9cWqobgNYlb35Sarfq9O4Vig35xcv+2/Imozd+hVQV
   lJzVOLjCjm7RPNeMeSLG2cCckeuvYnE74W8Q2nd2HeXYPkoX5e4ZUL39Q
   R1afLIlndDaMxeTFQL1pbl7Q2BkbG857sygkS6gwBBHIJUaqjeMVr6LJ2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368607843"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="368607843"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 06:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677542473"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="677542473"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Jul 2023 06:40:12 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPNhB-0003Fn-2u;
	Fri, 28 Jul 2023 13:39:59 +0000
Date: Fri, 28 Jul 2023 21:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Remi Pommarel <repk@triplefau.lt>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] batman-adv: Do not get eth header before
 batadv_check_management_packet
Message-ID: <ZMPFKLFOqbnJOdDW@c507f7d2ae6a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728133850.5974-1-repk@triplefau.lt>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net] batman-adv: Do not get eth header before batadv_check_management_packet
Link: https://lore.kernel.org/stable/20230728133850.5974-1-repk%40triplefau.lt

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



