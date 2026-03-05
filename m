Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309691494C3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 00:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670895; cv=none; b=rqVn4BXMen6iwfM72yFCTvuv2oGJKqOpHJeR/W3ojLdxJV2wpYheGWGtLBN6jIX/Awh80IsjCoh4cblCEgtL7R6TbqbADIy1k9ljNzs02wPiMZBQeGyouf+tAAYW84Pd0A52XU9JNemMEHpbgMFQIVtD4iQMvMY7xC+y7VTr+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670895; c=relaxed/simple;
	bh=Bxrd2fiwvhsKyZsl+nxo29zi+60R+/EN/vFklSOWd+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MS/8vpUaE6TcVw799QsumKmlE5N+Ltsssdc7Zxrlo/2CylsuHWOaYLqDCV9hrCVar3uMjzVAQxqgh1SrXff0rXQNF+5UREqxZpw0aVtlbaZuiF+RebCi+VCEivovo3bMzR+alSv9cNwaAeRRTi23FZ5ZGQt/ccuX/Lj4ZXiD298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm/iCaix; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm/iCaix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772670895; x=1804206895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bxrd2fiwvhsKyZsl+nxo29zi+60R+/EN/vFklSOWd+8=;
  b=Zm/iCaix0T0q6iZtCx6PWkdBbtHAjbuMi5hIUiIUjofunklhBYDfB5Vz
   /4ADf4Jml4yitzp/f79W6ODV3ML/DCsCUg7Ngt6TiatryFaE8vWcdQqgI
   4QUiZ8sRSrXbYSu+r9iRhGXsV6i8h5eM9J6k/mUJoxGMNpx3e1bEr8SNd
   vK+UlWTqFsT44z4smz/0VKB7bnQ/5WtjHYI4Cllddbcd3nWTdlMo4JHaE
   KgzEMYcZ1ILvYu9ZEnlPnbJpcaUjZ+rfqhz4afiPkX9McHMuj84UDpEt0
   XP5rMRtk4YRZ/MuPHnB2G4tn5o5zlWtSnrCGFjzxsV74vYmiJ1HXrtOLl
   Q==;
X-CSE-ConnectionGUID: rhPbZp5zTCKI/qBntlIdKA==
X-CSE-MsgGUID: Rcs1DXaWTsyD7OEmnZq6XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73653562"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73653562"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 16:34:54 -0800
X-CSE-ConnectionGUID: sUWpvx1ITcW6G79rW8WCKA==
X-CSE-MsgGUID: y/9N3ZxqS7ePC3zmt8m0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="217751914"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2026 16:34:51 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxwfv-000000004r7-2iLs;
	Thu, 05 Mar 2026 00:34:47 +0000
Date: Thu, 5 Mar 2026 08:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Pezzullo via B4 Relay <devnull+maximilianpezzullo.gmail.com@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	Terry M <terrym3201@bugzilla.kernel.org>,
	Maximilian Pezzullo <maximilianpezzullo@gmail.com>
Subject: Re: [PATCH] mm/vmstat: reject zero vm.stat_interval to prevent
 busy-loop
Message-ID: <202603050819.oMnaHoIC-lkp@intel.com>
References: <20260304-mm-vmstat-reject-zero-vm-stat_interval-to-prevent-busy-loop-v1-1-c03c9555ff15@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-mm-vmstat-reject-zero-vm-stat_interval-to-prevent-busy-loop-v1-1-c03c9555ff15@gmail.com>

Hi Maximilian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08]

url:    https://github.com/intel-lab-lkp/linux/commits/Maximilian-Pezzullo-via-B4-Relay/mm-vmstat-reject-zero-vm-stat_interval-to-prevent-busy-loop/20260304-153052
base:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
patch link:    https://lore.kernel.org/r/20260304-mm-vmstat-reject-zero-vm-stat_interval-to-prevent-busy-loop-v1-1-c03c9555ff15%40gmail.com
patch subject: [PATCH] mm/vmstat: reject zero vm.stat_interval to prevent busy-loop
config: parisc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603050819.oMnaHoIC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050819.oMnaHoIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050819.oMnaHoIC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmstat.c:2117:12: warning: 'vmstat_interval_handler' defined but not used [-Wunused-function]
    static int vmstat_interval_handler(const struct ctl_table *table, int write,
               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/vmstat_interval_handler +2117 mm/vmstat.c

  2116	
> 2117	static int vmstat_interval_handler(const struct ctl_table *table, int write,
  2118					    void *buffer, size_t *lenp, loff_t *ppos)
  2119	{
  2120		int ret = proc_dointvec_jiffies(table, write, buffer, lenp, ppos);
  2121	
  2122		if (ret == 0 && write && sysctl_stat_interval == 0) {
  2123			sysctl_stat_interval = HZ;
  2124			return -EINVAL;
  2125		}
  2126		return ret;
  2127	}
  2128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
