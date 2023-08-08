Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B75E569
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 21:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LF3AsSScAlFVJsyVVLtHUoIyYl8CsXpyTzmcybTygaQ=;
  b=VUihDfuUblQ9v8uejG/HDMBNYpvJYQK8JfuuAqSxUUJ0T2Dbv5dJ3LaA
   2dm7ppOocj/PNFVATClXA8VE2vDYU555IhqZZ5pgKt3kA2z3ZKFrLe6e+
   UIfsH1eGCHYtP2fLDokt/LZZH24lAokg3GBw96C8FepdlcXF21zM7Pj/l
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,157,1684792800"; 
   d="scan'208";a="63206877"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 23:27:00 +0200
Date: Tue, 8 Aug 2023 23:27:00 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc: Mark Brown <broonie@kernel.org>, oe-kbuild-all@lists.linux.dev, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5193/7933] sound/soc/sh/rcar/core.c:1287:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 break around line 1296. (fwd)
Message-ID: <alpine.DEB.2.22.394.2308082326260.3146@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Wed, 9 Aug 2023 05:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5193/7933] sound/soc/sh/rcar/core.c:1287:1-23:
    WARNING: Function "for_each_child_of_node" should have of_node_put() before
    break around line 1296.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
commit: 547b02f74e4ac1e7d295a6266d5bc93a647cd4ac [5193/7933] ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
:::::: branch date: 16 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-r053-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090538.FnBjBHsL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090538.FnBjBHsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308090538.FnBjBHsL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sh/rcar/core.c:1287:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 1296.
   sound/soc/sh/rcar/core.c:1306:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 1315.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
