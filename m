Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E34396
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 03:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVjWw3SN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697686488; x=1729222488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c4DRXwkQBdud0CCEJ6xru8W7/fEDn+pIlgaYDpaRsi8=;
  b=jVjWw3SN+LQEFzlYpOMTvueMSLFSgzIkRUKpYhrbC8BO8P7IE6h9dmnJ
   WhKmfI69Q9zjues0xPtmAjeAqVOKChzz5nF/AVwJWQLhIUbAlTYTodNoN
   da6To+UTlY5u8YtTbHCYzPsOesLSZ0FYsjvxUlDorLIM2P0kfDEE4xGyO
   TVqNDKBvoPwP5g1BzG/c/xazxjUkahXQuvSFg/YMEqNprtTUT6dGGaxbc
   bqnFNr3H9o4y+yd54RP4q6tE3LG/WfFguEO37QIPjvjIv/u5LXVWQ9yXq
   Gvnqc9UqwH1yKqHiy9usiGpMeUvA7Enth4uoweZ+caLAZmFCCskmqCWbQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4757020"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4757020"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 20:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791849814"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="791849814"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Oct 2023 20:34:46 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtJo3-0001XK-1O;
	Thu, 19 Oct 2023 03:34:43 +0000
Date: Thu, 19 Oct 2023 11:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH][TEST-REQUEST] ASoC: makes CPU/Codec channel connection
 map more generic
Message-ID: <202310191138.KdPUHUfP-lkp@intel.com>
References: <87wmvjpdut.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmvjpdut.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20231019-100635/Kuninori-Morimoto/ASoC-makes-CPU-Codec-channel-connection-map-more-generic/20231017-140005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87wmvjpdut.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH][TEST-REQUEST] ASoC: makes CPU/Codec channel connection map more generic
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310191138.KdPUHUfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191138.KdPUHUfP-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#248: FILE: sound/soc/soc-core.c:1087:
+				"dai_link->ch_maps[%d].connected_node (= %d) is "
+				"larger than max (= %d)",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
