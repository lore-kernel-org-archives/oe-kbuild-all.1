Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F19320C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682716187; x=1714252187;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=jl1xKxx2Fy1RbyxMCQG4rcWYLUwluCMgm9E74hiSxPI=;
  b=QoiZKEIfMHzX5m8AAWcezhsFuqfcgtKSRM4cXy24ZbkTwnttZPyugtcy
   AR7yBJiojYPvLZuUc9RoLLeXt4uSvJ5l1cEgMtcywjt9lbs4d03XsSyYX
   EIvnymoc6yz89Dqie3pbRcEM7hfSv/SOWQDGLI01AmXbp7Y5m6F8hEeIE
   WomkcG979LD19blIbjjR/nSD4WcuA9QmuHR0QmfErCtYbcJBjrubaJdAu
   Mm0Q3jTs0g371sOxtczoUNTwtWM90ySy+bVDEtyvhDkAZe6L/OReGZBqD
   huSKDW5vD1kLRyd1G2sAR20CsEXxQM/6esTTMXu+OTth9mOuk+uha9ObI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349890007"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="349890007"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 14:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="725471849"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="725471849"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Apr 2023 14:09:44 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psVLc-0000gz-0A;
	Fri, 28 Apr 2023 21:09:44 +0000
Date: Sat, 29 Apr 2023 05:08:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sagar Biradar <sagar.biradar@microchip.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] aacraid: reply queue mapping to CPUs based of IRQ
 affinity
Message-ID: <ZEw14CU6rNtHz7Em@afc780e125e2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428210751.29722-1-sagar.biradar@microchip.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] aacraid: reply queue mapping to CPUs based of IRQ affinity
Link: https://lore.kernel.org/stable/20230428210751.29722-1-sagar.biradar%40microchip.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



