Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3DC28F5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 00:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751763056; cv=none; b=co8H67xPWAvy//lVAbzv6rXPYfMUmvp+cei8E7XYvYoUFi0bFjfHaohIr1XZr8cHQFVHuNa9mxFLsY34Q12G7IqAQ9sMnh+KSfG5PdT7TUMzWbl1Ovgn6sBeSFV0/BNy6CVlZEjHr2TYZ56ODQMPLUys/0qmrro/crvzX2EjqZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751763056; c=relaxed/simple;
	bh=kQ9xy6U8J0IOGbjcBkkz0liukUKm3xkPz2qcKvGYg0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/3ef9Gdcmn4wgK04vpPWiX8Widw0VbKz51SAbM6Ij3oA3PsQ5E9OAcPUa2oDD1DZ02M7k1AHo6GlbeZcktbjsOPPZ8CkHicJXuKjy4Nkt/PYG9J0DshO2G9bTnQfAamhknN7yOT8atz13fwbtDEhWW+V1Mu/o3XQpA58UGWZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRV6yIWb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRV6yIWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751763054; x=1783299054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQ9xy6U8J0IOGbjcBkkz0liukUKm3xkPz2qcKvGYg0o=;
  b=aRV6yIWbkAjaFPSICzNHy35DpAC8dPZbQR3SxWypgwhFDwnBmYbO709U
   HQ9U+sVbrBKr3HAMBXHtXyGD8PJ7PbqFQsxPCVY51q4gOP9/1Ig3KB7Ri
   SGSwdXVwF3hzBkacom8USmHtWIONd51esgdpoAyN94fv3+fQyXs1Z+3aS
   yf3CdF5AoYSMBO8RjhDOXw6e6j+fJWtjaF0QbrmqedjKzGZS+xiICU2Gz
   w9wc6SZ3Opz7UIt/tc0LCcB6mK86nQSplFgl4H4ic3L1hJ6sOo+kN/Txv
   75oSegcXwLSwO5V/KGnhm4qAz9797UMq7SdC72H+CfLMvrzL8QADGvVgp
   g==;
X-CSE-ConnectionGUID: /Ma2JvVJRoqWQXeYHfAUCA==
X-CSE-MsgGUID: l5FfbqGOS1+HXN4zBfdHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="56648742"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="56648742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 17:50:54 -0700
X-CSE-ConnectionGUID: ex/eG5RURQKzruC+GuQhEw==
X-CSE-MsgGUID: s0ViMtO5S0COzqjSQG743g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159247412"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jul 2025 17:50:53 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYDak-0004nD-21;
	Sun, 06 Jul 2025 00:50:50 +0000
Date: Sun, 6 Jul 2025 08:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/3] stacktrace, stackdepot: Add seprintf()-like
 variants of functions
Message-ID: <202507060829.EfvBsc49-lkp@intel.com>
References: <ec2e375c2d1ed006f23e31d2f6ec7b46a97ad71e.1751747518.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2e375c2d1ed006f23e31d2f6ec7b46a97ad71e.1751747518.git.alx@kernel.org>

Hi Alejandro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.16-rc4 next-20250704]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alejandro-Colomar/vsprintf-Add-v-seprintf-v-stprintf/20250706-043535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/ec2e375c2d1ed006f23e31d2f6ec7b46a97ad71e.1751747518.git.alx%40kernel.org
patch subject: [RFC v1 2/3] stacktrace, stackdepot: Add seprintf()-like variants of functions
config: arm-randconfig-004-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060829.EfvBsc49-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060829.EfvBsc49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060829.EfvBsc49-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/stacktrace.c: In function 'stack_trace_seprint':
   kernel/stacktrace.c:93:21: error: implicit declaration of function 'seprintf'; did you mean 'snprintf'? [-Wimplicit-function-declaration]
      93 |                 p = seprintf(p, end, "%*c%pS\n", 1 + spaces, ' ',
         |                     ^~~~~~~~
         |                     snprintf
>> kernel/stacktrace.c:93:19: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      93 |                 p = seprintf(p, end, "%*c%pS\n", 1 + spaces, ' ',
         |                   ^


vim +93 kernel/stacktrace.c

    72	
    73	/**
    74	 * stack_trace_seprint - Print the entries in the stack trace into a buffer
    75	 * @p:		Pointer to the print buffer
    76	 * @end:	Pointer to one past the last element in the buffer
    77	 * @entries:	Pointer to storage array
    78	 * @nr_entries:	Number of entries in the storage array
    79	 * @spaces:	Number of leading spaces to print
    80	 *
    81	 * Return: Pointer to the trailing '\0'; or NULL on truncation.
    82	 */
    83	char *stack_trace_seprint(char *p, const char end[0],
    84				  const unsigned long *entries, unsigned int nr_entries,
    85				  int spaces)
    86	{
    87		unsigned int i;
    88	
    89		if (WARN_ON(!entries))
    90			return 0;
    91	
    92		for (i = 0; i < nr_entries; i++) {
  > 93			p = seprintf(p, end, "%*c%pS\n", 1 + spaces, ' ',
    94				     (void *)entries[i]);
    95		}
    96	
    97		return p;
    98	}
    99	EXPORT_SYMBOL_GPL(stack_trace_seprint);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
