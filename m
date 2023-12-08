Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC5101D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 06:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UribllVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:subject:message-id:mime-version;
  bh=HeHqdWehBWmHsX2GmjyaBttzBIbXfbZUAsDgj9C8SMw=;
  b=UribllVIpY6iJ3y10XU8TrHgFqcNGBtrcrHsno3Np+VoKlXwwQPsTM7b
   BmtPTFS3jVDcTBpQ7+MNUVDmXHW2ApPR4EBPJucjG5ovCglH7MyJbM04F
   MM7/0p7KkugrUg+QFDK4QdwRhQMp+ZNMhM/RZN7QzJPzuyEKzEUU08jVW
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,260,1695679200"; 
   d="scan'208";a="73788584"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 07:36:17 +0100
Date: Fri, 8 Dec 2023 07:36:17 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
    Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    =?ISO-8859-15?Q?Nuno_S=E1?= <nuno.sa@analog.com>, 
    linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: drivers/iio/frequency/adf4377.c:498:19-48: duplicated argument to
 & or | (fwd)
Message-ID: <alpine.DEB.2.22.394.2312080735000.3559@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-847705971-1702017377=:3559"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-847705971-1702017377=:3559
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

Maybe line 498 should contain ADF4377_0000_SOFT_RESET_MSK, not
ADF4377_0000_SOFT_RESET_R_MSK?

julia

---------- Forwarded message ----------
Date: Fri, 8 Dec 2023 06:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/iio/frequency/adf4377.c:498:19-48: duplicated argument to & or
    |

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: eda549e2e52496d0d374ce457f514a4f14172aa5 iio: frequency: adf4377: add support for ADF4377
date:   1 year ago
:::::: branch date: 3 days ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-101-20231208 (https://download.01.org/0day-ci/archive/20231208/202312080606.0wEO9f5h-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080606.0wEO9f5h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312080606.0wEO9f5h-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/frequency/adf4377.c:498:19-48: duplicated argument to & or |

vim +498 drivers/iio/frequency/adf4377.c

eda549e2e52496 Antoniu Miclaus 2022-11-15  484
eda549e2e52496 Antoniu Miclaus 2022-11-15  485  static int adf4377_soft_reset(struct adf4377_state *st)
eda549e2e52496 Antoniu Miclaus 2022-11-15  486  {
eda549e2e52496 Antoniu Miclaus 2022-11-15  487  	unsigned int read_val;
eda549e2e52496 Antoniu Miclaus 2022-11-15  488  	int ret;
eda549e2e52496 Antoniu Miclaus 2022-11-15  489
eda549e2e52496 Antoniu Miclaus 2022-11-15  490  	ret = regmap_update_bits(st->regmap, 0x0, ADF4377_0000_SOFT_RESET_MSK |
eda549e2e52496 Antoniu Miclaus 2022-11-15  491  				 ADF4377_0000_SOFT_RESET_R_MSK,
eda549e2e52496 Antoniu Miclaus 2022-11-15  492  				 FIELD_PREP(ADF4377_0000_SOFT_RESET_MSK, 1) |
eda549e2e52496 Antoniu Miclaus 2022-11-15  493  				 FIELD_PREP(ADF4377_0000_SOFT_RESET_R_MSK, 1));
eda549e2e52496 Antoniu Miclaus 2022-11-15  494  	if (ret)
eda549e2e52496 Antoniu Miclaus 2022-11-15  495  		return ret;
eda549e2e52496 Antoniu Miclaus 2022-11-15  496
eda549e2e52496 Antoniu Miclaus 2022-11-15  497  	return regmap_read_poll_timeout(st->regmap, 0x0, read_val,
eda549e2e52496 Antoniu Miclaus 2022-11-15 @498  					!(read_val & (ADF4377_0000_SOFT_RESET_R_MSK |
eda549e2e52496 Antoniu Miclaus 2022-11-15  499  					ADF4377_0000_SOFT_RESET_R_MSK)), 200, 200 * 100);
eda549e2e52496 Antoniu Miclaus 2022-11-15  500  }
eda549e2e52496 Antoniu Miclaus 2022-11-15  501

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
--8323329-847705971-1702017377=:3559--
