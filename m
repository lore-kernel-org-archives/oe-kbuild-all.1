Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC9122F14D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696015; cv=none; b=HRRg6X/O+NhMQTJBU7DI2Y9C/Wa5BfSbihK85G7Va7n/VLp0rY/BqkXVN7ii5eJ8coxsQI72AegBD36ZsoSbVZAS7VPrazObNDXYgrCWiVT3S00hFPONRcQKBDn/jQOsZo5hJ25KhPyBBwtxse/fD4xmdlU+QMArqterV2U1Bxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696015; c=relaxed/simple;
	bh=PfNYj1j/MgF4gLROmpaWAODWNKkDmt9M2toxEJ2yBWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5hx5Jor+/T5NjiHoQOyefJt/h6tpqDdubWZmVxPKyGNj3wo7wpC/MVfzDydTJEc9yDoS+3ZrnLK7D/HsPCsHeh7IajAbJXNOZGrhsR5fCKQ6s0Itc1+nrYXhXNkAfzFvcOggKJCCVn8uNhEn3ZG4HBBOcOGtVNyZPwCXcr+Ca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsqBqsJe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsqBqsJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761696014; x=1793232014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PfNYj1j/MgF4gLROmpaWAODWNKkDmt9M2toxEJ2yBWY=;
  b=PsqBqsJe5RXB49Owm43K/X6puZZTYp2XmjOdnwqfbqoBsk4M901u1yPx
   eSz8pMAmmMNrAHgof0/WfRlxRt/cXuNZbEPckXwIArHz6EmE+fG3t1P+d
   9YVRmzKN82SBIvG0Ag8Tc59XL3i7eC8UceGo1Mtp0z0B6xCMfF7PFjOvz
   Mnlpo07EDbHFoGDEznUZJ2lWYfJWe1mAXznTbOJX6nYsL4MhSUWvmX8b1
   +s7gG46TK8+bgFL+jUNw/4HwG250JAoSbm3BGKUgiLA1R5BSegvTa7MKd
   r69sAWC/L8cxzhY9dLGSpiGnJJfWX3pAwfiS+2LMKV9GXTj2Ys+W/Zvvj
   g==;
X-CSE-ConnectionGUID: VnVm1iITQn6Cu97hpbyy7w==
X-CSE-MsgGUID: kOZtdhUiQiicC0CCPH+0jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66423356"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="66423356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 17:00:13 -0700
X-CSE-ConnectionGUID: gRB80epuQc+i1lnHrqLFCA==
X-CSE-MsgGUID: +pAvOZbCSnSkyfl2CBnpGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185959911"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2025 17:00:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDtbg-000Ju5-0h;
	Wed, 29 Oct 2025 00:00:04 +0000
Date: Wed, 29 Oct 2025 07:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	minchan@kernel.org, lorenzo.stoakes@oracle.com, david@redhat.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, pfalcato@suse.de
Cc: oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org, hughd@google.com,
	kernel-team@android.com, android-mm@google.com,
	Kalesh Singh <kaleshsingh@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract the max
 map count sysctl
Message-ID: <202510290727.qQ5Z8dYd-lkp@intel.com>
References: <20251028212528.681081-4-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028212528.681081-4-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on b227c04932039bccc21a0a89cd6df50fa57e4716]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Document-lenient-map_count-checks/20251029-052713
base:   b227c04932039bccc21a0a89cd6df50fa57e4716
patch link:    https://lore.kernel.org/r/20251028212528.681081-4-kaleshsingh%40google.com
patch subject: [PATCH v4 3/5] mm: Introduce max_vma_count() to abstract the max map count sysctl
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251029/202510290727.qQ5Z8dYd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290727.qQ5Z8dYd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290727.qQ5Z8dYd-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: mm/nommu.o: in function `split_vma.constprop.0':
>> nommu.c:(.text+0xc54): undefined reference to `max_vma_count'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
