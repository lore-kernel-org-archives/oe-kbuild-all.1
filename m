Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DE64B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 05:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZr4RC7piHDC0wXeqfhMOBY0dqinU3I6wN6/XqjqPlc=;
  b=vOId0XVU/JPM/InbyXDevp8a26TrA9iYhGPqXC3elcwPiwwXdhigyBSa
   KeMG2Dj7iSWmYe49B5Icvnj5Ko8ekZAX9FMON/CVKsh5QIlA1Xj45USX6
   IJ0WYkDr5lPzyc6bkW8EqYIvJVB2VQtEX/KLIGNz/ibjV8J9iHEEm8IyY
   0=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,240,1684792800"; 
   d="scan'208";a="119571943"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 07:47:38 +0200
Date: Sun, 30 Jul 2023 07:47:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Justin Chen <justin.chen@broadcom.com>
cc: Simon Horman <simon.horman@corigine.com>, 
    Florian Fainelli <florian.fainelli@broadcom.com>, 
    oe-kbuild-all@lists.linux.dev, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2135/5284] drivers/net/ethernet/broadcom/asp2/bcmasp.c:562:1-33:
 WARNING: Function "for_each_available_child_of_node" should have of_node_put()
 before goto around lines 567. (fwd)
Message-ID: <alpine.DEB.2.22.394.2307300746550.3203@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 30 Jul 2023 06:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2135/5284]
    drivers/net/ethernet/broadcom/asp2/bcmasp.c:562:1-33: WARNING: Function
    "for_each_available_child_of_node" should have of_node_put() before goto
    around lines 567.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Justin Chen <justin.chen@broadcom.com>
CC: Simon Horman <simon.horman@corigine.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 490cb412007de593e07c1d3e2b1ec4233886707c [2135/5284] net: bcmasp: Add support for ASP2.0 Ethernet controller
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: s390-randconfig-r051-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300630.q6Vxwxty-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300630.q6Vxwxty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307300630.q6Vxwxty-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/asp2/bcmasp.c:562:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before goto around lines 567.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
