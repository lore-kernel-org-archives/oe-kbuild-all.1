Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A74367
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 01:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725671789; cv=none; b=WOlvylQq3lEpzuxkU6Gk2cp4D52FcoIrh4AvVQDBbuDM43jLZRifGtan2ldH4dc3xREywTY37mP06NLosxLcEjOSXSYWJUQqycvnUMLxmrMRO4h4czqTtlKsZ6XyGWPc3/ykidXytNOglqlR3jgffaa4iEfAcIqmGBOd43ZWy8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725671789; c=relaxed/simple;
	bh=Sc31VUCJQ4UQOaqJX4A5/1bRiNe5PKkT6kkoITGscp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiO1pFRGB/70SNk8vKW02uOLTwh/B5U70PZ4EM8rvFXAQP9kyDkYrAOJPfzgsl/wLGDt1qmHH0G7B9gajsTZ+zATf4JvPiQrJKq6OdG7HLMYg7aoIKqbSAkRCVVLSdMjL5wbOkyImAevaed5He6TOwQndFtwo1+9rFbL43tT5ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A50CLIky; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A50CLIky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725671787; x=1757207787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sc31VUCJQ4UQOaqJX4A5/1bRiNe5PKkT6kkoITGscp4=;
  b=A50CLIkyuiB2rce1MfqjwB0cSxhhjohsIlobB/pDOJXmkq1aHtXsHY+u
   IEd7WNZYcT+TTOLrykgHE2tlXNws0LsEJ6SqHAV0iXq7EVkeqiCOfwaq9
   gczLhJEn/OMP3oU+Fk89FsiSUlDWN49YTGxY52RKX6SsZ81VjSQ/q4zAI
   ovKcWJzOPemsxEZEY3koyC0X02dIipCMNRrWwPSW8xRgkVEKhMw4SvZF1
   dngrHc+fmrOpPlkKMoNMpYQdFjEJWRFbssapVL89LPMOJXpglO+TuEacx
   GOvw4jyGI4aR0rF0CdZS10C3X+N9OD44SYoX4PSTJQDxwgoPXJMA/VGUE
   w==;
X-CSE-ConnectionGUID: gX34u8oJRJ6Oof2lQ1aJBA==
X-CSE-MsgGUID: YgCcxLOvTE6/HTapHIL+jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23949300"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="23949300"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 18:16:27 -0700
X-CSE-ConnectionGUID: KtsOQaTkQOqzSK4W427mjw==
X-CSE-MsgGUID: wAn5xGeYSf2StlqfYfoHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="89386952"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2024 18:16:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smk3s-000C0R-0g;
	Sat, 07 Sep 2024 01:16:24 +0000
Date: Sat, 7 Sep 2024 09:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: Juntong Deng <juntong.deng@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/2] bpf: Add open-coded style iterator
 kfuncs for bpf dynamic pointers
Message-ID: <202409070843.e6HLIz8l-lkp@intel.com>
References: <AM6PR03MB5848C2304B17658423B4B81D99932@AM6PR03MB5848.eurprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR03MB5848C2304B17658423B4B81D99932@AM6PR03MB5848.eurprd03.prod.outlook.com>

Hi Juntong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Juntong-Deng/selftests-bpf-Add-tests-for-open-coded-style-bpf-dynamic-pointer-iterator/20240904-061518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/AM6PR03MB5848C2304B17658423B4B81D99932%40AM6PR03MB5848.eurprd03.prod.outlook.com
patch subject: [RFC PATCH bpf-next 1/2] bpf: Add open-coded style iterator kfuncs for bpf dynamic pointers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409070843.e6HLIz8l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070843.e6HLIz8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070843.e6HLIz8l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function 'bpf_iter_dynptr_next':
>> kernel/bpf/helpers.c:2794:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2794 |         ret = bpf_dynptr_read((u64)kit->buffer, read_len, (u64)kit->dynptr, kit->offset, 0);
         |                               ^
   kernel/bpf/helpers.c:2794:59: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2794 |         ret = bpf_dynptr_read((u64)kit->buffer, read_len, (u64)kit->dynptr, kit->offset, 0);
         |                                                           ^


vim +2794 kernel/bpf/helpers.c

  2771	
  2772	__bpf_kfunc int *bpf_iter_dynptr_next(struct bpf_iter_dynptr *it)
  2773	{
  2774		struct bpf_iter_dynptr_kern *kit = (void *)it;
  2775		int read_len, ret;
  2776		u32 size;
  2777	
  2778		if (!kit->dynptr)
  2779			return NULL;
  2780	
  2781		if (!kit->dynptr->data)
  2782			return NULL;
  2783	
  2784		if (unlikely(kit->read_len < 0))
  2785			return NULL;
  2786	
  2787		size = __bpf_dynptr_size(kit->dynptr);
  2788	
  2789		if (kit->offset >= size)
  2790			return NULL;
  2791	
  2792		read_len = (kit->offset + kit->buffer_len > size) ? size - kit->offset : kit->buffer_len;
  2793	
> 2794		ret = bpf_dynptr_read((u64)kit->buffer, read_len, (u64)kit->dynptr, kit->offset, 0);
  2795		if (unlikely(ret != 0)) {
  2796			/* if errors occur in bpf_dynptr_read, the errno is returned via read_len
  2797			 * and NULL is returned in the next iteration to exit the iteration loop.
  2798			 */
  2799			kit->read_len = ret;
  2800			goto out;
  2801		}
  2802	
  2803		kit->read_len = read_len;
  2804		kit->offset += read_len;
  2805	out:
  2806		return &kit->read_len;
  2807	}
  2808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
