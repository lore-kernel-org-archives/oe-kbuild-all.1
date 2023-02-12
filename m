Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186BC1374
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ywUmUjhrrlXaGmQ81FtkxJbcvVwxqDLz6CNsxGlR6U=;
  b=J2OozH6UPqL+j2dMAui4QUONMDOUzziBjg5MRV5ayKjpIhBH4hGoz6Lg
   UFjD6GairHwowz/0QITNluVAH8DKewvwF2YzIghjhhdP+oLdou+qslgLa
   jHjPXvzhNYyet3342gjwmsK0P/jUNQ/D0AeNrWMH+FuCXyDM4MGQldhw5
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.97,291,1669071600"; 
   d="scan'208";a="47506092"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 09:20:49 +0100
Date: Sun, 12 Feb 2023 09:20:47 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
    Herbert Xu <herbert@gondor.apana.org.au>, 
    Wojciech Ziemba <wojciech.ziemba@intel.com>, 
    Adam Guerin <adam.guerin@intel.com>
Subject: drivers/crypto/qat/qat_common/qat_compression.c:238:24-25: WARNING
 opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)
 (fwd)
Message-ID: <alpine.DEB.2.22.394.2302120919560.2799@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sun, 12 Feb 2023 11:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/qat/qat_common/qat_compression.c:238:24-25: WARNING
    opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Wojciech Ziemba <wojciech.ziemba@intel.com>
CC: Adam Guerin <adam.guerin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f339c2597ebb00e738f2b6328c14804ed19f5d57
commit: 1198ae56c9a520384dcf53f01cd9adecd73751d0 crypto: qat - expose deflate through acomp api for QAT GEN2
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230212/202302121127.u0a27G8S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302121127.u0a27G8S-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/qat/qat_common/qat_compression.c:238:24-25: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 237)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
