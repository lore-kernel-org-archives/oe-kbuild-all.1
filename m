Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2FE136351
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232564; cv=none; b=duqNLcpc/MNKOOVzQyuzjgnOyQ37rqaXvGFxtD+WA60zwqZFjHZcJg0hW1lMR3aTYsvxgEAhXOCxdjKijFvnPuIcmgAv34JNqoLJnWK549phSOGVJBspBTMMm20bw84BKNAsNZc/j46n8KEh4iGxUaZ4TeAAtoJGqbYyWwHcli0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232564; c=relaxed/simple;
	bh=+jzByVy5ReWMZ0jPkjlqojd6v3KEl+muB4zudgBdlUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ14imF1WPdTnOlxctJS3vc8RlsFk8mrqRLnswZHuphvuy4Yi9LCXxIWdycreM33TzGaUnejPna5CRjS5e5EYXXHkaTWygNSIP64JZDC1/30jGIPDEgTGPe5DpI/VHpvjKga+qCMkv3M4cL656thUZUo6AYXDFoOu6tofh94blA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kI+ohojV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kI+ohojV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747232561; x=1778768561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jzByVy5ReWMZ0jPkjlqojd6v3KEl+muB4zudgBdlUY=;
  b=kI+ohojVmppjrEnATFaXx072SD4BsIaLs0IPDQZ4ugse0h2KRAEcG0gU
   VN9bKLlcxGSjnSDplQeT2tS0lFSd2DormrJECNZP7CFlkLTiccMGd91BY
   zqZaaDR7a2IF71DewEo27iJPquPmkFrkPMwMDkyZEuiHqCx8KVcB3EFNz
   Swoo4SYUHR4xS5wqVHpSH6nJgkKzFfxkfOVBN1U+uiXjwD9F1KSQCzyIc
   e1iaEHmakeTTJnJlkxtEba1Vz2rRxlS3pc4UOvDRbL5qKGxfC6ylNXJt7
   i7X04QyZ3wdAkT6VmVkFMKTZ+svE71ikCeKWPi9KYBjwUk+7glzXs4QYF
   A==;
X-CSE-ConnectionGUID: oG1QsPCNSCqOZW9TehJ3jQ==
X-CSE-MsgGUID: E+dNjfDsQRe/YAq6UxmiPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48816199"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="48816199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:22:41 -0700
X-CSE-ConnectionGUID: giu3/B8WRs6K2TdqLBDAXg==
X-CSE-MsgGUID: 0PFTEArqQ2Kk9hpNdeQmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="161348943"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 May 2025 07:22:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFD0B-000HDr-15;
	Wed, 14 May 2025 14:22:31 +0000
Date: Wed, 14 May 2025 22:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, kernel_team@skhynix.com,
	torvalds@linux-foundation.org, damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
	will@kernel.org, tglx@linutronix.de, rostedt@goodmis.org,
	joel@joelfernandes.org, sashal@kernel.org, daniel.vetter@ffwll.ch,
	duyuyang@gmail.com, johannes.berg@intel.com, tj@kernel.org,
	tytso@mit.edu, willy@infradead.org, david@fromorbit.com,
	amir73il@gmail.com, gregkh@linuxfoundation.org, kernel-team@lge.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, mhocko@kernel.org,
	minchan@kernel.org, hannes@cmpxchg.org, vdavydov.dev@gmail.com
Subject: Re: [PATCH v15 02/43] dept: implement DEPT(DEPendency Tracker)
Message-ID: <202505142218.Mzer4xnE-lkp@intel.com>
References: <20250513100730.12664-3-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513100730.12664-3-byungchul@sk.com>

Hi Byungchul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3]

url:    https://github.com/intel-lab-lkp/linux/commits/Byungchul-Park/llist-move-llist_-head-node-definition-to-types-h/20250513-181346
base:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
patch link:    https://lore.kernel.org/r/20250513100730.12664-3-byungchul%40sk.com
patch subject: [PATCH v15 02/43] dept: implement DEPT(DEPendency Tracker)
config: x86_64-kismet-CONFIG_DEBUG_RWSEMS-CONFIG_DEPT-0-0 (https://download.01.org/0day-ci/archive/20250514/202505142218.Mzer4xnE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505142218.Mzer4xnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142218.Mzer4xnE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_RWSEMS when selected by DEPT
   WARNING: unmet direct dependencies detected for DEBUG_RWSEMS
     Depends on [n]: DEBUG_KERNEL [=y] && !PREEMPT_RT [=y]
     Selected by [y]:
     - DEPT [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   
   WARNING: unmet direct dependencies detected for DEBUG_MUTEXES
     Depends on [n]: DEBUG_KERNEL [=y] && !PREEMPT_RT [=y]
     Selected by [y]:
     - DEPT [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
