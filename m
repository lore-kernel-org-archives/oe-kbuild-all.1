Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7782720E8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688545077; x=1720081077;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=rz0v9QIUxLspvY/L3UqIDS0FVDS5+aMsMjXSkjqh5cU=;
  b=LFjiLONMyMe+iaMBDFq2/EHcjCr7x6ulw1BmL7ruhYaujC0RLZxDkSuD
   B849zBdOzLuFeqYfFAWyZadFDEI1RTIqaXOC2LJ8v78vUqBjWravbodCj
   UljnGLP5SOydBalxxmLplkN95+Kq43pmi5AWpGGGwvnMwLfX2o9kRW1yP
   GdYol1l0oZpt+fwD7ezsyjgooaQYWBk4rueSlP4Y1YxFNsdNpHUB0zWbS
   YVGl/u/vnrOhp9g2sNabOqrKVR+aywvA0grUPLq+Awi39D17w2CFiaO2/
   IMeMjiJRsNx0BhisD6L9fr8tduAqYKwb2FNv6ACljnU3J4DoA8dL1iiqW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365849919"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="365849919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 01:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784442204"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="784442204"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2023 01:17:54 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGxhx-0000Vq-0P;
	Wed, 05 Jul 2023 08:17:53 +0000
Date: Wed, 5 Jul 2023 16:17:49 +0800
From: kernel test robot <lkp@intel.com>
To: Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V5 net] net: mana: Fix MANA VF unload when hardware is
 unresponsive
Message-ID: <ZKUnLa+98qCZA5Dj@a1daa7802ad8>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688544973-2507-1-git-send-email-schakrabarti@linux.microsoft.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V5 net] net: mana: Fix MANA VF unload when hardware is unresponsive
Link: https://lore.kernel.org/stable/1688544973-2507-1-git-send-email-schakrabarti%40linux.microsoft.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



