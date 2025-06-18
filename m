Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453D2BF016
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247501; cv=none; b=shYE64Nlt0FWRhoh8EGSqgcdhUnZbXpi9CXQMUBcBBoFUbtAjdgMs/fZbhxTEYWmRo8mu8boZFfYcqahzyGMVPbrtm/V//s334OSfypukSIlKEm63sSTzdnicfbRXndYTIQco3oERUdW+IqNhOAvY9HSKmvHnmsXMhZHNkqC84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247501; c=relaxed/simple;
	bh=khIOnG66D8IyOqNQ5T/g49uMNPsIYC6rpq2TGwM4D+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTKxJXBJb48aAkXWd7j05RooeXXBVdKAePjrSZZMaxboj90i7/KiJH9CTf+V3ahGxM2NHwTgdqb47jnXhEg4/PToEN2r3picp8ohwxOvtIajv+rZjbUjXd5Rr6MiQyd0DF6/IWFApsruKQOkDo8CtVyvgHMTRruCznkAys1CwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBwUhzPt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBwUhzPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750247500; x=1781783500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=khIOnG66D8IyOqNQ5T/g49uMNPsIYC6rpq2TGwM4D+c=;
  b=IBwUhzPtD+8WXSc/5kNLjAqTmSM08IdUdXdQYlfy/7GO6rSUqly/9WyP
   2xYqBCvQnyMQXuubwVvGcoEDSjVZPODCnkL4REd/2IqCprobccLPP6Qso
   pPW3RwKoct8qIn36uPbsvNeBqOkIKO7m54G6f/0bbXiBJLxqmlkaJUt5V
   XbOK6fJUHirEBAIvrRl6B5Tmk+69J9ben4k1aCybtZQQbhBlrQ2orQUWX
   HR2mzXGjD9Rj9TpG1agRc5GsOrdodQzAWp8wCG9HGQbPew0M3wpOVoGi2
   dbwm5r/X/Xa08p8frr5Afa33MvELL99ojwiILtAXzP+1u/IqE2tSgf52A
   w==;
X-CSE-ConnectionGUID: QHUnUfErSeiqUZukWqMWNQ==
X-CSE-MsgGUID: +W1Hs+BZT4CgIpT6chvZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="62737824"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="62737824"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 04:51:39 -0700
X-CSE-ConnectionGUID: 2fbdDGwsSiK5ZLB9gh6EiQ==
X-CSE-MsgGUID: 2uZSuj6xQ/+UJqoNXGal5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149570452"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Jun 2025 04:51:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRrKJ-000JjW-2Y;
	Wed, 18 Jun 2025 11:51:35 +0000
Date: Wed, 18 Jun 2025 19:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
Message-ID: <202506181915.j2LnH7Ai-lkp@intel.com>
References: <20250604233656.41896-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604233656.41896-1-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on crng-random/master v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/wireguard-queueing-simplify-wg_cpumask_next_online/20250605-073832
base:   linus/master
patch link:    https://lore.kernel.org/r/20250604233656.41896-1-yury.norov%40gmail.com
patch subject: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20250618/202506181915.j2LnH7Ai-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181915.j2LnH7Ai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181915.j2LnH7Ai-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireguard/main.c:9:
   drivers/net/wireguard/queueing.h: In function 'wg_cpumask_choose_online':
>> drivers/net/wireguard/queueing.h:108:24: error: 'cpu' undeclared (first use in this function)
     108 |                 return cpu;
         |                        ^~~
   drivers/net/wireguard/queueing.h:108:24: note: each undeclared identifier is reported only once for each function it appears in


vim +/cpu +108 drivers/net/wireguard/queueing.h

e7096c131e5161f Jason A. Donenfeld 2019-12-09  104  
e7096c131e5161f Jason A. Donenfeld 2019-12-09  105  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
e7096c131e5161f Jason A. Donenfeld 2019-12-09  106  {
b74b49327e49f39 Yury Norov         2025-06-04  107  	if (likely(*stored_cpu < nr_cpu_ids && cpu_online(*stored_cpu)))
e7096c131e5161f Jason A. Donenfeld 2019-12-09 @108  		return cpu;
b74b49327e49f39 Yury Norov         2025-06-04  109  
b74b49327e49f39 Yury Norov         2025-06-04  110  	*stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
b74b49327e49f39 Yury Norov         2025-06-04  111  	return *stored_cpu;
e7096c131e5161f Jason A. Donenfeld 2019-12-09  112  }
e7096c131e5161f Jason A. Donenfeld 2019-12-09  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
