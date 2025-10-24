Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68536315777
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316826; cv=none; b=n7z/LfY3K/KXInIlkTVs6tXiFRt1jCabAXvyEuLnXzv2pNQUUcNLu2Yw3uSEPn7wDIBpQ5+IfLHjPV0hKt2dL977BdqSyXkO5Ges1RRD4unLj47kmffrDuWoyM8haW+CCC3IPj8RbsTl1BYn1PWUSJijGxtD8QM6Ajgg4gey4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316826; c=relaxed/simple;
	bh=kFmBSVAPamgrEmh6lxH3C4/FTOznXEWauAt5DdqlJE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIVBB5wzO2uYcc305BTvAdAQxriwFneYGOuiwy+ZJtwY/EWoj/X++qAPGSmwxhbdxJacquTfyp/cszcHkS+VWHsng9L8IJ/5pr2KQt8ZQpy8V/IjvOqThuXDEPQW4zxjTnQjOTQSEoMIh708eDZDQA/9EVKSJ2UhWJvOMONel6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZc1DU1C; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZc1DU1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761316824; x=1792852824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFmBSVAPamgrEmh6lxH3C4/FTOznXEWauAt5DdqlJE4=;
  b=nZc1DU1Cl3TO5kkrIsDxLsDPJy3VgzRVfK+IMROg7uMO5XwSaXQ593m8
   dlWRfOZMhTRL/MHcJj8ky5R+D2rbHUNcaWWe+ht7TZjXmYukoFXsqbxFk
   qwfzk5aBYzI8fljs9AEmiB4DWRCxBq6++IBXl0I0fKwr6V45wGPspWIyJ
   Ym9nm1kN/x2ZvNaPK9OkUb7BhoTEcejAIj9fexNrX8miMStsKjULsgINa
   1lM8Qv7XqFRF94ivbr4NYw3LlkdcNu11AyM3/wGUc2InriYAzWdXZrdU1
   4XjrzlJjPHbFn7EKEKp/NJr4QlaIe82QpRtg+G0ZRL/W/ZFdlmSUADLDe
   w==;
X-CSE-ConnectionGUID: K2hg2T+0RyeltKFXL8QkqA==
X-CSE-MsgGUID: sP90xgx/SuCjDEuZ7NT/ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74101395"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="74101395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:40:23 -0700
X-CSE-ConnectionGUID: 9ZP+G8szQ8OnXA13aoXHfA==
X-CSE-MsgGUID: LGJpFOR1RAah9yEEE9k0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184343395"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 07:40:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCIxm-000EYj-2Q;
	Fri, 24 Oct 2025 14:40:18 +0000
Date: Fri, 24 Oct 2025 22:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] udp: Move back definition of udpv6_encap_needed_key to
 ipv6 file.
Message-ID: <202510242214.RjDUfVB7-lkp@intel.com>
References: <20251023090736.99644-1-siddh.raman.pant@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023090736.99644-1-siddh.raman.pant@oracle.com>

Hi Siddh,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.18-rc2 next-20251024]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddh-Raman-Pant/udp-Move-back-definition-of-udpv6_encap_needed_key-to-ipv6-file/20251023-171157
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251023090736.99644-1-siddh.raman.pant%40oracle.com
patch subject: [PATCH] udp: Move back definition of udpv6_encap_needed_key to ipv6 file.
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251024/202510242214.RjDUfVB7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510242214.RjDUfVB7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510242214.RjDUfVB7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: net/ipv4/udp.o:(__jump_table+0xe8): undefined reference to `udpv6_encap_needed_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
