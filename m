Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E212B61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 14:44:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-311153ec442so597318f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840257; x=1689432257;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUB9EAsiNNama/Nfra3iw1TWWFpscYHsy3c18Oqy46o=;
        b=ZQo1vaRttsd/TzuCN5Fi8CNjpHDcBxpSKiDn45GxvJt6mgryLLQyIi9rSfALLafibw
         WTaiPkwCQczK19+cC5KYd992e7aluBlcppzeJbMHZNTw2tjmf3sGbB3FpM4KLS5i2nuZ
         3HIQEahLEFmWDSJfq4khwkZXDkt/ZxqPGGRgC1hCQKJVBPXxytex8R9+0DXn580XEoJv
         43QbdIwTMbu3qg1VeoCVjIUXEg8aYmunDlG3sCmtusO0HeXkFDG4SLdQ2/in2dJxqhk1
         85MxWzLisIX1OCL193PKuCGOIwWc4kMPF2KdXAdpMLZ2Nf4DhwrOru9drvwhiZIqCDJ/
         Baeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840257; x=1689432257;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUB9EAsiNNama/Nfra3iw1TWWFpscYHsy3c18Oqy46o=;
        b=PjgabXjmlIq+lEYehHhuGA3ubN8uZ7rzLJZzzQLI6Hxulw5Osg4B+RSyyw1KMkoYmN
         f2REG0oUVg3KvrWWGhaybpDAZVOx3WtRyxJWGMDQ09GaHKJg3Ik7jN8eD9bKIrumj87z
         JD+3sTtaoC1kuhjwoeYf0lpcfq2QbklQoAdHePI7VkGQytlDesCdFD7KSWljgRappoIy
         ia3bffy2TxW66MFXbskuYqLOOR9Q462/oalsepTr0BzMORhfTy0ZgoKZpfjhyShSSFXS
         0AldbK+0deC6X32vrAePwIlsQ3O2OCHuKY6mJWwIVf4TmhT6clE/O6dFM94IqMBt2Ew2
         YI2Q==
X-Gm-Message-State: AC+VfDwlp/mMOr0oUBuwcWg1wDAnseuU5y6uVcP0GPXKPYsciW8C1o87
	uMGRd2/B0RD3p+QOOCUc/og=
X-Google-Smtp-Source: ACHHUZ5R89ykoHtSdJfBC8yprnCsljjY/5OU40mUxUncQjlP29uileaSLVeWG7/ais1PKvWMtOZABQ==
X-Received: by 2002:adf:f601:0:b0:311:100a:d1e0 with SMTP id t1-20020adff601000000b00311100ad1e0mr3483681wrp.14.1686840256388;
        Thu, 15 Jun 2023 07:44:16 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003f709a7e46bsm20586198wme.46.2023.06.15.07.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 07:44:16 -0700 (PDT)
Subject: Re: [linux-next:master 8214/10326]
 drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to
 `ip_send_check'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <simon.horman@corigine.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 "linux-net-drivers@amd.com" <linux-net-drivers@amd.com>
References: <202306151656.yttECVTP-lkp@intel.com>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <a80867f3-a2b1-3ffb-d7b1-784e4bb94163@gmail.com>
Date: Thu, 15 Jun 2023 15:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202306151656.yttECVTP-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/06/2023 09:50, kernel test robot wrote:
> config: riscv-buildonly-randconfig-r001-20230614 (https://download.01.org/0day-ci/archive/20230615/202306151656.yttECVTP-lkp@intel.com/config)

This has:
# CONFIG_INET is not set

> All errors (new ones prefixed by >>):
> 
>    riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
>>> drivers/net/ethernet/sfc/tc_encap_actions.c:277: undefined reference to `ip_send_check'
>    riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
>    include/linux/rhashtable.h:648: undefined reference to `arp_tbl'
>    riscv32-linux-ld: drivers/net/ethernet/sfc/tc_encap_actions.o: in function `.L0 ':
>    drivers/net/ethernet/sfc/tc_encap_actions.c:135: undefined reference to `ip_route_output_flow'

From which these errors follow, since these symbols are in net/ipv4/*.o.
Not sure whether to put ifdefs in tc_encap_actions.c, or just make
 CONFIG_SFC[_SRIOV?] depend on (or select?) CONFIG_INET.  Because is
 there really a use case for putting an sfc NIC in a box without IP?

-ed
