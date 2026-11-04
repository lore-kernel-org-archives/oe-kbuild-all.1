Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771197;
	b=yZ+YVm3/8pgsz+moaV7mxIRhwH/6dAVfISrwZ0qEMbFoJKQABE9fYsHAMYav3Zxo/KQN
	 JDwQSRdEJidtGgRSlvpeB8tW1flW+vQIXe2XmiWvlWkuzceOqwXfoxzrpfW8syEmnBepi
	 lcUeN46xoDnuFOJtWZZ/FUE5brnf/eT8HkXmlkJyUcTvLKQtZpSNF2ftJALSmqF2ro9Fq
	 lIl6ki3rjwfnZCc1AUGDN7rYaGELm+IW9TxdrF9LlMUPihoWbP8vWNKe0vcox4EjaYj5v
	 b0tSHQw1q6rPmjFvbj470j+o52jJN0HDg6wBYvmKzp4tAxkUmu1JvmMEwtktHHgLtmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771197;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ALKW+m44fAiyC37sUwJTPfNcb+dgH1kvoHtEoKQd/UU=;
	b=HMWdNf1ktqM2zEdYZlLuFq9w9SYSA1vdRNRnQIL9oq3wfbRj1fnZ9iMmPksWIOEhYywW
	 9lqXRrcvl8r3+Qmnvztt14ywDSvlDryNviinFDJgruTTZxp/RzUsxQJE7Zcsb3QkNE0wF
	 lduPTYJr+yI+sCLfhImbA9zo7iFyBXBDnp4q8M6yP6AVTCmYKoEUfY1IJXV6x8kObjfvm
	 nUrgA9XFyhifg7xtqZmiqpxWsdng5Uug4Ht1C02/ETdz9bXCSkCCCSDlZZDI5He44NisB
	 8lrfSEl6rdxHfC8h2qnjqo3i0QuL0S/JVJvu0p1gFoRU9WZTSDKUu60G16OtWcPonhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCrl3xO5;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB7606EE93
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 05:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFB7606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCrl3xO5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771197; x=1825307197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mk62jaZ2ayTsTTIc+7nR7H6Khoyr50XODENsIf16K4A=;
  b=OCrl3xO5f35kuRnQm5GMon7wAVF3jUpZ5b90XrHUD9Qy03LxBMr7eGnX
   KJY+m9VbEgFJnNdA4RWRgNxcPKPpYCXGVeaPHTnZse1AvRz0illKxCdK5
   cOdEcg2JdVtDOAwSyYMIVSFggQnAHyD2GAm2vjItZrtN3FKYglg1kmk9k
   h69e6Aw2pX7ieiOVUmpIe1ElGbSel9oD6F/TBG+HvvoAJxjdjEx6zgG6Z
   W2Q4x0hxihVqHXRsuGl19A/m8GOK04J62f5nWBHU8Bg8+QFh6F6jVWg1t
   5V/URN+GceeS9Q4NXCNhrOh2c+vU9zBeCnCvJyv0/RA/zpRZ1PutfLigt
   Q==;
X-CSE-ConnectionGUID: NShpZR9UTyej95SZojgENA==
X-CSE-MsgGUID: oI3Nr1lnQn6ISMwi29kSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403414"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403414"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:33 -0800
X-CSE-ConnectionGUID: jT0U27Q/RUuNphOoINYBDw==
X-CSE-MsgGUID: DuphwukhSiOxYn8rmiM80A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6729635"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 21:46:31 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpj-0uyv;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 4 Nov 2026 13:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>,
	netfilter-devel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, coreteam@netfilter.org, phil@nwl.cc,
	fw@strlen.de, pablo@netfilter.org,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: Re: [PATCH nf] netfilter: synproxy: prevent unbounded recursion in
 transmit path
Message-ID: <202611041332.BDDaWwCF-lkp@intel.com>
References: <20261103125638.4667-1-fmancera@suse.de>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103125638.4667-1-fmancera@suse.de>

Hi Fernando,

kernel test robot noticed the following build errors:

[auto build test ERROR on netfilter-nf/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/netfilter-synproxy-prevent-unbounded-recursion-in-transmit-path/20261103-135638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git main
patch link:    https://lore.kernel.org/r/20261103125638.4667-1-fmancera%40suse.de
patch subject: [PATCH nf] netfilter: synproxy: prevent unbounded recursion in transmit path
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611041332.BDDaWwCF-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041332.BDDaWwCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041332.BDDaWwCF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/nf_synproxy_core.c:24:10: fatal error: net/netfilter/nf_recursion.h: No such file or directory
      24 | #include <net/netfilter/nf_recursion.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +24 net/netfilter/nf_synproxy_core.c

    16	
    17	#include <net/netfilter/nf_conntrack.h>
    18	#include <net/netfilter/nf_conntrack_ecache.h>
    19	#include <net/netfilter/nf_conntrack_extend.h>
    20	#include <net/netfilter/nf_conntrack_seqadj.h>
    21	#include <net/netfilter/nf_conntrack_synproxy.h>
    22	#include <net/netfilter/nf_conntrack_zones.h>
    23	#include <net/netfilter/nf_synproxy.h>
  > 24	#include <net/netfilter/nf_recursion.h>
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
