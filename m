Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ADF1CEAC2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661808; cv=none; b=LahD+rROwuMvFrmq+nCUj/iiCFm7IDnLOwX4nCsbiMKOTXGTW4j4By4PLyz4xmS20xLjSnxH7iW1TOFqDzuijvRkp+4SDBXgEirbQZgf2nmM5fp8i1vuXpf6m6/lCFk5ZQMJGG98QOwI23J4kIkxjKSbAdI+/TngDUFYqzq5anI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661808; c=relaxed/simple;
	bh=Lss/xyomWV9YSVNcUq2gi9/28MwQM5tgApMiY9ZSmsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alqR251sPaJZ4UES9dn1KQe4pzlYgiHXuSEAk5N4VDvE/ipLhnsv1jB9s1LeRXhoI4nNWFQAbHcswCSoBy7VsxEfmBHzaZ2XzAE9FHurN8zaSw/PCmht0b67l9UWCsA2zwliqxmzkmRb8zwAnAb0t2tlIDVZTBTgIg3j1QL7wEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=dV5tgYP3; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="dV5tgYP3"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-48657fc84a3so1454066b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 05 Jun 2026 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780661806; x=1781266606; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96c2yxvNjI/CF5ITi40jfuTNVzbxXBqb/WCnE2f85ds=;
        b=dV5tgYP3Ibp1tcuN0Rv/4poCBLSlzgZkDSBNcTkF6+TbiC0tDJUimLJPIEYyWtn945
         K3hI9TpnduC6jzGMK7AuYFShpkES17Ndf/2pLJ0forQsxsMxrpLphDZuNTTnlHCBqLoD
         z3bthlpLqakNkNXM8sk5BthvRxe+ic+IPianf98kdJ/tW0wkC5LkqdZvvJZdjcOcw+Xt
         zUEFd5p3O6pU1D9c33d+xgxU/uZ8elhanS/OJIDruRmY8hamkBTyKs8daUhBwayuTGDW
         bRaWhi7gKXDmrDWxWROzmdocp26Gyg4xHx9Ro5kGoyWqfnLueTSI/nO9dYQNhrjskyiA
         vMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661806; x=1781266606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96c2yxvNjI/CF5ITi40jfuTNVzbxXBqb/WCnE2f85ds=;
        b=oGvSQlq+du/pruGAIsoPVhNDalravAjV9rzVF7ZDM4K6DB2gC2y7aQNknG3RYXoCRX
         LIldwlt/hdoGtVcqGHgT/9IUlpj8YO2DTyfJDa+v4nkS9VpXxJhPnHnmE+J5pdOLTq9R
         vB5XGVIIXh0dLMRJR43gDUqIyaPRuj0H7UJmBYGxSezL1+mRkPEoZgK3N1cgzV9l+Fm1
         thWA5vAQQSlH/fQXg/sC7CSDjDG1Z4zTAiwdIzAtDQtDnPNC1ZjLg1+3awqFhQOIDAMl
         Jo7cZUDuZ8/osWlSjTfftxGfaf6oSsil7yIJhcTYHUnwSEA0uCQ7bXC5LtURw94dl1KX
         eHEg==
X-Gm-Message-State: AOJu0Yz8xxik67y5qs3J52YY7zAFpTf2BRoG4MHDeZfPzPu58wEy8RHv
	wxkP1UpGEQGBXSzDDWj3J/6SbJwfOZIsVruy9zCGh590m0PS9Eq2ib5tlA9V4JYBKYc=
X-Gm-Gg: Acq92OGiCHrZi+VOFjZsHnIm0R1jejCXDYnSiuKu7inuDAo1uCi/c0DWoN3ejQInYxl
	sKknimqHw6ZLlfmnZSyYRsz4EOCAQfqwc+6bvGoTgX9g5LNJ6xXbHCRiFFjxxlI0oFW9Ncv5FLe
	8usrtpdHLT9C/I29tSxM0DPsg8BvXjTWFcgtlxLsXWfxoSbbfmuCVtJlHKpyS60zThxb0LRL22f
	epSCRFCZJ0fFlwrYaMwVAMsUrHfqfUYa00/ZOO9hZzmWFOYuMSApQhoey/FXtFJm4OQXdBrTV8C
	3JFbFM/jd/xx9+NZoiTMPSOTbUXLhxXzTgLO0+LdxWhjXoYbpLKxtdM1RzRjyeVw4RjxeP3fI8Y
	ulrv8BbQNEAyV3ensdT5Ti70IEiIBxfAOh3axTIE9Bi6iMmO97mf1GFeioN96LfvitWRp4NS3Yj
	rAWhthefte/FxC+5IeQRKg9crvHUB3EIDx1AE=
X-Received: by 2002:a05:6808:1388:b0:486:7c50:6fa8 with SMTP id 5614622812f47-4868df59fa1mr2090018b6e.24.1780661806213;
        Fri, 05 Jun 2026 05:16:46 -0700 (PDT)
Received: from [172.22.22.234] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b760799sm6712943b6e.7.2026.06.05.05.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 05:16:44 -0700 (PDT)
Message-ID: <82990361-baa1-4930-9efb-1141c67d4517@riscstar.com>
Date: Fri, 5 Jun 2026 07:16:43 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Warning: MAINTAINERS references a file that doesn't
 exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
To: kernel test robot <lkp@intel.com>, Daniel Thompson <daniel@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202606050946.JGkrxO1C-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202606050946.JGkrxO1C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 2:15 AM, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-net-qca-qca808x-Add-regulator-properties/20260605-091912
> head:   a2cf643cd5401eea03d3f1a49d81e7d066ae6047
> commit: b6d9c722ce11c43b1e14ca3a15d993e470299502 dt-bindings: net: toshiba,tc9654-dwmac: add TC9564 Ethernet bridge
> date:   6 hours ago
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260605/202606050946.JGkrxO1C-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606050946.JGkrxO1C-lkp@intel.com/

This issue was caught once I upgraded the "dtschema" package.

It will be fixed in the next version of the series.

					-Alex

> 
> All warnings (new ones prefixed by >>):
> 
>     Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
>     Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
>     Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>     Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>     Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>     Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
>     Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
>     Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

