Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14D39E9BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502005; cv=none; b=nta4LlhHT7XVrEThOVm5VYLSZm0aRZVf0AkX1GaYDfLx2ASnsB2Iuh3WH8PJYC59Szq6BarugUXVbUFCFQPXdESTB2hQsCizjL7buGIZ4YWunj/NqWPkQ5Ckd7u3A0V2dgNN31q7CC3CTkm+DJHIUl7ot2wJs1pv4el3IaHBD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502005; c=relaxed/simple;
	bh=L6zFVDrVccCKN+PiTxILvm6XeA+JGNk4ZcIgQyr4bZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FegLrJ0eUGoLHto9AnrDOyGSAUTw78YcuDOre6FWGmUB2lm8CxvCZ4sMgkfNBTwvjGS833FsnDaw40Ol7p/6gjIATSO9qc6lyRmMTsQzFaYaMkNeepfoSi1e+hg9akrpNG5E6S1T/KyYu9GXwoTbuyWwrkDJbDGd7nxkWZyzX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hq8sfgqq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hq8sfgqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789502004; x=1821038004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6zFVDrVccCKN+PiTxILvm6XeA+JGNk4ZcIgQyr4bZY=;
  b=Hq8sfgqqCnO4efJD0iNBGmvSK1lwjBQwi7PiddtcH2amuDnLusdawzGE
   s56l6giSGnyQ8/rfgkCm/Aims1xe7Uf9fCZjxyKM9yIsroquoQkBiyY0q
   7ISvPIjc6Z9Q+0WEBd8qh3phLcCGUhluNFUWCKKXjbuhSok4YLsmN6lqq
   HatHX+Dys5MpgQFv4k78DUB8U7kxP9DCt50m3EteAcJwfON2nGvwHe7Nz
   7MrLl440pGfnGDH7w2ZSlbr90tPXafhdwCFJOSViKYCk9izPO4pguF5p7
   lhJDl6bEdinBmprcu7xNEl6Nxz9Vam7QclyuoNzrju3XhKnrqhaJpLW/I
   g==;
X-CSE-ConnectionGUID: OvPru5IwQAG5em/rp83D5g==
X-CSE-MsgGUID: V3s0MsIURqqJvFuxe34q7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100202919"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100202919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 12:53:23 -0700
X-CSE-ConnectionGUID: YtfMPbKLSUGmeHNtck/NYw==
X-CSE-MsgGUID: s456eXMRQ4mfNMnD9z1zSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296615090"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 12:53:21 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6ZDT-000000000gh-1H2M;
	Tue, 15 Sep 2026 19:53:19 +0000
Date: Tue, 15 Sep 2026 21:52:28 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v10b-akpm 30/40]
 include/linux/dynamic_debug.h:519: error: "_DPRINTK_CLASSBITS_INIT" redefined
Message-ID: <202609152130.Vaq9IRTf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v10b-akpm
head:   27e8ebc1c997eacd1d9221e0d313736244ae0db5
commit: 5959d9dd620041fe8451e9b2d2545b1084526432 [30/40] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: alpha-randconfig-r051-20260915 (https://download.01.org/0day-ci/archive/20260915/202609152130.Vaq9IRTf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609152130.Vaq9IRTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609152130.Vaq9IRTf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/module.h:31,
                    from lib/test_bitops.c:10:
>> include/linux/dynamic_debug.h:519: error: "_DPRINTK_CLASSBITS_INIT" redefined [-Werror]
     519 | #define _DPRINTK_CLASSBITS_INIT 0U
         | 
   include/linux/dynamic_debug.h:70: note: this is the location of the previous definition
      70 | #define _DPRINTK_CLASSBITS_INIT ((_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_PRINT) ? ~0U : 0U)
         | 
   cc1: all warnings being treated as errors


vim +/_DPRINTK_CLASSBITS_INIT +519 include/linux/dynamic_debug.h

   515	
   516	#if defined(DEBUG)
   517	#define _DPRINTK_CLASSBITS_INIT ~0U
   518	#else
 > 519	#define _DPRINTK_CLASSBITS_INIT 0U
   520	#endif
   521	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
