Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166A10E6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 03:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675394971; x=1706930971;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MuNV1TIMvNcl/UhWhouvSOMpjN7l8eq83kLUPAvY+pQ=;
  b=daSFa+U8L+OUztCH36hnukjFQcTn20ShZK7IgvvjiXbc77NXh1MesW3q
   zpCjwJ6FycyhHvvVXKkyUv2Px3PbSJ7hxdK4UZEpTE2EOIExNsnblPr+x
   T1lMTkokkO3g6mT3yiMmAslH/yNl05weS5VcVgwOOhRWYwElXcFXB1VOG
   qjzlJvvOgRY1Der7dao9WQXY3HYiDScDm2X3oZoWKXEXIHrilm8KfLeSE
   i86LhRsrK5Hdw8L7N42tDj3pfinLMigwmDbllAeyeIjv8IHaHgfKO0t8s
   D/CuniCtoKBv0zZFI/om0AoBpCO9a0Pvkj9ZO8yIeoQzrTlrhReR1H76c
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="329931574"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="329931574"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 19:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="774151085"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="774151085"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 19:29:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNmlV-000025-0F;
	Fri, 03 Feb 2023 03:29:29 +0000
Date: Fri, 3 Feb 2023 11:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Zheng Wang <zyytlz.wz@163.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] bcache: Remove some unnecessary NULL point check for
 the  return value of __bch_btree_node_alloc-related pointer
Message-ID: <Y9x/YmU23HV4N1W3@904499574ff1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203032750.578589-1-zyytlz.wz@163.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH v2] bcache: Remove some unnecessary NULL point check for the  return value of __bch_btree_node_alloc-related pointer
Link: https://lore.kernel.org/stable/20230203032750.578589-1-zyytlz.wz%40163.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



