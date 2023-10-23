Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC423BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5BQ3Og3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698047744; x=1729583744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3R42zwd/kn9eCJSB2u/oFHZt7Hd0+KwJQiVrh5igek4=;
  b=Q5BQ3Og3SnzzCadsmUcR8dXIqa+yyumusp10l5IG45hZwb1GP14JFeAY
   lsN9bOZUrY6YiDSsv3xkKd+QekNv+iRpH2BsrbLtQ1aaIuL4jfXN7xsuC
   mViQNnIltTQx8D0a1ijWneMQC3eiwoCzH00X+NhKtKoJij65QTyR79ve9
   YPtL0/93vHmLFy0RRAgfB2acVQarwFiW7im0IEOJzbPdak5SSIFpRtp3S
   0BsXlYyTjEFMw1J5tedxBFGzbSjyBRCBvyIKrqb6XyCx+efyn1FmclwY3
   QhenfsVhaZ6iAtEQUXKczqHSucI+z71edbtSSTG5+wFNYVhkrlN6LkKa/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="8345728"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="8345728"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 00:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="874619007"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="874619007"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2023 00:55:42 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qupml-0006hh-1v;
	Mon, 23 Oct 2023 07:55:39 +0000
Date: Mon, 23 Oct 2023 15:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/5] ASoC: audio-graph-card2: add CPU:Codec = N:M
 support
Message-ID: <202310231535.1TeRbKPz-lkp@intel.com>
References: <871qdllx3e.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qdllx3e.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-makes-CPU-Codec-channel-connection-map-more-generic/20231023-133933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/871qdllx3e.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v5 2/5] ASoC: audio-graph-card2: add CPU:Codec = N:M support
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310231535.1TeRbKPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231535.1TeRbKPz-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#45: FILE: sound/soc/generic/audio-graph-card2.c:532:
+			num = max (dai_link->num_cpus, dai_link->num_codecs);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
